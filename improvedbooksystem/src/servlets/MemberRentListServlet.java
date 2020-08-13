package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

public class MemberRentListServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");

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
				 * ----------------------------------------------------------------
				 * 1. Create SQL Statement from declared query.
				 * 2. Assign value to match the attribute field in database table.
				 * 3. Execute SQL Statement.
				 * 4. Check result exist or not.
				 *       YES: Convert result into JSON
				 *       NO: Do nothing
				 * 5. Send JSON response back to webpage
				 */
				String sql = "SELECT r.bookid, b.title, r.rentdate, r.duedate FROM rentals r JOIN books b ON r.bookid = b.id WHERE r.memberid = ? AND r.rentstatus = ?;";
				PreparedStatement stmt = conn.prepareStatement(sql);

				stmt.setInt(1, memberId);
				stmt.setString(2, "rent");

				ResultSet rs = stmt.executeQuery();
				PrintWriter out = response.getWriter();
				
				// Loop Result to be put into JSON Array of object.
				if(rs.next() == true) {
					JSONArray jsonArray = new JSONArray();

					do {
						JSONObject record = new JSONObject();
						record.put("bookid", rs.getInt(1));
						record.put("title", rs.getString(2));
						record.put("rentdate", rs.getDate(3).toString());

						java.util.Date dueDate = rs.getDate(4);
						record.put("duedate", dueDate.toString());
						//record.put("duedate", rs.getDate(4).toString());

						/* LATE RETURN PENALTY
						 * ------------------------------------------
						 * 1. Call function to calculate day amount of overdue.
						 * 2. Calculate penalty fee from overdue day.
						 */
						long overdue = getOverdueDaysAmount(dueDate);
						double penalty = overdue * 0.5;
						record.put("penalty", penalty);
						
						jsonArray.add(record);

					} while(rs.next());

					// Send response to webpage
					out.print(jsonArray);
				}
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

	private static long getOverdueDaysAmount(java.util.Date due) {
		java.util.Date today = new java.util.Date();
		long dayOverDue = 0;
		if(today.after(due)) {
			dayOverDue = (today.getTime() - due.getTime()) / 86400000; //86400000 is number of milliseconds in a day.
		}
	    
	    return Math.abs(dayOverDue);
	}
}