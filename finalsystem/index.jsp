<!DOCTYPE html>
<html>
<head>
	<title>BRS - Login</title>
	<!--Changing the icon in site title-->
	<link rel="shortcut icon" href="assets/img/icon.ico"/>
	
	<!--https://fontawesome.com/icons?d=gallery&m=free-->
	<script type="text/javascript" src="assets/fontawesome-free-5.11.2-web/js/all.min.js" defer></script>
	<!-- Import jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.4.1.js" defer></script>
	<script type="text/javascript" src="assets/js/script.js" defer></script>

	<!-- Import Google font for CSS uses -->
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
	<!--Collection of imported CSS files-->
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">

</head>
<body>
	<div class="content">
		<div class="page-login">
			<div class="container">
				<form id="login-form" action="" method="post">

					<h1>Admin Login</h1>

					<div class="row">
						<span class="label-icon">
							<label for="username"><i class="fas fa-user"></i></label>
						</span>
						<div class="txtbox">
							<input type="text" name="username" id="username" placeholder="Enter Username" autocomplete="off" required>
						</div>
					</div>
					<br>
					<div class="row">
						<span class="label-icon">
							<label for="password"><i class="fas fa-lock"></i></label>
						</span>
						<div class="txtbox">
							<input type="password" name="password" id="password" placeholder="Enter Password" required>
						</div>
					</div>

					<br><br>
					<input id="btn-login" type="submit" class="btn" value="Login">
				</form>
			</div>
		</div>
	</div>
</body>
</html>