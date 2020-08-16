<%@ include file="../includes/set-header.jsp" %>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="servlets.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>BRS - Rent Book</title>
	
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
				<h1>Rent Service</h1>
			</div>

			<div class="page">
				<h2>Rent Books Form</h2>

				<div class="container">
					<form id="rent-form" action="" method="post">
						<input type="text" name="memberid" id="memberid" class="numeric" placeholder="Enter Member ID" autocomplete="off" maxlength="3" required>
						<select name="bookid" id="bookid" required>
							<option value="-1" disabled selected>Select Book to Rent</option>
							<%
								/* DATABASE TRANSACTION PROCESSES
								 * ---------------------------------------------------------------------
								 * 1. Call class method() that establish database for this application.
								 * 2. Set Connection with returned database location path.
								 * 3. Check if connection established or not
								 *       YES: Proceed to data transactions.
								 *       NO : Print error in console.
								 * 4. Close the database connection.
								 */
								DatabaseManager db = null;
								Connection conn = null;
								try {
									db = new DatabaseManager();
									conn = db.getConnection();
									if(conn != null) {
										/* 1ST SQL QUERY EXECUTION
										 * ------------------------------------
										 * 1. Create SQL Statement from declared query.
										 * 2. Assign value to match the attribute field in database table.
										 * 3. Execute SQL Statement.
										 */
										String query = "SELECT * FROM books WHERE available = 'yes';";

										Statement stmt = conn.createStatement();
										ResultSet rs = stmt.executeQuery(query);

										while(rs.next()) {
											%>
												<option value="<%=rs.getInt("id")%>"><%=rs.getString("title")%></option>
											<%
										}

										conn.close();
									}

								} catch(SQLException e) {
									e.printStackTrace();

								} finally {
									try {
										conn.close();

									} catch(SQLException e) { e.printStackTrace(); }
								}
							%>
						</select>

						<!-- https://www.daterangepicker.com/ -->
						<label for="rent-date">Rent Date</label>
						<input type="text" name="rent-date" id="rent-date" readonly>
						<label for="expect-returndate">Return Date</label>
						<input type="text" name="expect-returndate" id="expect-returndate" readonly>
						<label for="fee">Rental Fee (RM)</label>
						<input type="text" name="fee" id="fee" readonly>
						<br>
						<input type="submit" class="btn" value="Submit">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>