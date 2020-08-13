<%@ include file="../includes/set-header.jsp" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="servlets.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Record</title>
	
	<!-- Refresh page when session timeout to the specied url -->
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=../../">

	<jsp:include page="../includes/import-files.html"/>
	<style type="text/css">
		#menu-record {
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
				<h1>Rental Record List</h1>
			</div>

			<div class="page record">
				<header>
					<h2>In Rental</h2>
				</header>
				<table>
					<thead>
						<tr>
							<th class="style">Member ID</th>
							<th class="style">Book ID</th>
							<th class="style">Rent Date</th>
							<th class="style">Due Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							try {
								DatabaseManager db = new DatabaseManager();
								Connection conn = db.getConnection();
								if(conn != null) {

									String sql = "SELECT * FROM rentals WHERE rentstatus = 'rent';";

									PreparedStatement stmt = conn.prepareStatement(sql);
									ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										%>
										<td data-label="Member ID"><%=rs.getString("memberid")%></td>
										<td data-label="Book ID"><%=rs.getString("bookid")%></td>
										<td data-label="Rent Date"><%=rs.getString("rentdate")%></td>
										<td data-label="Return Date"><%=rs.getString("duedate")%></td>
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
				<h2>Completed</h2>
				
				<table>
					<thead>
						<tr>
							<th class="style">Member ID</th>
							<th class="style">Book ID</th>
							<th class="style">Rent Date</th>
							<th class="style">Return Date</th>
							<th class="style">Penalty(RM)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							try {
								DatabaseManager db = new DatabaseManager();
								Connection conn = db.getConnection();

								if(conn != null) {

									String sql = "SELECT * FROM rentals WHERE rentstatus = 'completed' ORDER BY returndate DESC;";

									PreparedStatement stmt = conn.prepareStatement(sql);
									ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										%>
										<td data-label="Member ID"><%=rs.getString("memberid")%></td>
										<td data-label="Book ID"><%=rs.getString("bookid")%></td>
										<td data-label="Rent Date"><%=rs.getString("rentdate")%></td>
										<td data-label="Return Date"><%=rs.getString("returndate")%></td>
										<td data-label="Penalty(RM)"><%=String.format("%.2f", rs.getDouble("penaltyfee"))%></td>
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
		</div>
	</div>
</body>
</html>