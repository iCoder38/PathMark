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

/****** TEACHER LOGIN ******/

if($checkMethod == 'login')
{
        $email      = $_POST['email'];
        $password   = $_POST['password'];

        $LMselectLoginQuery = "SELECT * from Teacher

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
        $data['loginDataT'] = $row;
      }
      }
        else
      {
        $data['success']=false;
        $data['alertMessage'] = 'Either your Email or Password is Incorrect.';
      }
}








/****** TEACHER (MY CLASS STUDENTS) ******/

if($checkMethod == 'listOfMyClassStudents')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $class              = $_POST['class'];
    $section            = $_POST['section'];
    
    $active            = 'yes';

        $LMselectLoginQuery = "SELECT * from Student

        where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
        &&
           Class = '$class'
        &&
           Section = '$section'
           
           &&
           Active = '$active'
           
           ORDER BY `Student`.`id` DESC
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
          {
            $data['studentList'][] = $row;
          }
          }
            else
          {
            $data['success']=false;
            $data['alertMessage'] = 'No Student Found. Please click on "+" to add student.';
          }
}

/****** TEACHER (MY CLASS STUDENTS) ******/

if($checkMethod == 'incompleteProfileStudents')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $class              = $_POST['class'];
    $section            = $_POST['section'];
    
    $active            = 'yes';
    
    $profileComplete            = 'no';

        $LMselectLoginQuery = "SELECT * from Student

        where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
        &&
           Class = '$class'
        &&
           Section = '$section'
        &&
           Active = '$active'
        &&
           ProfileComplete = '$profileComplete'
           
           ORDER BY `Student`.`id` DESC
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
          {
            $data['studentList'][] = $row;
          }
          }
            else
          {
            $data['success']=false;
            $data['alertMessage'] = 'No Student Found. Please click on "+" to add student.';
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


















/****** ADD MARK ABSENT ******/

if($checkMethod == 'markAbsent')
{
    $schoolId           = $_POST['schoolId'];
    $schoolFullStackId  = $_POST['schoolFullStackId'];
    
    $studentId          = $_POST['studentId'];
    $studentName      = $_POST['studentName'];
    
    $teacherId      = $_POST['teacherId'];
    $teacherName      = $_POST['teacherName'];
    $teacherClass      = $_POST['teacherClass'];
    $date      = $_POST['date'];
    $time      = $_POST['time'];
    
    
    $sql="SELECT * from AbsentStudent 
    
    where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
        &&
           StudentId = '$studentId'
        &&
           Date = '$date'
           ";
  
            $res = mysqli_query($LMdbConnection,$sql);
            
            if (mysqli_num_rows($res) > 0) 
            {
                $data['success'] = false;  
                $row = mysqli_fetch_assoc($res);
                
                // if($email==$row['Email'])
                // {
                   $data['alertMessage'] = 'You already Marked absent this student today.';
                //}
            }
            else
            {
    
    
        $insertQ = "INSERT INTO AbsentStudent (SchoolId,SchoolFullStackId,StudentName,StudentId,TeacherId,TeacherName,TeacherClass,Date,Time) VALUES ('$schoolId','$schoolFullStackId','$studentName','$studentId','$teacherId','$teacherName','$teacherClass','$date','$time')";
                    
                    $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
                    
                    if($LMloginQuery) 
                    {
                        $data['success'] = true;
                        $data['alertMessage'] = "Successfully market absent.";
                    }
                    else
                    {
                        $data['success']=false;
                		$data['alertMessage'] = 'Something went wrong. Please try again later.';
                    }
            }
    
}











/****** SEND HOMEWORK ******/

if($checkMethod == 'sendHomework')
{
            $schoolId           = $_POST['schoolId'];
            $schoolFullStackId  = $_POST['schoolFullStackId'];
    
            $class      = $_POST['class'];
            $section    = $_POST['section'];
            $title      = $_POST['title'];
            $message    = $_POST['message'];
            $date       = $_POST['date'];
            $time       = $_POST['time'];
            $teacherId       = $_POST['teacherId'];
            $delete     = 'no';
           
    
           
            
            $insertQ = "INSERT INTO Homework (SchoolId,SchoolFullStackId,Class,Section,Title,Message,Date,Time,DeleteHomework,TeacherId) VALUES ('$schoolId','$schoolFullStackId','$class','$section','$title','$message','$date','$time','$delete','$teacherId')";
            
            $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
            
            if($LMloginQuery) 
            {
                $data['success'] = true;
                $data['alertMessage'] = "Homework has been sent Successfully";
            }
            else
            {
                $data['success']=false;
        		$data['alertMessage'] = 'Something went wrong. Please try again later.';
            }
}



/****** LIST OF ALL HOMEWORK ******/

if($checkMethod == 'listOfAllHomework')
{
        $schoolId           = $_POST['schoolId'];
        $schoolFullStackId  = $_POST['schoolFullStackId'];
        
        $class              = $_POST['class'];
        $section            = $_POST['section'];
        
        $profileComplete    = 'no';

        $LMselectLoginQuery = "SELECT * from Homework

        where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
        &&
           Class = '$class'
        &&
           Section = '$section'
        &&
           DeleteHomework = '$profileComplete'
           
           ORDER BY `Homework`.`id` DESC
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
          {
            $data['listOfHomework'][] = $row;
          }
          }
            else
          {
            $data['success']=false;
            $data['alertMessage'] = 'No Student Found. Please click on "+" to add student.';
          }
}





/****** SEND COMPLAINT ******/

if($checkMethod == 'sendComplaint')
{
            $schoolId           = $_POST['schoolId'];
            $schoolFullStackId  = $_POST['schoolFullStackId'];
    
            $class      = $_POST['class'];
            $section    = $_POST['section'];
            $title      = $_POST['title'];
            $message    = $_POST['message'];
            $date       = $_POST['date'];
            $time       = $_POST['time'];
            $teacherId  = $_POST['teacherId'];
            $delete     = 'no';
           
    
           
            
            $insertQ = "INSERT INTO Complaint (SchoolId,SchoolFullStackId,Class,Section,Title,Message,Date,Time,DeleteComplaint,TeacherId) VALUES ('$schoolId','$schoolFullStackId','$class','$section','$title','$message','$date','$time','$delete','$teacherId')";
            
            $LMloginQuery = mysqli_query($LMdbConnection, $insertQ);
            
            if($LMloginQuery) 
            {
                $data['success'] = true;
                $data['alertMessage'] = "Complaint has been sent Successfully";
            }
            else
            {
                $data['success']=false;
        		$data['alertMessage'] = 'Something went wrong. Please try again later.';
            }
}






/****** LIST OF ALL COMPLAINTS ******/

if($checkMethod == 'listOfAllComplaint')
{
        $schoolId           = $_POST['schoolId'];
        $schoolFullStackId  = $_POST['schoolFullStackId'];
        
        $class              = $_POST['class'];
        $section            = $_POST['section'];
        
        $profileComplete    = 'no';

        $LMselectLoginQuery = "SELECT * from Complaint

        where SchoolId  = '$schoolId'
        &&
           SchoolFullStackId = '$schoolFullStackId'
        &&
           Class = '$class'
        &&
           Section = '$section'
        &&
           DeleteComplaint = '$profileComplete'
           
           ORDER BY `Complaint`.`id` DESC
        ";
        
        $LMloginQuery = mysqli_query($LMdbConnection, $LMselectLoginQuery);

        if(mysqli_num_rows($LMloginQuery))
          {
            $data['success'] = true;
        while ($row=mysqli_fetch_assoc($LMloginQuery))
          {
            $data['listOfComplaint'][] = $row;
          }
          }
            else
          {
            $data['success']=false;
            $data['alertMessage'] = 'No complaint found.';
          }
}




 $y = json_encode($data,true);
                    header('Content-Type: application/json;charset=utf-8');
                    echo $y;
?>