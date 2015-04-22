

<footer id="footer">
<?php 
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$this->config->get('config_template'));
?>	
	<?php
		$modules =$helper->getModulesByPosition('footer'); 
		if( $modules ){ ?>
		
			<div class="col-md-24">
			<?php foreach ($modules as $module) { 
				echo $module;
			} ?>
			</div>

	<?php } ?>
	

			<!-- block banner -->
			<?php echo $helper->getBlockByPosition('b_Block_Footer_1'); ?>
			<!-- Block 2 -->
			<?php echo $helper->getBlockByPosition('b_Block_Footer_2'); ?>
			<div class="footer-info">
			<?php if ($informations) { ?>
			<div class="column col-xs-24 col-sm-12 col-md-6 col-lg-6 not-animated" data-animate="fadeInUp" data-delay="200">
				<h3><?php echo $text_information; ?></h3>
				<ul class="list-unstyled">
				<?php foreach ($informations as $information) { ?>
					<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
			
			<div class="column col-xs-24 col-sm-12 col-md-6 col-lg-6 not-animated" data-animate="fadeInUp" data-delay="300">
				<h3><?php echo $text_service; ?></h3>
				<ul class="list-unstyled">
				  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>				  
				</ul>
			</div>
			<div class="column col-xs-24 col-sm-12 col-md-6 col-lg-6 not-animated" data-animate="fadeInUp" data-delay="400" style="display:none;">
				<h3><?php echo $text_extra; ?></h3>
				<ul class="list-unstyled">
				  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			  </div>
			<div class="column col-xs-24 col-sm-12 col-md-6 col-lg-6 not-animated" data-animate="fadeInUp" data-delay="500">
				<h3><?php echo $text_account; ?></h3>
				<ul class="list-unstyled">
				  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
			</div>

</footer>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->


<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

</div>
</section>
<footer id="footer_bottom">
<div class="container">	
			<?php echo $helper->getBlockByPosition('b_Block_Footer_3'); ?>
			<div id="powered">
			<?php #echo $powered; ?>Designed and Developed by <a href="http://www.dignitasdigital.com" target="_blank"> Dignitas Digital</a> © 2014</div>			
			<?php echo $helper->getBlockByPosition('b_Block_Footer_4'); ?>	
</div>
</footer>
</section>
</body></html>
