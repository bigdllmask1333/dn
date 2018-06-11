<?php

namespace app\cms\validate;

use think\Validate;

/**
 * 客服验证器
 * @package app\cms\validate
 * @author 吴伟祥 <cwwx0128@qq.com>
 */
class Support extends Validate
{
    // 定义验证规则
    protected $rule = [
        'name|客服名称' => 'require',
        'qq|QQ号码'    => 'number',
        'msn|MSN'     => 'email',
    ];

    // 定义验证场景
    protected $scene = [
        'name' => ['name']
    ];
}
