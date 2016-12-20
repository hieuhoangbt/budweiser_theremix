<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';
?>
<div class="logo-hoaam"><img src="<?php echo $tpath; ?>assets/images/hoaamanhsang.png" alt="" /></div>
<div class="title"><h2>Chọn ca sĩ bạn yêu thích nhất</h2></div>
<div class="bgLayerBud">
    <div class="choose-singer">
        <?php foreach( $this->celebrities as $key=>$value){ ?>
        <div class="item-choose">
            <a href="#">
                <img src="<?php echo $value->image_jpeg; ?>" alt="" />
                <!-- <span>Bảo Thy</span> -->
            </a>
        </div>
        <?php } ?>
    </div>
</div>