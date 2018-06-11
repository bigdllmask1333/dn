<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/22
 * Time: 16:03
 */

namespace app\index\controller;

use think\Db;
use think\Request;
use Mail\Mail;
class Index extends Home
{
    //参数的配置 请登录zz.253.com 获取以下API信息 ↓↓↓↓↓↓↓
    const API_SEND_URL='http://smssh1.253.com/msg/send/json'; //创蓝发送短信接口URL
    const API_ACCOUNT= 'N424514_N4555470'; // 创蓝API账号
    const API_PASSWORD= 'yg8fOB0E9q6fb0';// 创蓝API密码

    /*构造函数*/
    public function _initialize()
    {
        if (!config('web_site_status')) {
            $this->error('站点已经关闭，请稍后访问~');
        }

        /*域名分类*/
        $dntype=Db::name('cms_dntype')->where(['status'=>'1','istab'=>'1'])->select();
        $this->assign('dntype',$dntype);                /*域名分类*/


        /*二级分类*/
        $dntypelist=Db::name('cms_dntype')->where(['status'=>'1'])->select();
        $this->assign('dntypeslist',$dntypelist);




    }


    public function tste11(){
        $mail = new \first\second\Mail();
        $mail->setServer("smtp.zoho.com", "kylin@201818.com", "zyx19880914",465, true); //设置smtp服务器，到服务器的SSL连接
        $mail->setFrom("kylin@201818.com"); //设置发件人
        $mail->setReceiver("1113249273@qq.com"); //设置收件人，多个收件人，调用多次
        $mail->setMail("test", "<b>test</b>"); //设置邮件主题、内容
        $mail->sendMail(); //发送
    }



    /**
     * 官网首页
     */
    public function index(){
        /*域名总数*/
        $Total=Db::name('cms_page')->where(['status'=>'1'])->count();
        /*域名分类*/
        $dntype=Db::name('cms_dntype')->where(['status'=>'1'])->select();
        $this->assign('total',$Total);                     /*域名总数*/
        /*域名优选8条数据*/
        $recommends=Db::name('cms_page')->where(['recommends'=>'1','status'=>'1'])->order('id desc')->limit(8)->select();
        $resdata=array();
        $tt=array();
        foreach ($recommends as $val){
            $tt=$val;
            $ts=GetPartStr($val['description'],6);
            $tt['description']=$ts;
            array_push($resdata,$tt);
        }

        $this->assign('recommendslist',$resdata);   /*推荐域名8条数据*/
        /*分类优选*/
        /*思路：做一个二维数组，拿出所有的分组进行循环，有数据的就入栈二维数组*/
        $fltype=array();
        $indata=array();
        foreach ($dntype as $val){
            $datanext=Db::name('cms_page')->where(['dntype'=>$val['id'],'status'=>'1'])->order('id desc')->limit(5)->select();
            $resdatas=array();
            $tts=array();
            foreach ($datanext as $vals){
                $tts=$vals;
                $ts=GetPartStr($vals['description'],6);
                $tts['description']=$ts;
                array_push($resdatas,$tts);
            }
            if($datanext){
                $indata['title']=$val['title'];
                $indata['typeid']=$val['id'];
                $indata['data']=$resdatas;
                array_push($fltype,$indata);
            }
        }

        /*最新出售域名*/
        $csdnlist=Db::name('cms_page')
            ->where(['status'=>'0'])
            ->order('update_time desc')
            ->paginate(8,false,['query'=>request()->param()]);



        /*广告位1*/
        $adtypelist=Db::table('dn_cms_adtype')->where(['status'=>'1'])->select();

        if(count($adtypelist)>=1){
            $adtype=$adtypelist[0]['id'];
            $firstad=Db::query('SELECT a.id,a.title,a.cover,a.urls,w.path FROM dn_cms_slider a INNER JOIN dn_admin_attachment w ON a.cover=w.id where a.status=1 and a.adtype='.$adtype);

            trace("=============================================================");
            trace($firstad);
            trace("=============================================================");

            $this->assign('firstad',$firstad);   /*推荐域名8条数据*/
        }

        /*广告位2*/
        if(count($adtypelist)>=2){
            $adtype=$adtypelist[1]['id'];
            $secondad=Db::query('SELECT a.id,a.title,a.cover,a.urls,w.path FROM dn_cms_slider a INNER JOIN dn_admin_attachment w ON a.cover=w.id where a.status=1 and a.adtype='.$adtype);
            trace("*********************************");
            trace($secondad);
            trace("*********************************");

            $this->assign('secondad',$secondad);   /*推荐域名8条数据*/
        }






        $this->assign('csdnlist',$csdnlist);   /*推荐域名8条数据*/
        $this->assign('fltypelist',$fltype);   /*推荐域名8条数据*/
        return $this->fetch();
    }

    /**
     * 导航分类页
     */
    public function tp(){

        /*搜索查询START*/
        if(Request::instance()->isGet()){
            $id      = addslashes(input("typeid"));
            if($id){
                $dnlist=Db::name('cms_page')
                    ->where(['dntype'=>$id])
                    ->where(['status'=>'1'])
                    ->paginate(10,false,['query'=>request()->param()]);


                $resdatas=array();
                $tts=array();
                foreach ($dnlist as $vals){
                    $tts=$vals;
                    $ts=GetPartStr($vals['description'],6);
                    $tts['description']=$ts;
                    array_push($resdatas,$tts);
                }



                $types=Db::name('cms_dntype')->where(['id'=>$id])->find();
            }
        }
        /*搜索查询END*/
        $page = $dnlist->render();

        /*广告位3*/
        $adtypelist=Db::table('dn_cms_adtype')->where(['status'=>'1'])->select();

        if(count($adtypelist)>=3){
            $adtype=$adtypelist[2]['id'];
            $thirdad=Db::query('SELECT a.id,a.title,a.cover,a.urls,w.path FROM dn_cms_slider a INNER JOIN dn_admin_attachment w ON a.cover=w.id where a.status=1 and a.adtype='.$adtype);

            trace("=============================================================");
            trace($thirdad);
            trace("=============================================================");

            $this->assign('thirdad',$thirdad);   /*推荐域名8条数据*/
        }

        /*域名分类*/
        $this->assign('list',$resdatas);                  /*域名列表*/
        $this->assign('types',$types);                  /*域名列表*/
        $this->assign('page',$page);                /*分页*/
        return $this->fetch();
    }

    /*域名优选*/
    public function dnbetter(){
        $dntype=Db::name('cms_dntype')->where(['status'=>'1'])->select();
        $fltype=array();
        $indata=array();
        foreach ($dntype as $val){
            $datanext=Db::name('cms_page')->where(['dntype'=>$val['id'],'status'=>'1'])->order('id desc')->select();


            $resdatas=array();
            $tts=array();
            foreach ($datanext as $vals){
                $tts=$vals;
                $ts=GetPartStr($vals['description'],6);
                $tts['description']=$ts;
                array_push($resdatas,$tts);
            }


            if($resdatas){
                $indata['title']=$val['title'];
                $indata['typeid']=$val['id'];
                $indata['data']=$resdatas;
                array_push($fltype,$indata);
            }
        }

        $this->assign('fltypelist',$fltype);   /*推荐域名8条数据*/

        return $this->fetch('bestDomain');
    }
    /*域名详情*/
    public function dn_info(){
        /*搜索查询START*/
        $request = Request::instance();
        $url=$request->url();
        $pieces = explode("dn_info/dn/", $url);

        if($pieces){
            $info=Db::name('cms_page')->where(['domain_name'=>$pieces['1']])->find();
        }

        $this->assign('info',$info);
        return $this->fetch();
    }



    /*用户提交信息*/
    public function addmassage(){
        $phone=Db::name('cms_phone')->where(['id'=>'55'])->find();
        $phonenum=$phone['phone'];

        $sendmail=Db::name('cms_phone')->where(['id'=>'56'])->find();
        $mails=$sendmail['phone'];

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
            $cc="【2018域名交易网站】后台有新消息，注意查看！";
            $this->sendSMS($phonenum,$cc);
//            $this->sendSMS($phonenum,'【域名网站】后台有新消息，注意查看！');
//            $this->sendSMS($phonenum,'【域名网站】您好，你有新的客户需求，域名：'.$datas['domain_name'].',用户：'.$datas['buyer_name'].',手机：'.$datas['buyer_tel'].'，请前往后台查看。');
//            $this->sendSMS($phonenum,'【域名网站】您好，你有新的客户需求，域名：'.$datas['domain_name'].',用户：'.$datas['buyer_name'].',手机：'.$datas['buyer_tel'].'，请前往后台查看。');
//            $this->sendSMS($phonenum,'您好，您有新的客户需求订单，请前往后台查看：用户名：'.$datas['buyer_name'].',联系方式：'.$datas['buyer_tel'].'，选购域名：'.$datas['domain_name'].',报价：'.$datas['buyer_hopeprice'].',补充：'.$datas['instructions'] );
//            $this->sendSMS($phonenum,'您好，您有新的客户需求订单，请前往后台查看：用户名：'.$datas['buyer_name'].',联系方式：'.$datas['buyer_tel'].'，选购域名：'.$datas['domain_name'].',报价：'.$datas['buyer_hopeprice'].',补充：'.$datas['instructions'] );


            /*邮件发送*/
            $mail = new \first\second\Mail();
            $mail->setServer("smtp.zoho.com", "kylin@201818.com", "zyx19880914",465, true); //设置smtp服务器，到服务器的SSL连接
            $mail->setFrom("kylin@201818.com"); //设置发件人
            $mail->setReceiver($mails); //设置收件人，多个收件人，调用多次
            $mail->setMail("【2018域名交易网站】", "<b>".$cc."</b>"); //设置邮件主题、内容
            $mail->sendMail(); //发送
            /*邮件发送*/


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
//            'msg' => urlencode($msg),
            'msg' => urlencode($msg),
            'phone' => $mobile,
            'report' => $needstatus
        );

        trace("=====================================================");
        trace($postArr);
        trace("=====================================================");
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


    public function search(){
        /*搜索查询START*/
        if(Request::instance()->isGet()){
            $search  = addslashes(input("get.search"));
            $suffix  = addslashes(input("get.suffix"));

            /*域名列表*/
            if($search=='' && $suffix=='' ){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->paginate(15,false,['query'=>request()->param()]);
            }
            if($search!='' && $suffix!='' ){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$search.'%')
                    ->where('domain_name','like','%'.$suffix.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($search!='' && $suffix=='' ){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$search.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($search=='' && $suffix!='' ){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$suffix.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }
        }

        $resdatas=array();
        $tts=array();
        foreach ($dnlist as $vals){
            $tts=$vals;
            $ts=GetPartStr($vals['description'],6);
            $tts['description']=$ts;
            array_push($resdatas,$tts);
        }



        /*搜索查询END*/
        $page = $dnlist->render();
        $this->assign('page',$page);                /*分页*/
        $this->assign('dnlist',$resdatas);   /*推荐域名8条数据*/
        return $this->fetch();
    }

    /*首页搜索进入的页面*/
    public function search2(){
        if(Request::instance()->isGet()){
            $crux  = addslashes(input("get.crux"));    /*域名主体*/
            $types  = addslashes(input("get.types"));  /*域名分类，title*/
            $hz  = addslashes(input("get.hz"));        /*域名后缀*/


            if($types!=''){
                $info=Db::name('cms_dntype')->where(['title'=>$types])->find();
                $types=$info['id'];
            }
            if($crux!='' && $types!='' && $hz!=''){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$crux.'%')
                    ->where('dntype',$types)
                    ->where('domain_name','like','%'.$hz.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux=='' && $types=='' && $hz==''){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux=='' && $types!=''&& $hz!=''){
                $dnlist=Db::name('cms_page')
                    ->where('dntype',$types)
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$hz.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux!='' && $types==''&& $hz!=''){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$crux.'%')
                    ->where('domain_name','like','%'.$hz.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux!='' && $types!=''&& $hz==''){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$crux.'%')
                    ->where('dntype',$types)
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux!='' && $types=='' && $hz==''){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$crux.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux=='' && $types!='' && $hz==''){
                $dnlist=Db::name('cms_page')
                    ->where('dntype',$types)
                    ->where(['status'=>'1'])
                    ->paginate(15,false,['query'=>request()->param()]);
            }

            if($crux=='' && $types=='' && $hz!=''){
                $dnlist=Db::name('cms_page')
                    ->where(['status'=>'1'])
                    ->where('domain_name','like','%'.$hz.'%')
                    ->paginate(15,false,['query'=>request()->param()]);
            }
        }


        $resdatas=array();
        $tts=array();
        foreach ($dnlist as $vals){
            $tts=$vals;
            $ts=GetPartStr($vals['description'],6);
            $tts['description']=$ts;
            array_push($resdatas,$tts);
        }


        /*搜索查询END*/
        $page = $dnlist->render();
        $this->assign('page',$page);                /*分页*/
        $this->assign('dnlist',$resdatas);   /*推荐域名8条数据*/
        return $this->fetch();
    }

    public function phpinfo(){
        phpinfo();
    }

    public function zxcs(){
        /*搜索查询START*/
        $dnlist=Db::name('cms_page')
            ->where(['status'=>'0'])
            ->paginate(10,false,['query'=>request()->param()]);
        /*搜索查询END*/
        $page = $dnlist->render();
        /*域名分类*/
        $this->assign('list',$dnlist);                  /*域名列表*/
        $this->assign('page',$page);                /*分页*/
        return $this->fetch();
    }


    /*云图插入*/
    public function jianbiao(){
        header("Content-type:text/html;charset=utf-8");
        $str="key=77978e28102a6a5304e26275ef5c5468&name=yuntu_suoc49d81aa2cdfc78e5e421961b7b0e50f";
        $postArr = array (
            'key'  =>  "77978e28102a6a5304e26275ef5c5468",
            'name' =>  "yuntu_suo",
            'sig'  =>  md5($str)
        );
        $url="http://yuntuapi.amap.com/datamanage/table/create";
        $datas=$this->curlPostyuntu($url,$postArr);
        var_dump($postArr);
        var_dump($datas);
    }
    /**
     * 通过CURL发送HTTP请求
     * @param string $url  //请求URL
     * @param array $postFields //请求参数
     * @return mixed
     *
     */
    //post方式发送请求
    public function curlPostyuntu($url,$fields,$timeout=10){
        $headers = array(
            'Content-Type: application/x-www-form-urlencoded;charset=utf-8');
        // Open connection
        $ch = curl_init();
        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt ( $ch, CURLOPT_CONNECTTIMEOUT, $timeout );
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($fields));
//        print_r('HTTP Params <br> '.urldecode(http_build_query($fields)));
//        echo'<br>';
        // Execute post
        $result = curl_exec($ch);
        // Close connection
        curl_close($ch);
        return $result;
    }

    /*定时任务发送邮件*/
    public function Sendemail(){
        /*每次进入的时候验证过期时间是否大于当前时间*/
        $time=time();
        $datalist=Db::name('cms_page')->where([])->select();
        $expiredn=array();
        foreach ($datalist as $val){
            $data=array();
            if($val['expiry_time']<=$time){
                array_push($expiredn,$val['domain_name']);
            }
        }
        $info="";
        if(count($expiredn)>0){
            foreach ($expiredn as $val){
                $info.="<li>".$val."</li>";
            }
            $info="您好，您有以下域名已过期，请到已出售域名查看并续费延期:".$info;

            $sendmail=Db::name('cms_phone')->where(['id'=>'56'])->find();
//            $mails="1113249273@qq.com";
            $mails=$sendmail['phone'];
            /*邮件发送*/
            $mail = new \first\second\Mail();
            $mail->setServer("smtp.zoho.com", "kylin@201818.com", "zyx19880914",465, true); //设置smtp服务器，到服务器的SSL连接
            $mail->setFrom("kylin@201818.com"); //设置发件人
            $mail->setReceiver($mails); //设置收件人，多个收件人，调用多次
            $mail->setMail("【2018域名交易网站】", "<b>".$info."</b>"); //设置邮件主题、内容
            $mail->sendMail(); //发送
            echo $info;
            echo "<br>";
            echo $mails;
            /*邮件发送*/

            /*短信发送*/
            $phone1=Db::name('cms_phone')->where(['id'=>'55'])->find();
            $phonenum2=$phone1['phone'];
            $cc="【2018域名交易网站】后台有过期域名，注意查看！";
            $this->sendSMS($phonenum2,$cc);
            /*短信发送*/
        }

    }

}