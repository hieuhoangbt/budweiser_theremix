<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';
$sess = JFactory::getSession();
$error=$sess->get('error');

$itemCelebrities = Budweiser_theremixHelpersBudweiser_theremix::getItemId('celebrity');
$urlCelebrities = JRoute::_('index.php?option=com_budweiser_theremix' . $itemCelebrities);
?>
<div class="logo">								
    <a href="#" class="logoBud"><img src="<?php echo $tpath; ?>assets/images/logo_BUD.png" alt="" /></a>
    <span class="hoaam"><img src="<?php echo $tpath; ?>assets/images/hoaamanhsang.png" alt="" /></span>
</div>
<?php if(!empty($error)){ ?>
<h4><?php echo $error; ?></h4>
<?php } ?>
<div class="btn-join"><a class="" href="<?php echo $urlCelebrities; ?>">THAM GIA</a></div>