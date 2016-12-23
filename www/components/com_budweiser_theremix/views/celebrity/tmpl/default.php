<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';

$itemForm = Budweiser_theremixHelpersBudweiser_theremix::getItemId('form');
$urlForm = JRoute::_('index.php?option=com_budweiser_theremix' . $itemForm);

$sess = JFactory::getSession();
$error=$sess->get('error');
?>
<div class="logo-hoaam"><img src="<?php echo $tpath; ?>assets/images/hoaamanhsang.png" alt=""/></div>
<?php if(!empty($error)){ ?>
<h4><?php echo $error; ?></h4>
<?php } ?>
<div class="title"><h2>Chọn ca sỹ bạn yêu thích nhất</h2></div>
<div class="choose-singer">
    <?php foreach ($this->celebrities as $key => $value) { ?>
        <div class="item-choose">
            <img src="<?php echo $value->image_jpeg; ?>" alt=""/>
            <a href="<?php echo $urlForm.'?celeb_id='.$value->id; ?>" class="shine">
                <span class="hover-shine"></span>
            </a>
        </div>
    <?php } ?>
</div>