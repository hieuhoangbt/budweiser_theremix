<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$base_url=Budweiser_theremixHelpersBudweiser_theremix::getBaseUrl();
$tpath = $base_url . 'templates/' . $app->getTemplate() . '/assets/';
?>
<div id="page">
        <!--<div class="bgFull"></div>-->
        <div class="bgWelcome bgThank">
            <img src="<?php echo $tpath; ?>images/bg-thank.jpg" alt="">
        </div>
        <div class="wrapper">
            <div class="logo">								
                <a href="<?php echo $base_url; ?>" class="logoBud"><img src="<?php echo $tpath; ?>images/logo_BUD.png" alt="" /></a>
                <span class="hoaam"><a href="<?php echo $base_url; ?>"><img src="<?php echo $tpath; ?>images/hoaamanhsang.png" alt="" /></a></span>
            </div>
        </div>
        <div class="text-thank">
            <img src="<?php echo $tpath; ?>images/text-thank.png" alt="">
        </div>
</div>

