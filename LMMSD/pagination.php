<?php

$LMregHostName = "localhost";
$LMregUserName = "u686423365_lmmsu";
$LMregPassword = "0so48EzUudmTcdHwpD";
$LMDATABASENAME = "u686423365_lmmsd";

//connect
$LMdbConnection = mysqli_connect($LMregHostName, $LMregUserName, $LMregPassword, $LMDATABASENAME);
if (!$LMdbConnection) {
  echo "NOT CONNECT WITH DATABASE". mysqli_error($LMdbConnection);
}


	   $studentSchoolId 	= '124';

         

    $jsonListingOfAllSchool = "SELECT * from LMMySchoolBusReRoute 
    WHERE 
    	LMMySchoolMainIdForBusRoute 			= '$studentSchoolId'
    
    	";


    $LMTeacherQueryResult = mysqli_query($LMdbConnection, $jsonListingOfAllSchool);


      if(mysqli_num_rows($LMTeacherQueryResult))
      {
        $data['success'] = true;    
    while ($rowJSONlistingOfSchool = mysqli_fetch_assoc($LMTeacherQueryResult)) 
  	{
  		$data['busRouteListing'][] = $rowJSONlistingOfSchool;     
  	}	 

      }
      else
      {
        $data['success']=false;
      }

    
     $y = json_encode($data,true);
     header('Content-Type: application/json;charset=utf-8');
        echo $y;


?>
                

    
      