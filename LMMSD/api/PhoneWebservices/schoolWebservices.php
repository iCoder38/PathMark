<?php

include ('DBConnection.php');
// header('Content-Type: application/json');

header('Access-Control-Allow-Origin: *');  

$officialEmail = 'official@lmourcompany.com';
$noReplyEmail = 'no-reply@lmourcompany.com';
$sendSMSapiKey = 'MB31/b+e6Hc-xjpYJ2HgG3I0BdolgSMgQQHvjNC0lq';


$checkMethod = $_POST['webserviceName'];


$securityWB = $_POST['securityServiceName'];


// $iAmSecurityHeader = array("CCTV");
$iAmSecurityHeader = array("CCTV","Medic","FireExtinguisher","Fence");

/****** SPINNER (REGISTRATION) ******/

if($checkMethod == 'spinnerRegistration')
{
    $name       = $_POST['name'];
    $email      = $_POST['email'];
    $phone      = $_POST['phone'];
    $active     = 'yes';
    
    $insertLogin = "INSERT INTO SpinnerReg (Name,Email,Phone,Active) VALUES ('$name','$email','$phone','$active')";
    
    $LMloginQuery = mysqli_query($LMdbConnection, $insertLogin);
    
    if($LMloginQuery) 
    {
        
        $LMselectLoginQuery = "SELECT * from SpinnerReg

                        where Email  = '$email'
                        &&
                           Active = '$active'
                        ";
                        
                        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);
                
                        if(mysqli_num_rows($LMloginQuery))
                          {
                            $data['success'] = true;
                        while ($row=mysqli_fetch_assoc($LMloginQuery))
                      {
                        $data['loginData'] = $row;
                     
                      }
                      }
                        else
                      {
                        $data['success']=false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
      
        
    }
    else
    {
        $data['success']=false;
        $data['alertMessage'] = 'Something went wrong. Please try again later.';
    }
    
    /*
    $name       = $_POST['name'];
    $email      = $_POST['email'];
    $phone      = $_POST['phone'];
    $active     = 'yes';
    
     $sql="SELECT * from SpinnerReg WHERE (Email = '$email')";
  
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($email==$row['Email'])
                {
                   $data['alertMessage'] = 'This email is already registered with us.';
                }
            }
            
            else
            {
    
    $insertLogin = "INSERT INTO SpinnerReg (Name,Email,Phone,Active) VALUES ('$name','$email','$phone','$active')";
    
    $LMloginQuery = mysqli_query($LMdbConnection, $insertLogin);
    
    if($LMloginQuery) 
    {
        /*
                $message = '<h2>Your MSD Login password is</h2> <br> <br><h1>'.$password.'</h1> <small><strong>Note :</strong>Please Do Not share your password with anyone. You can update your password later in Update Password section.</small>';
        
        		$to       ="$email";
        		$subject  = "Login credentials";
        		$headers  = 'From: LM-MSD'.' '.$officialEmail. "\r\n";
        		$headers .= "MIME-Version: 1.0\r\n";
        		$headers .= "Content-Type: text/html;\n\tcharset=\"iso-8859-1\"\r\n";
        
                $sent   = @mail($to,$subject,$message,$headers);
        
                if ($sent) {
                    */
                    //$data['success'] = true;
                    //$data['alertMessage'] = 'Succesfully registered. Please check your mail for credentials.';
                    
                    
                    /*
                    $LMselectLoginQuery = "SELECT * from SpinnerReg

                        where Email  = '$email'
                        &&
                           Active = '$active'
                        ";
                        
                        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);
                
                        if(mysqli_num_rows($LMloginQuery))
                          {
                            $data['success'] = true;
                        while ($row=mysqli_fetch_assoc($LMloginQuery))
                      {
                        $data['loginData'] = $row;
                     
                      }
                      }
                        else
                      {
                        $data['success']=false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
      
      
      
      
      
                    /*
                }
            }
                else
                {
                    $data['success'] = false; 
                    $data['alertMessage'] = 'Something went wrong. Please try again later.'; 
                }
                */
            //}

}


/****** LOGIN ******/

if($checkMethod == 'login')
{
        $email      = $_POST['email'];
        $password   = $_POST['password'];

        $LMselectLoginQuery = "SELECT * from SchoolRegistration

        where Email  = '$email'
        &&
           Password = '$password'
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
      {
        $data['loginDataS'] = $row;
     
      }
      }
        else
      {
        $data['success']=false;
        $data['alertMessage'] = 'Something went wrong. Please try again later.';
      }

}

/****** REGISTRATION ******/

if($checkMethod == 'registration')
{
    $fullStackId    = md5(microtime().rand());
    $password       = md5(microtime().rand());
    $schoolName     = $_POST['schoolName'];
    $email          = $_POST['email'];
    $token          = $_POST['tokeid'];
    $device         = $_POST['device'];
    $loginVia       = $_POST['loginVia'];
    $active         = 'yes';
    
    $admissionStatus = 'close';
    $admissionStatusComment = 'none';
    
     $sql="SELECT * from SchoolRegistration WHERE (Email = '$email')";
  
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($email==$row['Email'])
                {
                   $data['alertMessage'] = 'This email is already registered with us.';
                }
            }
            
            else
            {
    
    $insertLogin = "INSERT INTO SchoolRegistration (Email,Password,TokenId,Device,LoginVia,Active,FullStackId,SchoolName,AdmissionStatus,AdmissionComment) VALUES ('$email','$password','$token','$device','$loginVia','$active','$fullStackId','$schoolName','$admissionStatus','$admissionStatusComment')";
    
    $LMloginQuery = mysqli_query($LMdbConnection, $insertLogin);
    
    if($LMloginQuery) 
    {
                $message = '<h2>Your MSD Login password is</h2> <br> <br><h1>'.$password.'</h1> <small><strong>Note :</strong>Please Do Not share your password with anyone. You can update your password later in Update Password section.</small>';
        
        		$to       ="$email";
        		$subject  = "Login credentials";
        		$headers  = 'From: LM-MSD'.' '.$officialEmail. "\r\n";
        		$headers .= "MIME-Version: 1.0\r\n";
        		$headers .= "Content-Type: text/html;\n\tcharset=\"iso-8859-1\"\r\n";
        
                $sent   = @mail($to,$subject,$message,$headers);
        
                if ($sent) {
                    $data['success'] = true;
                    $data['alertMessage'] = 'Succesfully registered. Please check your mail for credentials.';
                }
            }
                else
                {
                    $data['success'] = false; 
                    $data['alertMessage'] = 'Something went wrong. Please try again later.'; 
                }
            }

}


/****** ADMISSION STATUS ******/

if($checkMethod == 'admissionStatus')
{
    $schoolId               = $_POST['id'];
    $schoolAdmissionStatus  = $_POST['status'];
    $schoolAdmissionComment = $_POST['comment'];
    
    
    $LMEditUpdateQuery = "UPDATE SchoolRegistration 
                   
                       SET 
                            AdmissionStatus     = '$schoolAdmissionStatus',
                            AdmissionComment    = '$schoolAdmissionComment'
                            
                        WHERE id = $schoolId ";
                        
                        $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);

 		        if ($LMEditResult) 
                    {
 			            // $data['success'] = true;
 			            // $data['alertMessage'] = 'Successfully Updated.';
 			            
 			            
 			            

                        $LMselectLoginQuery = "SELECT * from SchoolRegistration
                
                        where id  = '$schoolId'
                        ";
                        
                        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);
                
                        if(mysqli_num_rows($LMloginQuery))
                          {
                            $data['success'] = true;
                        while ($row=mysqli_fetch_assoc($LMloginQuery))
                          {
                            $data['loginDataS'] = $row;
                            $data['alertMessage'] = 'Successfully Updated.';
                          }
                          }
                            else
                          {
                            $data['success']=false;
                            $data['alertMessage'] = 'Something went wrong. Please try again later.';
                          }
      
      
      
      
      
      
      
      
      
		    	    }
		    	else
                    {
		                $data['success']=false;
		                $data['alertMessage'] = 'Something went wrong. Please try again later.';
                    }
    
}


/****** ADD TEACHER ******/

if($checkMethod == 'addTeacher')
{
    $EPassword = md5(microtime().rand());
    $schoolId  = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $name       = $_POST['Tname'];
    $email      = $_POST['Temail'];
    $class      = $_POST['Tclass'];
    $section    = $_POST['Tsection'];
    $subject    = $_POST['Tsubject'];
    $active     = 'yes';
    $profileCompleted     = 'no';
    
    
    $sql="SELECT * from Teacher WHERE (Email = '$email')";
  
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($email==$row['Email'])
                {
                   $data['alertMessage'] = 'This email has already been taken. Please use another account';  
                    
                }
            }
            
            else
            {
    
                $insertQ = "INSERT INTO Teacher (Name,Email,Password,Class,Section,Subject,Active,SchoolId,SchoolFullStackId,ProfileCompleted) VALUES ('$name','$email','$EPassword','$class','$section','$subject','$active','$schoolId','$schoolFullStackId','$profileCompleted')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    $data['success'] = true;
                    $data['alertMessage'] = "Succesfully Created Teacher's account";
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}



/****** TOTAL TEACHER ******/

if($checkMethod == 'totalTeacher')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $jsonListingOfAllSchool = "SELECT * from Teacher 
    WHERE 
    	SchoolId 			= '$SchoolId'
    &&
        SchoolFullStackId 			= '$SchoolFullStackId'
    	";

    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);

      if(mysqli_num_rows($LMTeacherQueryResult))
      {
        $data['success'] = true;    
    while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
  	{
  		$data['teacherListing'][] = $rowJSONlistingOfSchool;     
  	}	 

      }
      else
      {
        $data['success']=false;
        $data['alertMessage'] = 'Something went wrong. Please try again later.';
      }

    
}


/****** ADD STUDENT ******/

if($checkMethod == 'addStudent')
{
    $EPassword = md5(microtime().rand());
            $loginId = md5(microtime().rand());
            $schoolId  = $_POST['schoolId'];
            $schoolFullStackId  = $_POST['schoolFullStackId'];
            
            $name       = $_POST['Sname'];
            $email      = 'no';
            $class      = $_POST['Sclass'];
            $section    = $_POST['Ssection'];
            $active     = 'yes';
            $rollNumber = $POST['rollNumber'];
            
            $profileComplete = 'no';
            $phoneNumber = 'no';
    
            $res = mysqli_query($LMdbConnection,$sql);
            
            $insertQ = "INSERT INTO Student (Name,Email,Password,Class,Section,Active,SchoolId,SchoolFullStackId,StudentLoginId,RollNumber,ProfileComplete,PhoneNumber) VALUES ('$name','$email','$EPassword','$class','$section','$active','$schoolId','$schoolFullStackId','$loginId','$rollNumber','$profileComplete','$phoneNumber')";
            
            $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
            
            if($LMloginQuery) 
            {
                $data['success'] = true;
                $data['alertMessage'] = "Succesfully Created Student's account";
            }
            else
            {
                $data['success']=false;
        		$data['alertMessage'] = 'Something went wrong. Please try again later.';
            }
    
}

/****** TOTAL STUDENT ******/

if($checkMethod == 'totalStudent')
{
    
    /*
    	$apiKey = urlencode('MB31/b+e6Hc-TjowAqMbi9NqmhiJ1eXympXLNR8s0t');
	// Contact details
// 	$group_id = '123456';
    $numbers = 919996682884  .",". 919582730966 ;
 
	// Prepare data for POST request
// 	$data = array('apikey' => $apiKey, 'group_id' => $group_id, 'numbers' => $numbers);
    	$data = array('apikey' => $apiKey, 'numbers' => $numbers);
    
	// Send the POST request with cURL
	$ch = curl_init('https://api.textlocal.in/create_contacts/');
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$response = curl_exec($ch);
	curl_close($ch);
	*/
	
	
	
	
	
	
	
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];

        $LMselectLoginQuery = "SELECT * from Student

        where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
           
           ORDER BY `Student`.`id` DESC
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
          {
            $data['studentListing'][] = $row;
          }
          }
            else
          {
            $data['success']=false;
            $data['alertMessage'] = 'No Student Found. Please click on "+" to add student.';
          }
    
}



/****** ADD FACILITY ******/

if($checkMethod == 'addFacility')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $Fname      = $_POST['Fname'];
    $Fcomment   = $_POST['Fcomment'];
    $Fdelete    = 'no';
    
    $insertQ = "INSERT INTO Facility (SchoolId,SchoolFullStackId,FacilityName,FacilityComment,FacilityDelete) VALUES ('$schoolId','$schoolFullStackId','$Fname','$Fcomment','$Fdelete')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    $data['success'] = true;
                    $data['alertMessage'] = "Facility added successfully";
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
    
}


/****** TOTAL FACILITY ******/

if($checkMethod == 'totalFacility')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $jsonListingOfAllSchool = "SELECT * from Facility 
    WHERE 
    	SchoolId 			= '$SchoolId'
    &&
        SchoolFullStackId 			= '$SchoolFullStackId'
    &&
        FacilityDelete 			= 'no'
    	";

    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);

      if(mysqli_num_rows($LMTeacherQueryResult))
      {
        $data['success'] = true;    
    while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
  	{
  		$data['facilityListing'][] = $rowJSONlistingOfSchool;     
  	}	 

      }
      else
      {
        $data['success']=false;
        $data['alertMessage'] = 'Something went wrong. Please try again later.';
      }

    
}


/****** DELETE FACILITY ******/

if($checkMethod == 'deleteFacility')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    
    $Delete = 'yes';
    $Aid    	    = $_POST['id'];
    
    $LMEditUpdateQuery = "UPDATE Facility SET 

                FacilityDelete   =  '$Delete'
  
                WHERE id = $Aid ";

                $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);

                

                if ($LMEditResult) 
                {
                    $data['success'] = true; 
                    $data['alertMessage'] = "Facility deleted successfully";
                }
                 else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
    
}



/****** ADD ACTIVITY ******/

if($checkMethod == 'addActivity')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $category      = $_POST['category'];
    $activityList   = $_POST['activities'];
    $Adelete    = 'no';
    
    $insertQ = "INSERT INTO Activity (SchoolId,SchoolFullStackId,ActivityCategory,Activities,ActivityDelete) VALUES ('$schoolId','$schoolFullStackId','$category','$activityList','$Adelete')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    $data['success'] = true;
                    $data['alertMessage'] = "Activity added successfully";
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
    
}



/****** TOTAL ACTIVITY ******/

if($checkMethod == 'totalActivity')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $Category    	    = $_POST['category'];
    
    $jsonListingOfAllSchool = "SELECT * from Activity 
    WHERE 
    	SchoolId 			= '$SchoolId'
    &&
        SchoolFullStackId 			= '$SchoolFullStackId'
    &&
      ActivityCategory 			= '$Category'
    &&
      ActivityDelete 			= 'no'
    	";

    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);

      if(mysqli_num_rows($LMTeacherQueryResult))
      {
        $data['success'] = true;    
    while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
  	{
  		$data['activityListing'][] = $rowJSONlistingOfSchool;     
  		// $data['alertMessage'] = "Activity added successfully";
  	}	 

      }
      else
      {
        $data['success']=false;
        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
      }

    
}

/****** DELETE ACTIVITY ******/

if($checkMethod == 'deleteActivity')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    
    $activityDelete = 'yes';
    $Aid    	    = $_POST['id'];
    
    $LMEditUpdateQuery = "UPDATE Activity SET 

                ActivityDelete   =  '$activityDelete'
  
                WHERE id = $Aid ";

                $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);

                

                if ($LMEditResult) 
                {
                    $data['success'] = true; 
                    $data['alertMessage'] = "Activity deleted successfully";
                }
                 else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
    
}




/****** ADD BUS ROUTES ******/

if($checkMethod == 'addBusRoute')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $DriverName         = $_POST['driverName'];
    $RouteNumber        = $_POST['routeNumber'];
    $Places             = $_POST['places'];
    $delete             = 'no';
    
    $insertQ = "INSERT INTO BusRoute (SchoolId,SchoolFullStackId,DriverName,RouteNumber,Places,DeleteBusRoute) VALUES ('$schoolId','$schoolFullStackId','$DriverName','$RouteNumber','$Places','$delete')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    $data['success'] = true;
                    $data['alertMessage'] = "Bus route added successfully";
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
    
}


/****** TOTAL BUS ROUTE ******/

if($checkMethod == 'totalBusRoute')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $jsonListingOfAllSchool = "SELECT * from BusRoute 
    WHERE 
    	SchoolId 			= '$SchoolId'
    &&
        SchoolFullStackId 			= '$SchoolFullStackId'
    &&
      DeleteBusRoute 			= 'no'
    	";

    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);

      if(mysqli_num_rows($LMTeacherQueryResult))
      {
        $data['success'] = true;    
    while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
  	{
  		$data['busRouteListing'][] = $rowJSONlistingOfSchool;     
  		// $data['alertMessage'] = "Activity added successfully";
  	}	 

      }
      else
      {
        $data['success']=false;
        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
      }

    
}

/****** DELETE BUS ROUTE ******/

if($checkMethod == 'deleteBusRoute')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    
    $activityDelete = 'yes';
    $Aid    	    = $_POST['id'];
    
    $LMEditUpdateQuery = "UPDATE BusRoute SET 

                DeleteBusRoute   =  '$activityDelete'
  
                WHERE id = $Aid ";

                $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);

                

                if ($LMEditResult) 
                {
                    $data['success'] = true; 
                    $data['alertMessage'] = "Bus Route deleted successfully";
                }
                 else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
    
}



/****** EDIT BUS ROUTE ******/

if($checkMethod == 'editBusRoute')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $DriverName         = $_POST['driverName'];
    $RouteNumber        = $_POST['routeNumber'];
    $Places             = $_POST['places'];
    
    $Aid    	    = $_POST['id'];
    
    $LMEditUpdateQuery = "UPDATE BusRoute SET 

                DriverName      =  '$DriverName',
                RouteNumber     =  '$RouteNumber',
                Places          =  '$Places'
  
                WHERE id = $Aid ";

                $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);

                if ($LMEditResult) 
                {
                    $data['success'] = true; 
                    $data['alertMessage'] = "Successfully updated";
                }
                 else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
    
}



/****** COUNT LIST ******/

if($checkMethod == 'countList')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                    
                    $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId = '$SchoolId'
                                    &&
                                        SchoolFullStackId  = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($row = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          	   
                                          		$data['tTeacher']   = $row['TotalTeacher'];
                                          		$data['tStudent']   = $row['TotalStudent'];
                                          		$data['tBook']      = $row['TotalBooks'];
                                          		$data['tLab']       = $row['TotalLabs'];
                                          		$data['tClassroom'] = $row['TotalClassrooms'];
                                          		$data['tComputers'] = $row['TotalComputers'];
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'Something went wrong. Please try again later 3.';
                                      }
                                      
                                      
                
                }
            }
            else
            {
                
                $countZero = '0';
                   //insert
                
     $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalTeacher,TotalStudent,TotalBooks,TotalLabs,TotalClassrooms,TotalComputers) VALUES ('$SchoolId','$SchoolFullStackId','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {

                    $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId = '$SchoolId'
                                    &&
                                        SchoolFullStackId  = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($row = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully fetched";
                                          	   
                                          		$data['tTeacher']   = $row['TotalTeacher'];
                                          		$data['tStudent']   = $row['TotalStudent'];
                                          		$data['tBook']      = $row['TotalBooks'];
                                          		$data['tLab']       = $row['TotalLabs'];
                                          		$data['tClassroom'] = $row['TotalClassrooms'];
                                          		$data['tComputers'] = $row['TotalComputers'];
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'Something went wrong. Please try again later 3.';
                                      }
                                      
     
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
           
            }
}


/****** COUNT (TEACHER) ******/

if($checkMethod == 'countTeacher')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $dValue = $_POST['countValue'];
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                //update
                    $LMEditUpdateQuery = "UPDATE Count SET 
    
                    TotalTeacher      =  '$dValue'
      
                    WHERE SchoolId = '$SchoolId' ";
    
                    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
                    if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                    }
                     else
                      {
                        $data['success'] = false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
                }
            }
            else
            {
            // insert
                $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalTeacher) VALUES ('$SchoolId','$SchoolFullStackId','$dValue')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    // $data['success'] = true;
                    // $data['alertMessage'] = "Successfully updated";
                    
                                 $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId 			= '$SchoolId'
                                    &&
                                        SchoolFullStackId   = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		$data['countListing'][] = $rowJSONlistingOfSchool;
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
                                      }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}

/****** COUNT (STUDENT) ******/

if($checkMethod == 'countStudent')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $dValue = $_POST['countValue'];
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                //update
                    $LMEditUpdateQuery = "UPDATE Count SET 
    
                    TotalStudent      =  '$dValue'
      
                    WHERE SchoolId = '$SchoolId' ";
    
                    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
                    if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                    }
                     else
                      {
                        $data['success'] = false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
                }
            }
            else
            {
            // insert
                $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalStudent) VALUES ('$SchoolId','$SchoolFullStackId','$dValue')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    // $data['success'] = true;
                    // $data['alertMessage'] = "Successfully updated";
                    
                                 $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId 			= '$SchoolId'
                                    &&
                                        SchoolFullStackId   = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		$data['countListing'][] = $rowJSONlistingOfSchool;
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
                                      }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}


/****** COUNT (COMPUTERS) ******/

if($checkMethod == 'countComputer')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $dValue = $_POST['countValue'];
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                //update
                    $LMEditUpdateQuery = "UPDATE Count SET 
    
                    TotalComputers      =  '$dValue'
      
                    WHERE SchoolId = '$SchoolId' ";
    
                    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
                    if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                    }
                     else
                      {
                        $data['success'] = false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
                }
            }
            else
            {
            // insert
                $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalComputers) VALUES ('$SchoolId','$SchoolFullStackId','$dValue')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    // $data['success'] = true;
                    // $data['alertMessage'] = "Successfully updated";
                    
                                 $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId 			= '$SchoolId'
                                    &&
                                        SchoolFullStackId   = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		$data['countListing'][] = $rowJSONlistingOfSchool;
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
                                      }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}

/****** COUNT (BOOKS) ******/

if($checkMethod == 'countBook')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $dValue = $_POST['countValue'];
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                //update
                    $LMEditUpdateQuery = "UPDATE Count SET 
    
                    TotalBooks      =  '$dValue'
      
                    WHERE SchoolId = '$SchoolId' ";
    
                    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
                    if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                    }
                     else
                      {
                        $data['success'] = false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
                }
            }
            else
            {
            // insert
                $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalBooks) VALUES ('$SchoolId','$SchoolFullStackId','$dValue')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    // $data['success'] = true;
                    // $data['alertMessage'] = "Successfully updated";
                    
                                 $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId 			= '$SchoolId'
                                    &&
                                        SchoolFullStackId   = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		$data['countListing'][] = $rowJSONlistingOfSchool;
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
                                      }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}




/****** COUNT (LABS) ******/

if($checkMethod == 'countLab')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $dValue = $_POST['countValue'];
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                //update
                    $LMEditUpdateQuery = "UPDATE Count SET 
    
                    TotalLabs      =  '$dValue'
      
                    WHERE SchoolId = '$SchoolId' ";
    
                    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
                    if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                    }
                     else
                      {
                        $data['success'] = false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
                }
            }
            else
            {
            // insert
                $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalLabs) VALUES ('$SchoolId','$SchoolFullStackId','$dValue')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    // $data['success'] = true;
                    // $data['alertMessage'] = "Successfully updated";
                    
                                 $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId 			= '$SchoolId'
                                    &&
                                        SchoolFullStackId   = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		$data['countListing'][] = $rowJSONlistingOfSchool;
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
                                      }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}





/****** COUNT (CLASSROOMS) ******/

if($checkMethod == 'countClassroom')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $dValue = $_POST['countValue'];
    
     $sql="SELECT * from Count WHERE 
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                //update
                    $LMEditUpdateQuery = "UPDATE Count SET 
    
                    TotalClassrooms      =  '$dValue'
      
                    WHERE SchoolId = '$SchoolId' ";
    
                    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
                    if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                    }
                     else
                      {
                        $data['success'] = false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
                }
            }
            else
            {
            // insert
                $insertQ = "INSERT INTO Count (SchoolId,SchoolFullStackId,TotalClassrooms) VALUES ('$SchoolId','$SchoolFullStackId','$dValue')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    // $data['success'] = true;
                    // $data['alertMessage'] = "Successfully updated";
                    
                                 $jsonListingOfAllSchool = "SELECT * from Count 
                                    WHERE 
                                    	SchoolId 			= '$SchoolId'
                                    &&
                                        SchoolFullStackId   = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		$data['countListing'][] = $rowJSONlistingOfSchool;
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'No Activity added yet. Please add activity first.';
                                      }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}


/************************************************************************************************************/
/************************************************************************************************************/
/************************************************************************************************************/
/************************************************************************************************************/
/************************************************************************************************************/
/****** SCHOOL DETAILS (SCHOOL NAME) ******/

/****** SCHOOL DETAILS ******/

if($checkMethod == 'schoolDetails')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
     $sql="SELECT * from SchoolDetails 
     where
        SchoolId = '$SchoolId'
     &&
        SchoolFullStackId = '$SchoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($SchoolId==$row['SchoolId'] && $SchoolFullStackId==$row['SchoolFullStackId'])
                {
                    
                    $jsonListingOfAllSchool = "SELECT * from SchoolDetails 
                                    WHERE 
                                    	SchoolId = '$SchoolId'
                                    &&
                                        SchoolFullStackId  = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($row = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully updated";
                                          		
                                          		$iAmTableHeader = array("School Name","Principle Name","Vice-Principle Name","Email","Email Optional","Phone","Phone Option","Country","City","State","Address","Zipcode");
                                          		
                                          		$data['TableHeader'] = $iAmTableHeader;
                                          		
                                          		
                                          		
                                          		$iAmTableRow = array($row['SchoolName'],$row['PrincipleName'],$row['VicePrincipleName'],$row['Email'],$row['EmailOptional'],$row['Phone'],$row['PhoneOptional'],$row['Country'],$row['City'],$row['State'],$row['Address'],$row['Zipcode']);

                                          		$data['TableRows'] = $iAmTableRow;
                                          		
                                          		
                                          		/*
                                          		$data['dSchoolName']     = $row['SchoolName'];
                                          		$data['dPrinciple']     = $row['PrincipleName'];
                                          		$data['sVicePrinciple'] = $row['VicePrincipleName'];
                                          		$data['sEmail']         = $row['Email'];
                                          		$data['sEmailOptional'] = $row['EmailOptional'];
                                          		$data['sPhone']         = $row['Phone'];
                                          		$data['sPhoneOptional'] = $row['PhoneOptional'];
                                          		$data['sCountry']       = $row['Country'];
                                          		$data['sCity']          = $row['City'];
                                          		$data['sState']         = $row['State'];
                                          		$data['dAddress']       = $row['Address'];
                                          		$data['dZipcode']       = $row['Zipcode'];
                                                */
                                                
                                                
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'Something went wrong. Please try again later 3.';
                                      }
                                      
                                      
                
                }
            }
            else
            {
                
                $countZero = '0';
                   //insert
                
     $insertQ = "INSERT INTO SchoolDetails (SchoolId,SchoolFullStackId,SchoolName,PrincipleName,VicePrincipleName,Email,EmailOptional,Phone,PhoneOptional,Country,City,State,Address,Zipcode) VALUES ('$SchoolId','$SchoolFullStackId','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero','$countZero')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {

                    $jsonListingOfAllSchool = "SELECT * from SchoolDetails 
                                    WHERE 
                                    	SchoolId = '$SchoolId'
                                    &&
                                        SchoolFullStackId  = '$SchoolFullStackId'
                                    	";
                                
                                    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
                                
                                      if(mysqli_num_rows($LMTeacherQueryResult))
                                      {
                                        $data['success'] = true;    
                                            while ($row = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                                          	{
                                          	    $data['alertMessage'] = "Successfully fetched";
                                          	   
                                          	   
                                          	   $iAmTableHeader = array("School Name","Principle Name","Vice-Principle Name","Email","Email Optional","Phone","Phone Option","Country","City","State","Address","Zipcode");
                                          		
                                          		$data['TableHeader'] = $iAmTableHeader;
                                          		
                                          		
                                          		
                                          		$iAmTableRow = array($row['SchoolName'],$row['PrincipleName'],$row['VicePrincipleName'],$row['Email'],$row['EmailOptional'],$row['Phone'],$row['PhoneOptional'],$row['Country'],$row['City'],$row['State'],$row['Address'],$row['Zipcode']);

                                          		$data['TableRows'] = $iAmTableRow;
                                          	
                                          	}	 
                                      }
                                      else
                                      {
                                        $data['success']=false;
                                        $data['alertMessage'] = 'Something went wrong. Please try again later 4.';
                                      }
                                      
     
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later 5.';
                }
           
            }
}







/****** EDIT (SCHOOL NAME) *****/
if($checkMethod == 'editSchoolDetails')
{
    // 1 = school name
    // 2 = principle name
    // 3 = vice principle name
    // 4 = email
    // 5 = email optional
    // 6 = phone
    // 7 = phone optional
    // 8 = country
    // 9 = city
    // 10 = state
    // 11 = address
    // 12 = zipcode
    
    $sId 	            = $_POST['id'];
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $ketVal = $_POST['keyValue'];// either one or two or three or four
    $dValue = $_POST['text'];
    
    if($ketVal == 'School Name') // school name
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            SchoolName  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
      if($ketVal == 'Principle Name') // principle name
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            PrincipleName  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Vice-Principle Name') // vice - principle name
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            VicePrincipleName  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Email') // email
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            Email  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Email Optional') // email optional
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            EmailOptional  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Phone') // Phone
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            Phone  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Phone Option') // Phone Option
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            PhoneOptional  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Country') // country
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            Country  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'City') // city
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            City  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'State') // state
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            State  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Address') // address
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET 
                            Address  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    if($ketVal == 'Zipcode') // zipcode
    {
        $LMEditUpdateQuery = "UPDATE SchoolDetails 
                       SET to
                            Zipcode  = '$dValue'
                            WHERE SchoolId = '$SchoolId' ";
    }
    
    $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
    
 		        if ($LMEditResult) 
                    {
                        /*
                        // Account details
                        $apiKey = urlencode($sendSMSapiKey);
	
                        // Message details
                        $numbers = array(919953032351);
                        $sender = urlencode('LMOMSD');
                        $message = rawurlencode('Your student is absent today.');
                        
                        $numbers = implode(',', $numbers);
                        
                        // Prepare data for POST request
                        $data = array('apikey' => $apiKey, 'numbers' => $numbers, "sender" => $sender, "message" => $message);
                        
                        
                        // Send the POST request with cURL
                        $ch = curl_init('https://api.textlocal.in/send/');
                        curl_setopt($ch, CURLOPT_POST, true);
                        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                        $response = curl_exec($ch);
                        curl_close($ch);
	                    */
	                    
	                    /*
	                    // Send the GET request with cURL
                    	$ch = curl_init('https://api.textlocal.in/send/?' . $data);
                    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    	$response = curl_exec($ch);
                    	curl_close($ch);
                    	*/
	
	
                        // success update
                         $data['success'] = true; 
                        $data['alertMessage'] = "Successfully updated.";
                        
                        
	
		    	    }
		    	else
                    {
		                $data['success']=false;
		                $data['alertMessage'] = 'Something went wrong. Please try again later.';
                    }
    
}





/************************************************************************************************************/
/************************************************************************************************************/
/************************************************************************************************************/
/************************************************************************************************************/
/************************************************************************************************************/



/****** GALLERY ******/
if($checkMethod == 'uploadSchoolGallery')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
	$imageName = $_POST['nameOfImage'];
	$photo=$_FILES['photo']['name'];
	$tmp_name=$_FILES['photo']['tmp_name'];

    $deletePhoto = 'no';
    
	$filename=date('ymdhis').basename($photo);
	$target="./School/".$filename;
	move_uploaded_file($tmp_name, $target);

	$sql="INSERT INTO SchoolGallery (SchoolId,SchoolFullStackId,photo,DeletePhoto) VALUES ('$SchoolId','$SchoolFullStackId','$filename','$deletePhoto')";

	$result=mysqli_query($LMdbConnection,$sql); 

	if($result)
	{
	    $data['success'] = true; 
        $data['alertMessage'] = "Successfully updated.";
	}
	else
	{
        $data['success']=false;
        $data['alertMessage'] = 'Something went wrong. Please try again later.';
	}

}

/****** GALLERY LIST ******/
if($checkMethod == 'listOfAllGalleryImage')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    //$deletePhoto      = 'no';
    
    // &&
    // DeletePhoto = '$deletePhoto'
    
    $LMselectLoginQuery = "SELECT * from SchoolGallery

                        where SchoolId  = '$SchoolId'
                        &&
                           SchoolFullStackId = '$SchoolFullStackId'
                        
                           
                           
                           ORDER BY `SchoolGallery`.`id` DESC
                        ";
                        
                        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);
                
                        if(mysqli_num_rows($LMloginQuery))
                          {
                            $data['success'] = true;
                        while ($row=mysqli_fetch_assoc($LMloginQuery))
                      {
                        $data['schoolGalleryImageList'][] = $row;
                        $data['alertMessage'] = "Successfully updated.";
                     
                      }
                      }
                        else
                      {
                        $data['success']=false;
                        $data['alertMessage'] = 'Something went wrong. Please try again later.';
                      }
      
        
    
}

/****** UNIFORM ******/
if($checkMethod == 'addUniform')
{ 
    $schoolId  = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $Utitle         = $_POST['title'];
    $Gender         = $_POST['gender'];
    $Comment        = $_POST['comment'];
    $deleteUniform  = 'no';

	$photo=$_FILES['photo']['name'];
	$tmp_name=$_FILES['photo']['tmp_name'];

    $deletePhoto = 'no';
    
	$filename=date('ymdhis').basename($photo);
	$target="./SchoolUniform/".$filename;
	move_uploaded_file($tmp_name, $target);


    $insertQ = "INSERT INTO Uniform (SchoolId,SchoolFullStackId,UniformTitle,Gender,Comment,DeleteUniform,photo) VALUES ('$schoolId','$schoolFullStackId','$Utitle','$Gender','$Comment','$deleteUniform','$filename')";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
        
        if($LMloginQuery) 
        {
            $data['success'] = true;
            $data['alertMessage'] = "Succesfully uploaded";
        }
        else
        {
            $data['success'] = false;
    		$data['alertMessage'] = 'Something went wrong. Please try again later.';
        }
}


/****** UNIFORM LIST *********/

if($checkMethod == 'schoolUniformList')
{
    
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $LMselectLoginQuery = "SELECT * from Uniform

        where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
          {
            $data['schoolUniformList'][] = $row;
            $data['alertMessage'] = 'Successfully fetched.';
          }
          }
            else
          {
            $data['success']=false;
            $data['alertMessage'] = 'Something went wrong. Please try again later.';
          }
}


/****** SECURITY ******/

if($checkMethod == 'schoolSecurity')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $cctv  = $_POST['cctv'];
    $medic  = $_POST['medic'];
    $fireExtinguisher  = $_POST['fireExtinguisher'];
    $fence  = $_POST['fence'];
    
    
    $sql="SELECT * from Security 
     where
        SchoolId = '$schoolId'
     &&
        SchoolFullStackId = '$schoolFullStackId'
     ";
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                if($schoolId==$row['SchoolId'] && $schoolFullStackId==$row['SchoolFullStackId'])
                {
                    $jsonListingOfAllSchool = "SELECT * from Security 
                WHERE 
                	SchoolId = '$schoolId'
                &&
                    SchoolFullStackId  = '$schoolFullStackId'
                	";
            
                $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
            
                  if(mysqli_num_rows($LMTeacherQueryResult))
                  {
                    $data['success'] = true;    
                        while ($row = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                      	{
                      	    $data['alertMessage'] = "Successfully updated.";
                      	   
                            $data['SecurityHeading'] = $iAmSecurityHeader;
                            
                            
                            $iAmTableRow = array($row['CCTV'],$row['Medic'],$row['FireExtinguisher'],$row['Fence']);
                            $data['SecurityRows'] = $iAmTableRow;
                      	}	 
                  }
                  else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
                }
            }
            else
            {
                 
                $countZero = "n";
                   //insert
                
            $insertQ = "INSERT INTO Security (SchoolId,SchoolFullStackId) VALUES ('$schoolId','$schoolFullStackId')";
                
                $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                
                if($LMloginQuery) 
                {
                    $jsonListingOfAllSchool = "SELECT * from Security 
                WHERE 
                	SchoolId = '$schoolId'
                &&
                    SchoolFullStackId  = '$schoolFullStackId'
                	";
            
                $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);
            
                  if(mysqli_num_rows($LMTeacherQueryResult))
                  {
                    $data['success'] = true;    
                        while ($row = mysqli_fetch_assoc($LMTeacherQueryResult)) 
                      	{
                      	    $data['alertMessage'] = "Successfully updated.";
                      	   
                            $data['SecurityHeading'] = $iAmSecurityHeader;
                            
                            
                            
                            $iAmTableRow = array($row['CCTV'],$row['Medic'],$row['FireExtinguisher'],$row['Fence']);
                            // $iAmTableRow = array($row['CCTV']);
                            $data['SecurityRows'] = $iAmTableRow;
                      	}	 
                  }
                  else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
                }
                else
                {
                    $data['success']=false;
            		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                }
            }
}


/****** SECURITY UPDATE ******/

if($checkMethod == 'updateSecurityServiceHere')
{
    //$securityWB = $_POST['securityServiceName'];
    
    $SchoolId 	        = $_POST['schoolId'];
    $myUpdateValue 	    = $_POST['securityValue'];
    
    if($securityWB == 'CCTV')
    {
          $LMEditUpdateQuery = "UPDATE Security SET 

                CCTV            =  '$myUpdateValue'
  
                WHERE SchoolId  = '$SchoolId' ";

    }
    else if($securityWB == 'Medic')
    {
        $LMEditUpdateQuery = "UPDATE Security SET 

                Medic            =  '$myUpdateValue'
  
                WHERE SchoolId  = '$SchoolId' ";
    }
    else if($securityWB == 'FireExtinguisher')
    {
        $LMEditUpdateQuery = "UPDATE Security SET 

                FireExtinguisher            =  '$myUpdateValue'
  
                WHERE SchoolId  = '$SchoolId' ";
    }
    else if($securityWB == 'Fence')
    {
        $LMEditUpdateQuery = "UPDATE Security SET 

                Fence            =  '$myUpdateValue'
  
                WHERE SchoolId  = '$SchoolId' ";
    }
    
    
    
            $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
                if ($LMEditResult) 
                    {
                        $data['success'] = true; 
                        $data['alertMessage'] = "Successfully Updated";
                    }
                else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
    
    
    

  
    
  
                
                  
}

/****** DEACTIVATE MY ACCOUNT ******/

if($checkMethod == 'deactivateMySchoolAccount')
{
    $SchoolId 	        = $_POST['schoolId'];
    $SchoolFullStackId 	= $_POST['schoolFullStackId'];
    
    $active = 'no';
    
    $LMEditUpdateQuery = "UPDATE SchoolRegistration SET 

                Active   =  '$active'
  
                WHERE id = '$SchoolId'
                ";

                $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);

                if ($LMEditResult) 
                {
                    //$data['success'] = true; 
                    //$data['alertMessage'] = "Account has been De-Activated Successfully.";
                    
                     $LMselectLoginQuery = "SELECT * from SchoolRegistration

                        where id        = '$SchoolId'
                        &&
                           FullStackId  = '$SchoolFullStackId'
                        ";
                        
                        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);
                
                        if(mysqli_num_rows($LMloginQuery))
                          {
                            $data['success'] = true;
                            while ($row=mysqli_fetch_assoc($LMloginQuery))
                              {
                                  
                                $deactivatedAccountHolderEmail = $row['Email'];
                                
                                $message = '<h2>How to Recover your Account.</h2> Steps to Recover your account:- <br>
                                            <ul><li>Open Mobile application.</li> 
                                                <li>Type your Email and Password.</li> 
                                                <li>If your account is De-Activated then a Pop Up occurs.</li><li>Click Activate.</li>
                                                <li>LM will ask your Phone Number (Just confirm it is really you).</li>
                                                <li>When LM team confirmed your details then we will automatically generate an Encrypted password and send it to your Registered Email Address.</li>    
                                            </ul>';
        
                                		$to       = $deactivatedAccountHolderEmail;
                                		$subject  = "Your account has been De-Activated. To recover your account please follow 'Recover My Account Steps.' ";
                                		$headers  = 'From: LM-MSD'.' '.$officialEmail. "\r\n";
                                		$headers .= "MIME-Version: 1.0\r\n";
                                		$headers .= "Content-Type: text/html;\n\tcharset=\"iso-8859-1\"\r\n";
                                
                                        $sent   = @mail($to,$subject,$message,$headers);
                                        
                                        if($sent) {
                                            $data['loginDataS'] = $row;
                                            $data['alertMessage'] = "Account has been De-Activated Successfully.";
                                        }
                                        else
                                        {
                                            $data['success']=false;
                                            $data['alertMessage'] = 'Something went wrong. Please try again later.';
                                        }
                              }
                              }
                                else
                              {
                                $data['success']=false;
                                $data['alertMessage'] = 'Something went wrong. Please try again later.';
                              }
      
      
      
                }
                 else
                  {
                    $data['success']=false;
                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                  }
                  
                  
                  
                  
}



/****** ACTIVATE MY ACCOUNT ******/

if($checkMethod == 'activateMySchoolAccount')
{
    $password       = md5(microtime().rand());
    
    $emailIs 	= $_POST['email'];
    
    $active = 'yes';
    
     $LMselectLoginQuery = "SELECT * from SchoolRegistration

                        where Email        = '$emailIs'
                        ";
                        
                        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);
                
                        if(mysqli_num_rows($LMloginQuery))
                          {
                            $data['success'] = true;
                            while ($row=mysqli_fetch_assoc($LMloginQuery))
                              {
                                $schoolIdIs = $row['id'];
                                 
                                   $LMEditUpdateQuery = "UPDATE SchoolRegistration SET 

                                        Active      =  '$active',
                                        Password    =  '$password'
                          
                                        WHERE id = '$schoolIdIs'
                                        ";
                        
                                        $LMEditResult = mysqli_query($LMdbConnection, $LMEditUpdateQuery);
                        
                                        if ($LMEditResult) 
                                        {
                                            $message = '<h1>We are HAPPY to see you back.</h1>
                                                                    <h2>Your New Paassword Is.</h2><br>
                                                                        <ul>
                                                                            <li>Email:- '.$emailIs.'</li> 
                                                                            <li>Password:- '.$password.'</li>
                                                                        </ul>
                                                                    <br>
                                                                    <br>
                                                                    <strong>You can change your Password later.</strong>
                                                                    ';
                                
                                                        		$to       = $emailIs;
                                                        		$subject  = "Your account has been De-Activated. To recover your account please follow 'Recover My Account Steps.' ";
                                                        		$headers  = 'From: LM-MSD'.' '.$officialEmail. "\r\n";
                                                        		$headers .= "MIME-Version: 1.0\r\n";
                                                        		$headers .= "Content-Type: text/html;\n\tcharset=\"iso-8859-1\"\r\n";
                                                        
                                                                $sent   = @mail($to,$subject,$message,$headers);
                                                                
                                                                if($sent) {
                                                                    $data['success']=true;
                                                                    $data['alertMessage'] = "Please check your Registered Email address for password and login with that password to Activate your account";
                                                                }
                                                                else
                                                                {
                                                                    $data['success']=false;
                                                                    $data['alertMessage'] = 'Something went wrong. Please try again later.';
                                                                }
                                        }
                                         else
                                          {
                                            $data['success']=false;
                                            $data['alertMessage'] = 'Something went wrong. Please try again later.';
                                          }
                              }
                          }
}




                    $y = json_encode($data,true);
                    header('Content-Type: application/json;charset=utf-8');
                    echo $y;
?>

