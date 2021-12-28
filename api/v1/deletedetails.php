<?php
// delete details endpoint

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'apiclasses.php';

	if ($_SERVER['REQUEST_METHOD'] == "DELETE") {
		
		// get jsondata
		$jsondata = file_get_contents("php://input");

		// decode json data
		$data = json_decode($jsondata);

		if (empty($data->staff_id) || empty($data->status)) {
			
			$output = <<<RES
			{
				"message": "Failed",
				"data": "[]",
				"method": "Bad Request"
			}
			RES;

			echo $output;
			exit;
		}

		// instantiating class
		$objdelete = new Staff;

		// instantiating method
		$obj = $objdelete->deleteStaffDetails($data->staff_id, $data->status);

		echo $obj;
	}else{

		$output = <<<RES
			{
				"message": "Failed",
				"data": "[]",
				"method": "Bad Method"
			}
			RES;

			echo $output;
			exit;
	}
?>