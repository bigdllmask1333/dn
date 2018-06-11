<?php

namespace app\cms\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\cms\model\Massage as MassageModel;
use think\Db;

/**
 * 单页控制器
 * @package app\cms\admin
 */
class Massage extends Admin
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
        $data_list = MassageModel::where($map)->order($order)->paginate();

        $map['status'] = 1;
// 把查询条件传入查询方法
        $datalist=Db::name('cms_dntype')->where($map)->field('id,title')->select();
        $newtylelist=array();
        foreach ($datalist as $val){
            $newtylelist[$val['id']]=$val['title'];
        }

        /*TODD 这里可以查询出域名分类作为数据字典*/
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setSearch(['title' => '标题']) // 设置搜索框
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['domain_name', '域名'],
                ['service_provider', '服务商'],
                ['dntype', '域名分类',$newtylelist],
                ['buyer_name', '姓名'],
                ['buyer_tel', '联系方式'],
                ['buyer_hopeprice', '期望价位'],
                ['instructions', '补充说明'],
                ['bake', '沟通备注'],
                ['status', '状态（关闭即已沟通）', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButtons('enable,disable,delete') // 批量添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => '删除后无法恢复。']]) // 批量添加右侧按钮
            ->addOrder('id,title,create_time,update_time')
            ->setRowList($data_list) // 设置表格数据
            ->addValidate('Page', 'title')
            ->fetch(); // 渲染模板
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
            if (MassageModel::update($data)) {
                // 记录行为
//                action_log('page_edit', 'cms_page', $id, UID, $data['title']);
                $this->success('编辑成功', 'index');
            } else {
                $this->error('编辑失败');
            }
        }
        $info = MassageModel::get($id);


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
                ['textarea', 'bake', '沟通备注', '100字左右'],
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
        $page_title = MassageModel::where('id', 'in', $ids)->column('domain_name');
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
        $page_title = MassageModel::where('id', 'in', $ids)->column('title');
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
        $page    = MassageModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $page . ')，新值：(' . $value . ')';
        return parent::quickEdit(['page_edit', 'cms_page', $id, UID, $details]);
    }
}