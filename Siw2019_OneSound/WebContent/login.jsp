<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Sound</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/noWebkit.css">
</head>

<body>

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);height: 140px;">
        <div class="bradcumbContent">
            
            <h2>Login</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100" >
        <div class="container" >
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content" style="box-shadow: 0 0 20px 5px rgba(0, 0, 0, 0.07);">
                        
                        <!-- Login Form -->
                        <div class="login-form" id="firstDiv">
                        	<h3>Welcome Back</h3>
                            <form action="checkLogin" method="post"  class="login100-form validate-form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" >Email address</label>
                                    <input type="email" class="form-control input100" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter E-mail"> 
                                </div>
                                <div class="form-group">
                                	<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i></span>
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control input100" id="exampleInputPassword1"  name="pass" placeholder="Password">
                                </div>
                                <button type="submit" class="btn oneMusic-btn mt-30">Login</button>
                                <div class="text-center p-t-50" id="infoLabel-50">
									<h5 id='infoEmail' class="label--desc">${Message}</h5>
								</div> 
                                <div class="text-center p-t-35">
									<span class="txt1"> Non sei ancora registrato? </span> <a
										href="registration.jsp" class="txt2"> Registrati </a> <br>
										<span class="txt1"> Password dimenticata? </span> <a id="recovery"
											href="#" class="txt2"> Recupera </a>
								</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->
  
   

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <!-- checkLogin -->
    <script src="js/login.js"></script>
</body>

</html>