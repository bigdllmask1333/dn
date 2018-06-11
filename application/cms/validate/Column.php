<?php


namespace app\cms\validate;

use think\Validate;

/**
 * 栏目验证器
 * @package app\cms\validate
 * @author 吴伟祥 <cwwx0128@qq.com>
 */
class Column extends Validate
{
    // 定义验证规则
    protected $rule = [
        'pid|所属栏目'    => 'require',
        'name|栏目名称'   => 'require|unique:cms_column,name^pid',
        'model|内容模型'  => 'require',
    ];
}
