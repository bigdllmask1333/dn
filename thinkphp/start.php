<?php

// | ThinkPHP [ WE CAN DO IT JUST THINK ]

// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.

// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

// | Author: liu21st <liu21st@gmail.com>


namespace think;

// ThinkPHP 引导文件
// 1. 加载基础文件
require __DIR__ . '/base.php';

// 2. 执行应用
App::run()->send();

Lang::setAllowLangList(['zh-cn','en-us']);