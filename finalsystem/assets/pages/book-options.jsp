<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Books</title>

	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>

	<style type="text/css">
		#menu-books {
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
				<h1>Archive Services</h1>
			</div>

			<div class="page">
				<h2>Select your option</h2>

				<div class="container">
					<button id="opt-addbook" class="btn">Add Book</button>
					<button id="opt-archiverecord" class="btn">View Archive</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>