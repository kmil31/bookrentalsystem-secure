package servlets;

import java.sql.*;
import java.util.*;
import java.time.LocalTime;

public class DateGenerator {

	/* FUNCTION TO MANIPULATE DATE ACCORDING TO CALENDAR COMPATIBILITY
	 * ----------------------------------------------------------------------------
	 * 1. Declare object containing Calendar by current time zone & locale system.
	 * 2. Set time of calendar by date.
	 * 3. Add date to the time set in calendar by specific amount of day(s).
	 * 4. Return SQL Date with calendar time in millisecond(s) for precision.
	 */
	public static java.sql.Date getExpectedReturnDate(java.sql.Date today) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		calendar.add(Calendar.DATE, 2);
		return new java.sql.Date(calendar.getTimeInMillis());
	}

	// FUNCTION TO GENERATE CURRENT DATE (JAVA) & RETURN AS SQL DATE
	public static java.sql.Date getCurrentDate() {
		return new java.sql.Date(new java.util.Date().getTime());
	}
}