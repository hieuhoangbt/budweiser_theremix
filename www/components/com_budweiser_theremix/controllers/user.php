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
class Budweiser_theremixControllerUser extends Budweiser_theremixController {

    public function &getModel($name = 'User', $prefix = 'Budweiser_theremixModel') {
        $model = parent::getModel($name, $prefix, array('ignore_request' => true));
        return $model;
    }

    public function saveLoginFB() {
        /*         *
         * Save info login facebook
         * */
        $model = $this->getModel();
        $id = JRequest::getVar('scope_id');
        $email = JRequest::getVar('email');
        $fullname = JRequest::getVar('name');
        $gender = JRequest::getVar('gender');
        $check = $model->checkUserExist($email);
        if (empty($check)) {
            $result = $model->saveInfoLoginFB($fullname, $email, $gender, $id);
            if (!empty($result)) {
                $sess = JFactory::getSession();
                $sess->set('user_id', $result);
            }
        } else {
            $sess = JFactory::getSession();
            $sess->set('user_id', $check->id);
            $result = true;
        }

        echo json_encode($result);
        exit;
    }




}
