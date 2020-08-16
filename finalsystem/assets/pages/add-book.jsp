<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Add Book</title>
	
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
				<h1>Add Archives Service</h1>
			</div>

			<div class="page">
				<h2>Add New Book</h2>

				<div class="container">
					<form id="book-form" action="" method="post">
						<input type="text" name="title" id="title" placeholder="Enter Book Title" autocomplete="off" maxlength="50" required>
						<input type="text" name="author" id="author" placeholder="Enter Book Author" autocomplete="off" maxlength="50" required>
						<br>
						<input type="submit" class="btn" value="Add Book">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>