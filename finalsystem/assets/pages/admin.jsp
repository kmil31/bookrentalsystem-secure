<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Administrator</title>
	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>
</head>
<body>
	<div class="content">
		<jsp:include page="../includes/admin-navbar.html"/>

		<div class="site-space">
			<div class="page head">
				<h1>Book Rental System</h1>
			</div>

			<div class="page">
				<h2>Administrator Privilege</h2>
				<p>You are authorized to register new member of staff as user of this BRS application and delete existing members. As this is still in prototype phase, there may be some changes in the future on feature that system administrator is authorized to do.</p>
			</div>
		</div>
	</div>
</body>
</html>