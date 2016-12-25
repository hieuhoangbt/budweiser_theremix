<?php

/**
 * @version    3.4
 * @package     com_biore_photomaker
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Xuananh <xuananh1059.com.vn>
 */
// No direct access.
defined('_JEXEC') or die;

require_once JPATH_COMPONENT . '/controller.php';

/**
 * User list controller class.
 */
class Budweiser_theremixControllerCelebrities extends Budweiser_theremixController {

    public function &getModel($name = 'User', $prefix = 'Budweiser_theremixModel') {
        $model = parent::getModel($name, $prefix, array('ignore_request' => true));
        return $model;
    }

    public function submit() {
        JRequest::checkToken('post') or jexit('Invalid Token');
        $sess = JFactory::getSession();
        $app = JFactory::getApplication();
        $jinput = JFactory::getApplication()->input;
        $post = $jinput->get('jform', '', 'array');
        $itemHome = Budweiser_theremixHelpersBudweiser_theremix::getItemId('home');
        $urlHome = JRoute::_('index.php?option=com_budweiser_theremix' . $itemHome);
        
        if (str_replace(" ", "", $post['username']) == "") {
            $sess->set('error', 'Vui lòng nhập tên của bạn!');
            $app->redirect(JUri::current() . '?celeb_id=' . $post['celeb_id']);
        }
        if (empty($this->clean($post['username']))) {
            $sess->set('error', 'Vui lòng không nhập kí tự đặc biệt!');
            $app->redirect(JUri::current() . '?celeb_id=' . $post['celeb_id']);
        }
        if (empty($post['celeb_id']) || $post['celeb_id'] == '0') {
            $sess->set('error', 'Vui lòng chọn ca sĩ bạn muốn chụp ảnh cùng trước khi nhập tên!');
            $app->redirect(JUri::current());
        }
        $name = Budweiser_theremixHelpersBudweiser_theremix::getAlias($post['username']);
        $itemTool = Budweiser_theremixHelpersBudweiser_theremix::getItemId('tool');
        $urlTool = JRoute::_('index.php?option=com_budweiser_theremix' . $itemTool) . "?celeb=" . $post['celeb_id'] . "&name=" . $name;
        $app->redirect($urlTool);
    }

    public function clean($string) {
        $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

        return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
    }

    public function saveResult($username, $celeb) {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $now = date('Y-m-d h:i:s');
        $columns = array('username', 'celebrity_id', 'created_at');
        $values = array($db->quote($username), $db->quote($celeb), $db->quote($now));
        $query
                ->insert($db->quoteName('#__budweiser_theremix_result'))
                ->columns($db->quoteName($columns))
                ->values(implode(',', $values));
        $db->setQuery($query);
        $db->execute();
        return $db->insertid();
    }

}
