<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Budweiser_theremix
 * @author     anh <xuananh1059@gmail.com>
 * @copyright  2016 anh
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

/**
 * Class Budweiser_theremixFrontendHelper
 *
 * @since  1.6
 */
class Budweiser_theremixHelpersBudweiser_theremix
{
	/**
	 * Get an instance of the named model
	 *
	 * @param   string  $name  Model name
	 *
	 * @return null|object
	 */
	public static function getModel($name)
	{
		$model = null;

		// If the file exists, let's
		if (file_exists(JPATH_SITE . '/components/com_budweiser_theremix/models/' . strtolower($name) . '.php'))
		{
			require_once JPATH_SITE . '/components/com_budweiser_theremix/models/' . strtolower($name) . '.php';
			$model = JModelLegacy::getInstance($name, 'Budweiser_theremixModel');
		}

		return $model;
	}

	/**
	 * Gets the files attached to an item
	 *
	 * @param   int     $pk     The item's id
	 *
	 * @param   string  $table  The table's name
	 *
	 * @param   string  $field  The field's name
	 *
	 * @return  array  The files
	 */
	public static function getFiles($pk, $table, $field)
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query
			->select($field)
			->from($table)
			->where('id = ' . (int) $pk);

		$db->setQuery($query);

		return explode(',', $db->loadResult());
	}

    /**
     * Gets the edit permission for an user
     *
     * @param   mixed  $item  The item
     *
     * @return  bool
     */
    public static function canUserEdit($item)
    {
        $permission = false;
        $user       = JFactory::getUser();

        if ($user->authorise('core.edit', 'com_budweiser_theremix'))
        {
            $permission = true;
        }
        else
        {
            if (isset($item->created_by))
            {
                if ($user->authorise('core.edit.own', 'com_budweiser_theremix') && $item->created_by == $user->id)
                {
                    $permission = true;
                }
            }
            else
            {
                $permission = true;
            }
        }

        return $permission;
    }
    public static function getItemId($view) {
        $component = JComponentHelper::getComponent('com_budweiser_theremix');
        $menus = JApplication::getMenu('site', array());
        $menu_items = $menus->getItems('component_id', $component->id);
        $itemid = null;
        if (isset($menu_items)) {
            foreach ($menu_items as $menu_item) {
                if ((@$menu_item->query['view'] == $view)) {
                    $itemid = '&Itemid=' . $menu_item->id;
                    break;
                }
            }
        }
        return $itemid;
    }
    public static function getNameCeleb($id){
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('name');
        $query->from('#__budweiser_theremix_celebrity');
        $query->where('id='.$id);
        $query->where('state=1');
        $db->setQuery($query);
        $result = $db->loadResult();
        return (empty($result)) ? false : $result;
    }
}
