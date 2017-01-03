<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$base_url=Budweiser_theremixHelpersBudweiser_theremix::getBaseUrl();
$tpath = $base_url . 'templates/' . $app->getTemplate() . '/';

$itemForm = Budweiser_theremixHelpersBudweiser_theremix::getItemId('form');
$urlForm = JRoute::_('index.php?option=com_budweiser_theremix' . $itemForm);

$sess = JFactory::getSession();
$error = $sess->get('error');
?>
<div class="logo-hoaam"><a href="<?php echo base_url; ?>"><img src="<?php echo $tpath; ?>assets/images/hoaamanhsang.png" alt=""/></a></div>
    <div class="title"><h2>Chọn ca sỹ bạn yêu thích nhất</h2></div>
<?php if (!empty($error)) { ?>
    <p style="text-align: center; color: white"><?php echo $error; ?></p>
<?php } ?>
    <div class="choose-singer">
        <?php foreach ($this->celebrities as $key => $value) { ?>
            <div class="item-choose">
                <img src="<?php echo $value->image_jpeg; ?>" alt=""/>
                <a href="<?php echo $urlForm . '?celeb_id=' . $value->id; ?>" class="shine">
                    <span class="hover-shine"></span>
                </a>
            </div>
        <?php } ?>
    </div>
    <div class="note">
        <h5>
            *Hãy chuẩn bị đủ ánh sáng và đứng cách xa camera khoảng cách 1m<br/>
            để có tấm hình đẹp nhất cùng ca sỹ yêu thích của bạn
        </h5>
    </div>
<?php $sess->clear('error'); ?>