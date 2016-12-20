<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Budweiser_theremix
 * @author     anh <xuananh1059@gmail.com>
 * @copyright  2016 anh
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;

jimport('joomla.application.component.controlleradmin');

use Joomla\Utilities\ArrayHelper;

/**
 * Results list controller class.
 *
 * @since  1.6
 */
class Budweiser_theremixControllerResults extends JControllerAdmin
{
	/**
	 * Method to clone existing Results
	 *
	 * @return void
	 */
	public function duplicate()
	{
		// Check for request forgeries
		Jsession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		// Get id(s)
		$pks = $this->input->post->get('cid', array(), 'array');

		try
		{
			if (empty($pks))
			{
				throw new Exception(JText::_('COM_BUDWEISER_THEREMIX_NO_ELEMENT_SELECTED'));
			}

			ArrayHelper::toInteger($pks);
			$model = $this->getModel();
			$model->duplicate($pks);
			$this->setMessage(Jtext::_('COM_BUDWEISER_THEREMIX_ITEMS_SUCCESS_DUPLICATED'));
		}
		catch (Exception $e)
		{
			JFactory::getApplication()->enqueueMessage($e->getMessage(), 'warning');
		}

		$this->setRedirect('index.php?option=com_budweiser_theremix&view=results');
	}

	/**
	 * Proxy for getModel.
	 *
	 * @param   string  $name    Optional. Model name
	 * @param   string  $prefix  Optional. Class prefix
	 * @param   array   $config  Optional. Configuration array for model
	 *
	 * @return  object	The Model
	 *
	 * @since    1.6
	 */
	public function getModel($name = 'result', $prefix = 'Budweiser_theremixModel', $config = array())
	{
		$model = parent::getModel($name, $prefix, array('ignore_request' => true));

		return $model;
	}

	/**
	 * Method to save the submitted ordering values for records via AJAX.
	 *
	 * @return  void
	 *
	 * @since   3.0
	 */
	public function saveOrderAjax()
	{
		// Get the input
		$input = JFactory::getApplication()->input;
		$pks   = $input->post->get('cid', array(), 'array');
		$order = $input->post->get('order', array(), 'array');

		// Sanitize the input
		ArrayHelper::toInteger($pks);
		ArrayHelper::toInteger($order);

		// Get the model
		$model = $this->getModel();

		// Save the ordering
		$return = $model->saveorder($pks, $order);

		if ($return)
		{
			echo "1";
		}

		// Close the application
		JFactory::getApplication()->close();
	}
    public function export2excel() {
        require_once JPATH_BASE . DIRECTORY_SEPARATOR . 'components/com_budweiser_theremix/helpers/PHPExcel.php';
        $start = 0;
        $now = date('Y-m-d');
        do {
            $db = JFactory::getDbo();
            $query = $db->getQuery(true);
            $query->select('a.*, b.fullname as user_name, b.email, b.gender, b.scope_id');
            $query->from('`#__budweiser_theremix_result` AS a');
            $query->join('LEFT','`#__budweiser_theremix_user` AS b ON a.user_id=b.id');
            $query->order('a.id ASC');
            $query->where('a.state = 1');

            $limit = 1000;
            $db->setQuery($query, $start, $limit);
            $items = $db->loadObjectList();


            //export excel
            $filenameoutput = JPATH_SITE . "/tmp/danh-sach-ket-qua" . $now;
            if ($start == 0) {
                // Create new PHPExcel object
                $objPHPExcel = new PHPExcel();
                // Rename sheet
                $objPHPExcel->getActiveSheet()->setTitle('Danh Sách kết quả');
                // Set active sheet index to the first sheet, so Excel opens this as the first sheet
                $objPHPExcel->setActiveSheetIndex(0);
                $worksheet = $objPHPExcel->getActiveSheet();
                $row = 1; // 1-based index
                $label_name = array('STT', 'Fullname', 'Gender','Email','Scope_id','Celebrity','Image', 'Created Date');
                $field_name = array('stt', 'user_name', 'gender', 'email', 'scope_id', 'celebrity_id', 'image', 'created_at');
                if ($row == 1) {
                    $col = 0;
                    foreach ($label_name as $field) {
                        $worksheet->getRowDimension($row)->setRowHeight(-1);
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $field);
                        $col++;
                    }
                    $row++;
                }
            } else {
                $fileType = 'Excel5';

                // Read the file
                $objReader = PHPExcel_IOFactory::createReader($fileType);
                $objPHPExcel = $objReader->load($filenameoutput . '.xls');
                $objPHPExcel->setActiveSheetIndex(0);
                $worksheet = $objPHPExcel->getActiveSheet();
            }
            $start += $limit;
            foreach ($items as $row_data) {
                $col = 0;
                foreach ($field_name as $field) {
                    if ($field == 'stt') {
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $row - 1);
                    } else if ($field == 'scope_id') {
                        $scope="http://facebook.com/".$row_data->$field;
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $scope);
                    }else if ($field == 'image') {
                        $image=JUri::root().$row_data->$field;
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $image);
                    } else if ($field == 'gender') {
                        if ($row_data->$field == 1) {
                            $gender = 'Nam';
                        } else {
                            $gender = 'Nữ';
                        }
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $gender);
                    } else {
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $row_data->$field);
                    }

                    $col++;
                }
                $row++;
            }
            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
            $objWriter->save($filenameoutput . ".xls");
            $total = count($items);
            if ($total < $limit) {
                $append = false;
            } else {
                $append = true;
            }
        } while ($append == true);
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=danh-sach.xls");
        header('Cache-Control: max-age=0');
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        @unlink($filenameoutput . ".xls");
        exit;
    }
}
