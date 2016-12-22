<?php
defined('_JEXEC') or die;
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/assets/tool/';
?>

<div id="page">
        <div class="content">
            <div class="bg-tool"></div>
            <div class="tool">
                <div class="img-top">
                    <div class="logo-tool">
                        <img src="<?php echo $tpath; ?>images/logo-tool.png" alt="">
                    </div>
                    <div class="slogan-tool">
                        <img src="<?php echo $tpath; ?>images/slogan-tool.png" alt="">
                    </div>
                </div>
                <div class="frame-wrapper">
                    <canvas id="tool-canvas">
                        Browers doesn't not support canvas html5
                    </canvas>
                    <div class="controll">
                        <form class="form-upload" action="">
                            <div class="timeCoundow">0</div>
                            <div class="vetical-middle loadder">
                                <div class="center-child">
                                    <div class="loadding">&nbsp;</div>
                                </div>
                            </div>
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
                                <img class="img-link" src="<?php echo $tpath; ?>images/bg_upload.png" change_src="<?php echo $tpath; ?>images/bg_upload_change.png" alt=""/>
                                <input class="input_file" id="file_upload" type="file"/>
                            </div>
                            <div class="edit-controll disable">
                                <p class="zoom-icon zoom_in"><img src="<?php echo $tpath; ?>images/plus.png" alt=""/></p>
                                <div id="slider-zoom"></div>
                                <p class="zoom-icon zoom_out"><img src="<?php echo $tpath; ?>images/tru.png" alt=""/></p>
                                <p class="icon-move"></p>
                                <p class="confirm_edit"><img src="<?php echo $tpath; ?>images/ok.png" alt=""/></p>
                            </div>
                            <div class="image-output"></div>
                        </form>
                    </div>
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
        </div>
    </div>