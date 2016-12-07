<?php
defined('_JEXEC') or die;
jimport('joomla.html.parameter');
$app = JFactory::getApplication();
$tpath = JURI::root() . 'templates/' . $app->getTemplate() . '/';

//Get facebook app
$params = JComponentHelper::getParams('com_budweiser_theremix');
$appID = $params->get('facebook_app_id');
?>
