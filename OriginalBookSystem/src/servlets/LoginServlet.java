package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.math.BigInteger;
import java.security.*;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		// GET VALUE FROM FORM INPUT INTO VARIABLES
		String username = request.getParameter("username").trim();
		String pswd = request.getParameter("password").trim();

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
			// Convert the given password to hex format to match with encrypted password in database.
			MessageDigest strToHex = MessageDigest.getInstance("SHA-1");
			strToHex.update(pswd.getBytes("UTF-8"));
			String hexPswd = new BigInteger(1 , strToHex.digest()).toString(16);

			// Setup database connection
			db = new DatabaseManager();
			conn = db.getConnection();

			if(conn != null) {

				/* SQL STATEMENT TRANSACTION EXECUTION
				 * ---------------------------------------------------------------------
				 * 1. Create SQL Statement from declared SQL statement.
				 * 2. Store returned data set from database by SQL statement execution.
				 * 3. Assign data set to specific variable.
				 */
				String sql = "SELECT * FROM users WHERE username = ?;";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, username);
				ResultSet rs = stmt.executeQuery();

				if(rs.next()) {
					/* SERVLET OUTPUT STREAM TO RETURN VALUE TO THE WEBPAGE
					 * -----------------------------------------------------
					 * 1. Declare Stream object
					 * 2. Clear stream of any element inside the object;
					 * 3. Pass stream object back to webpage
					 */
					PrintWriter out = response.getWriter();
					out.flush();

					String dbName = rs.getString("username");
					String dbPswd = rs.getString("pswd");

					// Check matching username & password in database
					if(username.equals(dbName) && hexPswd.equals(dbPswd)) {

						String userRole = rs.getString("authority");

						HttpSession session = request.getSession(true); // Create new if session doesn't exist.
						session.setMaxInactiveInterval(60);
						session.setAttribute("userRole", userRole);

						out.print("success");
						//response.sendRedirect("assets/pages/home.jsp");
					}

					else {
						out.print("fail");
						//response.sendRedirect("index.jsp");
					}
				}
			}
		} catch(Exception error) {
			error.printStackTrace();

		} finally {
			// Close database connection despite the outcome of transactions.
			try {
				conn.close();

			} catch(SQLException error) { error.printStackTrace(); }
		}
	}
}