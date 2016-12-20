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

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/html');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');
JHtml::_('behavior.keepalive');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_budweiser_theremix/css/form.css');
?>
<script type="text/javascript">
    js = jQuery.noConflict();
    js(document).ready(function () {

    });

    Joomla.submitbutton = function (task) {
        if (task == 'celebrity.cancel') {
            Joomla.submitform(task, document.getElementById('celebrity-form'));
        }
        else {

            if (task != 'celebrity.cancel' && document.formvalidator.isValid(document.id('celebrity-form'))) {

                Joomla.submitform(task, document.getElementById('celebrity-form'));
            }
            else {
                alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
            }
        }
    }
</script>

<form
    action="<?php echo JRoute::_('index.php?option=com_budweiser_theremix&layout=edit&id=' . (int)$this->item->id); ?>"
    method="post" enctype="multipart/form-data" name="adminForm" id="celebrity-form" class="form-validate">

    <div class="form-horizontal">
        <?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

        <?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_BUDWEISER_THEREMIX_TITLE_CELEBRITY', true)); ?>
        <div class="row-fluid">
            <div class="span10 form-horizontal">
                <fieldset class="adminform">

                    <input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>"/>
                    <input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>"/>
                    <input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>"/>
                    <input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>"/>
                    <input type="hidden" name="jform[checked_out_time]"
                           value="<?php echo $this->item->checked_out_time; ?>"/>

                    <?php echo $this->form->renderField('created_by'); ?>
                    <?php echo $this->form->renderField('modified_by'); ?>
                    <?php echo $this->form->renderField('name'); ?>
                    <?php echo $this->form->renderField('image_jpeg'); ?>
                    <?php echo $this->form->renderField('image_png'); ?>
                    <!--Video-->
                    <div class="row-fluid">
                        <div class="span10 form-horizontal">
                            <fieldset class="adminform">
                                <label>Video: </label>
                                <?php echo $this->form->renderField('video'); ?>

                                <?php if (!empty($this->item->video)) : ?>
                                    <?php foreach ((array) $this->item->video as $fileSingle) : ?>
                                        <?php if (!is_array($fileSingle)) : ?>
                                            <a href="<?php echo JRoute::_(JUri::root() . $fileSingle, false); ?>"><?php echo $fileSingle; ?></a> | <a href="index.php?option=com_budweiser_theremix&task=celebrity.deleteVideoUrl&id=<?php echo $this->item->id; ?>">Delete</a> <br/>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <input type="file" name="video_file" />
                                <?php endif; ?>
                            </fieldset>
                        </div>
                    </div>
                    <!--End video-->


                    <?php if ($this->state->params->get('save_history', 1)) : ?>
                        <div class="control-group">
                            <div class="control-label"><?php echo $this->form->getLabel('version_note'); ?></div>
                            <div class="controls"><?php echo $this->form->getInput('version_note'); ?></div>
                        </div>
                    <?php endif; ?>
                </fieldset>
            </div>
        </div>
        <?php echo JHtml::_('bootstrap.endTab'); ?>



        <?php echo JHtml::_('bootstrap.endTabSet'); ?>

        <input type="hidden" name="task" value=""/>
        <?php echo JHtml::_('form.token'); ?>

    </div>
</form>
