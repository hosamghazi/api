<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always;">
    <h1><?php echo $text_invoice; ?> #<?php echo $order['order_id']; ?></h1>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td colspan="2"><?php echo $text_order_detail; ?></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 50%;"><address>
            <strong><?php echo $order['store_name']; ?></strong><br />
            <?php echo $order['store_address']; ?>			
            </address>              <strong>الرقم الضريبي : 310899829500003</strong><br /></strong><br />
            <b><?php echo $text_telephone; ?></b> <?php echo $order['store_telephone']; ?><br />
            <?php if ($order['store_fax']) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
            <?php } ?>
            <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
            <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a></td>
          <td style="width: 50%;"><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
            <?php if ($order['invoice_no']) { ?>
            <b><?php echo $text_invoice_no; ?></b> <?php echo $order['invoice_no']; ?><br />
            <?php } ?>
            <b><?php echo $text_order_id; ?></b> <?php echo $order['order_id']; ?><br />
            <b><?php echo $text_payment_method; ?></b> <?php echo $order['payment_method']; ?><br />
            <?php if ($order['shipping_method']) { ?>
            <b><?php echo $text_shipping_method; ?></b> <?php echo $order['shipping_method']; ?><br />
            <?php } ?></td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td style="width: 50%;"><b><?php echo $text_payment_address; ?></b></td>
          <td style="width: 50%;"><b><?php echo $text_shipping_address; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><address>
            <?php echo $order['payment_address']; ?>
			
			
            </address></td>
          <td><address>
            <?php echo $order['shipping_address']; ?>
			
			
			<br/>
			<b><?php echo $text_email; ?>:</b> <?php echo $order['email']; ?><br/>
	            <b><?php echo $text_telephone; ?>:</b> <?php echo $order['telephone']; ?> 
			
            </address></td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $column_product; ?></b></td>
          <td><b><?php echo $column_model; ?></b></td>
          <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
          <td class="text-right"><b><?php echo $column_price; ?></b></td>
          <td class="text-right"><b><?php echo $column_total; ?></b></td>
        </tr>
      </thead>
      <tbody>
	  
	  
	  
	  
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['price']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['voucher'] as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td></td>
          <td class="text-right">1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['total'] as $total) { ?>
        <tr>
          <td class="text-right" colspan="4"><b><?php echo $total['title']; ?></b></td>
          <td class="text-right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $text_comment; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['comment']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>
  </div>
  <?php } ?>
  
  
  
  
  
  
 <?php
////////////// onyx start

$url = 'http://ghanaty.selfip.com:9090/OnyxShopMarket/Service.svc/SaveOrder';
$data = 
    
	array('type' => "ORACLE",
	"year" => "2022",
	"activityNumber" => "1",
	
	"value" => array("OrderNo" =>"",
	"OrderSer" => "",
	"P_REF_DOC_NO" => $order['order_id'],
	"Code" => "" ,
	"Name" => "hosam ttt" ,
	
	"ImageValue" => "",
	"P_A_DESC" =>  $order['shipping_method'],
    "CustomerType"=> 4,
    "FiscalYear"=> "2022",
    "Activity"=> "1",
    "BranchNumber"=> "1",
    "WarehouseCode"=> 94,
    "TotalDemand"=> "460.00",
    "TotalDiscount"=> "0",
    "TotalTax"=> "0",
    "ChargeAmt"=> 15,
    "CustomerAddress"=> "SA - RIYADH - Riyadh - ( Qurtobah )",
    "Mobile"=> $order['telephone'],
    "Latitude"=> "24.046463326483025",
    "Logitude"=> "45.933837500000024",
    "FileExtension"=> "-1",
    "ImageValue"=> "-1",
    "P_AD_TRMNL_NM"=> 0,
    "P_ORDER_DATE"=> -1,
    "P_DISC_AMT_AFTR_VAT"=> "0",
    "P_CASH_NO"=> "-1",
    "P_CR_CARD_NO"=> "-1",
    "P_BILL_DOC_TYPE"=> "4",
    "P_R_CODE"=> "-1",
    "P_C_CODE_CSH"=> "-1",
    "P_DRIVER_NO"=> "-1",
    "P_INACTIVE"=>"-1",
    "P_SHO_SYS_TYP"=>"1",
	
	
	
	
	
	
	"OrderDetailsList"  => [
	
	
	
	
	
	

	array ("Code" => $product['sku'] , "Unit" => "حبه" ,"Quantity" => "11" ,"Price" => "150" ,"DiscountPercentage" => "1" ,"DiscountValue" => "1" , "TaxRate" => "1" ,
	
	
	"TaxAmount" => "1" , "ChargeAmt" => "10" , "P_DIS_AMT_AFTR_VAT" => "1" , "P_BATCH_NO" => "-1" ,
	
	"P_FREE_QTY"=> "-1",
                "P_SUB_C_CODE"=> "-1",
                "P_DIS_AMT_MST"=> "1",
                "P_EXPIRE_DATE"=> "-1",
                "P_DIS_AMT_DTL2"=> "1",
                "P_DIS_AMT_DTL3"=> "1",
                 "P_QT_PRM_NO"=>"-1",
                "P_QT_PRM_SER"=>"-1",
                "P_QT_PRM_RCRD_NO"=>"-1"
	
	
	
	
	) ,
	
	
	array ("Code" => $product['sku'] , "Unit" => "حبه" ,"Quantity" => "1" ,"Price" => "250" ,"DiscountPercentage" => "1" ,"DiscountValue" => "1" , "TaxRate" => "1" ,
	
	
	"TaxAmount" => "1" , "ChargeAmt" => "10" , "P_DIS_AMT_AFTR_VAT" => "1" , "P_BATCH_NO" => "-1" ,
	
	"P_FREE_QTY"=> "-1",
                "P_SUB_C_CODE"=> "-1",
                "P_DIS_AMT_MST"=> "1",
                "P_EXPIRE_DATE"=> "-1",
                "P_DIS_AMT_DTL2"=> "1",
                "P_DIS_AMT_DTL3"=> "1",
                 "P_QT_PRM_NO"=>"-1",
                "P_QT_PRM_SER"=>"-1",
                "P_QT_PRM_RCRD_NO"=>"-1"
	
	
	
	
	)
	

]
	)
	
	
	
	);
	
	
	
	
 
$data_string = json_encode($data);
$ch=curl_init($url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");

curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER,
    array(
        'Content-Type:application/json',
        'Content-Length: ' . strlen($data_string)
		
		
		
		
		
		
    )
);

$result = curl_exec($ch);
curl_close($ch);


echo "<pre>$result</pre>";
echo "<pre>$data_string</pre>";




////////////// onyx





?>
  
  
  
  
  
  
  
  
  
  
  
  
</div>
</body>
</html>