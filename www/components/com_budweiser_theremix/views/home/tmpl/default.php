<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$base_url=Budweiser_theremixHelpersBudweiser_theremix::getBaseUrl();
$tpath = $base_url . 'templates/' . $app->getTemplate() . '/';

$itemCelebrities = Budweiser_theremixHelpersBudweiser_theremix::getItemId('celebrity');
$urlCelebrities = JRoute::_('index.php?option=com_budweiser_theremix' . $itemCelebrities);
?>
<div class="logo">								
    <a href="#" class="logoBud"><img src="<?php echo $tpath; ?>assets/images/logo_BUD.png" alt="" /></a>
    <span class="hoaam"><a href="<?php echo $base_url; ?>"><img src="<?php echo $tpath; ?>assets/images/hoaamanhsang.png" alt="" /></a></span>
</div>
<div class="btn-join"><a class="" href="<?php echo $urlCelebrities; ?>">THAM GIA</a></div>
<?php //$sess->clear('error'); ?>
