<?php 
// update details endpoint 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'apiclasses.php';

	if ($_SERVER['REQUEST_METHOD'] == "PUT") {
		
		// get json data
		$jsondata = file_get_contents("php://input");

		// decode json data
		$data = json_decode($jsondata);

		if (empty($data->staff_id) || empty($data->status)) {
			
			$output = <<<RES
			{
				"status": "Failed",
				"data": "[]",
				"method": "Bad Request"
			}
			RES;

			echo $output;
			exit;
		}

		// instantiating class
		$obj = new Staff;

		// obj of method
		$objupdate = $obj->updateStaffDetails($data->staff_id, $data->status);
		echo $objupdate;

	}else{

		$output = <<<RES
			{
				"status": "Failed",
				"data": "[]",
				"method": "Bad Request"
			}
			RES;

			echo $output;
			exit;
	}
?>