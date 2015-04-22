<?php echo $header; ?>
<div class="col-xs-24 col-sm-24 col-md-24">
	<div    id="breadcrumb">	
	<?php $i = 1; $count = count($breadcrumbs);  ?>
	<b></b>
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<a class="<?php if($i==$count){echo 'breadcrumb_last';} else if($i==$count-1){echo 'breadcumb_middle';} else{echo 'breadcumb_first';} ?>" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php $i++; } ?>
	</div>
</div>
<?php echo $column_left; ?>	<?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  
  <?php if (isset($this->request->get['route']) && $this->request->get['route'] == 'checkout/success') { ?>

<!-- Google Code for Website Conversion Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 965809235;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "C8t3CN2M-lYQ06jEzAM";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/965809235/?label=C8t3CN2M-lYQ06jEzAM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<?php } ?>
  
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>