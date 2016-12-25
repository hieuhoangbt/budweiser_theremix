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
        $app = JFactory::getApplication();
        $view = $app->input->getCmd('view', 'celebritys');
        $app->input->set('view', $view);

        parent::display($cachable, $urlparams);

        return $this;
    }

    public function getAllData()
    {
        $frame = $this->getAllFrame();
        $celerities = $this->getAllCelebrity();
        $array = array(
            'frame' => $frame,
            'models' => $celerities
        );
        echo json_encode($array);
        exit;
    }

    public function getAllCelebrity()
    {
        $db = & JFactory::getDBO();
        $query = $db->getQuery(true);
        $query->select('id, image_png as image');
        $query->from('#__budweiser_theremix_celebrity');
        $query->where('state=1');
        $db->setQuery($query);
        $result = $db->loadObjectList();
        return (empty($result)) ? false : $result;
    }

    public function getAllFrame()
    {
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
        $username = JRequest::getVar('username');
        $celeb_id = JRequest::getInt('celeb_id');
        $url_img = $this->saveImage($image);
        $save = $this->insertImageResult($url_img, $celeb_id, $username);
        if ($save) {
            $result = array('status' => true, 'message' => 'success', 'url_share' => $url_img);
        } else {
            $result = array('status' => false, 'message' => 'error');
        }
        echo json_encode($result);
        exit;
    }

    public function saveImage($base64_string)
    {
        if (empty($base64_string)) {
            $result = array('status' => false, 'message' => 'error');
            echo json_encode($result);
            exit;
        }
        list($type, $data) = explode(';', $base64_string);
        list(, $data) = explode(',', $data);
        $data = base64_decode($data);
        $filename = date('d_m_Y') . '_' . uniqid() . '.png';
        $imgpath = JPATH_ROOT . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'result' . DIRECTORY_SEPARATOR . $filename;
        file_put_contents($imgpath, $data);
        $url = 'images/result/' . $filename;
        return $url;
    }

    public function insertImageResult($image_upload, $celeb_id, $username)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $now = date('Y-m-d H:i:s');
        $columns = array('username', 'celebrity_id', 'image', 'state', 'created_at');
        $values = array($db->quote($username), $db->quote($celeb_id), $db->quote($image_upload), -2, $db->quote($now));

        $query
                ->insert($db->quoteName('#__budweiser_theremix_result'))
                ->columns($db->quoteName($columns))
                ->values(implode(',', $values));
        $db->setQuery($query);
        $result = $db->execute();
        return $result;
    }

    public function updateState()
    {
        if ($_POST['state'] == 0) {
            $this->hardDeleted($_POST['img']);
            exit;
        }
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $fields = array(
            $db->quoteName('state') . ' = ' . $db->quote($_POST['state'])
        );

        $conditions = array(
            $db->quoteName('image') . ' = ' . $db->quote($_POST['img'])
        );

        $query->update($db->quoteName('#__budweiser_theremix_result'))->set($fields)->where($conditions);

        $db->setQuery($query);

        $result = $db->execute();
        exit;
    }

    public function hardDeleted($img)
    {
        $imgPath = JPATH_ROOT . DIRECTORY_SEPARATOR . $img;
        if (file_exists($imgPath)) {
            @unlink($imgPath);
        }
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $conditions = array(
            $db->quoteName('image') . ' = ' . $db->quote($_POST['img'])
        );

        $query->delete($db->quoteName('#__budweiser_theremix_result'));
        $query->where($conditions);
        $db->setQuery($query);
        $result = $db->execute();
        return true;
    }

}
