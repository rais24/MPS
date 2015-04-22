<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0">
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<link href='http://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/boss_add_cart.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/cs.animate.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/jquery.jgrowl.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/responsive.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap-custom.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.selectbox-0.2.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bootstrap.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.jgrowl.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bossthemes.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.appear.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.smoothscroll.js"></script>
 <!--[if lt IE 9]>
  <script type="text/javascript" src="catalog/view/javascript/bossthemes/html5shiv.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/respond.min.js"></script>
<![endif]-->

<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->

<!--[if IE 9]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie9.css" />
<![endif]-->
<!--[if IE 8]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie8.css" />
<![endif]-->

<?php /******************THEME FONTS SETTINGS*********************/ ?>

<?php $editor = $this->config->get('b_General_Show'); ?>
<?php if (isset($editor)) {  ?>
<?php include "catalog/view/theme/".$this->config->get('config_template')."/template/bossthemes/Boss_font_setting.php"; ?>
<?php include "catalog/view/theme/".$this->config->get('config_template')."/template/bossthemes/Boss_color_setting.php"; ?>
<?php } ?>
<script>  
if (/*@cc_on!@*/false) {  
    document.documentElement.className+=' ie10';  
}  
</script>
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>

<?php 
$customcode = array();
$customcode =  $this->config->get('customcode');
?>
<!-- custom css-->
<?php if($customcode['custom_css']){ ?>
	<style type="text/css">
	<?php echo $customcode['custom_css'];?>
	</style>
<?php } ?>
<!-- end custom css-->

<!-- custom javascript-->
<?php if($customcode['custom_java']){ ?>
	<script type="text/javascript"><!--
	<?php echo $customcode['custom_java']; ?>
	//--></script>
<?php } ?>
<!-- end custom javascript-->

<?php if (isset($this->request->get['route']) && $this->request->get['route'] == 'checkout/success') { ?>

<!-- Facebook Conversion Code for MPS - Conversions -->
<script>(function() {
var _fbq = window._fbq || (window._fbq = []);
if (!_fbq.loaded) {
var fbds = document.createElement('script');
fbds.async = true;
fbds.src = '//connect.facebook.net/en_US/fbds.js';
var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(fbds, s);
_fbq.loaded = true;
}
})();
window._fbq = window._fbq || [];
window._fbq.push(['track', '6018297151522', {'value':'0.01','currency':'USD'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6018297151522&amp;cd[value]=0.01&amp;cd[currency]=USD&amp;noscript=1" /></noscript>



<?php } ?>

<?php echo $google_analytics; ?>
<meta name="p:domain_verify" content="9a8ba6d065c74fd400de56cd56d373a1"/>
</head>
<?php 
	$array = (explode('/',$_SERVER['REQUEST_URI']));
	$end = end($array);
	if($end == "index.php" || $end == "home" || $end == ""){
		$home_page='home_page';
	}else{
		$home_page="other_page";
	}
?>
<body class="<?php echo $home_page; ?>">

<?php 
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$this->config->get('config_template'));
$b_Mode_CSS = $this->config->get('b_Mode_CSS');
if(!isset($b_Mode_CSS)){
	$b_Mode_CSS ="wide";
}
?>

<section id="page-container"  class="<?php echo $b_Mode_CSS; ?>">
<header id="header-top">
	<div class="container">
		<div class="row">
			<div class="header-top col-xs-24 col-sm-24 col-md-24">
				<div class="header-top-left">					
					<?php echo $language; ?>
					<?php echo $currency; ?>
					<div id="welcome">
						<?php if(isset($boss_login)){echo $boss_login; }?>
					</div>
 
				</div>
<div class="logo_rightdiv"> 
 <div class="call_icon"><img src="image/data/Call.png" alt="" /></div>
  <div class="shipping_iocn"><img src="image/data/free_shipping.png" /></div>
</div>
          
				<div class="header-top-right">
					<div class="links">
						<a class="m-wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
						<a class="m-account" href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
						<a class="m-checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
						<a class="m-shoppingcart" href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
					</div>
					<div id="search" class="pull-right">
						<div class="button-search cs-tooltip" title="<?php echo $text_search; ?>" data-toggle="tooltip" data-placement="bottom" data-original-title="Tooltip on bottom"></div>
						<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<header id="header">
<section id="page-top">
</section>
	<div class="container">
			<div class="header-bottom">
				<?php if ($logo) { ?>
					<div id="logo" ><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
				<?php } ?>
				
				<?php echo $cart; ?>
				<!-- megamenu position-->
				<?php	
					$modules =$helper->getModulesByPosition('mainmenu'); 
					if( $modules ){
						foreach ($modules as $module) { 
							 echo $module; 
						} 
					}
				?>
				
				<!-- Slideshow Position-->
				<?php
					$modules =$helper->getModulesByPosition('slideshow'); 
					if( $modules ){
						foreach ($modules as $module) { 
							echo $module; 
						} 
					} 
				?>
			</div>

	</div>
</header>

<section id="boss-announce">
<div class="container">
<?php if ($error) { ?>   
	<div class="warning">
		<?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" />
	</div>
<?php } ?>
<div id="notification"></div>
</div>
</section>
<section id="content-container">
<!-- Block Header -->
<?php echo $helper->getBlockByPosition('b_Block_Header_Top'); ?>
<?php echo $helper->getBlockByPosition('b_Block_Header_Bottom'); ?>
<div class="container">