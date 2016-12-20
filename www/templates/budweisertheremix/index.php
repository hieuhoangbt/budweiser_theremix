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
        <title>Welcome</title>
        <!-- Bootstrap -->
        <link href="<?php echo $tpath; ?>assets/css/screen.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <?php if($view=='home'){ ?>
        <div class="bgFull"></div>
        <div class="bgWelcome"></div>
        <?php }else if($view=='form'){ ?>
        <div class="bgFull"></div>
        <?php } ?>
        <div class="wrapper">
            <!--Component-->
            <jdoc:include type="component"/>
        </div>
    </body>
</html>
