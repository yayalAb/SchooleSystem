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
				<li><a href="#">Student Report Card</a></li>
			</ol>
		</section>
		<?php

				include_once('../controller/config.php');
				$index=$_SESSION["index_number"];
				$current_year=date('Y');
				$exam=7;
				$year=2022;
				$stud="SELECT * FROM student where id = $index";

				$fsim="SELECT student_exam.marks, subject.name FROM student_exam INNER JOIN subject ON student_exam.subject_id = subject.id WHERE student_exam.index_number='$index' and student_exam.exam_id=7";
				//$fsim="SELECT * FROM student_exam where index_number = $index  and exam_id=7";
				$ssim="SELECT marks FROM student_exam WHERE index_number='$index' and exam_id=8";
				$rank=" SELECT index_number, sum(marks) as marks FROM student_exam WHERE year=2022 GROUP BY index_number ORDER by sum(marks) DESC";
				$result=mysqli_query($conn,$stud);
                $sumf=0;
                $sums=0;
                $count=0;
				$index1=0;
				$loop=0;
				$second=array(0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
				$result1=mysqli_query($conn,$ssim);
				if(mysqli_num_rows($result1) > 0){
					while($row=mysqli_fetch_assoc($result1)){
						$second[$index1]=$row['marks']; ;
						$index1+=1;
						$sums+=$row['marks'];
				}
			}
			$rankres=mysqli_query($conn,$rank);
			$ran=1;
			if(mysqli_num_rows($rankres) > 0){
				while($row=mysqli_fetch_assoc($rankres)){
					if($row['index_number']!=$index){
						$ran++;
					}
					else{
						break;
					}
			}
		}
				?>

			   <?php			
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
							<center><h3 class="box-title">Student Report Card</h3></center>
							</div><!-- /.box-header -->
						<div class="box-body">
							<div class="form-group" id="divExam">
							<div>
								<label>School name : &nbsp;&nbsp; </label> <u><b> YABERUS WOLKITE SCHOOOL</b></u>
								</div>
								<div class="row">
								<div class="col-md-6">
									<label style="margin-top:5%;">Student Full Name : </label> <u><b>&nbsp; <?php echo $row["full_name"]; ?></b></u>
								</div>
								<div class="col-md-3">
									<label style="margin-top:5%;">Age : </label><u><b> &nbsp; 20 </b></u>
								</div>
								<div class="col-md-3">
									<label style="margin-top:5%;">Sex : </label><u><b> &nbsp; <?php echo $row["gender"]; ?></b></u>
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
										<th> Subject</th>
										<th> 1st Semester</th>
										<th> 2nd Semester</th>
										<th> Average</th>
								</thead>
									<tbody>
										<?php
										$result=mysqli_query($conn,$fsim);
										if(mysqli_num_rows($result) > 0){
											while($row=mysqli_fetch_assoc($result)){
                                                $sumf+=$row['marks'];
                                                  $count++;	
												  $loop++;
										?>
										<tr>
										<td><?php echo $row['name'] ?></td>
										<td><?php echo $row['marks'] ?></td>
										<td><?php echo $second[$loop-1]?></td>
										<td><?php echo ($row['marks']+ $second[$loop-1])/2 ?></td>
										</tr>
										<?php 
											}
										}
										?>
                                        <tr>
                                            <td>Total</td>
                                            <td><?php echo $sumf ?> </td>
                                            <td><?php echo $sums ?> </td>     
                                            <td><?php echo ($sumf+$sums)/2?> </td>   
                                        </tr>
                                        <tr>
                                            <td>Average</td>
                                            <td><?php echo $sumf/$count ?> </td>   
                                            <td><?php echo $sums/$count ?> </td>   
                                            <td><?php echo (($sumf/$count )+($sums/$count))/2 ?> </td>  
                                        </tr>
                                        <tr>
                                            <td>Rank</td>
                                            <td><?php echo $ran  ?> </td>    
                                        </tr>
                                        <tr>
                                            <td>Home.R Teacher Name</td>
                                            <td>................... </td>    
                                            <td>Remark </td>  
                                            <td>promoted </td> 
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

