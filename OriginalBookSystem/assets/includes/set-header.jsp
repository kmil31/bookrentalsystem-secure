<%
// Disable back page feature when logout.
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache");

/* DISABLE DIRECT PAGE ACCESSING USING URL
 * ============================================
 * 1. Declare HttpSession by requesting server.
 * 2. Check session for login exist or not.
 *     - YES: direct user back to login page.
 *     - NO: Proceed to view this page.
 */
session=request.getSession(false); // Don't create new if session doesn't exist.

if(session.getAttribute("userRole")==null) {

	response.sendRedirect("../../");
}
%>