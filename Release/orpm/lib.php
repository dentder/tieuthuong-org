<?php
// This script and data application were generated by AppGini 5.31
// Download AppGini for free from http://bigprof.com/appgini/download/


error_reporting(E_ERROR | E_WARNING | E_PARSE);

if(!defined('datalist_db_encoding')) define('datalist_db_encoding', 'UTF-8');
if(function_exists('date_default_timezone_set')) @date_default_timezone_set('America/New_York');
if(function_exists('set_magic_quotes_runtime')) @set_magic_quotes_runtime(0);

$currDir=dirname(__FILE__);
include("$currDir/settings-manager.php");
detect_config();
migrate_config();

include("$currDir/config.php");
include("$currDir/db.php");
include("$currDir/incCommon.php");
include("$currDir/ci_input.php");
include("$currDir/datalist.php");
@include("$currDir/hooks/links-navmenu.php");
function sql($statment, &$o){

	/*
		Supported options that can be passed in $o options array (as array keys):
		'silentErrors': If true, errors will be returned in $o['error'] rather than displaying them on screen and exiting.
	*/

	global $Translation;
	static $connected = false, $db_link;

	$dbServer = config('dbServer');
	$dbUsername = config('dbUsername');
	$dbPassword = config('dbPassword');
	$dbDatabase = config('dbDatabase');

	ob_start();

	if(!$connected){
		/****** Connect to MySQL ******/
		if(!extension_loaded('mysql') && !extension_loaded('mysqli')){
			echo error_message('PHP is not configured to connect to MySQL on this machine. Please see <a href="http://www.php.net/manual/en/ref.mysql.php">this page</a> for help on how to configure MySQL.');
			$e=ob_get_contents(); ob_end_clean(); if($o['silentErrors']){ $o['error']=$e; return FALSE; }else{ echo $e; exit; }
		}

		if(!($db_link = @db_connect($dbServer, $dbUsername, $dbPassword))){
			echo error_message(db_error($db_link, true));
			$e=ob_get_contents(); ob_end_clean(); if($o['silentErrors']){ $o['error']=$e; return FALSE; }else{ echo $e; exit; }
		}

		/****** Select DB ********/
		if(!db_select_db($dbDatabase, $db_link)){
			echo error_message(db_error($db_link));
			$e=ob_get_contents(); ob_end_clean(); if($o['silentErrors']){ $o['error']=$e; return FALSE; }else{ echo $e; exit; }
		}

		$connected = true;
	}

	if(!$result = @db_query($statment, $db_link)){
		if(!stristr($statment, "show columns")){
			// retrieve error codes
			$errorNum = db_errno($db_link);
			$errorMsg = db_error($db_link);

			echo error_message(htmlspecialchars($errorMsg) . "\n\n<!--\n" . $Translation['query:'] . "\n $statment\n-->\n\n");
			$e = ob_get_contents(); ob_end_clean(); if($o['silentErrors']){ $o['error'] = $errorMsg; return false; }else{ echo $e; exit; }
		}
	}

	ob_end_clean();
	return $result;
}

function NavMenus($options = array()){
	global $Translation;
	$menu = '';

	/* default options */
	if(empty($options)){
		$options = array(
			'tabs' => 7
		);
	}

	$t = time();
	$arrTables = getTableList();
	if(is_array($arrTables)){
		foreach($arrTables as $tn => $tc){
			/* ---- list of tables where hide link in nav menu is set ---- */
			$tChkHL = array_search($tn, array('residence_and_rental_history','employment_and_income_history','references'));
			if($tChkHL !== false && $tChkHL !== null) continue;

			/* ---- list of tables where filter first is set ---- */
			$tChkFF = array_search($tn, array());
			if($tChkFF !== false && $tChkFF !== null){
				$searchFirst = '&Filter_x=1';
			}else{
				$searchFirst = '';
			}
			$menu .= "<li><a href=\"{$tn}_view.php?t={$t}{$searchFirst}\"><img src=\"" . ($tc[2] ? $tc[2] : 'blank.gif') . "\" height=\"32\"> {$tc[0]}</a></li>";
		}
	}

	// custom nav links, as defined in "hooks/links-navmenu.php" 
	global $navLinks;
	if(is_array($navLinks)){
		$memberInfo = getMemberInfo();
		$links_added = 0;
		foreach($navLinks as $link){
			if(!isset($link['url']) || !isset($link['title'])) continue;
			if($memberInfo['admin'] || @in_array($memberInfo['group'], $link['groups']) || @in_array('*', $link['groups'])){
				if(!$links_added) $menu .= '<li class="divider"></li>';
				$menu .= "<li><a href=\"{$link['url']}\"><img src=\"" . ($link['icon'] ? $link['icon'] : 'blank.gif') . "\" height=\"32\"> {$link['title']}</a></li>";
				$links_added++;
			}
		}
	}

	return $menu;
}

function StyleSheet(){
	$css_links  = '<link rel="stylesheet" href="resources/initializr/css/bootstrap_compact.css">';
	$css_links .= '<style>body{ padding-top: 70px; padding-bottom: 20px; }</style>';
	$css_links .= '<!--[if gt IE 8]><!--> <link rel="stylesheet" href="resources/initializr/css/bootstrap-theme.css"> <!--<![endif]-->';
	$css_links .= '<link rel="stylesheet" href="dynamic.css.php">';
	return $css_links;
}

function getUploadDir($dir){
	global $Translation;

	if($dir==""){
		$dir=$Translation['ImageFolder'];
	}

	if(substr($dir, -1)!="/"){
		$dir.="/";
	}

	return $dir;
}

function PrepareUploadedFile($FieldName, $MaxSize, $FileTypes='jpg|jpeg|gif|png', $NoRename=false, $dir=""){
	global $Translation;
	$f = $_FILES[$FieldName];

	$dir=getUploadDir($dir);

	if($f['error'] != 4 && $f['name']!=''){
		if($f['size']>$MaxSize || $f['error']){
			echo error_message(str_replace('<MaxSize>', intval($MaxSize / 1024), $Translation['file too large']));
			exit;
		}
		if(!preg_match('/\.('.$FileTypes.')$/i', $f['name'], $ft)){
			echo error_message(str_replace('<FileTypes>', str_replace('|', ', ', $FileTypes), $Translation['invalid file type']));
			exit;
		}

		if($NoRename){
			$n  = str_replace(' ', '_', $f['name']);
		}else{
			$n  = microtime();
			$n  = str_replace(' ', '_', $n);
			$n  = str_replace('0.', '', $n);
			$n .= $ft[0];
		}

		if(!file_exists($dir)){
			@mkdir($dir, 0777);
		}

		if(!@move_uploaded_file($f['tmp_name'], $dir . $n)){
			echo error_message("Couldn't save the uploaded file. Try chmoding the upload folder '{$dir}' to 777.");
			exit;
		}else{
			@chmod($dir.$n, 0666);
			return $n;
		}
	}
	return "";
}
?>