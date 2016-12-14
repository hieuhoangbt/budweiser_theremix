<?php

/**
 * @version     1.0.0
 * @package     com_biore_photomaker
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Xuananh <xuananh1059@gmail.com>
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Biore records.
 */
class Budweiser_theremixModelUser extends JModelList {

    /**
     * Constructor.
     *
     * @param    array    An optional associative array of configuration settings.
     * @see        JController
     * @since    1.6
     */
    public function __construct($config = array()) {
        parent::__construct($config);
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     *
     * @since    1.6
     */
    protected function populateState($ordering = null, $direction = null) {

        // Initialise variables.
        $app = JFactory::getApplication();

        // List state information
        $limit = $app->getUserStateFromRequest('global.list.limit', 'limit', $app->getCfg('list_limit'));
        $this->setState('list.limit', $limit);

        $limitstart = JFactory::getApplication()->input->getInt('limitstart', 0);
        $this->setState('list.start', $limitstart);


        if (empty($ordering)) {
            $ordering = 'a.ordering';
        }

        // List state information.
        parent::populateState($ordering, $direction);
    }

    /**
     * Build an SQL query to load the list data.
     *
     * @return    JDatabaseQuery
     * @since    1.6
     */
    protected function getListQuery() {
        // Create a new query object.
        $db = $this->getDbo();
        $query = $db->getQuery(true);

        // Select the required fields from the table.
        $query->select(
                $this->getState(
                        'list.select', 'a.*'
                )
        );

        $query->from('`#__budweiser_theremix_user` AS a');
        $query->where('`a`.`state` = 1');
        return $query;
    }

    public function getItems() {
        return parent::getItems();
    }
    public function checkUserExist($email) {
        /*         *
         * Check user exits
         * */
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('id');
        $query->from('#__budweiser_theremix_user');
        $query->where('email = "' . $email . '" and state=1');
        $db->setQuery($query);
        $result = $db->loadObject();
        return $result;
    }

    public function saveInfoLoginFB($fullname, $email, $gender, $scope_id) {
        $db = JFactory::getDbo();
        $now = date('Y-m-d H:i:s');
        $query = $db->getQuery(true);
        $columns = array('fullname', 'email', 'scope_id', 'gender', 'state', 'created_at');
        $values = array($db->quote($fullname), $db->quote($email), $db->quote($scope_id), $db->quote($gender), 1, $db->quote($now));
        $query
            ->insert($db->quoteName('#__budweiser_theremix_user'))
            ->columns($db->quoteName($columns))
            ->values(implode(',', $values));
        $db->setQuery($query);
        $db->execute();
        return $db->insertid();
    }




}
