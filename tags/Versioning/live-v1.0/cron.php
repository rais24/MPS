<?php

mysql_connect("localhost","mypartys_dev","dd12345");
mysql_select_db("mypartys_dev");

$msg="Hello,<br> Products going out of stock.<br><br>";
$msg.="<table border='1'>";
$msg.="<tr><td><b>Product Id</b></td><td><b>Model</b></td><td><b>Remaining Quantity</b></td></tr>";
$result=mysql_query("select product.product_id, model, quantity, name from product LEFT JOIN product_description on product.product_id=product_description.product_id where product.quantity<='5' order by quantity");
while($row=mysql_fetch_assoc($result))
{
	$msg.="<tr>
	<td>$row[product_id]</td>
	<td>$row[name]</td>
	<td>$row[quantity]</td>
	</tr>";
}
$msg.="</table><br><br>Regards,<br>Team My Party Shop";

$sub="My Party Shop";
/////////////To email id//////////////////////////
$to="amit@dignitasdigital.com";
$to1="mypartyshopdelhi@gmail.com";
/////////////From email id////////////////////////
$em="Product Quantity Alert<support@mypartyshoponline.com>";
//////////////////////////////////////////////////
$headers  = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
$headers .= 'From:'.$em."\r\n";
$headers .= "To:".$to."\r\n";
$num=mysql_num_rows($result);
if($num>0)
{
mail("$to","$sub", "$msg", "$headers","-f support@mypartyshoponline.com");
mail("$to1","$sub", "$msg", "$headers","-f support@mypartyshoponline.com");
}

?>