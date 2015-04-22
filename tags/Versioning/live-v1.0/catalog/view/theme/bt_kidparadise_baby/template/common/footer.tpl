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
			<div class="footer-info" style="position:relative;">
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
			<div style="position:absolute; right:20px; bottom:30px; display:none;">
			<a href="http://www.facebook.com/mypartyshoponline" target="_blank"><img src="http://mypartyshoponline.com/image/social_icons/facebook.png" /></a>
			<a href="http://www.twitter.com/mypartyshop" target="_blank"><img src="http://mypartyshoponline.com/image/social_icons/twitter.png" /></a>
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
			<?php #echo $powered; ?>Designed and Developed by <a href="http://www.dignitasdigital.com" target="_blank"> Dignitas Digital</a> © 2015</div>			
			<?php echo $helper->getBlockByPosition('b_Block_Footer_4'); ?>	
</div>
</footer>
</section>



<script>
/**
 * jQuery snow effects.
 *
 * This is a heavily modified, jQuery-adapted, browser-agnostic version of 
 * "Snow Effect Script" by Altan d.o.o. (http://www.altan.hr/snow/index.html).
 *
 * Dustin Oprea (2011)
 */

function __ShowSnow(settings)
{

    var snowsrc = settings.SnowImage;
    var no = settings.Quantity;

    var dx, xp, yp;    // coordinate and position variables
    var am, stx, sty;  // amplitude and step variables
    var i; 

    var doc_width = $(window).width() - 10;
    var doc_height = $(window).height()+200;

    dx = [];
    xp = [];
    yp = [];
    am = [];
    stx = [];
    sty = [];
    flakes = [];
    for (i = 0; i < no; ++i) 
    {
        dx[i] = 0;                        // set coordinate variables
        xp[i] = Math.random()*(doc_width-50);  // set position variables
        yp[i] = Math.random()*doc_height;
        am[i] = Math.random()*20;         // set amplitude variables
        stx[i] = 0.02 + Math.random()/10; // set step variables
        sty[i] = 0.7 + Math.random();     // set step variables

        var flake = $("<div />");

        var id = ("dot" + i);
        flake.attr("id", id);
        flake.css({
                    position: "absolute",
                    zIndex: i,
                    top: "15px",
                    left: "15px"
                });

        flake.append("<img src='" + snowsrc + "'>");
        flake.appendTo("body");

        flakes[i] = $("#" + id);
    }

    var animateSnow;
    animateSnow = function() 
    {  
        for (i = 0; i < no; ++ i) 
        {
            // iterate for every dot
            yp[i] += sty[i];
            if (yp[i] > doc_height - 50) 
            {
                xp[i] = Math.random() * (doc_width - am[i] - 30);
                yp[i] = 0;
                stx[i] = 0.02 + Math.random() / 10;
                sty[i] = 0.7 + Math.random();
            }
      
            dx[i] += stx[i];
            flakes[i].css("top", yp[i] + "px");
            flakes[i].css("left", (xp[i] + am[i] * Math.sin(dx[i])) + "px");
        }

        snowtimer = setTimeout(animateSnow, 10);
    };

	function hidesnow()
    {
		if(window.snowtimer)
            clearTimeout(snowtimer)

        for (i = 0; i < no; i++)
            flakes[i].hide();
	}
		
    animateSnow();
	if (settings.HideSnowTime > 0)
    	setTimeout(hidesnow, settings.HideSnowTime * 1000)
}

(function($) {
    $.fn.snow = function(options) {
  
    var settings = $.extend({
            SnowImage:      undefined,
            Quantity:       7,
            HideSnowTime:   0
        }, options);

    __ShowSnow(settings);

    return this;
  }

})(jQuery);

</script>

<script type="text/javascript">
$(function() {
    //$(document).snow({ SnowImage: "http://mypartyshoponline.com/image/data/heart9.gif", Quantity:"30" });
});
</script>


</body></html>