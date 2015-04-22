<?php
class ControllerModuleBossLatest extends Controller {
	protected function index($setting) {
		
		static $module = 0;
		
		$this->language->load('module/boss_latest');
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->data['text_show_more'] = $this->language->get('text_show_more');
				
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$this->data['products'] = array();
		
		$this->data['number_product'] = $this->model_catalog_product->getTotalProducts();
		
		if (empty($setting['limit'])) {
			$this->data['limit'] = 8;
		}else{
			$this->data['limit'] = $setting['limit'];
		}
		
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $this->data['limit']
		);
											
		$results = $this->model_catalog_product->getProducts($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
	
		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_latest.tpl';
		} else {
			$this->template = 'default/template/module/boss_latest.tpl';
		}

		$this->render();
	}

	public function viewMoreProducts(){
		$this->language->load('module/boss_latest');
		
		$this->data['text_show_more'] = $this->language->get('text_show_more');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$module = $this->request->get['module'];
		
		$this->data['module'] = $module;
		
		$boss_latest_module = $this->config->get('boss_latest_module');
		
		$setting = $boss_latest_module[$module];
		
		if (empty($setting['limit'])) {
			$limit = 8;
		}else{
			$limit = $setting['limit'];
		}
						
		$count = $this->request->get['count'];
		
		$this->data['number_product'] = $this->model_catalog_product->getTotalProducts();
		
		$this->data['limit'] = $limit + $count;
		
		$this->data['products'] = array();
		
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC'
		);

		$results = $this->model_catalog_product->getProducts($data);
		
		$results = array_slice($results, (int)$count, (int)$limit);
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
		
		$json = array();
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_latest_more.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_latest_more.tpl';
		} else {
			$this->template = 'default/template/module/boss_latest_more.tpl';
		}
		
		$json['html'] = $this->render();
		
		$this->response->setOutput(json_encode($json));
	}
}
?>