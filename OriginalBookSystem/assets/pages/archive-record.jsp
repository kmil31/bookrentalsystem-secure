<%@ include file="../includes/set-header.jsp" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="servlets.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Book List</title>
	
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
				<h1>Archive Record List</h1>
			</div>

			<div class="page record">
				<h2>Available for Rent</h2>

				<table>
					<thead>
						<tr>
							<th class="style">Checkbox</th>
							<th class="style">ID</th>
							<th class="style">Title</th>
							<th class="style">Author</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							try {
								DatabaseManager db = new DatabaseManager();
								Connection conn = db.getConnection();
								if(conn != null) {
									String sql = "SELECT id, title, author FROM books WHERE available = 'yes';";

									PreparedStatement stmt = conn.prepareStatement(sql);
									ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										%>
										<td><input type="checkbox"></td>
										<td class="id" data-label="ID"><%=rs.getInt("id")%></td>
										<td data-label="Title"><%=rs.getString("title")%></td>
										<td data-label="Available"><%=rs.getString("author")%></td>
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
				<button class="btn" id="book-delete">Delete Selected</button>
			</div>

			<div class="page record">
				<h2>Currently in Rental</h2>

				<table>
					<thead>
						<tr>
							<th class="style">ID</th>
							<th class="style">Title</th>
							<th class="style">Author</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							try {
								DatabaseManager db = new DatabaseManager();
								Connection conn = db.getConnection();
								if(conn != null) {
									String sql = "SELECT id, title, author FROM books WHERE available = 'no';";

									PreparedStatement stmt = conn.prepareStatement(sql);
									ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										%>
										<td data-label="ID"><%=rs.getInt("id")%></td>
										<td data-label="Title"><%=rs.getString("title")%></td>
										<td data-label="Available"><%=rs.getString("author")%></td>
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