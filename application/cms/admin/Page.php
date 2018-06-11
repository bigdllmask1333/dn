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
        /*每次进入的时候验证过期时间是否大于当前时间*/
        $time=time();
        $datalist=Db::name('cms_page')->where([])->select();
        $expiredn=array();
        foreach ($datalist as $val){
            $data=array();
            if($val['expiry_time']<=$time){
                $data['recommends']=0;
                $data['status']=0;
                array_push($expiredn,$val['domain_name']);
            }
            Db::name('cms_page')->where('id', $val['id'])->update($data);
        }

        $info="";

        if(count($expiredn)>0){
            foreach ($expiredn as $val){
                $info.="<li>".$val."</li>";
            }
            $info="您好，您有以下域名已过期，请到已出售域名查看并续费延期:".$info;
            $jump="<br> <a href='alreadysell'>点击前往已出售域名</a>";
        }



        // 查询
        $map = $this->getMap();
        // 排序
        $order = $this->getOrder('id desc');
        // 数据列表
        $map['status'] = 1;
        $data_list = PageModel::where($map)->order($order)->paginate();


// 把查询条件传入查询方法
        $btnType = [
            'class' => 'btn btn-info',
            'title' => '导入数据',
            'icon'  => 'fa fa-fw fa-sitemap',
            'href'  => url('page/import')
        ];
        $updown=[
            '0'=>'已出售',
            '1'=>'未出售',
        ];

        $inout=[
            '0'=>'不推荐',
            '1'=>'推荐',
        ];

        // 授权按钮
        // 定义按钮属性
        $btn = [
            'title' => '清空筛选',
            'href' => url('page/index') // 此属性仅用于a标签按钮，button按钮不产生作用
        ];


        $btnType2 = [
            'class' => 'btn btn-danger',
            'title' => '清空筛选',
            'icon'  => 'fa fa-fw fa-sitemap',
            'href'  => url('page/index')
        ];


        $js = <<<EOF
            <script type="text/javascript">
            
            </script>
EOF;
        $html = <<<EOF
          
EOF;
        $css = <<<EOF
           <style>
           </style>
EOF;


        /*TODD 这里可以查询出域名分类作为数据字典*/
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setExtraJs($js)
            ->setExtraHtml($html)
            ->setExtraCss($css)
            ->addTimeFilter('expiry_time')
            ->setSearch(['id' => 'ID', 'domain_name' => '域名', 'service_provider' => '服务商']) // 设置搜索框
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['domain_name', '域名', 'text.edit'],
                ['service_provider', '服务商'],
                ['dntype', '域名分类',$this->dntype()],
//                ['expiry_time', '到期时间', 'date'],
            ])
            ->addColumn('expiry_time', '到期时间', 'callback', function($value){
                $time=time();
                if($time<$value){
                    return date("Y-m-d", $value);
                }else{
                    return "<button type=\"button\" class=\"btn-danger\">已过期</button>";
                }
            })
//                ['expiry_time', '到期时间', 'date'],
            ->addColumns([ // 批量添加数据列
                ['buyprice', '买入/元'],
                ['dnprice', '展示/元'],
                ['sellingprice', '成交/元'],
                ['status', '是否出售', 'switch'],
                ['recommends', '推荐', 'switch'],
                ['right_button', '操作', 'btn']
            ])
//            ->setPageTips('温馨提示:点击到期时间排序可以看到所有已过期域名', 'info')
            ->setPageTips($info.$jump, 'danger')
            ->addFilter(['domain_name','service_provider','status']) // 添加筛选
            ->addFilter('dntype', $this->dntype()) // 域名分类
            ->addFilter('status', $updown) // 是否出售
            ->addFilter('recommends', $inout) // 是否出售
            ->addTopButton('custom', $btnType) // 添加顶部按钮
            ->addTopButtons('add,enables,disables,delete') // 批量添加顶部按钮
            ->addTopButton('custom', $btnType2) // 添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => '删除后无法恢复。']]) // 批量添加右侧按钮
            ->addOrder('id,dnprice,status,recommends,expiry_time')
            ->setRowList($data_list) // 设置表格数据
            ->addValidate('Page', 'title')
            ->fetch(); // 渲染模板
    }


    /**
     * 已出售域名
     * @author 吴伟祥 <cwwx0128@qq.com>
     * @return mixed
     */
    public function alreadysell()
    {
        /*每次进入的时候验证过期时间是否大于当前时间*/
        $time=time();
        $datalist=Db::name('cms_page')->where([])->select();
        foreach ($datalist as $val){
            $data=array();
            if($val['expiry_time']<=$time){
                $data['recommends']=0;
                $data['status']=0;
            }
            Db::name('cms_page')->where('id', $val['id'])->update($data);
        }



        // 查询
        $map = $this->getMap();
        // 排序
        $order = $this->getOrder('id desc');
        $map['status'] = 0;
        // 数据列表
        $data_list = PageModel::where($map)->order($order)->paginate();

        $map['status'] = 1;
// 把查询条件传入查询方法
        $btnType = [
            'class' => 'btn btn-info',
            'title' => '导入数据',
            'icon'  => 'fa fa-fw fa-sitemap',
            'href'  => url('page/import')
        ];
        $updown=[
            '0'=>'已出售',
            '1'=>'未出售',
        ];

        $inout=[
            '0'=>'不推荐',
            '1'=>'推荐',
        ];

        // 授权按钮
        // 定义按钮属性
        $btn = [
            'title' => '清空筛选',
            'href' => url('page/index') // 此属性仅用于a标签按钮，button按钮不产生作用
        ];


        $btnType2 = [
            'class' => 'btn btn-danger',
            'title' => '清空筛选',
            'icon'  => 'fa fa-fw fa-sitemap',
            'href'  => url('page/index')
        ];

        /*TODD 这里可以查询出域名分类作为数据字典*/
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->addTimeFilter('expiry_time')
            ->setSearch(['id' => 'ID', 'domain_name' => '域名', 'service_provider' => '服务商']) // 设置搜索框
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['domain_name', '域名', 'text.edit'],
                ['service_provider', '服务商'],
                ['dntype', '域名分类',$this->dntype()],
//                ['expiry_time', '到期时间', 'date'],
            ])
            ->addColumn('expiry_time', '到期时间', 'callback', function($value){
                $time=time();
                if($time<$value){
                    return date("Y-m-d", $value);
                }else{
                    return "<button type=\"button\" class=\"btn-danger\">已过期</button>";
                }
            })
            ->addColumns([ // 批量添加数据列
//                ['dnprice', '价格/元'],
                ['buyprice', '买入/元'],
                ['dnprice', '展示/元'],
                ['sellingprice', '成交/元'],
                ['status', '是否出售', 'switch'],
                ['recommends', '推荐', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->setPageTips('温馨提示：点击到期时间的排序就可以看到所有已过期的域名了', 'danger')
            ->addFilter(['domain_name','service_provider','status']) // 添加筛选
            ->addFilter('dntype', $this->dntype()) // 域名分类
            ->addFilter('status', $updown) // 是否出售
            ->addFilter('recommends', $inout) // 是否出售
//            ->addTopButton('custom', $btnType) // 添加顶部按钮
            ->addTopButtons('enables,delete') // 批量添加顶部按钮
            ->addTopButton('custom', $btnType2) // 添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => '删除后无法恢复。']]) // 批量添加右侧按钮
            ->addOrder('id,dnprice,status,recommends,expiry_time')
            ->setRowList($data_list) // 设置表格数据
            ->addValidate('Page', 'title')
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
            $data['status']=1;
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
                ['text', 'buyprice', '买入价格'],
                ['text', 'dnprice', '展示价格'],
                ['text', 'sellingprice', '售出价格']
            ])
            ->addSelect('dntype', '选择类型', '请选择类型', $newtylelist, '1')
            ->addFormItems([
                ['tags', 'keywords', '域名关键词', '关键字之间用英文逗号隔开'],
                ['textarea', 'description', '域名卖点', '15字左右'],
//                ['radio', 'status', '立即启用', '', ['否', '是'], 1]
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
                ['text', 'buyprice', '买入价格'],
                ['text', 'dnprice', '域名价格'],
                ['text', 'sellingprice', '售出价格']
            ])
            ->addSelect('dntype', '选择类型', '请选择类型', $newtylelist, '1')
            ->addFormItems([
                ['date', 'expiry_time', '到期时间'],
                ['tags', 'keywords', '域名关键词', '关键字之间用英文逗号隔开'],
                ['textarea', 'description', '域名卖点', '15字左右']
//                ['radio', 'status', '立即启用', '', ['否', '是']]
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
                trace("*********************^^^^^^^^^^^^^^^^^^^^^^********************");
                trace(count($data));
                trace("*********************^^^^^^^^^^^^^^^^^^^^^^********************");
                $success=0;
                $false=0;
                $typenum=0;
                $chongfu=0;
                foreach ($data as $val){
                    $title=$val[4];
                    $types=Db::name('cms_dntype')->where(['title'=>$title])->find();
                    $dntype=$types['id'];
                    if($types){
                        $yezhu=$val[0];
                        $check = PageModel::get(['domain_name' => $yezhu]);
                        if (!$check){
                            $lastdata=array();
                            $lastdata['domain_name']=$val[0];             /*域名*/
                            $lastdata['service_provider']=$val[1];       /*服务商*/
                            $lastdata['expiry_time']=strtotime($val[2]);             /*到期时间*/
                            $lastdata['description']=$val[3];             /*域名描述*/
                            $lastdata['dntype']=$dntype;                    /*类型  默认0*/
                            $lastdata['status']='1';                  /*状态*/
                            $lastdata['dnprice']=$val[5];             /*域名价格*/
                            $lastdata['buyprice']=$val[6];            /*域名买入价格*/
                            $lastdata['sellingprice']=$val[7];        /*域名卖出价格*/
                            $bbd=PageModel::create($lastdata);
                            if($bbd){
                                $success++;
                            }else{
                                $false++;
                            }
                        }else{
                            $chongfu++;
                        }
                    }else{
                        $typenum++;
                    }
                }
                $str="成功导入".$success."条数据，".$false."条数据导入失败,".$chongfu."条数据重复，".$typenum."条数据的类型不存在。";
                $this->success($str, 'index','',10);
            }else{
                $this->error('格式不对！表格模板点击这里下载!');
            }
        }

        return $this->fetch();
    }
}