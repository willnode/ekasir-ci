<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require 'Basic.php';

class Admin extends CI_Basic_Api_Controller {

	const ROLE = 'admin';

	public function index()
	{
		load_info([
			'routes'=>[
				'/admin/user/',
				'/admin/profile/',
				'/admin/barang/',
				'/admin/transaksi/',
			],
		]);
	}

	public function barang($id=NULL)
	{
		master_crud([
			'table' => 'barang',
			'id' => $id,
			'select' => [
				'barang_id', 'barang_nama', 'barang_kode', 'barang_harga_beli',
				'barang_harga_jual', 'barang_sisa_stok',
			],
			'validations' => [
				['barang_nama', 'Nama Barang', 'required'],
				['barang_kode', 'Kode Barang', 'required'],
				['barang_harga_beli', 'Harga Beli Barang', 'required'],
				['barang_harga_jual', 'Harga Jual Barang', 'required'],
				['barang_sisa_stok', 'Stok Barang', 'required'],
			],
		]);
	}

	public function transaksi($id=NULL)
	{
		master_crud([
			'table' => 'transaksi',
			'id' => $id,
			'select' => [
				'transaksi_id', 'transaksi_waktu', 'transaksi_total',
			],
			'validations' => [

			],
			'before_update'=>function($id, &$data, $existing) {
				if ($existing == NULL) {
					// Password Change
					$struks = get_instance()->input->post('struk');
					$sum = 0;
					foreach ($struks as $s) {
						$sum += $s['struk_harga_barang'] * $s['struk_qty'];
					}
					$data['transaksi_waktu'] = date('Y-m-d H:i:s');
					$data['transaksi_total'] = $sum;
				}
			},
			'after_update' => function($id, $data, $is_created) {
				if ($is_created) {
					// Password Change
					$struks = get_instance()->input->post('struk');
					foreach ($struks as $s) {
						$s['transaksi_id'] = $data['transaksi_id'];
						$this->db->insert('struk', $s);
						$this->db->query("UPDATE barang SET barang.barang_sisa_stok = barang.barang_sisa_stok - ".
							"{$get_instance()->db->escape($s['struk_qty'])} WHERE barang.barang_id = ".
							"{$get_instance()->db->escape($s['barang_id'])};");
					}
				}
			}
		]);
	}


	public function profile()
	{
		master_crud([
			'table'=>'login',
			'id'=>$this->login->login_id,
			'select'=>[
				'login_id', 'username',	'email', 'name', 'avatar', 'role',
			],
			'validations'=>[
				['name', 'Name', 'required|alpha_numeric_spaces'],
				['email', 'Email', 'required|valid_email'],
			],
			'file_uploads'=>[
				['name'=>'avatar', 'types'=>'jpg|jpeg|png|bmp']
			],
			'before_update'=>function($id, &$data, $existing) {
				// Password Change
				$password = 'password';
				if (get_instance()->input->post($password) || empty($existing->{$password})) {
					if (run_validation([
						[$password, 'Password', 'required'],
						['passconf', 'Password Confirmation', "matches[$password]"]
					])) {
						$data[$password] = $_POST[$password];
						if(control_password_update($data, $password)) {
							$data['otp'] = NULL;
						}
					}
				}
				return TRUE;
			}
		]);
	}
}
