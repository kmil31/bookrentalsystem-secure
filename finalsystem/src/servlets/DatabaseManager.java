package servlets;

import java.sql.*;

public class DatabaseManager {
	public Connection getConnection() {
		try {
			/* ESTABLISH DATABASE CONNECTOR FOR THE APPLICATION
			 * ---------------------------------------------------------------------
			 * 1. Load (MySQL) JavaDataBaseConnecter (JDBC) class into ClassLoader.
			 * 2. Set connection path for database used for this application.
			 * 3. Print possible error occur in console.
			 */
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", "1234");
			return conn;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}