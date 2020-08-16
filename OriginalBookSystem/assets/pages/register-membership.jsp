<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Register</title>
	
	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>

	<style type="text/css">
		#menu-membership {
			background-color: #fb0;
			font-weight: bold;
			color: #232323;
		}
	</style>
</head>
<body>
	<div class="content">
		<jsp:include page="../includes/side-navbar.html"/>

		<div class="site-space">
			<div class="page head">
				<h1>New Membership Services</h1>
			</div>

			<div class="page">
				<h2>Registration Form</h2>

				<div class="container">
					<form id="member-form" action="" method="post">
						<input type="text" name="name" id="name" placeholder="Enter Name" autocomplete="off" maxlength="50" required>
						<input type="text" name="phone" id="phone" class="numeric" placeholder="Enter Phone Number" autocomplete="off" maxlength="20" required>
						<br>
						<input id="btn-register" type="submit" class="btn" value="Register">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>