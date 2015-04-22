<?php echo $header; ?>
<div class="col-xs-24 col-sm-24 col-md-24">
	<div   id="breadcrumb">	
	<?php $i = 1; $count = count($breadcrumbs);  ?>
	<b></b>
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>

	<a class="<?php if($i==$count){echo 'breadcrumb_last';} else if($i==$count-1){echo 'breadcumb_middle';} else{echo 'breadcumb_first';} ?>" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php $i++; } ?>
	</div>	
</div>
<?php echo $column_left; ?>	<?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  <div class="row">
  <div class="product-info">	
    <?php if ($thumb || $images) { ?>
    <div class="boss_zoom col-lg-13 col-md-13 col-sm-24 col-xs-24">
      <?php if ($thumb) { ?>
      <div  class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /><b></b></a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="list_carousel responsive">
		<ul id="boss-image-additional">
        <?php foreach ($images as $image) { ?>
        <li><a  href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img  src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
        <?php } ?>
		</ul>
		<a id="prev_image_additional" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
		<a id="next_image_additional" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class=" col-lg-11 col-md-11 col-sm-24 col-xs-24">
	  <h1 ><?php echo $heading_title; ?></h1>
	   <div class="review">
        <div><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');goToByScroll('tab-review');"><?php echo $reviews; ?></a><a  class="pull-right" onclick="$('a[href=\'#tab-review\']').trigger('click');goToByScroll('review-title');"><?php echo $text_write; ?></a></div>
        
      </div>
      <div class="description">
		<span><?php echo $text_stock; ?></span> <b class="stock"><?php echo $stock; ?></b><br />
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        
	  </div>
     
      <?php if ($profiles): ?>
      <div class="profiles options">
          <h2><?php echo $text_payment_profile ?><span class="required"> *</span></h2>          
		  <select class="profiles_sl"name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <span id="profile-description"></span>
      </div>
      <?php endif; ?>
      <?php if ($options) { ?>
      <div class="options">
        <h2><?php echo $text_option; ?></h2>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
		<div class="boss_check">
		<div class="box-check">
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <p><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></p>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
		</div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
		<div class="box-check">
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <p><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></p>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        </div>
		</div>
       
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option button_opt">
          <div class="title_text upload_bt"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <span class="button"><input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-primary"></span>
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text datetime_box" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text datetime_box" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
	  
    <div class="cart">  
      <?php if ($review_status) { ?>     
	   <div class="quantily_info">
			<div class="title_text"><b><?php echo $text_qty; ?></b></div>
            <div class="select_number">                
				<input type="text" class="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                <button onclick="changeQty(1); return false;" class="increase" title="Increase">+</button>
                <button onclick="changeQty(0); return false;" class="decrease" title="Decrease">-</button>	
            </div>
            <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
        </div>
      <?php } ?>   
		<div class="price_info">
		 <?php if ($price) { ?>
		<?php if (!$special) { ?>
        <span class="price"><?php echo $price; ?></span>
        <?php } else { ?>
       <span   class="price-new"><?php echo $special; ?></span>  <span class="price-old"><?php echo $price; ?></span>
        <?php } ?>
		<?php } ?>     
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span>
        <?php } ?>
        <?php if ($discounts) { ?>
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
		<?php if ($minimum >1) { ?>
			<div class="minimum"><?php echo $text_minimum; ?></div>
			
		<?php } ?>
		<div class=""><span class="btn btn-color"  title="<?php echo $button_cart; ?>" ><input type="button" value="<?php echo $button_cart; ?>" id="button-cart" title="<?php echo $button_cart; ?>" /></span></div>		
		<div class="action">			
			<div class="compare"><a class="action-button" onclick="boss_addToCompare('<?php echo $product_id; ?>');" ><?php echo $button_compare; ?></a></div>
			<div class="wishlist"><a class="action-button" onclick="boss_addToWishList('<?php echo $product_id; ?>');" ><?php echo $button_wishlist; ?></a></div>
		</div>
		<div class="share"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> 
        </div>
      </div>
    </div>
  </div>
  </div>
  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
  </div>
  
  <h2 class="ta-header"><span><?php echo $tab_description; ?></span></h2>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
   <h2 class="ta-header"><span><?php echo $tab_review; ?></span></h2>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" ></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="" />
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="left"><a id="button-review" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>
  
  <?php if ($tags) { ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  
  <?php if ($products) { ?>
    <div id="tab-related">
    <h2 class="ta-related"><span><?php echo $tab_related; ?> (<?php echo count($products); ?>)</span></h2>
	<div class="carousel-button">
		<a id="prev_related" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
		<a id="next_related" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
	</div>
  <div class="list_carousel responsive" >
    <ul id="product_related" class="content-products box-product product-grid"><?php foreach ($products as $product) { ?><li><div>
      <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><b></b></a>
		 <div class="cart"><a onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-color" title="<?php echo $button_cart; ?>"><span><?php echo $button_cart; ?></span></a></div>
		</div>
        <?php } ?>    
       
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
         <span class="price-new"><?php echo $product['special']; ?></span>  <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        </div><?php } ?>
       
    <div class="action boss-actions ">
            <div class="wishlist"><a class="button button-grey" onclick="boss_addToWishList('<?php echo  $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></a></div><div class="compare"><a class="button button-grey" onclick="boss_addToCompare('<?php echo  $product['product_id'];  ?>');"><span><?php echo $button_compare; ?></span></a></div>
        </div></div>
    </li><?php } ?></ul>
        
  </div>
    </div>
  <?php } ?>
     
  
  <?php echo $content_bottom; ?></div>

<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.easing.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js"></script>

<script type="text/javascript"><!--
function changeQty(increase) {
    var qty = parseInt($('.select_number').find("input").val());
    if ( !isNaN(qty) ) {
        qty = increase ? qty+1 : (qty > <?php echo $minimum; ?> ? qty-1 : <?php echo $minimum; ?>);
        $('.select_number').find("input").val(qty);
    }
}
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox",
		slideshow: "false",
		width: '90%', 
		height: '90%',
		maxWidth: <?php echo $this->config->get('config_image_popup_width') ?>,
		maxHeight: <?php echo ($this->config->get('config_image_popup_height') + 15); ?>
	});
});
//--></script> 
<script type="text/javascript"><!--
$(window).load(function(){
	$('#boss-image-additional').carouFredSel({
		auto: false,
		responsive: true,
		width: '100%',
		prev: '#prev_image_additional',
		next: '#next_image_additional',
		swipe: {
		onTouch : true
		},
		items: {
			width: 120,
			height: 'auto',
			visible: {
			min: 1,
			max: 4
			}
		},
		scroll: {
			direction : 'left',    //  The direction of the transition.
			duration  : 1000   //  The duration of the transition.
		}
	});
	$('#product_related').carouFredSel({
		auto: false,
		responsive: true,
		width: '100%',
		prev: '#prev_related',
		next: '#next_related',
		swipe: {
		onTouch : true
		},
		items: {
			width: 300,
			height: 'auto',
			visible: {
			min: 1,
			max: 3
			}
		},
		scroll: {
			direction : 'left',    //  The direction of the transition.
			duration  : 1000   //  The duration of the transition.
		}
	});
});
  
function goToByScroll(id){
    $('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
    $('h2.ta-header').removeClass('selected');
    $('#tab-review').prev().addClass('selected');
}

$(document).ready(function() {
    product_resize();
});

$(window).resize(function() {
    product_resize();
});

function product_resize()   {
    if(getWidthBrowser() < 768){
        $('#tabs').hide();
        $('h2.ta-header').show();
    } else {
        $('h2.ta-header').hide();
        $('#tabs').show();
        var list = $('#tabs a');
        list.each(function( index ) {
            if($(this).hasClass('selected')){
                $(this).click();
            }
        });
    }
}

$('h2.ta-header').first().addClass('selected');
$('h2.ta-header').click(function() {
    if($(this).next().css('display') == 'none'){
        $(this).next().show();
        $(this).addClass('selected');
    }else{
        $(this).next().hide();
        $(this).removeClass('selected');
    }   
    return false;
}).next().hide(); 

//--></script>
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=bossthemes/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
      success: function(json) {
		$('.warning, .attention, information, .error').remove();
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).append('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}   
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
		    }  
            if (json['success']) {
                addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#cart-total').html(json['total']);
				$('#boss_cart').load('index.php?route=module/cart #boss_cart > *');
            }
      }
	});
}); 
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>