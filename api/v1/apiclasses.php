<?php 
	// defining class

	class Staff{

		public $dbconn;

			// member functions
			public function __construct(){

				// creating database connection by creating instance of mysqli class
				$this->dbconn = new Mysqli("localhost", "root", "", "staffdb");

				if ($this->dbconn->connect_error) {
					die('Connection problem'.$this->dbconn->connect_error);
				}else{
					// echo "Connected successfully";
				}
			}

			// method for adding staff details
			public function addStaffDetails($staffid, $staffname, $staffemail, $deptid, $levelid, $countryid, $employdate){

				// sql query
				$sql = "INSERT INTO staff_detail(staff_id, staff_name, staff_email, dept_id, level_id, country_id, staff_dateemployed) VALUES ('$staffid','$staffname','$staffemail','$deptid','$levelid','$countryid','$employdate')";

				// run sql query
				$result = $this->dbconn->query($sql);

				if (!empty($this->dbconn->error)) {
					die('Connection Error'.$this->dbconn->error);
				}

				if ($this->dbconn->affected_rows == 1) {
					
					$status = "success";
					$data = $this->dbconn->insert_id;
					$message = "A new record was added succesfully";
				}else{

					$status = "failed";
					$data = [];
					$message = "Could not add new record".$this->dbconn->error;
				}

				$response = array(

					"status"=> $status,
					"data"=> $data,
					"message"=> $message
				);

				return json_encode($response);
			}

			// method to list staff details
			public function listStaffDetails($staffid){

				// write query
				$sql = "SELECT staff_detail.staff_id,staff_detail.staff_name,staff_detail.staff_dateemployed,staff_detail.status,country_details.country_name,dept_details.dept_name,level_details.level_name FROM staff_detail
				LEFT JOIN country_details ON country_details.country_id = staff_detail.country_id
				LEFT JOIN dept_details ON dept_details.dept_id = staff_detail.dept_id
				LEFT JOIN level_details ON level_details.level_id = staff_detail.level_id
				WHERE staff_id ='$staffid'";

				// run query
				$output = $this->dbconn->query($sql);

				if (!empty($this->dbconn->error)) {
					die('Error in network onnection'.$this->dbconn->error);
				}

				$result = array();
				if ($this->dbconn->affected_rows > 0) {
					
					while ($row = $output->fetch_assoc()) {
						$result[] = $row;
					}

					$status = "success";
					$data = $result;
					$message = "Staff Details Updated succesfully";
				}else{

					$status = "Failed";
					$data = [];
					$message = "Could not find staff details".$this->dbconn->error;
				}

				$response = array(

					"status"=>$status,
					"data"=>$data,
					"message"=>$message
				);

				return json_encode($response);
			}

			public function updateStaffDetails($staffid, $stat){

				// write query
				$sql = "UPDATE staff_detail SET status='$stat' WHERE staff_id='$staffid'";

				// run query
				$output = $this->dbconn->query($sql);

				if (!empty($this->dbconn->error)) {
					die('Connection Error'.$this->dbconn->error);
				}

				if ($this->dbconn->affected_rows == 1) {
					
					$status = "Success";
					$data = $output;
					$message = "Updated succesfully";
				}else{

					$status = "Failed";
					$data = [];
					$message = "Failed to update".$this->dbconn->error;
				}

				$response = array(

					"status"=>$status,
					"data"=>$data,
					"message"=>$message
				);

				return json_encode($response);
			}

			// method to soft delete staff details, status will be changed to deleted but the entire record will not be deleted
			public function deleteStaffDetails($staffid, $stat){

				// write query
				$sql = "UPDATE staff_detail SET status='$stat' WHERE staff_id='$staffid'";

				// run query
				$output = $this->dbconn->query($sql);

				if (!empty($this->dbconn->error)) {
					die('Connection Error'.$this->dbconn->error);
				}

				if ($this->dbconn->affected_rows == 1) {
					
					$status = "Success";
					$data = $output;
					$message = "Updated succesfully";
				}else{

					$status = "Failed";
					$data = [];
					$message = "Failed to update".$this->dbconn->error;
				}

				$response = array(

					"status"=>$status,
					"data"=>$data,
					"message"=>$message
				);

				return json_encode($response);
			}
	}
?>