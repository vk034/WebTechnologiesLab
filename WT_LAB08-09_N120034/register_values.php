<?php
    include "dbconfig.php";

    $firstname=$_POST["fname"];
    $lastname=$_POST["lname"];
    $gender=$_POST["gender"];
    $dob=$_POST["dob"];
    $email=$_POST["email"];
    $phone=$_POST["phone"];
    $address=$_POST["address"];
    $year=$_POST["year"];
    $fav_wt=$_POST["WT"];
    $fav_cn=$_POST["CN"];
    @$fav_cc=$_POST["CC"];
    @$fav_oops=$_POST["OOPs"];
    $user=htmlentities(mysql_real_escape_string($_POST['uname']));
    $passwd=htmlentities(mysql_real_escape_string($_POST['passwd']));
    $secques=$_POST["security"];
    $sqanswer=$_POST["sqanswer"];

    //Upload Profile Picture.

    $name=$_FILES['profile']['name'];
    //echo $name;
    @$temp_name=$_FILES['profile']['tmp_name'];
    $fileext=pathinfo($name,PATHINFO_EXTENSION);
    $ext=strtoupper($fileext);
    //echo $ext;
        if($ext=='PNG' || $ext=='JPG'){
            $location = 'uploads/';
            if(move_uploaded_file($temp_name, $location.$name)){
                //echo 'File uploaded successfully';
                $sql="INSERT INTO student_details (firstname,lastname,gender,dob,email,phone,address,year,fav_wt,fav_cn,fav_cc,fav_oops,username,password,sec_ques,sec_ans,profile)
				values('$firstname','$lastname','$gender','$dob','$email','$phone','$address','$year','$fav_wt','$fav_cn','$fav_cc','$fav_oops','$user','$passwd','$secques','$sqanswer','$name')";
				mysql_query($sql);
            }
        }
        else{
          echo '<script>';
          echo "Unsupported File....!!!";
          echo '</script>';
        }

    echo "<script>window.location='login.php';</script>";
    //echo "Register Successful.";
    //echo "$name";
?>
