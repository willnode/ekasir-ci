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
				'barang_id', 'barang_nama', 'barang_kode',
				'barang_modal', 'barang_harga' //, 'barang_sisa_stok',
			],
			'searchable'=> ['barang_nama', 'barang_kode'],
			'validations' => [
				['barang_nama', 'Nama Barang', 'required'],
				['barang_kode', 'Kode Barang', 'required'],
				['barang_modal', 'Harga Beli Barang', 'required'],
				['barang_harga', 'Harga Jual Barang', 'required'],
				// ['barang_sisa_stok', 'Stok Barang', 'required'],
			],
		]);
	}

	public function laporan($range = 'harian')
	{
		if (GET === REQUEST_METHOD) {
			$index = array_search($range, ['harian', 'mingguan', 'bulanan']);
			if ($index === null) return	load_error('Invalid range');
			$count = [14, 10, 12][$index];
			$unit = ['days', 'weeks', 'months'][$index];
			$data = [
				'tanggal' => [],
				'transaksi' => [],
				'bruto' => [],
				'neto' => [],
			];
			for ($i=0; $i < $count; $i++) {
				get_instance()->db->where('transaksi_waktu <', date('Y-m-d', strtotime(($i-1).' '.$unit.' ago')));
				get_instance()->db->where('transaksi_waktu >=', date('Y-m-d', strtotime(($i).' '.$unit.' ago')));
				$result = $this->db->get('transaksi')->result();
				$bruto = 0; $neto = 0; $transaksi = 0;
				foreach ($result as $row) {
					$transaksi ++;
					$bruto += $row->transaksi_total;
					$neto += $row->transaksi_total - $row->transaksi_modal;
				}
				$data['tanggal'][] = date('Y-m-d', strtotime($i.' '.$unit.' ago'));
				$data['transaksi'][] = $transaksi;
				$data['bruto'][] = $bruto;
				$data['neto'][] = $neto;
				# code...
			}
			load_info([
				'data' => $data
			]);
		}
		load_405();
	}

	public function transaksi($id=NULL)
	{
		master_crud([
			'table' => 'transaksi',
			'id' => $id,
			'select' => [
				'transaksi_id', 'transaksi_waktu', 'transaksi_modal', 'transaksi_total',
			],
			'before_update'=>function($id, &$data, $existing) {
				if ($existing == NULL) {
					$struks = get_instance()->input->post('struk');
					$sumHarga = 0;
					$sumModal = 0;
					foreach ($struks as $s) {
						$sumModal += $s['struk_modal_barang'] * $s['struk_qty'];
						$sumHarga += $s['struk_harga_barang'] * $s['struk_qty'];
					}
					$data['transaksi_waktu'] = date('Y-m-d H:i:s');
					$data['transaksi_modal'] = $sumModal;
					$data['transaksi_total'] = $sumHarga;
				}
			},
			'after_update' => function($id, $data, $is_created) {
				if ($is_created) {
					// Password Change
					$struks = get_instance()->input->post('struk');
					foreach ($struks as $s) {
						$s['transaksi_id'] = $id;
						$this->db->insert('struk', $s);
						$struk_qty = get_instance()->db->escape($s['struk_qty']);
						$barang_id = get_instance()->db->escape($s['barang_id']);
						// Skip stok
						// $this->db->query("UPDATE barang SET barang.barang_sisa_stok = barang.barang_sisa_stok - ".
						// 	"{$struk_qty} WHERE barang.barang_id = ".
						// 	"{$barang_id}");
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
				'login_id', 'username',	'name', 'role',
			],
			'validations'=>[
				['username', 'Username', 'required|alpha_numeric_spaces'],
				['name', 'Name', 'required|alpha_numeric_spaces'],
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
