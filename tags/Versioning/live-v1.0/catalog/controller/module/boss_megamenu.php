<?php
class ControllerModuleBossMegamenu extends Controller {

	protected function index($setting) {
	
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_megamenu.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_megamenu.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_megamenu.css');
		}
	
		$data_template = $this->cache->get('boss_megamenu.' . (int)$this->config->get('config_language_id'));
		
		$this->data['data_template'] = $data_template;
		
		if(!$data_template){
		
			static $module = 0;
			
			$this->load->model('catalog/manufacturer');
			$this->load->model('tool/image');
			$this->load->model('catalog/information');
			$this->load->model('catalog/category');
			$this->load->model('catalog/product');
			$this->load->model( 'bossthemes/boss_megamenu' );
			
			$this->language->load('module/boss_megamenu');
			
			
			$this->data['button_cart'] = $this->language->get('button_cart');
			
			$this->data['categories'] = array();
						
			$categories = $this->model_catalog_category->getCategories(0);
			
			foreach ($categories as $category) {
				if ($category['top']) {
					// Level 2
					$children_data = array();
					
					$children = $this->model_catalog_category->getCategories($category['category_id']);
					
					foreach ($children as $child) {
						$data = array(
							'filter_category_id'  => $child['category_id'],
							'filter_sub_category' => true
						);
						
						$product_total = $this->model_catalog_product->getTotalProducts($data);
										
						$children_data[] = array(
							'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
							'children'		=> $this->getChildrenCategory($child, $child['category_id']),
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						);						
					}
					
					$this->data['categories'][] = array(
						'name'     => $category['name'],
						'children' => $children_data,
						'column'   => $category['column'] ? $category['column'] : 1,
						'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
					);
				}
			}
			
			$parent = '1';
			
			$menusettings = array();
			$menusettings = $this->config->get('boss_megamenu_module');
			$menu_width = $menusettings[0]['menu_width'];
			$menu_column = $menusettings[0]['num_column'];
			$this->data['menu_width'] = $menu_width;
			$menus = array();
			$menus = $this->model_bossthemes_boss_megamenu->getChilds($parent);
			$type = '';
			if (!empty($menus)) {
				foreach ($menus as $menu){
					if(in_array($this->config->get('config_store_id'),$menusettings[0]['store_id'])){
						$href = "#";
						if(isset($menu['url'])){
							$href = $menu['url'];
						}
						$colums = $menu['colums'];
						$dropdown_width = ($menu_width/$menu_column)*$colums;
						$parent = $menu['megamenu_id'];
						$menudropdowns = array();
						$menuchilds = array();
						$menuchilds = $this->model_bossthemes_boss_megamenu->getChilds($parent);
						if (!empty($menuchilds)) {
							foreach ($menuchilds as $menuchild){
								$type = $menuchild['type'];
								$contents = array();
								$hrefchild = "#";
								$childcolums = $menuchild['colums'];
								$child_width = ($menu_width/$menu_column)*$childcolums;
								
								if (isset($type)) {
								
									if ($type == 'manufacturer') {
										$params = json_decode($menuchild['params'], true);
										if (isset($menuchild['item'])) {
											$manufacturer_ids = explode(',', $menuchild['item']);
											foreach($manufacturer_ids as $manufacturer_id){
												if($manufacturer_id!=''){
													$result = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);
													$contents[] = array(
														'name'    => $result['name'],
														'image'   => $this->model_tool_image->resize($result['image'], ($params['manufacturer_img_w']) ? $params['manufacturer_img_w'] : 45, ($params['manufacturer_img_h']) ? $params['manufacturer_img_h'] : 45),
														'href'	  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
														'show_image'  => $params['manufacturer_img'],
														'show_name'  => $params['manufacturer_name']
													);
												}
											}
										}
									}
									
									if ($type == 'product') {
										$params = json_decode($menuchild['params'], true);
										
										if (isset($menuchild['item'])) {
											$product_ids = explode(',', $menuchild['item']);
											foreach ($product_ids as $product_id) {
												$product_info = $this->model_catalog_product->getProduct($product_id);
												if ($product_info) {
													if ($params['product_show_img'] && $product_info['image']) {
														$image = $this->model_tool_image->resize($product_info['image'], isset($params['product_img_w']) ? $params['product_img_w'] : 45, isset($params['product_img_h']) ? $params['product_img_h'] : 45);
													} else {
														$image = false;
													}

													if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
														$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
													} else {
														$price = false;
													}
													
													if ((float)$product_info['special']) {
														$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
													} else {
														$special = false;
													}	
													
													if ($this->config->get('config_tax')) {
														$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
													} else {
														$tax = false;
													}		
													
													$contents[] = array(
														'thumb'   	 => $image,
														'name'    	 => $product_info['name'],
														'price'   	 => $price,
														'special'     => $special,
														'rating'      => $product_info['rating'],
														'reviews'     => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
														'model'		=> $product_info['model'],
														'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
													);
												}
											}
										}
									}
									
									if ($type == 'category') {
										$params = json_decode($menuchild['params'], true);
										if (isset($menuchild['item'])) {
										
											$category_id = $menuchild['item'];
											if($category_id!=''){
												
												if ($category_id != 0) {
													$category_info = $this->model_catalog_category->getCategory($category_id);
													$parent = array(
														'name'     		=> $category_info['name'],
														'title'			=> $menuchild['title'],
														'show_parent'   => $params['category_show_parent'],
														'show_image'   => $params['category_show_img'],
														'image'			=> $category_info['image'] ? $this->model_tool_image->resize($category_info['image'],($params['category_img_w']) ? $params['category_img_w'] : 45,($params['category_img_h']) ? $params['category_img_h'] : 45) : '',
														'href'     		=> $this->url->link('product/category', 'path=' . $category_info['category_id'])
													);
												}else{
													$parent = array(
														'name'     		=> '',
														'title'			=> $menuchild['title'],
														'show_parent'   => 0,
														'show_image'   => 0,
														'image'			=> '',
														'href'     		=> ''
													);
												}
												
												$results = $this->model_catalog_category->getCategories($category_id);
												foreach ($results as $category) {
													$contents[] = array(
														'name'     		=> $category['name'],
														'show_sub'      => $params['category_show_sub'],
														'show_parent'   => $params['category_show_parent'],
														'show_image'   => $params['category_show_img'],
														'children'		=> $this->getChildrenCategory($category, $category['category_id']),
														'image'			=> $category['image'] ? $this->model_tool_image->resize($category['image'],($params['category_img_w']) ? $params['category_img_w'] : 45,($params['category_img_h']) ? $params['category_img_h'] : 45) : '',
														'href'     		=> $this->url->link('product/category', 'path=' . $category['category_id'])
													);
												}
											}
										}
									}
									
									if ($type == 'information') {
										if (isset($menuchild['item'])) {
											$information_ids = explode(',', $menuchild['item']);
											foreach($information_ids as $information_id){
												if($information_id!=''){
													$result = $this->model_catalog_information->getInformation($information_id);
													$contents[] = array(
														'title' => $result['title'],
														'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
													);
												}
											}
										}
									}
									
									if ($type == 'product') {
										
									}
									
									if ($type == 'url') {
										if(isset($menuchild['url'])){
											$hrefchild = $menuchild['url'];
										}
										$contents =  $menuchild['content_text'];
									}
									
									if ($type == 'html') {
										$contents =  html_entity_decode($menuchild['content_text'], ENT_QUOTES, 'UTF-8');							
									}
								
								}
								
								$menudropdowns[] = array(
									'title'	 			=> $menuchild['title'],
									'type'				=> $type,
									'href'				=> $hrefchild,
									'content'			=> $contents,
									'parent'			=> (isset($parent) ? $parent : null),
									'child_width'	    => $child_width
									
								);
								
							}
						}
						
						$this->data['menus'][] = array(
							'title'	 			=> $menu['title'],
							'menuchilds'        => $menudropdowns,
							'dropdown_width'	=> $dropdown_width,
							'href'				=> $href
						);
					}
				}
			}
				
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_megamenu.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/boss_megamenu.tpl';
			} else {
				$this->template = 'default/template/module/boss_megamenu.tpl';
			}
			
			$this->cache->set('boss_megamenu.' . (int)$this->config->get('config_language_id'),$this->render());
			
			//$this->render();
		}else{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_megamenu.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/boss_megamenu.tpl';
			} else {
				$this->template = 'default/template/module/boss_megamenu.tpl';
			}
			
			$this->render();
		}
	}
	
	private function getChildrenCategory($category, $path)
	{
		
		$children_data = array();
		$children = $this->model_catalog_category->getCategories($category['category_id']);
		
		
		foreach ($children as $child) {
			$data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true	
			);		
				
								
			$children_data[] = array(
				'name'  	=> $child['name'],
				'children' 	=> $this->getChildrenCategory($child, $path . '_' . $child['category_id']),
				'column'   	=> 1,
				'href'  => $this->url->link('product/category', 'path=' . $path . '_' . $child['category_id'])	

			);
			
		}
		
		
		return $children_data;
	}
}
?>