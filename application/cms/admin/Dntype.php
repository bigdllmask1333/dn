<?php

namespace app\cms\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\cms\model\Dntype as DntypeModel;
use think\Db;
/**
 * 域名类型控制器
 * @package app\cms\admin
 */
class Dntype extends Admin
{
    /**
     * 域名类型列表
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
        $data_list = DntypeModel::where($map)->order($order)->paginate();

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')

            ->setSearch(['title' => '域名分类']) // 设置搜索框
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['title', '域名分类', 'text.edit'],
                ['create_time', '创建时间', 'datetime'],
                ['update_time', '更新时间', 'datetime'],
                ['status', '是否显示', 'switch'],
                ['istab', '设为导航', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButtons('add,enable,disable,delete') // 批量添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => '该分类下面如果有数据则无法删除！']]) // 批量添加右侧按钮
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

            // 验证
            $result = $this->validate($data, 'Page');
            if(true !== $result) $this->error($result);

            if ($page = DntypeModel::create($data)) {
                // 记录行为
                action_log('page_add', 'cms_page', $page['id'], UID, $data['title']);
                $this->success('新增成功', 'index');
            } else {
                $this->error('新增失败');
            }
        }

        // 显示添加页面
        return ZBuilder::make('form')
            ->addFormItems([
                ['text', 'title', '域名分类名称'],
                ['textarea', 'description', '页面描述', '100字左右'],
                ['radio', 'status', '立即启用', '', ['否', '是'], 1]
            ])
            ->fetch();
    }

    /**
     * 编辑
     * @param null $id 域名类型id
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
//            $result = $this->validate($data, 'Page');
//            if(true !== $result) $this->error($result);

            if (DntypeModel::update($data)) {
                // 记录行为
//                action_log('page_edit', 'cms_page', $id, UID, $data['title']);
                $this->success('编辑成功', 'index');
            } else {
                $this->error('编辑失败');
            }
        }

        $info = DntypeModel::get($id);

        // 显示编辑页面
        return ZBuilder::make('form')
            ->addFormItems([
                ['hidden', 'id'],
                ['text', 'title', '域名分类名称'],
                ['textarea', 'description', '页面描述', '100字左右'],
                ['radio', 'status', '立即启用', '', ['否', '是']]
            ])
            ->setFormdata($info)
            ->fetch();
    }

    /**
     * 删除域名类型
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function delete($record = [])
    {

        return $this->setStatus('delete');
    }

    /**
     * 启用域名类型
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function enable($record = [])
    {
        return $this->setStatus('enable');
    }

    /**
     * 禁用域名类型
     * @param array $record 行为日志
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function disable($record = [])
    {
        return $this->setStatus('disable');
    }

    /**
     * 设置域名类型状态：删除、禁用、启用
     * @param string $type 类型：delete/enable/disable
     * @param array $record
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function setStatus($type = '', $record = [])
    {
        $ids        = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
        if($type=='delete'){
            $types=Db::name('cms_page')->where('dntype', 'in', $ids)->find();
            if($types){
                $this->error('该分类下面存在域名，请先自行删除！');
//                return parent::setStatus($type, ['page_'.$type, 'cms_page', 0, UID, implode('、', "")]);
//                return ZBuilder::make('table')->setPageTips('这是页面提示信息')->fetch();
            }else{
                $page_title = DntypeModel::where('id', 'in', $ids)->column('title');
                return parent::setStatus($type, ['page_'.$type, 'cms_page', 0, UID, implode('、', $page_title)]);
            }
        }else{
            $page_title = DntypeModel::where('id', 'in', $ids)->column('title');
            return parent::setStatus($type, ['page_'.$type, 'cms_page', 0, UID, implode('、', $page_title)]);
        }

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
        $page    = DntypeModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $page . ')，新值：(' . $value . ')';
        return parent::quickEdit(['page_edit', 'cms_page', $id, UID, $details]);
    }
}