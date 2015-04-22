<?php 
$quantity_products = 0;
foreach ($products as $product) { 
  $quantity_products += $product['quantity'];
}
foreach ($vouchers as $voucher) { 
  $quantity_products ++;
}
?>
<div id="boss_cart">
  <div class="heading" >
    <h4><a href="<?php echo $cart; ?>" class="check_shop"><?php echo $heading_title; ?> <span id="quantity_product"><?php echo $quantity_products; ?></span></a></h4>	
  </div>
  <div class="content">
    <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
      <table>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image">
			<div>
		  <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /><b></b></a>
            <?php } ?>
			<div class="remove"><a class="check_remove" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&amp;remove=<?php echo $product['key']; ?>' : $('#boss_cart').load('index.php?route=module/cart&amp;remove=<?php echo $product['key']; ?>' + ' #boss_cart > *');"><?php echo $button_remove; ?></a></div>
			</div></td>
          <td class="name"><div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
              <?php } ?>
              <?php if ($product['recurring']): ?>
              - <small><?php echo $text_payment_profile ?> <?php echo $product['profile']; ?></small><br />
              <?php endif; ?>
            </div>
		  <div class="total"><?php echo $product['total']; ?></div>
          <div class="quantity">x&nbsp;<?php echo $product['quantity']; ?></div>
          
	      </td>
		</tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image"><div><div class="remove"><a class="check_remove" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&amp;remove=<?php echo $voucher['key']; ?>' : $('#boss_cart').load('index.php?route=module/cart&amp;remove=<?php echo $voucher['key']; ?>' + ' #boss_cart > *');"><?php echo $button_remove; ?></a></div></div></td>
          <td class="name"><?php echo $voucher['description']; ?>
		   <div class="total"><?php echo $voucher['amount']; ?></div>
          <div class="quantity">x&nbsp;1</div>
         
        </td>
		</tr>
        <?php } ?>
      </table>
    </div>
     <div class="mini-cart-total">
      <table>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="left<?php echo ($total==end($totals) ? ' last' : ''); ?>"><?php echo $total['title']; ?>:</td>
          <td class="right<?php echo ($total==end($totals) ? ' last' : ''); ?>"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <div class="checkout">
		<a class="btn btn-checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
		<a class="btn btn-primary" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> </div>
    <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
  </div>
</div>	
