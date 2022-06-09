<?php
if(!isset($_SERVER['HTTP_REFERER'])){
    // redirect them to your desired location
    header('location:../index.php');
    exit;
}
?>
<?php include_once('head.php'); ?>
<?php include_once('header_parents.php'); ?>
<?php include_once('sidebar3.php'); ?>

<style>
.form-control-feedback {
  
   pointer-events: auto;
  
}

.set-width-tooltip + .tooltip > .tooltip-inner { 
     min-width:180px;
}

.msk-fade {  
      
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.5s;
    animation-name: animatetop;
    animation-duration: 0.5s

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



@media only screen and (max-width: 500px) {
	
	.container{
		
	 	width:100%;
	  	position: static;
		
		
	}
	
	[class*="col-"] {
        width: 100%;
    }
	
	
	
	.panel-body{
		overflow-x:auto !important; 
	}
	
	

}

@media only screen and (max-width: 768px) {
    /* For mobile phones: */
  .container{
		
	 	width:100%;
	  	position: static;
		
		
	}
	
	[class*="col-"] {
        width: 100%;
    }
	
	
	
	.panel-body{
		overflow-x:auto !important; 
	}
	
}

@media only screen and (max-width: 1200px) {
    /* For mobile phones: */
 
	
	.container{
		
	 	width:100%;
	  	position: static;
		
		
	}
	
	[class*="col-"] {
        width: 100%;
    }
	
	
	
	.panel-body{
		overflow-x:auto !important; 
	}
	
	
}




/* #modalINV1 css  */

@media print{

	body{
		
		visibility: hidden;
	
	}

	#modalINV1{
		
	   visibility: visible;
	
	}

	#divPhoto{
		display:none;	
	}

}

#modalINV1 .div-logo {
	float: left;
	height: 130px;
}

#modalINV1 .logo{
	float: left;
	width: 90px;
	height: 90px;
	margin-right: 10px;
	border-radius: 50%;
	text-align: center;
	background-color:#8860a7;
}

#modalINV1 .class-name{
	float: left;		
	margin-top:0;
	padding-top:0;			
}

#modalINV1 h1,#modalINV1 h2,#modalINV1 h3{
	margin-top:0;
	color:#8860a7;

}

#modalINV1 .class-address {
	float: left;
			
}

#modalINV1 .class-email {
	float: right;
	margin-right:15px;
	padding-right:0;
	color:white;
	background-color:#8860a7;
}

#modalINV1 th{			
	background-color:#8860a7;
	color:white;
}
#modalINV1 .std-name{
	color:#8860a7;
	font-size:16px;
}
#modalINV1 #h1{
display:none;	
}

#modalINV1 .pdetail1 {
	padding:0;
	float:right;
	margin-right:7px; 
	
}

#modalINV1 .pdetail2 {
	float: right;
	
}

@media print{

#modalINV1 .logo{
		background-color:#8860a7 !important;	
	}

#modalINV1 h1,#modalINV1 h2,#modalINV1 h3,#modalINV1 .std-name{
		color:#8860a7 !important;	
	}
	
	
#modalINV1 .table-bordered th{
			
		color:white!important;
		background-color:#8860a7 !important;		
				
	}
#modalINV1 .class-email {
		color:white!important;
		background-color:#8860a7 !important;
		
} 
	
#modalINV1 .panel{
		border:hidden!important;
}
#modalINV1 #btn1,#modalINV1 .panel-footer ,#modalINV1 .msk-heading {
		display:none;
			
}
	
#modalINV1 #h1{
		display:inline;	
}

#modalINV1 .close{
		display:none;	
}
	
@-moz-document url-prefix() {
		
	.panel{
		
		margin:0;
		padding:0;
	}
	#modalINV1{
		
		margin:0!important;
		padding:0!important;
		position:absolute;
		left:-150px;
	}
	@page{
		margin:0;
		padding:0;	
	}

}

</style>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
    	<h1>
        	Comments
        	<small>Preview</small>
        </h1>
        <ol class="breadcrumb">
        	<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Comments</a></li>
    	</ol>
	</section>
    
	<!-- table for view all records -->
	<section class="content" > <!-- Start of table section -->
    	<div class="row" id="table1"><!--MSK-000132-1-->
        	<div class="col-md-10">
            	<div class="box">
                	<div class="box-header">
<?php
include_once('../controller/config.php');
$index=$_SESSION["index_number"];

$sql1="SELECT * FROM parents WHERE index_number='$index'";
$result1=mysqli_query($conn,$sql1);
$row1=mysqli_fetch_assoc($result1);
$my_son_index=$row1['my_son_index'];

$sql="select * from comment where sender='tes@gmail.com'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$name=$row['i_name'];
?>                    
                <h3 class="box-title">Comments</h3>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <!-- MSK-00093-->
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <th class="col-md-1">Reciver</th>
                        <th class="col-md-1">Text</th>
                    </thead>
                    <tbody>
                <?php
                include_once('../controller/config.php');

                $sql="select * from comment where sender='tes@gmail.com'";
                $result=mysqli_query($conn,$sql);
                $count = 0;
                if(mysqli_num_rows($result) > 0) {
                    while($row=mysqli_fetch_assoc($result)){
                        $count++;
                        
                ?>   
                        <tr>
                                <td>mm</td>
								<td>bb</td>
                                <td><button class="btn-success" > edit</button> </td>
                                <td><button class="btn-danger" > delete</button> </td>
                                <!--MSK-00102-->                                                
                            </td>
                        </tr>
                        <?php } }    ?>
                    </tbody>
                </table>
            </div><!-- ./box-body -->
        </div><!-- ./box -->
    </div> 
</div>
     </section>   
      


</div><!-- /.content-wrapper -->  
              
<?php include_once('footer.php');?>