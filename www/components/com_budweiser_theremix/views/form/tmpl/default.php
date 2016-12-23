<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';
$celebrity=JRequest::getInt('celeb_id');
$sess = JFactory::getSession();

if(empty($celebrity)){
    $itemCele = Budweiser_theremixHelpersBudweiser_theremix::getItemId('celebrtity');
    $urlCele = JRoute::_('index.php?option=com_budweiser_theremix' . $itemCele);
    $error=$sess->set('error','Vui lòng chọn ca sĩ yêu thích!');
    $app->redirect($urlCele);
}
?>

<div class="logo-hoaam"><img src="<?php echo $tpath; ?>assets/images/logo_hoaamanhsang.png" alt="" /></div>
<form class="form-submit" action="" method="post">
    <div class="form-group"><input type="text" name="jform[username]" value="" /></div>
    <div class="btn-start"><button type="submit" class="hover-transition"><img src="<?php echo $tpath; ?>assets/images/btn_red.png" alt=""><span> BẮT ĐẦU</span></button></div>
    
    <input type="hidden" name="jform[celeb_id]" value="<?php echo $celebrity; ?>">
    <input type="hidden" name="option" value="com_budweiser_theremix" />
    <input type="hidden" name="task" value="celebrities.submit" />
    <?php echo JHtml::_('form.token'); ?>
</form>