<?php
/**
 * Created by PhpStorm.
 * User: 老开车
 * Date: 2018/6/5
 * Time: 13:05
 */

namespace app\index\controller;

use think\Db;

class Test
{
    public function index(){
        $data = ['data' => 'sadasdasdsa12121'];
        if(Db::table('dn_cms_test')->insert($data)){
            echo "success";
        };
    }
}