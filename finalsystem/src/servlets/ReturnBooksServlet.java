package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

public class ReturnBooksServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		// CALL FUNCTION TO GET DATE FOR DATA INPUT
		Date returnDate = DateGenerator.getCurrentDate();

		DatabaseManager db = null;
		Connection conn = null;
		
		try {
			/* GET JSON STRING FROM REQUEST PARAMETER
			 * --------------------------------------------
			 * 1. Convert JSON String into JSON Array.
			 * 2. Loop the JSON Array to read the each object in it.
			 */
			JSONArray jArray = new JSONArray(request.getParameter("returndata"));

			for(int i = 0; i < jArray.length(); i++) {
				JSONObject record = jArray.getJSONObject(i);
				int memberId = record.getInt("memberid");
				int bookId = record.getInt("bookid");
				double penalty = record.getDouble("penalty");

				/* DATABASE TRANSACTION PROCESSES
				 * ---------------------------------------------------------------------
				 * 1. Call class method() that establish database for this application.
				 * 2. Set Connection with returned database location path.
				 * 3. Check if connection established or not
				 *       YES: Proceed to data transactions.
				 *       NO : Print error in console.
				 * 4. Close the database connection.
				 */
				db = new DatabaseManager();
				conn = db.getConnection();
				
				if(conn != null) {

					/* 1ST SQL STATEMENT TRANSACTION EXECUTION
					 * ------------------------------------
					 * 1. Create SQL Statement from declared SQL statement.
					 * 2. Assign value to match the attribute field in database table.
					 * 3. Execute SQL Statement.
					 */
					String sql = "UPDATE rentals SET returndate = ?, penaltyfee = ?, rentstatus = ? WHERE memberid = ? AND bookid = ? AND rentstatus = ?;";

					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setDate(1, returnDate);
					stmt.setDouble(2, penalty);
					stmt.setString(3, "completed");
					stmt.setInt(4, memberId);
					stmt.setInt(5, bookId);
					stmt.setString(6, "rent");
					stmt.executeUpdate();

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
					stmt.setString(1, "yes");
					stmt.setInt(2, bookId);
					stmt.executeUpdate();

					conn.commit(); // Commit all SQL statement made before last commit into one transaction.
				}
			}
		} catch(JSONException | SQLException error) {
			error.printStackTrace();

		} finally {
			// Close database connection despite the outcome of transactions.
			try {
				conn.close();

			} catch(SQLException error) { error.printStackTrace(); }
		}
	}
}