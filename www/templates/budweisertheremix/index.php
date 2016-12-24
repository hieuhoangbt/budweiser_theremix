<?php
defined('_JEXEC') or die;
jimport('joomla.html.parameter');
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';

//Get facebook app
$params = JComponentHelper::getParams('com_budweiser_theremix');
$appID = $params->get('facebook_app_id');
$view = JRequest::getVar('view');
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <jdoc:include type="head"/>
    <!-- Bootstrap -->
    <link href="<?php echo $tpath; ?>assets/css/screen.css" rel="stylesheet">
    <link href="<?php echo $tpath . 'assets/tool/' ?>css/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <link href="<?php echo $tpath . 'assets/tool/' ?>css/screen.css" type="text/css" rel="stylesheet" />
    <!--end-css-->
    <!--javascript-->
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/fabric.min.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/jquery-ui.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/hook.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/filereader.js"></script>
    <script src="<?php echo $tpath; ?>assets/js/start.h.js"></script>
    <script type="text/javascript" src="<?php echo $tpath . 'assets/tool/' ?>js/start.js"></script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var URL_ROOT = '<?php echo JURI::root(); ?>';
        var TPATH = '<?php echo $tpath; ?>';
    </script>
</head>

<body>
    <?php if ($view != 'tool') { ?>
        <div class="bgFull"></div>
    <?php } ?>
    <?php if ($view == 'home') { ?>
        <div class="bgWelcome"></div>
    <?php } else if ($view == 'form') { ?>
        <div class="bgForm"></div>
    <?php } else if ($view == 'celebrity') { ?>
        <div class="bgSinger"></div>
    <?php } ?>
    <div class="wrapper">
        <!--Component-->
        <jdoc:include type="component"/>
    </div>
</body>
</html>
