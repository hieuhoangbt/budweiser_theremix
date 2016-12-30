<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/assets/tool/';
$sess = JFactory::getSession();

$name = JRequest::getVar('name');
$celeb = JRequest::getInt('celeb');
if (empty($name) || empty($celeb)) {
    $itemHome = Budweiser_theremixHelpersBudweiser_theremix::getItemId('home');
    $urlHome = JRoute::_('index.php?option=com_budweiser_theremix' . $itemHome);
    $error = $sess->set('error', 'Vui lòng chọn ca sĩ và điền thông tin trước khi chụp ảnh!');
    $app->redirect($urlHome);
}
$name_celeb = Budweiser_theremixHelpersBudweiser_theremix::getNameCeleb($celeb);
?>
<script type="text/javascript">
    var CELEB_ID = "<?php echo $celeb; ?>";
    var USERNAME = "<?php echo strtoupper($name); ?>";
    var hasTag = "<?php echo strtoupper($name_celeb); ?>";
</script>
<div id="page">
    <div class="content">
        <div class="bg-tool"></div>
        <div class="tool">
            <div class="img-top">
                <div class="logo-tool">
                    <a href="<?php echo JUri::root(); ?>"><img src="<?php echo $tpath; ?>images/logo-tool.png" alt=""></a>
                </div>
                <div class="slogan-tool">
                    <img src="<?php echo $tpath; ?>images/slogan-tool.png" alt="">
                </div>
            </div>
            <div class="frame-wrapper">
                <canvas id="canvas">
                    Browers doesn't not support canvas html5
                </canvas>
                <div class="time_option disable">
                    <div class="icon_time" option_time="3"><img src="<?php echo $tpath; ?>images/3s.png" alt=""></div>
                    <div class="icon_time" option_time="10"><img src="<?php echo $tpath; ?>images/10s.png" alt=""></div>
                </div>
                <div class="timeCoundow">0</div>
                <div class="controll">
                    <form id="change_img" class="form-upload" action="">
                        <!--div class="timeCoundow">0</div>-->
                        <!--<div class="vetical-middle loadder">
                            <div class="center-child">
                                <div class="loadding">&nbsp;</div>
                            </div>
                        </div>-->
                        <div class="btn-form link-snap disable" direct="snap">
                            <span>chụp ảnh</span>
                        </div>
                        <div class="link-after disable">
                            <div class="link-after-item link-snap-prev">
                                <span>chụp lại</span>
                                <img class="img-link" src="<?php echo $tpath; ?>images/bg_snap_prev.png" alt=""/>
                            </div>
                            <div class="link-after-item link-share">
                                <span>chia sẻ</span>
                                <img class="img-link" src="<?php echo $tpath; ?>images/bg_share_face.png" alt=""/>
                            </div>
                        </div>
                        <div class="btn-form link-file disable" direct="file">
                            <span>Tải ảnh</span>
                            <img class="img-link up_file" src="<?php echo $tpath; ?>images/bg_upload.png"
                                 default_src="<?php echo $tpath; ?>images/bg_upload.png" change_src="images/bg_upload_change.png" alt=""/>
                            <img class="img-link snap_file disable" src="<?php echo $tpath; ?>images/bg_snap_file.png" alt="">
                            
                            <input class="input_file" id="file_upload" type="file"/>
                            <input type="hidden" name="username" value="<?php echo $name; ?>">
                            <input type="hidden" name="celeb_id" id="celeb_id" value="<?php echo $celeb; ?>">
                            <input type="hidden" name="base64_image" id="base64_image" value="">
                            <?php echo JHtml::_('form.token'); ?>
                        </div>
                        <div class="edit-controll disable">
                            <p class="zoom-icon zoom_in"><img src="<?php echo $tpath; ?>images/plus.png" alt=""/></p>
                            <div id="slider-zoom"></div>
                            <p class="zoom-icon zoom_out"><img src="<?php echo $tpath; ?>images/tru.png" alt=""/></p>
                            <p class="icon-move"></p>
                            <p class="confirm_edit"><img src="<?php echo $tpath; ?>images/ok.png" alt=""/></p>
                        </div>
                    </form>
                </div>
                <div class="image-output"></div>
                <div class="capturing-frame">
                    <video id="capturing" autoplay></video>
                </div>

                <div class="video-frame">
                    <video id="video_frame">
                        <source src="">
                    </video>
                </div>
                <!--<div class="btn-form dow"><span>dowload</span></div>-->
            </div>
        </div>
        <div class="output_base">
                <canvas id="canvas_base">Browser does't not support HTML5!</canvas>
                <img class="image-facebook" alt="">
            </div>
        <div class="loadder">
            <div class="cssload-loader">
                <img src="<?php echo $tpath; ?>images/ring-alt.svg" />
            </div>

        </div>
    </div>
    <div class="loadding-page">
        <img src="<?php echo $tpath; ?>images/image_loadding.png" alt="">
    </div>
</div>
<?php $sess->clear('error'); ?>