<?php

namespace app\index\controller;

use think\Db;
use think\Request;
/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Home
//class Index extends \think\Controller
{
    //参数的配置 请登录zz.253.com 获取以下API信息 ↓↓↓↓↓↓↓
    const API_SEND_URL='http://smssh1.253.com/msg/send/json'; //创蓝发送短信接口URL
    const API_ACCOUNT= 'N4555470'; // 创蓝API账号
    const API_PASSWORD= '1GBCK2DOZFf452';// 创蓝API密码


    public function index()
    {
        /*域名总数*/
        $Total=Db::name('cms_page')->where([])->count();


        /*推荐域名*/
        $recommends=Db::name('cms_page')->where(['recommends'=>'1'])->select();

        /*广告位*/
        $ad=Db::query('SELECT a.id,a.title,a.cover,a.urls,w.path FROM dn_cms_slider a INNER JOIN dn_admin_attachment w ON a.cover=w.id where a.status=1');


        /*搜索查询START*/
        if(Request::instance()->isGet()){
            $search  = addslashes(input("get.search"));
            $suffix  = addslashes(input("get.suffix"));
            $id      = addslashes(input("typeid"));
            /*域名列表*/
            if($search==''){
                $dnlist=Db::name('cms_page')
                    ->where([])
                    ->paginate(10,false,['query'=>request()->param()]);
            }else{
                $dnlist=Db::name('cms_page')
                    ->where('domain_name','like','%'.$search.'%')
                    ->where('domain_name','like','%'.$suffix.'%')
                    ->paginate(10,false,['query'=>request()->param()]);
            }
            if($id){
                $dnlist=Db::name('cms_page')
                    ->where(['dntype'=>$id])
                    ->paginate(10,false,['query'=>request()->param()]);
            }
        }
        /*搜索查询END*/
        /*域名分类*/
        $dntype=Db::name('cms_dntype')->where(['status'=>'1'])->select();


        $page = $dnlist->render();
        $this->assign('total',$Total);                  /*域名总数*/
        $this->assign('list',$dnlist);                  /*域名列表*/
        $this->assign('recommendslist',$recommends);   /*推荐域名*/
        $this->assign('ad',$ad);                        /*广告位*/
        $this->assign('dntype',$dntype);                /*域名分类*/
        $this->assign('page',$page);                /*域名分类*/
        return $this->fetch();
    }

    /*用户提交信息*/
    public function addmassage(){
        if (Request::instance()->isAjax()){
            $datas=input('post.')['data'];
            $dn=$datas['domain_name'];
            $dndetail=Db::name('cms_page')
                ->where('domain_name',$dn)
                ->find();
            $datas['domain_name']=$dndetail['domain_name'];
            $datas['service_provider']=$dndetail['service_provider'];
            $datas['dntype']=$dndetail['dntype'];
            $datas['status']=1;
            $datas['bake']='';
            $this->sendSMS('15956050495','您好，您有新的客户需求订单，请前往后台查看：用户名：'.$datas['buyer_name'].',联系方式：'.$datas['buyer_tel'].'，选购域名：'.$datas['domain_name'].',报价：'.$datas['buyer_hopeprice'].',补充：'.$datas['instructions'] );
//            $sj=$this->ChuanglanSmsApi($datas);

            $info=Db::name('cms_massage')->insert($datas);
            if($info){
                $data=[
                    'success'=>'true',
                    'msg'=>'您的购买信息我们已收到，平台管家24小时内与您联系，请您保持手机畅通！',
                ];
            }else{
                $data=[
                    'success'=>'false',
                    'msg'=>'新增失败',
                ];
            }
            return json($data);

        }
    }

    /**
     * 发送短信
     *
     * @param string $mobile 		手机号码
     * @param string $msg 			短信内容
     * @param string $needstatus 	是否需要状态报告
     */
    public function sendSMS( $mobile, $msg, $needstatus = 'true') {

        //创蓝接口参数
        $postArr = array (
            'account'  =>  self::API_ACCOUNT,
            'password' => self::API_PASSWORD,
            'msg' => urlencode($msg),
            'phone' => $mobile,
            'report' => $needstatus
        );
        $result = $this->curlPost( self::API_SEND_URL, $postArr);
        //var_dump($postArr);die();
        return $result;
    }

    /**
     * 通过CURL发送HTTP请求
     * @param string $url  //请求URL
     * @param array $postFields //请求参数
     * @return mixed
     *
     */
    private function curlPost($url,$postFields){
        $postFields = json_encode($postFields);

        $ch = curl_init ();
        curl_setopt( $ch, CURLOPT_URL, $url );
        curl_setopt( $ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json; charset=utf-8'   //json版本需要填写  Content-Type: application/json;
            )
        );
        curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt( $ch, CURLOPT_POST, 1 );
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $postFields);
        curl_setopt( $ch, CURLOPT_TIMEOUT,60);
        curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, 0);
        $ret = curl_exec ( $ch );
        if (false == $ret) {
            $result = curl_error(  $ch);
        } else {
            $rsp = curl_getinfo( $ch, CURLINFO_HTTP_CODE);
            if (200 != $rsp) {
                $result = "请求状态 ". $rsp . " " . curl_error($ch);
            } else {
                $result = $ret;
            }
        }
        curl_close ( $ch );
        return $result;
    }
}
