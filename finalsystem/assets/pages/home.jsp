<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Home</title>
	
	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>

	<style type="text/css">
		#menu-home {
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
				<h1>Book Rental System</h1>
			</div>

			<div class="page">
				<h2>Application that provides assist tool for managing book rental store business.</h2>
				<p>This application is developed to cater the needs of rental business with database equipped to hold the business records. In this case, we focused on rental book as an simple demo for running test to show its live implementation.</p>
				<p>It is featured on customer data that requires the customer to register for membership before they can start renting book(s), book data which to be stored in store archive for rental and rental(s) data to manage transaction of business operation.</p>
			</div>

			<div class="page">
				<h2>Developed by Pomba Group</h2>
				<p>See detail of our group in About Us section.</p>
			</div>
		</div>
	</div>
</body>
</html>