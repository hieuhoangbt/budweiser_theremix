<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Budweiser_theremix
 * @author     anh <xuananh1059@gmail.com>
 * @copyright  2016 anh
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Budweiser_theremix', JPATH_COMPONENT);
JLoader::register('Budweiser_theremixController', JPATH_COMPONENT . '/controller.php');


// Execute the task.
$controller = JControllerLegacy::getInstance('Budweiser_theremix');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
