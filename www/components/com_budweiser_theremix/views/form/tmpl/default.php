<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';
$celebrity = JRequest::getInt('celeb_id');
$sess = JFactory::getSession();
$error = $sess->get('error');


?>

<div class="logo-hoaam"><img src="<?php echo $tpath; ?>assets/images/logo_hoaamanhsang.png" alt="" /></div>
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