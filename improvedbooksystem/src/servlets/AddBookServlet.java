package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddBookServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		// GET VALUE FROM FORM INPUT INTO VARIABLES
		String title = request.getParameter("title").trim();
		String author = request.getParameter("author").trim();

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
				
				/* 1ST SQL STATEMENT TRANSACTION EXECUTION
				 * ----------------------------------------------------------------
				 * 1. Create SQL Statement from declared SQL statement.
				 * 2. Assign value to match the attribute field in database table.
				 * 3. Execute SQL Statement.
				 */
				String sql = "INSERT INTO books (title, author, available) VALUES (?, ?, ?)";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, title);
				stmt.setString(2, author);
				stmt.setString(3, "yes");
				stmt.execute();

				conn.setAutoCommit(false); // Remove connection's commitment of previos SQL Statement.

				/* 2ND SQL STATEMENT TRANSACTION EXECUTION
				 * ---------------------------------------------------------------------
				 * 1. Create SQL Statement from declared SQL statement.
				 * 2. Store returned data set from database by SQL statement execution.
				 * 3. Assign data set to specific variable.
				 */
				sql = "SELECT id FROM books WHERE title = ? AND author = ?;";
				int id = 0;

				stmt = conn.prepareStatement(sql);
				stmt.setString(1, title);
				stmt.setString(2, author);
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
				PrintWriter out = response.getWriter();
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
}