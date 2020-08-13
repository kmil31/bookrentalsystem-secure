<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Membership</title>

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
		<jsp:include page="../includes/admin-navbar.html"/>

		<div class="site-space">
			<div class="page head">
				<h1>Membership Services</h1>
			</div>

			<div class="page">
				<h2>Select your option</h2>

				<div class="container">
					<button id="opt-registermember" class="btn">Register</button>
					<button id="opt-memberrecord" class="btn">View Member</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>