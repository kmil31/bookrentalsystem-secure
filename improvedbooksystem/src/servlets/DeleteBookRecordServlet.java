package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

public class DeleteBookRecordServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		DatabaseManager db = null;
		Connection conn = null;
		
		try {
			/* GET JSON STRING FROM REQUEST PARAMETER
			 * --------------------------------------------
			 * 1. Convert JSON String into JSON Array.
			 * 2. Loop the JSON Array to read the each object in it.
			 */
			JSONArray jArray = new JSONArray(request.getParameter("bookdata"));

			for(int i = 0; i < jArray.length(); i++) {
				JSONObject record = jArray.getJSONObject(i);
				int bookId = record.getInt("bookid");

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
					String sql = "DELETE FROM books WHERE id = ?;";

					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, bookId);
					stmt.execute();
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