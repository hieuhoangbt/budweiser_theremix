<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';
?>

<div class="logo-hoaam"><img src="<?php echo $tpath; ?>assets/images/logo_hoaamanhsang.png" alt="" /></div>
<form class="form-submit" action="" method="">
    <div class="form-group"><input type="text" value="" /></div>
    <div class="btn-start"><button class="hover-transition">BẮT ĐẦU</button></div>
</form>