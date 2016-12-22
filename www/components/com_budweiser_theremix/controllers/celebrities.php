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
    public function submit(){
        JRequest::checkToken('post') or jexit('Invalid Token');
        $sess = JFactory::getSession();
        $app = JFactory::getApplication();
        $jinput = JFactory::getApplication()->input;
        $post = $jinput->get('jform', '', 'array');
        //var_dump($post);die;
        $itemHome = Budweiser_theremixHelpersBudweiser_theremix::getItemId('home');
        $urlHome = JRoute::_('index.php?option=com_budweiser_theremix' . $itemHome);
        if(empty($post['username']) || empty($post['celeb_id'])){
            $app->redirect($urlHome);
        }
        $insert_id=$this->saveResult($post['username'],$post['celeb_id']);
        if(empty($insert_id)){
            $sess->set('error', 'Có lỗi trong quá trình lưu dữ liệu.Vui lòng thử lại sau!');
            $app->redirect($urlHome);
        }
        $itemTool = Budweiser_theremixHelpersBudweiser_theremix::getItemId('tool');
        $urlTool = JRoute::_('index.php?option=com_budweiser_theremix' . $itemTool);
        $app->redirect($urlTool);
        
        
    }
    public function saveResult($username, $celeb){
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $now = date('Y-m-d h:i:s');
        $columns = array('username', 'celebrity_id','created_at');
        $values = array($db->quote($username), $db->quote($celeb),$db->quote($now));
        $query
                ->insert($db->quoteName('#__budweiser_theremix_result'))
                ->columns($db->quoteName($columns))
                ->values(implode(',', $values));
        $db->setQuery($query);
        $db->execute();
        return $db->insertid();
    }





}
