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

jimport('joomla.application.component.controller');

/**
 * Class Budweiser_theremixController
 *
 * @since  1.6
 */
class Budweiser_theremixController extends JControllerLegacy
{
	/**
	 * Method to display a view.
	 *
	 * @param   boolean $cachable  If true, the view output will be cached
	 * @param   mixed   $urlparams An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return  JController   This object to support chaining.
	 *
	 * @since    1.5
	 */
	public function display($cachable = false, $urlparams = false)
	{
        $app  = JFactory::getApplication();
        $view = $app->input->getCmd('view', 'celebritys');
		$app->input->set('view', $view);

		parent::display($cachable, $urlparams);

		return $this;
	}
        public function getAllData(){
            $frame=$this->getAllFrame();
            $celerities=$this->getAllCelebrity();
            $array=array(
                'frame'=>$frame,
                'models'=>$celerities
            );
            echo json_encode($array);exit;
           
        }

        public function getAllCelebrity() {
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('id, image_jpeg as image');
        $query->from('#__budweiser_theremix_celebrity');
        $query->where('state=1');
        $db->setQuery($query);
        $result = $db->loadObjectList();
        return (empty($result)) ? false : $result;
    }

    public function getDetailCelebrity() {
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('id,name, image_jpeg, image_png, video');
        $query->from('#__budweiser_theremix_celebrity');
        $query->where('state=1');
        $db->setQuery($query);
        $result = $db->loadObjectList();
        return (empty($result)) ? false : $result;
    }

    public function getAllFrame() {
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('id, image');
        $query->from('#__budweiser_theremix_frame');
        $query->where('state=1');
        $db->setQuery($query);
        $result = $db->loadObjectList();
        return (empty($result)) ? false : $result;
    }
}
