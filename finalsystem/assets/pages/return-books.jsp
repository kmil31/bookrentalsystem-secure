<%@ include file="../includes/set-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Return Book</title>
	
	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>
	<style type="text/css">
		#menu-rental {
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
				<h1>Return Service</h1>
			</div>

			<div class="page">
				<h2>Return Book</h2>

				<div class="container">
					<input type="text" name="memberid" id="memberid" class="return numeric" placeholder="Member ID" autocomplete="off" maxlength="3" required>
					<button class="btn" id="btn-show-book">Show books</button>
				</div>
			</div>

			<div id="booklist-in-rent" class="page record ondemand">
				<h2>Check Book to Return</h2>
				<form id="return-form" action="" method="POST">
					<table id="rent-table">
						<thead>
							<tr>
								<th class="style">CheckBox</th>
								<th class="style">ID</th>
								<th class="style">Title</th>
								<th class="style">Rent Date</th>
								<th class="style">Due Date</th>
								<th class="style">Penalty(RM)</th>
							</tr>
						</thead>
						<tbody id="table-body">
							
						</tbody>
					</table>

					<div class="container">
						<br>
						<input type="text" name="penaltyfee" id="penaltyfee" placeholder="Penalty Fee" readonly>
						<br>
						<input type="submit" class="btn" value="Return Selected">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>