package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CheckCurrentRentCountServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// SET RESPOND TYPE BY THIS SERVER AS JSON OBJECT
		response.setContentType("text/html");

		// GET VALUE FROM FORM INPUT INTO VARIABLES
		int memberId = Integer.parseInt(request.getParameter("memberid").trim());

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

				/* SQL STATEMENT TRANSACTION EXECUTION
				 * ---------------------------------------------------------------------
				 * 1. Create SQL Statement from declared SQL statement.
				 * 2. Assign value to match the attribute field in table attributes.
				 * 3. Store returned data set from database by SQL statement execution.
				 * 4. Assign data set to specific variable.
				 */
				String sql = "SELECT COUNT(*) AS count FROM rentals WHERE memberid = ? AND rentstatus = 'rent';";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, memberId);
				ResultSet rs = stmt.executeQuery();
				int count = 0;

				if(rs.next()) {
					count = rs.getInt("count");
				}

				/* SERVLET OUTPUT STREAM TO RETURN VALUE TO THE WEBPAGE
				 * -----------------------------------------------------
				 * 1. Declare Stream object
				 * 2. Clear stream of any element inside the object;
				 * 3. Pass stream object back to webpage
				 */
				PrintWriter out = response.getWriter();
				out.flush();
				out.print(count);
			}

		} catch(SQLException error) {
			error.printStackTrace();

		} finally {
			// Close database connection despite the outcome of transactions.
			try {
				conn.close();

			} catch(SQLException error) { error.printStackTrace(); }
		}
	}
}