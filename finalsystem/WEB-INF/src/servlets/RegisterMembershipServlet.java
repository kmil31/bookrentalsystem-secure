package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class RegisterMembershipServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		// GET VALUE FROM FORM INPUT INTO VARIABLES
		String name = Jsoup.clean(request.getParameter("name"), Whitelist.none());
		String phone = Jsoup.clean(request.getParameter("phone"), Whitelist.none());

		/* DATABASE TRANSACTION PROCESSES
		 * ---------------------------------------------------------------------
		 * 1. Call class method() that establish database for this application.
		 * 2. Set Connection with returned database location path.
		 * 3. Check if connection established or not
		 *       YES: Proceed to data transactions.
		 *       NO : Print error in console.
		 * 4. Close the database connection.
		 */

		PrintWriter out = response.getWriter();
		
		if(name != null && !name.isEmpty() && phone != null && !phone.isEmpty()) {
			DatabaseManager db = null;
			Connection conn = null;

			try {
				db = new DatabaseManager();
				conn = db.getConnection();
				
				if(conn != null) {

					/* 1ST SQL STATEMENT TRANSACTION EXECUTION
					* ----------------------------------------------------------------
					* 1. Create SQL Statement from declared SQL statement.
					* 2. Assign value to match the attribute field in database table.
					* 3. Execute SQL Statement.
					*/
					String sql = "INSERT INTO members (membername, phone) VALUES (?, ?)";

					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setString(1, name);
					stmt.setString(2, phone);
					stmt.execute();

					conn.setAutoCommit(false); // Remove connection's commitment of previos SQL Statement.

					/* 2ND SQL STATEMENT TRANSACTION EXECUTION
					* ---------------------------------------------------------------------
					* 1. Create SQL Statement from declared SQL statement.
					* 2. Store returned data set from database by SQL statement execution.
					* 3. Assign data set to specific variable.
					*/
					sql = "SELECT id FROM members WHERE membername = ? AND phone = ?;";
					int id = 0;

					stmt = conn.prepareStatement(sql);
					stmt.setString(1, name);
					stmt.setString(2, phone);
					ResultSet rs = stmt.executeQuery();
					conn.commit(); // Commit all SQL statement made before last commit into one transaction.

					if(rs.next()) {
						id = rs.getInt("id");
					}

					/* SERVLET OUTPUT STREAM TO RETURN VALUE TO THE WEBPAGE
					* -----------------------------------------------------
					* 1. Declare Stream object
					* 2. Clear stream of any element inside the object;
					* 3. Pass stream object back to webpage
					*/
					out.flush();
					out.print(id);
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
		else {
			out.flush();
			out.print("EmptyMember");
		}
	}
}