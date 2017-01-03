<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$base_url = Budweiser_theremixHelpersBudweiser_theremix::getBaseUrl();
$tpath = $base_url . 'templates/' . $app->getTemplate() . '/';
$celebrity = JRequest::getInt('celeb_id');
$sess = JFactory::getSession();
$error = $sess->get('error');

if (JRequest::getInt("celeb_id") == 0) {
    $itemHome = Budweiser_theremixHelpersBudweiser_theremix::getItemId('home');
    $urlHome = JRoute::_('index.php?option=com_budweiser_theremix' . $itemHome);
    $error = $sess->set('error', 'Vui lòng chọn ca sĩ và điền thông tin trước khi chụp ảnh!');
    $app->redirect($urlHome);
}
?>

<div class="logo-hoaam"><a href="<?php echo $base_url; ?>"><img src="<?php echo $tpath; ?>assets/images/logo_hoaamanhsang.png" alt="" /></a></div>
<form class="form-submit" action="" method="post">
    <?php if (!empty($error)) { ?>
        <p style="text-align: center; color: white"><?php echo $error; ?></p>
    <?php } ?>
    <div class="form-group"><input type="text" name="jform[username]" /></div>
    <div class="btn-start"><button type="submit" class="hover-transition">BẮT ĐẦU</button></div>

    <input type="hidden" name="jform[celeb_id]" value="<?php echo $celebrity; ?>">
    <input type="hidden" name="option" value="com_budweiser_theremix" />
    <input type="hidden" name="task" value="celebrities.submit" />
    <?php echo JHtml::_('form.token'); ?>
</form>
<?php $sess->clear('error'); ?>