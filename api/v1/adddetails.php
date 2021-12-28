<?php 
// add details endpoint
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include("apiclasses.php");

	if ($_SERVER['REQUEST_METHOD'] == "POST") {

		//get json data
		$jsondata = file_get_contents('php://input');

		// decode jsondata
		$data = json_decode($jsondata);

		// echo "<pre>";
		// print_r($data);
		// echo "</pre>";

		// validating
		if (empty($data->staffid) || empty($data->staffname) || empty($data->staffemail) || empty($data->staffdeptid) || empty($data->stafflevelid) || empty($data->staffcountryid) || empty($data->staffdateofemploy)) {
			
			$result = <<<RES
			{
				"status": "failed",
				"data": "[]",
				"method": "Bad Request"
			}
			RES;

			echo $result;
			exit;
		}

		// instantiating method
		$objstaff = new Staff;

		// making reference to method
		$output = $objstaff->addStaffDetails($data->staffid, $data->staffname, $data->staffemail, $data->staffdeptid, $data->stafflevelid, $data->staffcountryid, $data->staffdateofemploy);

		echo $output;
	}else{

		$result = <<<RES
			{
				"status": "failed",
				"data": "[]",
				"method": "Method not supported"
			}
			RES;

			echo $result;
	}
?>