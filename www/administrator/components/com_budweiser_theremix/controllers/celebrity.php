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

jimport('joomla.application.component.controllerform');

/**
 * Celebrity controller class.
 *
 * @since  1.6
 */
class Budweiser_theremixControllerCelebrity extends JControllerForm
{
	/**
	 * Constructor
	 *
	 * @throws Exception
	 */
	public function __construct()
	{
		$this->view_list = 'celebrities';
		parent::__construct();
	}
    protected function getAlias($string) {
        $trans = array(
            "đ" => "d", "ă" => "a", "â" => "a", "á" => "a", "à" => "a",
            "ả" => "a", "ã" => "a", "ạ" => "a",
            "ấ" => "a", "ầ" => "a", "ẩ" => "a", "ẫ" => "a", "ậ" => "a",
            "ắ" => "a", "ằ" => "a", "ẳ" => "a", "ẵ" => "a", "ặ" => "a",
            "é" => "e", "è" => "e", "ẻ" => "e", "ẽ" => "e", "ẹ" => "e",
            "ế" => "e", "ề" => "e", "ể" => "e", "ễ" => "e", "ệ" => "e",
            "í" => "i", "ì" => "i", "ỉ" => "i", "ĩ" => "i", "ị" => "i",
            "ư" => "u", "ô" => "o", "ơ" => "o", "ê" => "e",
            "Ư" => "u", "Ô" => "o", "Ơ" => "o", "Ê" => "e",
            "ú" => "u", "ù" => "u", "ủ" => "u", "ũ" => "u", "ụ" => "u",
            "ứ" => "u", "ừ" => "u", "ử" => "u", "ữ" => "u", "ự" => "u",
            "ó" => "o", "ò" => "o", "ỏ" => "o", "õ" => "o", "ọ" => "o",
            "ớ" => "o", "ờ" => "o", "ở" => "o", "ỡ" => "o", "ợ" => "o",
            "ố" => "o", "ồ" => "o", "ổ" => "o", "ỗ" => "o", "ộ" => "o",
            "ú" => "u", "ù" => "u", "ủ" => "u", "ũ" => "u", "ụ" => "u",
            "ứ" => "u", "ừ" => "u", "ử" => "u", "ữ" => "u", "ự" => "u",
            "ý" => "y", "ỳ" => "y", "ỷ" => "y", "ỹ" => "y", "ỵ" => "y",
            "Ý" => "Y", "Ỳ" => "Y", "Ỷ" => "Y", "Ỹ" => "Y", "Ỵ" => "Y",
            "Đ" => "D", "Ă" => "A", "Â" => "A", "Á" => "A", "À" => "A",
            "Ả" => "A", "Ã" => "A", "Ạ" => "A",
            "Ấ" => "A", "Ầ" => "A", "Ẩ" => "A", "Ẫ" => "A", "Ậ" => "A",
            "Ắ" => "A", "Ằ" => "A", "Ẳ" => "A", "Ẵ" => "A", "Ặ" => "A",
            "É" => "E", "È" => "E", "Ẻ" => "E", "Ẽ" => "E", "Ẹ" => "E",
            "Ế" => "E", "Ề" => "E", "Ể" => "E", "Ễ" => "E", "Ệ" => "E",
            "Í" => "I", "Ì" => "I", "Ỉ" => "I", "Ĩ" => "I", "Ị" => "I",
            "Ư" => "U", "Ô" => "O", "Ơ" => "O", "Ê" => "E",
            "Ư" => "U", "Ô" => "O", "Ơ" => "O", "Ê" => "E",
            "Ú" => "U", "Ù" => "U", "Ủ" => "U", "Ũ" => "U", "Ụ" => "U",
            "Ứ" => "U", "Ừ" => "U", "Ử" => "U", "Ữ" => "U", "Ự" => "U",
            "Ó" => "O", "Ò" => "O", "Ỏ" => "O", "Õ" => "O", "Ọ" => "O",
            "Ớ" => "O", "Ờ" => "O", "Ở" => "O", "Ỡ" => "O", "Ợ" => "O",
            "Ố" => "O", "Ồ" => "O", "Ổ" => "O", "Ỗ" => "O", "Ộ" => "O",
            "Ú" => "U", "Ù" => "U", "Ủ" => "U", "Ũ" => "U", "Ụ" => "U",
            "Ứ" => "U", "Ừ" => "U", "Ử" => "U", "Ữ" => "U", "Ự" => "U",);

        //remove any '-' from the string they will be used as concatonater
        $str = str_replace('-', ' ', $string);

        $str = strtr($str, $trans);
        $lang = JFactory::getLanguage();
        $str = $lang->transliterate($str);

        // remove any duplicate whitespace, and ensure all characters are alphanumeric
        $str = preg_replace(array('/\s+/', '/[^A-Za-z0-9\-\.]/'), array('-', ''), $str);

        // lowercase and trim
        $str = trim(strtolower($str));

        return $str;
    }
    public function postSaveHook($model, $validData){
        $items = $model->getItem();
        $app = JFactory::getApplication();
        $id = $items->get('id');
        $formdata = JRequest::getVar('jform', null, 'post', 'array');
        $file = JRequest::getVar('video_file', null, 'files', 'array');
        if (!empty($file['tmp_name'])) {
            $mime = mime_content_type($file['tmp_name']);
            jimport('joomla.filesystem.file');
            $filename = $this->getAlias(uniqid() . "_" . JFile::makeSafe($file['name']));
            $src = $file['tmp_name'];
            $dest = JPATH_ROOT . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "celebrity_video" . DIRECTORY_SEPARATOR . $filename;
            if (in_array(strtolower(JFile::getExt($filename)), array('mp4')) || in_array(strtolower($mime), array('application/mp4', 'video/mp4'))) {
                if (JFile::upload($src, $dest)) {
                    $formdata['video'] = "images/celebrity_video/" . $filename;

                    $this->updateVideoUrl($id, $formdata);
                } else {
                    $msg = "Upload failed!";
                }
            } else {
                $msg = "Please upload mp4 file.";
            }

            if ($msg) {
                $this->setError($msg);
                $this->setMessage($this->getError(), 'error');

                $this->setRedirect(
                    JRoute::_(
                        'index.php?option=' . $this->option . '&view=' . $this->view_item . '&id=' . $formdata['id'] . '&layout=edit'
                        . $this->getRedirectToListAppend(), false
                    )
                );

                return false;
            }
        }
    }
    
    public function deleteVideoUrl()
    {
        $id = JRequest::getInt("id");
        $model = $this->getModel();
        $item = $this->getItemById($id);
        if ($item) {
            $videoPath = JPATH_ROOT . DIRECTORY_SEPARATOR . $item->video;
            if (file_exists($videoPath)) {
                $file = basename($videoPath, ".mp4");
                $fpathCvt = dirname($videoPath) . "/" . $file;
                if (is_dir($fpathCvt)) {
                    @rmdir($fpathCvt);
                }
                @unlink($videoPath);
            }
            $formdata = [
                'video' => ''
            ];
            $this->updateVideoUrl($id, $formdata);
        }
        $this->setMessage('Delete video in record success.', 'success');

        $this->setRedirect(
            JRoute::_(
                'index.php?option=' . $this->option . '&view=' . $this->view_item . '&id=' . $id . '&layout=edit'
                . $this->getRedirectToListAppend(), false
            )
        );
    }
        public function updateVideoUrl($id, $formdata) {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $fields = array(
            $db->quoteName('video') . ' = '. $db->quote($formdata['video'])
        );
        $conditions = array(
            $db->quoteName('id') . ' = ' . $db->quote($id)
        );

        $query->update($db->quoteName('#__budweiser_theremix_celebrity'))->set($fields)->where($conditions);

        $db->setQuery($query);

        $db->execute();
    }
    public function getItemById($id) {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("*")
            ->from($db->quoteName('#__budweiser_theremix_celebrity'))
            ->where($db->quoteName("id") . "=" . $db->quote($id));
        $db->setQuery($query);
        $item = $db->loadObject();
        return ($item) ? $item : false;
    }
}
