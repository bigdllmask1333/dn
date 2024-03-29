<?php

namespace app\cms\validate;

use think\Validate;

/**
 * 菜单验证器
 * @package app\cms\validate
 * @author 吴伟祥 <cwwx0128@qq.com>
 */
class Menu extends Validate
{
    // 定义验证规则
    protected $rule = [
        'column|栏目' => 'requireIf:type,0',
        'page|单页' => 'requireIf:type,1',
        'title|菜单标题' => 'requireIf:type,2|length:1,30',
        'url|URL' => 'requireIf:type,2',
    ];

    // 定义验证提示
    protected $message = [
        'column.requireIf' => '请选择栏目',
        'page.requireIf'   => '请选择单页',
        'title.requireIf'  => '菜单标题不能为空',
        'url.requireIf'    => 'URL不能为空'
    ];

    // 定义验证场景
    protected $scene = [
        'title' => ['title']
    ];
}
