<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once 'Basic.php';

class Home extends CI_Basic_Api_Controller {

	public function index()
	{
		load_info([
			'routes'=>[
				'/login/',
				'/admin/',
			],
		]);
	}

	public function login()
	{
		if (!empty($this->login)) {
			unset($this->login->password);
			load_ok([
				'login'=>$this->login
			]);
		} else {
			load_401('Wrong Authentication', 'guest');
		}
	}

	public function load_404()
	{
		load_404();
	}

	public function hash($password)
	{
		// Built-in hash helper
		echo password_hash($password, PASSWORD_DEFAULT);
	}
}
