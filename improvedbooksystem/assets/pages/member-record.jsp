<%@ include file="../includes/set-header.jsp" %>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="servlets.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Member List</title>
	
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
				<h1>Member Record List</h1>
			</div>

			<div class="page record">
				<h2>In Rental</h2>

				<table>
					<thead>
						<tr>
							<th class="style">ID</th>
							<th class="style">Name</th>
							<th class="style">Phone No</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							try {
								DatabaseManager db = new DatabaseManager();
								Connection conn = db.getConnection();
								if(conn != null) {
									String sql = "SELECT m.id, m.membername, m.phone FROM members m WHERE EXISTS (SELECT r.memberid FROM rentals r WHERE r.memberid = m.id AND rentstatus = 'rent');";

									PreparedStatement stmt = conn.prepareStatement(sql);
									ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										%>
										<td class="id" data-label="ID"><%=rs.getInt("id")%></td>
										<td data-label="Name"><%=rs.getString("membername")%></td>
										<td data-label="Phone No"><%=rs.getString("phone")%></td>
										</tr>
										<%
									}

									conn.close();
								}

							} catch(Exception e) {}
						%>
					</tbody>				
				</table>
			</div>

			<div class="page record">
				<h2>Currently No Rental</h2>

				<table>
					<thead>
						<tr>
							<th>Checkbox</th>
							<th class="style">ID</th>
							<th class="style">Name</th>
							<th class="style">Phone No</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							try {
								DatabaseManager db = new DatabaseManager();
								Connection conn = db.getConnection();
								if(conn != null) {
									String sql = "SELECT m.id, m.membername, m.phone FROM members m WHERE NOT EXISTS (SELECT r.memberid FROM rentals r WHERE r.memberid = m.id AND rentstatus = 'rent');";

									PreparedStatement stmt = conn.prepareStatement(sql);
									ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										%>
										<td><input type="checkbox"></td>
										<td class="id" data-label="ID"><%=rs.getInt("id")%></td>
										<td data-label="Name"><%=rs.getString("membername")%></td>
										<td data-label="Phone No"><%=rs.getString("phone")%></td>
										</tr>
										<%
									}

									conn.close();
								}

							} catch(Exception e) {}
						%>
					</tbody>				
				</table>
				<br>
				<button class="btn" id="member-delete">Delete Selected</button>
			</div>
		</div>
	</div>
</body>
</html>