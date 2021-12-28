<?php 
// listdetails end point

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'apiclasses.php';

	if ($_SERVER['REQUEST_METHOD'] == "GET") {
		
		// get data
		$jsondata = file_get_contents("php://input");

		// decode data
		$data = json_decode($jsondata);

		// validating
		if (empty($data->staff_id)) {
			
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
		$objlist = new Staff;

		// instantiating method
		$outlist = $objlist->listStaffDetails($data->staff_id);

		echo $outlist;
	}else{

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
?>
