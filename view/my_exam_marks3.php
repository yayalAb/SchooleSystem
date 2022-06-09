<?php
if(!isset($_SERVER['HTTP_REFERER'])){
    // redirect them to your desired location
    header('location:../index.php');
    exit;
}
?>
<div class="col-md-12">
	<div class="box">
    	<div class="box-header">
<?php
error_reporting(0);
include_once('../controller/config.php');

$exam=$_GET['exam'];
$year=$_GET['year'];
	
$sql="SELECT * FROM exam WHERE id='$exam'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$name=$row['name'];

?>          
        	<center><h2 class="box-title"><?php echo $year; ?> - <?php echo $name; ?> Exam</h2></center>
        </div><!-- /.box-header -->
        <div class="box-body table-responsive">
             <div class="row">
        		<div class=" col-md-5">
                       <h4 class="box-title">Exam Marks </h4><br>  
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <th width="1">ID</th>
                            <th width="120">Subject</th>
                            <th width="100">Marks</th>
                            <th width="100">Grade</th>
                            
                        </thead>
                        <tbody>
<?php
include_once('../controller/config.php');
$index=$_GET['index'];
$exam=$_GET['exam'];
$year=$_GET['year'];
        
$prefix="";
$prefix1="";
$subject='';
$marks='';
$mark_range='';
$mark_grade='';
        
$sql1="SELECT * FROM student_grade WHERE index_number='$index' and year='$year'";
$result1=mysqli_query($conn,$sql1);
$row1=mysqli_fetch_assoc($result1);
$id=$row1['grade_id'];
		
$sql="select subject.name as s_name,student_exam.marks as se_marks 
      from student_exam 
      inner join subject
      on student_exam.subject_id=subject.id
      where student_exam.index_number='$index' and student_exam.exam_id='$exam' and student_exam.year='$year'";
                  
$result=mysqli_query($conn,$sql);
$count=0;
if(mysqli_num_rows($result) > 0){
	while($row=mysqli_fetch_assoc($result)){
		$count++;
				 
$subject.=$prefix.'"'. $row['s_name'].'"';
$prefix=',';

$marks.=$prefix1.'"'.$row['se_marks'].'"'; 
$prefix1=',';

$marks1=$row['se_marks'];
                
$sql2="SELECT * FROM exam_range_grade WHERE grade_id='$id' and '$marks1' > _from and '$marks1' <= _to ";
				
$result2=mysqli_query($conn,$sql2);
$row2=mysqli_fetch_assoc($result2);
$mark_grade=$row2['mark_grade'];

if($row['se_marks']=="Absent"){
	$mark_grade="Absent";
}
				
?>  <tr><td><?php echo $count; ?></td>
 <form name="signup" action="sqlreport.php" onSubmit="return validation_for_signup()" method="post"><table align="center" bg background="../image/gold.jpg"bordercolor="#333333" border="0" ><tr ><td>
  <p align="left">   <h2 ><strong><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Report Card</b></strong></h2>
  <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </label>
  <label></label>
</p>
<p>&nbsp;&nbsp;&nbsp;School Name&nbsp;
  <input type="text" name="schname"size="12" value="Yaberus wolkite School"/>
  &nbsp;&nbsp;&nbsp;&nbsp;Student ID
  <input type="text" name="id"size="14"value="<?php echo $row['id']; ?>" >
</p>
<td>

<p> Student Full name
  &nbsp;
  <input name="full_name" type="text" value="<?php echo $row['full_name']; ?>" onblur=MM_validateForm('schname','','RinRange1:100');return document.MM_returnValue" />
 

  <input type="text" name="age" id ="age" value="<?php echo $row['age']; ?>"  >
  <span style="font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#FF0000; font-weight:bold;" id="errmsg"></span><span class="style2"></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sex&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
  &nbsp;
  <select name="sex" >
    <option>male</option>
    <option>female</option>
  </select>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone No_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="mphone" type="text" size="18" id="mphone" value="0910386937" > <span style="font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#FF0000; font-weight:bold;" id="errmsg1"></span><span class="style2"></span>
  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home Phone No_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
  <input name="hphone" type="text" size="18" id="hphone"value="0331231428" ><span style="font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#FF0000; font-weight:bold;" id="errmsg2"></span><span class="style2"></span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Grade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="grade" value="<?php echo $row['grade']; ?>">
   
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Promoted To&nbsp;&nbsp;&nbsp;&nbsp;
  <select name="promoted" >
  <option>11</option>
  <option>12</option>
</select>
Academic Year&nbsp;
<select name="ayear" >
  <option>2006</option>
  <option>2007</option>
  <option>2008</option>
   <option>2009</option>
    <option>2010</option>
     <option>2011</option>
      <option>2012</option>
      <option>2013</option>
      <option>2014</option>
      <option class="selected">2015</option>
      <option>2016</option>
      <option>2017</option>
      <option>2018</option>
      <option>2019</option>
      <option>2020</option>
</select>
</p>
<h4>&nbsp;&nbsp; &nbsp;Subjects&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 
  &nbsp;&nbsp;First Semester &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Second Semester&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Average</h4>

<p> Amharic&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" name="amharic1" id="amharic1" value="<?php echo $row['se_marks']; ?>" />
  <input type="text" id="amharic2"name="amharic2" value="<?php echo $row['amharic2']; ?>" />
  <input type="text" name="amharic3" id="amharic3" />
</p>
<p> English
  &nbsp;&nbsp;
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="english1"name="english1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="english2"name="english2" value="<?php echo $row['english2']; ?>">
  <input type="text" id="english3"name="english3" />
</p>
<p> Mathimatics&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="maths1"name="maths1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="maths2"name="maths2" value="<?php echo $row['maths2']; ?>">
  <input type="text" id="maths3"name="maths3">
</p>
<p> Physics&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="physics1"name="physics1"value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="physics2"name="physics2"value="<?php echo $row['physics2']; ?>">
  <input type="text"id="physics3" name="physics3">
</p>
<p> Biology     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="biology1"name="biology1" value="<?php echo $row['se_marks']; ?>">
  <input type="text"id="biology2" name="biology2" value="<?php echo $row['biology2']; ?>">
  <input type="text"id="biology3" name="biology3" />
</p>
<p>Chemistry
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text"id="chemistry1" name="chemistry1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="chemistry2"name="chemistry2" value="<?php echo $row['chemistry2']; ?>">
  <input type="text" id="chemistry3"name="chemistry3" />
</p>
<p> Geography&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="geography1"name="geography1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="geography2"name="geography2" value="<?php echo $row['geography2']; ?>">
  <input type="text"  id="geography3"name="geography3">
</p>
<p> Economics     &nbsp;&nbsp;&nbsp;
  &nbsp; &nbsp;
  <input type="text" name="economics1"id="economics1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" name="economics2" id="economics2"  value="<?php echo $row['economics2']; ?>">
  <input type="text" id="economics3" name="economics3" />
</p>
<p> Bussines     &nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" name="bussines1"id="bussines1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" name="bussines2" id="bussines2" value="<?php echo $row['bussines2']; ?>">
  <input type="text" id="bussines3" name="bussines3" />
</p>
<p> History&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text"id="history1" name="history1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="history2" name="history2" value="<?php echo $row['history2']; ?>">
  <input type="text" id="history3"name="history3" />
</p>
<p> Civics
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="civics1"name="civics1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="civics2"name="civics2"  value="<?php echo $row['civics2']; ?>">
  <input type="text" id="civics3"name="civics3">
</p>
<p>HPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="hpe1"name="hpe1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="hpe2"name="hpe2" value="<?php echo $row['hpe2']; ?>">
  <input type="text" id="hpe3"name="hpe3">
</p>
<p>IT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" id="it1"name="it1" value="<?php echo $row['se_marks']; ?>">
  <input type="text" id="it2"name="it2" value="<?php echo $row['it2']; ?>">
  <input type="text"id="it3" name="it3"/>
</p>
<p>Total
  <input type="button" name="Sumbit22" value="totalhere" onclick="javascript:total()">
  <input type="text" id="total1"name="total1">
    <input type="text"id="total2" name="total2" >
    <input type="text"  id="total3" name="total3" >
</p>
<p> Avarage
  <input type="button" name="Sumbit2" value="avg" onclick="javascript:tavg()">
&nbsp;
<input type="text" id="avarage1"name="avarage1">
    <input type="text" id="avarage2"name="avarage2">
    <input type="text"id="avarage3" name="avarage3">
</p>
<p>Rank&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="rank1">
    <input type="text" name="rank2">
    <input type="text" name="rank3" />
</p>
<p> Conduct
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" name="con1" >
      <input type="text" name="con2">
      <input type="text" name="con3" >
</p>
<p>Home Room Teacher Name :
  <input type="text" name="tname"placeholder="Home rome teacher name">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Remark :
  <select name="remark">     
    <option>promoted</option>   
    <option>Failed</option>
  </select><?php }?>
      <?php }?>
  <input type="submit" name="Submit" value="Sumbit">
  <label><br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
  <label></label>
  <label>
  <input type="button" name="Sumbit" value="avarage" onclick="javascript:avarage()"/>
  </label>
&nbsp; &nbsp;

&nbsp;  &nbsp;
<label>
<input name="   reset" type="reset" id="        reset" value="            clear    " />
</label>
&nbsp;&nbsp; </p>
<p><center>
</center>&nbsp; </p>
</form>

                               
            </tr>
          </tbody>
            </table>	
                </div>
        		
        	</div>
     	</div><!-- /.box-body -->           
	</div><!-- /.box-->
</div> 