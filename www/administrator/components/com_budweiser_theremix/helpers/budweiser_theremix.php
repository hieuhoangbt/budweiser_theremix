<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Budweiser_theremix
 * @author     anh <xuananh1059@gmail.com>
 * @copyright  2016 anh
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

/**
 * Budweiser_theremix helper.
 *
 * @since  1.6
 */
class Budweiser_theremixHelpersBudweiser_theremix
{
	/**
	 * Configure the Linkbar.
	 *
	 * @param   string  $vName  string
	 *
	 * @return void
	 */
	public static function addSubmenu($vName = '')
	{
		JHtmlSidebar::addEntry(
			JText::_('COM_BUDWEISER_THEREMIX_TITLE_CELEBRITYS'),
			'index.php?option=com_budweiser_theremix&view=celebritys',
			$vName == 'celebritys'
		);
		JHtmlSidebar::addEntry(
			JText::_('COM_BUDWEISER_THEREMIX_TITLE_USERS'),
			'index.php?option=com_budweiser_theremix&view=users',
			$vName == 'users'
		);
		JHtmlSidebar::addEntry(
			JText::_('COM_BUDWEISER_THEREMIX_TITLE_FRAMES'),
			'index.php?option=com_budweiser_theremix&view=frames',
			$vName == 'frames'
		);

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
	 * Gets a list of the actions that can be performed.
	 *
	 * @return    JObject
	 *
	 * @since    1.6
	 */
	public static function getActions()
	{
		$user   = JFactory::getUser();
		$result = new JObject;

		$assetName = 'com_budweiser_theremix';

		$actions = array(
			'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.own', 'core.edit.state', 'core.delete'
		);

		foreach ($actions as $action)
		{
			$result->set($action, $user->authorise($action, $assetName));
		}

		return $result;
	}
}


class Budweiser_theremixHelper extends Budweiser_theremixHelpersBudweiser_theremix
{
    public static function getUserNameFromId($id){
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('fullname');
        $query->from('#__budweiser_theremix_user');
        $query->where('state=1 and id=' . $db->quote($id));
        $db->setQuery($query);
        return $db->loadResult();
    }
    public static function getCelebrityFromId($id){
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('name');
        $query->from('#__budweiser_theremix_celebrity');
        $query->where('state=1 and id=' . $db->quote($id));
        $db->setQuery($query);
        return $db->loadResult();
    }
}
