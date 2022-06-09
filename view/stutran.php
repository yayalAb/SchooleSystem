<?php
if(!isset($_SERVER['HTTP_REFERER'])){
    // redirect them to your desired location
    header('location:../index.php');
    exit;
}
?>
<?php include_once('head.php'); ?>
<?php include_once('header_student.php'); ?>
<?php include_once('sidebar1.php'); ?>

<style>

body { 

	overflow-y:scroll;
}


.modal-content1 {
	
   position: absolute;
   left: 125px; 
}
@media only screen and (max-width: 500px) {

	.modal-content1 {
   		
		position:static;
   
	}
}

.form-control-feedback {
  
   pointer-events: auto;
  
}

.set-width-tooltip + .tooltip > .tooltip-inner { 
  
     min-width:180px;
}
.set-color-tooltip + .tooltip > .tooltip-inner { 
  
     min-width:180px;
	 background-color:red;
}
.image-error{
	border:1px solid #f44336;
	
}

.image-success{
	border:1px solid #009900;
	
}

.msk-fade {  
      
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s

}

body.modal-open-noscroll1
{
    overflow:hidden;
	
 
}
.box-title{
	text-align:center;
}
/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}
.content{
	margin-left:5%;
}


</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Exam
				<small>Preview</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Exam</a></li>
				<li><a href="#">STUDENT TRANSCRIPT</a></li>
			</ol>
		</section>
		<?php

				include_once('../controller/config.php');
				$index=$_SESSION["index_number"];
				$current_year=date('Y');
				$exam=7;
				$year=2022;
				$stud="SELECT * FROM student where id = $index";
				$fsim="SELECT student_exam.marks, subject.name FROM student_exam INNER JOIN subject ON student_exam.subject_id = subject.id WHERE student_exam.index_number='$index' and student_exam.exam_id=7 and student_exam.grade_id=16";
				//$fsim="SELECT * FROM student_exam where index_number = $index  and exam_id=7";
				  $ssim="SELECT marks FROM student_exam  WHERE index_number='$index' and exam_id=8 and grade_id=16";
				  $result3=mysqli_query($conn,$ssim);
				  $sllind=0;
				  $sums=0;
				  $sec11=array(0,0,0,0,0,0,0,0,0,0,0,0);
				  if(mysqli_num_rows($result3) > 0){
					  while($row=mysqli_fetch_assoc($result3)){
						  $sec11[$sllind]=$row['marks'];
						  $sums+=$row['marks'];
						  $sllind++;
					  }
					}

				  $first12="SELECT marks FROM student_exam  WHERE index_number='$index' and exam_id=7 and grade_id=17";
				  $result4=mysqli_query($conn,$first11);
				  $sllind=0;
				  $sumf12=0;
				  $fir12=array(0,0,0,0,0,0,0,0,0,0,0,0);
				  if(mysqli_num_rows($result4) > 0){
					  while($row=mysqli_fetch_assoc($result4)){
						  $fir12[$sllind]=$row['marks'];
						  $sumf12+=$row['marks'];
						  $sllind++;
					  }
					}

					$sec12="SELECT marks FROM student_exam  WHERE index_number='$index' and exam_id=8 and grade_id=17";
					$result4=mysqli_query($conn,$sec12);
					$sllind=0;
					$sums12=0;
					$sec12=array(0,0,0,0,0,0,0,0,0,0,0,0);
					if(mysqli_num_rows($result4) > 0){
						while($row=mysqli_fetch_assoc($result4)){
							$sec12[$sllind]=$row['marks'];
							$sums12+=$row['marks'];
							$sllind++;
						}
					  }
				
				
				$result=mysqli_query($conn,$stud);
                $sumf=0;
                $sumf=0;
                $count=0;
				if(mysqli_num_rows($result) > 0){
					while($row=mysqli_fetch_assoc($result)){
						  
						?>
		<section class="content">
			<div class="row">
				<!-- left column -->
				<div class="col-md-10">
					<!-- general form elements -->
					<div class="box box-primary">
							<div class="box-header with-border">
							<center><h3 class="box-title">STUDENT TRANSCRIPT</h3></center>
							</div><!-- /.box-header -->
						<div class="box-body">
							<div class="form-group" id="divExam">
							<div>
								<label style="margin-top:5%;">School name : &nbsp;&nbsp; </label> <u><b> YABERUS WOLKITE SCHOOOL</b></u>
								</div>
								<div class="row">
								<div class="col-md-6">
									<label style="margin-top:5%;">Student Full Name : </label> <u><b>&nbsp; <?php echo $row["full_name"]; ?></b></u>
								</div>
								<div class="col-md-3">
									<label style="margin-top:5%;">Age : </label><u><b> &nbsp; 20 </b></u>
								</div>
								<div class="col-md-3">
									<label style="margin-top:3%;">Sex : </label><u><b> &nbsp; <?php echo $row["gender"]; ?></b></u>
								</div>
                                </div>
								<div class="row">
								<div class="col-md-4">
									<label style="margin-top:3%;">Academaic Year : </label> <u><b>&nbsp; <?php echo $row["reg_year"]; ?> </b></u>
								</div>
								<div class="col-md-4">
									<label style="margin-top:3%;">Mobile Phone : </label><u><b> &nbsp; <?php echo $row["phone"]; ?> </b></u>
								</div>
								<div class="col-md-4">
									<label style="margin-top:3%;">Home Phone : </label><u><b> &nbsp; 0915676789 </b></u>
								</div>
								</div>
							  <?php
									}
								}

						?>
	<!-- Main content -->
 
								

								<table class="table table-bordered">
									<thead>
                                        <tr>
                                            <td><td>Grade 11<td></td>
                                            <td><td>Grade 12<td></td>
                                        <tr>
										<tr>
                                            <th> Subject</th>
                                            <th> 1st Semester</th>
                                            <th> 2nd Semester</th>
                                            <th> Average</th>
                                            <th> 1st Semester</th>
                                            <th> 2nd Semester</th>
                                            <th> Average</th>
                                        </tr>
								</thead>
									<tbody>
										<?php
										$result=mysqli_query($conn,$fsim);
										if(mysqli_num_rows($result) > 0){
											while($row=mysqli_fetch_assoc($result)){
                                                $sumf+=$row['marks'];
                                                  $count++;	
										?>
										<tr>
										<td><?php echo $row['name'] ?></td>
										<td><?php echo $row['marks'] ?></td>
										<td><?php echo $sec11[$count-1]?></td>
										<td><?php echo ($row['marks']+ $sec11[$count-1])/2 ?></td>
                                        <td><?php echo $fir12[$count-1]?></td>
										<td><?php echo $sec12[$count-1] ?></td>
										<td><?php echo ($sec12[$count-1]+$fir12[$count-1])/2 ?></td>
										</tr>
										<?php 
											}
										}
										?>
                                        <tr>
                                            <td>Total</td>
                                            <td><?php echo $sumf ?> </td>
                                            <td><?php echo $sums ?> </td>     
                                            <td><?php echo ($sumf+$sums)/2  ?> </td>   
                                            <td><?php echo $sumf12?> </td>
                                            <td><?php echo $sums12 ?> </td>     
                                            <td><?php echo ($sums12+$sumf12)/2 ?> </td>  
                                        </tr>
                                        <tr>
                                            <td>Average</td>
                                            <td><?php echo $sumf/$count ?> </td>   
                                            <td><?php echo $sums/$count ?> </td>   
                                            <td><?php echo (($sumf/$count)+($sums/$count))/2 ?> </td>  
                                            <td><?php echo $sumf12/$count ?> </td>   
                                            <td><?php echo $sums12/$count ?> </td>   
                                            <td><?php echo (($sumf12/$count)+($sums12/$count))/2 ?> </td>  
                                        </tr>
									</tbody>
								</table>
								<center><h4>Director Name......................Signature.......................</h4></center>

								</div>    
							</div><!-- /.box-body -->
						</div><!-- /.box -->
					</div>
				</div>
			</section><!-- End of form section -->
		</div><!-- /.content-wrapper -->  
                             
<?php include_once('footer.php');?>

