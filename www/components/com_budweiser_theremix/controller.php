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
        $query->select('id, image_png as image');
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
    public function saveImageResult()
    {
        JSession::checkToken() or die('Invalid Token');
        $sess = JFactory::getSession();
        $image = JRequest::getVar('base64_image');
        $username=JRequest::getVar('username');
        $celeb_id=JRequest::getInt('celeb_id');
        $url_img=$this->saveImage($image);
        $save=$this->updateImageResult($url_img,$celeb_id,$username);
        $sess->clear("category_id");
        echo json_encode(array('url_share'=>JUri::root().$url_img,'insert_id'=>$save));exit;

    }
    public function saveImage($base64_string) {
        list($type, $data) = explode(';', $base64_string);
        list(, $data) = explode(',', $data);
        $data = base64_decode($data);
        $filename = date('d_m_Y').'_'.uniqid() . '.png';
        $imgpath = JPATH_ROOT . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'result' . DIRECTORY_SEPARATOR . $filename;
        file_put_contents($imgpath, $data);
        $url = 'images/result/' . $filename;
        return $url;
        
    }
    public function saveUserSelfie($image_upload,$celeb_id,$username){
        $db = JFactory::getDbo();
        $now=date('Y-m-d H:i:s');
        $query = $db->getQuery(true);
        $columns = array('username','image','celebrity_id','state', 'created_at');
        $values = array($db->quote($username),$db->quote($image_upload),$db->quote($celeb_id), 1, $db->quote($now));
        $query
            ->insert($db->quoteName('#__budweiser_theremix_result'))
            ->columns($db->quoteName($columns))
            ->values(implode(',', $values));
        $db->setQuery($query);
        $db->execute();
        return $db->insertid();
    }
}
