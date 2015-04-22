<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <!-- start category -->
	  <h3></h3>
	  <div style="max-height: 280px; overflow-y: auto; margin: 20px;">
		<table class="list">
          <thead>
            <tr>
			  <td width="1" style="text-align: center;"></td>
              <td class="left"><?php echo $column_name; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($categories) { ?>
            <?php foreach ($categories as $category) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($category['selected']) { ?>
                <input type="checkbox" name="blogarticles_check[<?php echo $category['blog_article_id']; ?>]" value="<?php echo $category['blog_article_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="blogarticles_check[<?php echo $category['blog_article_id']; ?>]" value="<?php echo $category['blog_article_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $category['name']; ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="2"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
	  </div>
	  <!-- end category -->
	  <!-- start module -->
	  <table id="module" class="list">
        <thead>
          <tr>
			<td class="left"><?php echo $entry_image; ?></td>
			<td class="left"><?php echo $entry_limit; ?></td>
		    <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
			<td class="left">
				<input type="text" name="blogarticles_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />			
				<input type="text" name="blogarticles_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3" />
				<?php if (isset($error_image[$module_row])) { ?>
				<span class="error"><?php echo $error_image[$module_row]; ?></span>
				<?php } ?></td>
			<td class="left"><input type="text" name="blogarticles_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="1" />
				<?php if (isset($error_limit[$module_row])) { ?>
				<span class="error"><?php echo $error_limit[$module_row]; ?></span>
				<?php } ?>
			</td>
            <td class="left"><select name="blogarticles_module[<?php echo $module_row; ?>][layout_id]">
				<?php if ($module['layout_id'] == 0) { ?>
					<option value="0" selected="selected"><?php echo $text_all; ?></option>
				<?php } else { ?>
					<option value="0"><?php echo $text_all; ?></option>
				<?php } ?>
				<?php foreach ($layouts as $layout) { ?>
				<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
				<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
				<?php } ?>
				<?php } ?>
			</select></td>
            <td class="left"><select name="blogarticles_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
				 <?php if ($module['position'] == 'footer_top') { ?>
                <option value="footer_top" selected="selected"><?php echo $text_footer_top; ?></option>
                <?php } else { ?>
                <option value="footer_top"><?php echo $text_footer_top; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="blogarticles_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="blogarticles_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
	  <!-- end module -->
    </form>
  </div>
</div>
<script type="text/javascript"><!--
  var module_row = <?php echo $module_row; ?>;

  function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';	
	html += '    <td class="left"><input type="text" name="blogarticles_module[' + module_row + '][width]" value="80" size="3" /> <input type="text" name="blogarticles_module[' + module_row + '][height]" value="80" size="3" /></td>';	
	html += '    <td class="left"><input type="text" name="blogarticles_module[' + module_row + '][limit]" value="20" size="1" /></td>';
	html += '    <td class="left"><select name="blogarticles_module[' + module_row + '][layout_id]">';
	html += '    <option value="0"><?php echo $text_all; ?></option>';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';	
	html += '    <td class="left"><select name="blogarticles_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="footer_top"><?php echo $text_footer_top; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="blogarticles_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="blogarticles_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
  }
//--></script> 
<?php echo $footer; ?>