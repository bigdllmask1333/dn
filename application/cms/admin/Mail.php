<?php
/**
 * Created by PhpStorm.
 * User: cwwx0
 * Date: 2018/6/5
 * Time: 22:19
 */

namespace app\cms\admin;
use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\cms\model\Phone as PhoneModel;
use think\Db;

class Mail extends Admin
{
    /**
     * 单页列表
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function index()
    {
        /*每次进入的时候验证过期时间是否大于当前时间*/
        // 查询
        $map = $this->getMap();
        $map['id']=56;
        // 排序
        $order = $this->getOrder();
        // 数据列表
        $data_list = PhoneModel::where($map)->order($order)->paginate();

        $map['status'] = 1;
// 把查询条件传入查询方法
        $btnType = [
            'class' => 'btn btn-info',
            'title' => '导入数据',
            'icon'  => 'fa fa-fw fa-sitemap',
            'href'  => url('page/import')
        ];
        /*TODD 这里可以查询出域名分类作为数据字典*/
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->addColumns([ // 批量添加数据列
                ['phone', '邮箱'],
                ['status', '启用', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addRightButtons(['edit']) // 批量添加右侧按钮
            ->setRowList($data_list) // 设置表格数据
            ->fetch(); // 渲染模板
    }

    /**
     * @return array
     * @throws 获取域名分类
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function dntype(){
        $map['status'] = 1;
        $datalists=Db::name('cms_dntype')->where($map)->select();
        $newtylelist=array();
        foreach ($datalists as $val){
            $newtylelist[$val['id']]=$val['title'];
        }
        return $newtylelist;
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

            // 验证
            /*$result = $this->validate($data, 'Page');
            if(true !== $result) $this->error($result);*/
            if (PhoneModel::update($data)) {
                // 记录行为
//                action_log('page_edit', 'cms_page', $id, UID, $data['title']);
                $this->success('编辑成功', 'index');
            } else {
                $this->error('编辑失败');
            }
        }
        $info = PhoneModel::get($id);


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
                ['text', 'phone', '手机号码'],
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
        $page_title = PhoneModel::where('id', 'in', $ids)->column('domain_name');
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
        $page_title = PhoneModel::where('id', 'in', $ids)->column('domain_name');
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
        $page    = PhoneModel::where('id', $id)->value($field);
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
                if(count($data)!="6"){
                    $this->error('格式不对！');
                }
                foreach ($data as $val){
                    $title=$val[4];
                    $types=Db::name('cms_dntype')->where(['title'=>$title])->find();
                    $dntype=$types['id'];

                    trace("*********************^^^^^^^^^^^^^^^^^^^^^^********************");
                    trace($types);
                    trace($dntype);
                    trace("*********************^^^^^^^^^^^^^^^^^^^^^^********************");

                    if($types){
                        $yezhu=$val[0];
                        $check = PhoneModel::get(['domain_name' => $yezhu]);
                        if (!$check){
                            $lastdata=array();
                            $lastdata['domain_name']=$val[0];             /*域名*/
                            $lastdata['service_provider']=$val[1];       /*服务商*/
                            $lastdata['expiry_time']=strtotime($val[2]);             /*到期时间*/
//                        $data['expiry_time']=strtotime($data['expiry_time']);
                            $lastdata['description']=$val[3];             /*域名描述*/
                            $lastdata['dntype']=$dntype;                    /*类型  默认0*/
                            $lastdata['status']='0';              /*状态*/
                            $lastdata['dnprice']=$val[5];             /*域名价格*/
                            $bbd=PhoneModel::create($lastdata);
                        }else{
                            $bbd=0;
                        }
                    }else{
                        $bbd=0;
                    }

                }
                if ($bbd) {
                    $this->success('导入成功', 'index');
                } else {
                    $this->error('导入失败,请检查是否有重复或者模板格式是否正确！');
                }

            }else{
                $this->error('格式不对！表格模板点击这里下载!');
            }
        }

        return $this->fetch();
    }
}