<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - About Us</title>
	
	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>

	<style type="text/css">
		#menu-aboutus {
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
				<h1>About Us</h1>
			</div>

			<div class="page">
				<h2>Pomba Group</h2>
				<p>Established in 2019 for the purpose of completing Group Project of course INFO 3305 Web Application Development. We are students from section 3 of semester 1 2019/2020 supervised by Dr. Najhan Muhamad Ibrahim.</p>
				<p>Current member consist of 3 developers that are also currently ICT students.</p>
			</div>

			<div class="page">
				<h2>Current Member</h2>
				<p>Muhammad Luqmanulhakim bin Sa'ari (1813225)</p>
				<p>Muhammad Amir Izzat bin Mohd Unzir (1811049)</p>
				<p>Ba Jamel Omar Faez Salem (1610367)</p>
			</div>
		</div>
	</div>
</body>
</html>