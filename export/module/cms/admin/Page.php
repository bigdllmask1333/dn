<?php

namespace app\cms\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\cms\model\Page as PageModel;
use think\Db;

/**
 * 单页控制器
 * @package app\cms\admin
 */
class Page extends Admin
{
    /**
     * 单页列表
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function index()
    {
        // 查询
        $map = $this->getMap();
        // 排序
        $order = $this->getOrder();
        // 数据列表
        $data_list = PageModel::where($map)->order($order)->paginate();

        $map['status'] = 1;
// 把查询条件传入查询方法
        $datalist=Db::name('cms_dntype')->where($map)->field('id,title')->select();
        $newtylelist=array();
        foreach ($datalist as $val){
            $newtylelist[$val['id']]=$val['title'];
        }


        $btnType = [
            'class' => 'btn btn-info',
            'title' => '导入数据',
            'icon'  => 'fa fa-fw fa-sitemap',
            'href'  => url('page/import')
        ];

        /*TODD 这里可以查询出域名分类作为数据字典*/
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setSearch(['title' => '标题']) // 设置搜索框
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['domain_name', '域名', 'text.edit'],
                ['service_provider', '服务商'],
                ['dntype', '域名分类',$newtylelist],
                ['expiry_time', '到期时间', 'datetime'],
                ['dnprice', '价格/元'],
                ['status', '上下架', 'switch'],
                ['recommends', '推荐', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButton('custom', $btnType) // 添加顶部按钮
            ->addTopButtons('add,enables,disables,delete') // 批量添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => '删除后无法恢复。']]) // 批量添加右侧按钮
            ->addOrder('id,title,create_time,update_time')
            ->setRowList($data_list) // 设置表格数据
            ->addValidate('Page', 'title')
            ->fetch(); // 渲染模板
    }

    /**
     * 新增
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function add()
    {
        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();
            $data['expiry_time']=strtotime($data['expiry_time']);

            // 验证
            /*$result = $this->validate($data, 'Page');
            if(true !== $result) $this->error($result);*/

            if ($page = PageModel::create($data)) {
                // 记录行为
//                action_log('page_add', 'cms_page', $page['id'], UID, $data['title']);
                $this->success('新增成功', 'index');
            } else {
                $this->error('新增失败');
            }
        }

        $list_city = ['gz' => '广州', 'sz' => '深圳', 'sh' => '上海'];
        $map['status'] = 1;
// 把查询条件传入查询方法
        $datalist=Db::name('cms_dntype')->where($map)->field('id,title')->select();
        $newtylelist=array();
        foreach ($datalist as $val){
            $newtylelist[$val['id']]=$val['title'];
        }

        // 显示添加页面
        return ZBuilder::make('form')
            ->addFormItems([
                ['text', 'domain_name', '域名'],
                ['text', 'service_provider', '服务商'],
                ['date', 'expiry_time', '到期时间'],
                ['text', 'dnprice', '域名价格']
            ])
            ->addSelect('dntype', '选择类型', '请选择类型', $newtylelist, '1')
            ->addFormItems([
                ['tags', 'keywords', '域名关键词', '关键字之间用英文逗号隔开'],
                ['textarea', 'description', '域名卖点', '15字左右'],
                ['radio', 'status', '立即启用', '', ['否', '是'], 1]
            ])


            ->fetch();
    }

    /**
     * 编辑
     * @param null $id 单页id
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function edit($id = null)
    {
        if ($id === null) $this->error('缺少参数');

        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();

            $data['expiry_time']=strtotime($data['expiry_time']);
            // 验证
            /*$result = $this->validate($data, 'Page');
            if(true !== $result) $this->error($result);*/
            if (PageModel::update($data)) {
                // 记录行为
//                action_log('page_edit', 'cms_page', $id, UID, $data['title']);
                $this->success('编辑成功', 'index');
            } else {
                $this->error('编辑失败');
            }
        }
        $info = PageModel::get($id);


        $list_city = ['gz' => '广州', 'sz' => '深圳', 'sh' => '上海'];
        $map['status'] = 1;
// 把查询条件传入查询方法
        $datalist=Db::name('cms_dntype')->where($map)->field('id,title')->select();
        $newtylelist=array();
        foreach ($datalist as $val){
            $newtylelist[$val['id']]=$val['title'];
        }

        // 显示编辑页面
        return ZBuilder::make('form')
            ->addFormItems([
                ['hidden', 'id'],
                ['text', 'domain_name', '域名'],
                ['text', 'service_provider', '服务商'],
                ['text', 'dnprice', '域名价格']
            ])
            ->addSelect('dntype', '选择类型', '请选择类型', $newtylelist, '1')
            ->addFormItems([
                ['date', 'expiry_time', '到期时间'],
                ['tags', 'keywords', '域名关键词', '关键字之间用英文逗号隔开'],
                ['textarea', 'description', '域名卖点', '15字左右'],
                ['radio', 'status', '立即启用', '', ['否', '是']]
            ])

            ->setFormdata($info)
            ->fetch();
    }

    /**
     * 删除单页
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function delete($record = [])
    {
        $ids        = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
        $page_title = PageModel::where('id', 'in', $ids)->column('domain_name');
        return parent::setStatus('delete', ['page_'.'delete', 'cms_page', 0, UID, implode('、', $page_title)]);
//        return $this->setStatus('delete');
    }

    /**
     * 启用单页
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function enable($record = [])
    {
        return $this->setStatus('enable');
    }

    /**
     * 禁用单页
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function disable($record = [])
    {
        return $this->setStatus('disable');
    }

    /**
     * 设置单页状态：删除、禁用、启用
     * @param string $type 类型：delete/enable/disable
     * @param array $record
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function setStatus($type = '', $record = [])
    {
        $ids        = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
        $page_title = PageModel::where('id', 'in', $ids)->column('domain_name');
        return parent::setStatus($type, ['page_'.$type, 'cms_page', 0, UID, implode('、', $page_title)]);
    }

    /**
     * 快速编辑
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function quickEdit($record = [])
    {
        $id      = input('post.pk', '');
        $field   = input('post.name', '');
        $value   = input('post.value', '');
        $page    = PageModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $page . ')，新值：(' . $value . ')';
        return parent::quickEdit(['page_edit', 'cms_page', $id, UID, $details]);
    }




    /**
     * 表格导入
     *
     * @return mixed
     */
    public function import()
    {
        // 保存数据asd
        if ($this->request->isPost()) {
            $file = request()->file('xlsxs');
            if(!$file){
                $this->error('请点击添加文件后再做导入操作！');
            }
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads',true,false);
            if($info) {
                $root = $info->getSaveName();
                $data1 = import_excel('./uploads/' . $root);
                $data = array_splice($data1, 1);
                foreach ($data as $val){
                    $yezhu=$val[0];
                    $check = PageModel::get(['domain_name' => $yezhu]);
                    if (!$check){
                        $lastdata=array();
                        $lastdata['domain_name']=$val[0];             /*域名*/
                        $lastdata['service_provider']=$val[1];       /*服务商*/
                        $lastdata['expiry_time']=strtotime($val[2]);             /*到期时间*/
//                        $data['expiry_time']=strtotime($data['expiry_time']);
                        $lastdata['description']=$val[3];             /*域名描述*/
                        $lastdata['dntype']=$val[4];                    /*类型  默认0*/
                        $lastdata['status']='0';              /*状态*/
                        $lastdata['dnprice']=$val[5];             /*域名价格*/
                        $bbd=PageModel::create($lastdata);
                    }else{
                        $bbd=0;
                    }
                }
                if ($bbd) {
                    $this->success('导入成功', 'index');
                } else {
                    $this->error('导入失败,请检查是否有重复或者模板格式是否正确！');
                }

            }
        }

        return $this->fetch();
    }
}