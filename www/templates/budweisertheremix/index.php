<?php
defined('_JEXEC') or die;
jimport('joomla.html.parameter');
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';

//Get facebook app
$params = JComponentHelper::getParams('com_budweiser_theremix');
$appID = $params->get('facebook_app_id');
$logo = $params->get('logo_budweiser');
$slogan = $params->get('slogan');
$title_share = $params->get('title_share');
$desc_share = $params->get('desc_share');
$hashtag = $params->get('hashtag');
$view = JRequest::getVar('view');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php if ($view == "tool") { ?>
        <meta http-equiv="X-UA-Compatible" content="IE=9;IE=10;IE=Edge;IE=11,chrome=1"/>
    <?php } else { ?>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php } ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jdoc:include type="head"/>
    <!-- Bootstrap -->
    <link href="<?php echo $tpath; ?>assets/css/screen.css" rel="stylesheet">
    <link href="<?php echo $tpath . 'assets/tool/' ?>css/jquery-ui.min.css" type="text/css" rel="stylesheet"/>
    <link href="<?php echo $tpath . 'assets/tool/' ?>css/loadding.css" type="text/css" rel="stylesheet"/>

    <!--end-css-->
    <!--javascript-->
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/hook.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/start.js"></script>
    <script src="<?php echo $tpath; ?>assets/js/start.h.js"></script>
    <?php if ($view == 'tool') { ?>
        <link href="<?php echo $tpath . 'assets/tool/' ?>css/screen.css" type="text/css" rel="stylesheet"/>
        <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/fontloader.js"></script>
        <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/fabric.min.js"></script>
        <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/jquery-ui.js"></script>
        <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/filereader.js"></script>sss
    <?php } ?>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var URL_ROOT = '<?php echo JURI::root(); ?>';
        var TPATH = '<?php echo $tpath; ?>';
        var SLOGAN = "<?php echo $slogan ?>";
        var LOGO = "<?php echo $logo ?>";
        var HASHTAG = "<?php echo $hashtag; ?>";
        var TITLE_SHARE = "<?php echo $title_share; ?>";
        var DESC_SHARE = "<?php echo $desc_share; ?>";
    </script>
</head>

<body class="<?php if ($view == 'thanks') {
    echo "face";
} else if ($view == 'tool') {
    echo "";
} ?>">
<?php if ($view == 'home') { ?>
    <div class="bgWelcome"></div>
<?php } else if ($view == 'form') { ?>
    <div class="bgForm"></div>
<?php } else if ($view == 'celebrity') { ?>
    <div class="bgSinger"></div>
<?php } ?>
<?php if ($view != 'thanks') { ?>
    <div class="wrapper <?php echo ($view == 'tool') ? "page-tool" : ""; ?>">
        <!--Component-->
        <jdoc:include type="component"/>
    </div>
<?php } else { ?>
    <jdoc:include type="component"/>
<?php } ?>
<?php if ($view != "tool" && $view != "thanks") {?>
    <div class="loadding-page">
        <img src="<?php echo $tpath; ?>assets/tool/images/image_loadding.png" alt="">
    </div>
<?php } ?>
<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '<?php echo $appID; ?>',
            xfbml: true,
            version: 'v2.8'
        });

        FB.getLoginStatus(function (response) {
            res_status = response;
        });

        FB.Canvas.setSize({width: 810, height: 456});
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
</body>
</html>
