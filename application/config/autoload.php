<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Composer autoload
require_once FCPATH . 'vendor/autoload.php';

/*
| -------------------------------------------------------------------
| AUTO-LOADER
| -------------------------------------------------------------------
| This file specifies which systems should be loaded by default.
|
| Instructions...
*/

/*
| -------------------------------------------------------------------
|  Auto-load Packages
| -------------------------------------------------------------------
| Prototype:
|  $autoload['packages'] = array(APPPATH.'third_party', '/usr/local/shared');
*/
$autoload['packages'] = array();

/*
| -------------------------------------------------------------------
|  Auto-load Libraries
| -------------------------------------------------------------------
| Prototype:
|  $autoload['libraries'] = array('database', 'email', 'session');
*/
$autoload['libraries'] = array('database', 'session');

/*
| -------------------------------------------------------------------
|  Auto-load Drivers
| -------------------------------------------------------------------
*/
$autoload['drivers'] = array();

/*
| -------------------------------------------------------------------
|  Auto-load Helper Files
| -------------------------------------------------------------------
*/
$autoload['helper'] = array('url', 'digital');

/*
| -------------------------------------------------------------------
|  Auto-load Config files
| -------------------------------------------------------------------
*/
$autoload['config'] = array();

/*
| -------------------------------------------------------------------
|  Auto-load Language files
| -------------------------------------------------------------------
*/
$autoload['language'] = array();

/*
| -------------------------------------------------------------------
|  Auto-load Models
| -------------------------------------------------------------------
*/
$autoload['model'] = array('Common_model');
