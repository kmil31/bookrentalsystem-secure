package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RentBookServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		// GET VALUE FROM FORM INPUT INTO VARIABLES
		int memberId = Integer.parseInt(request.getParameter("memberid").trim());
		int bookId = Integer.parseInt(request.getParameter("bookid").trim());

		// CALL FUNCTION TO GET DATE FOR DATA INPUT
		Date rentDate = DateGenerator.getCurrentDate();
		Date dueDate = DateGenerator.getExpectedReturnDate(rentDate);

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
				 * ------------------------------------
				 * 1. Create SQL Statement from declared SQL statement.
				 * 2. Assign value to match the attribute field in database table.
				 * 3. Execute SQL Statement.
				 */
				String sql = "INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus) VALUES (?, ?, ?, ?, ?);";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, memberId);
				stmt.setInt(2, bookId);
				stmt.setDate(3, rentDate);
				stmt.setDate(4, dueDate);
				stmt.setString(5, "rent");
				stmt.execute();

				conn.setAutoCommit(false); // Disable auto commit of SQL statements for transaction.

				/* 2ND SQL STATEMENT TRANSACTION EXECUTION
				 * ---------------------------------------------
				 * 1. Create SQL Statement from declared SQL statement.
				 * 2. Assign value to match the attribute field in database table.
				 * 3. Commit transaction to transact
				 * 4. Execute SQL Statement.
				 */
				sql = "UPDATE books SET available = ? WHERE id = ?;";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "no");
				stmt.setInt(2, bookId);
				stmt.executeUpdate();

				conn.commit(); // Commit all SQL statement made before last commit into one transaction.
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