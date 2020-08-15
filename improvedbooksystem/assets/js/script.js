/* WEBSITE NAVIGATION MENUS & BUTTONS
 * --------------------------------------------------------------------------------------------
 * 1. Declare object variable containing HTML elements.
 * 2. Check the element exist in the current loaded page content or not to assign click event.
 * 3. Function to redirect to another webpages by URL.
 */
var menuHome = document.getElementById("menu-home");
var menuAdmin = document.getElementById("menu-admin");
var menuRental = document.getElementById("menu-rental");
var optRent = document.getElementById("opt-rent");
var optReturn = document.getElementById("opt-return");
var menuBooks = document.getElementById("menu-books");
var optAddBook = document.getElementById("opt-addbook");
var optArchiveRecord = document.getElementById("opt-archiverecord");
var menuRegisterMembership = document.getElementById("menu-membership");
var optRegisterMember = document.getElementById("opt-registermember");
var optMemberRecord = document.getElementById("opt-memberrecord");
var menuRecord = document.getElementById("menu-record");
var menuAboutUs = document.getElementById("menu-aboutus");
var menuLogout = document.getElementById("menu-logout");

if(menuHome) { menuHome.addEventListener("click", gotoHome); }
if(menuAdmin) { menuAdmin.addEventListener("click", gotoAdmin); }
if(menuRental) { menuRental.addEventListener("click", gotoRental); }
if(optRent) { optRent.addEventListener("click", gotoRent); }
if(optReturn) { optReturn.addEventListener("click", gotoReturn); }
if(menuBooks) { menuBooks.addEventListener("click", gotoBooks); }
if(optAddBook) { optAddBook.addEventListener("click", gotoAddBook); }
if(optArchiveRecord) { optArchiveRecord.addEventListener("click", gotoArchiveRecord); }
if(menuRegisterMembership) { menuRegisterMembership.addEventListener("click", gotoMembership); }
if(optRegisterMember) { optRegisterMember.addEventListener("click", gotoRegisterMembership); }
if(optMemberRecord) { optMemberRecord.addEventListener("click", gotoMemberRecord); }
if(menuRecord) { menuRecord.addEventListener("click", gotoRecord); }
if(menuAboutUs) { menuAboutUs.addEventListener("click", gotoAboutUs); }
if(menuLogout) { menuLogout.addEventListener("click", gotoLogout); }

function gotoHome() { window.location.href = "home.jsp"; }
function gotoAdmin() { window.location.href = "admin.jsp"; }
function gotoRental() { window.location.href = "rental-options.jsp"; }
function gotoRent() { window.location.href = "rent-books.jsp"; }
function gotoReturn() { window.location.href = "return-books.jsp"; }
function gotoBooks() { window.location.href = "book-options.jsp"; }
function gotoAddBook() { window.location.href = "add-book.jsp"; }
function gotoArchiveRecord() { window.location.href = "archive-record.jsp"; }
function gotoMembership() { window.location.href = "membership-options.jsp"; }
function gotoRegisterMembership() { window.location.href = "register-membership.jsp"; }
function gotoMemberRecord() { window.location.href = "member-record.jsp"; }
function gotoRecord() { window.location.href = "rental-record.jsp"; }
function gotoAboutUs() { window.location.href = "about-us.jsp"; }
function gotoLogout() { window.location.href = "logout.jsp"; }

/* AUTO-GENERATE TEXTBOX FOR STATIC VALUE
 * ----------------------------------------------------------------------------------------
 * 1. Declare object variable containing current date & HTML elements.
 * 2. Check the element exist in the current loaded page content or not to call functions.
 * 3. Function to generate value automatically.
 */
var currentDate = new Date();
var txtRentDate = document.getElementById("rent-date");
var txtExpectedDate = document.getElementById("expect-returndate");
var txtFee = document.getElementById("fee");

if(txtRentDate) { getCurrentDate(txtRentDate); }
if(txtExpectedDate) { getExpectedDate(txtExpectedDate); }
if(txtFee) { txtFee.value = 4; }

function getCurrentDate(txtbox) {
	var day = currentDate.getDate();
	var month = currentDate.getMonth() + 1;
	var year = currentDate.getFullYear();
	var datestring = day + "/" + month + "/" + year;
	txtbox.value = datestring;
}

function getExpectedDate(txtbox) {
	var expectedDate = new Date(currentDate);
	expectedDate.setDate(expectedDate.getDate() + 2)
	var day = expectedDate.getDate();
	var month = expectedDate.getMonth() + 1;
	var year = expectedDate.getFullYear();
	var datestring = day + "/" + month + "/" + year;
	txtbox.value = datestring;
}

function selectAll(chkbox){
    var checkboxes = document.getElementsByTagName('input');
     if (chkbox.checked) {
         for (var i = 0; i < checkboxes.length; i++) {
             if (checkboxes[i].type == 'checkbox') {
                 checkboxes[i].checked = true;
             }
         }
     } else {
         for (var i = 0; i < checkboxes.length; i++) {
             console.log(i)
             if (checkboxes[i].type == 'checkbox') {
                 checkboxes[i].checked = false;
             }
         }
     } 
}

// Function to limit input only to numeric value
$(document).on("input", ".numeric", function() {
	this.value = this.value.replace(/\D/g,'');
});

$(document).ready(function() {

	/* LOGIN
	 * ------------------------------------------------------------
	 * 1. Get username & password from textboxes.
	 * 2. Post AJAX request to check matching record in database.
	 * 3. Display appropriate message for success/failure request.
	 */
	$("#login-form").on("submit", function(event) {
		event.preventDefault();

		var username = $("#username").val();
		var password = $("#password").val();

		$.ajax({
			type : "post",
			url : "LoginServlet",
			data : {
				username : username,
				password : password
			},
			success : function(data) {;
				if(data === "admin") {
					$(location).attr("href", "assets/pages/admin.jsp");
				}

				else if (data === "staff") {
					$(location).attr("href", "assets/pages/home.jsp");
				}

				else {
					alert("Invalid username or password!");
				}
			},
			error : function() {
				alert("Login failed due to database issue.");
			}
		})
	})

	/* REGISTER CUSTOMER MEMBERSHIP
	 * ------------------------------------------------------------
	 * 1. Get member info from textboxes.
	 * 2. Post AJAX request to register member into database.
	 * 3. Display appropriate message for success/failure request.
	 * 4. redirect user to specific page.
	 */
	$("#member-form").on("submit", function(event) {
		event.preventDefault(); // Stop default action of element (refresh page)

		var name = $("#name").val();
		var phone = $("#phone").val();
		if (((name.match(/[^0-9a-zA-Z\s]/g)||[]).length)===0) {
		$.ajax({
			type : $(this).attr("method"), // post request
			url : "../../RegisterMembershipServlet",
			data : {
				name : name,
				phone : phone
			},
			success : function(data, textStatus) {
				if (data === "EmptyMember"){
					alert("Input is not valid");
				}
				else{
					alert("New member successfully registered with ID = " + data);
				}
			},
			error : function(textStatus) {
				alert("Registration failed due to database issue.");
			},
			complete : function() {
				$(location).attr("href", "membership-options.jsp");
			}
		})
		}
		else{
			alert("Oops we have detected an unwanted character!");
		}
	})

	/* DELETE MEMBERSHIP RECORD
	 * -------------------------------------------------------
	 * 1. Create JSON array out of member ID from checked member.
	 * 2. Post request.
	 */
	$("#member-delete").click(function() {

		/* CREATE JSON FOR MEMBER DATA
		 * ------------------------------------------------
		 * 1. Create empty array.
		 * 2. Loop table entire for checking selected row.
		 * 3. Get data from selected row.
		 */
		var memberdata = [];

		$("table input[type='checkbox']:checked").each(function() {
			// Get required value from row.
			var row = $(this).closest("tr");
			var memberid = row.find("td.id").text();

			// Create object with multiple properties.
			var item = {};
			item["memberid"] = parseInt(memberid);

			// Insert the object into array.
			memberdata.push(item);
		})

		/* Check if there is selected return data.
		 *    YES : Post AJAX request the  created JSON into server.
		 *    NO  : Display alert message.
		 */
		if(memberdata && memberdata.length > 0) {
			if(confirm("Are you sure to delete selected member(s)?")) {
				$.ajax({
					type : "post",
					url : "../../DeleteMemberRecordServlet",
					//contentType : "application/json",
					data : {memberdata : JSON.stringify(memberdata)}, // Must convert to JSON String
					//dataType : "json",
					success : function() {
						alert("Delete member(s) process succeed.");
					},
					error : function() {
						alert("Delete member(s) process failed due to database issue.");
					},
					complete : function() {
						$(location).attr("href", "membership-options.jsp");
					}
				})
			}
		}
		
		else {
			alert("Please select at least one member to delete.");
		}
	})

	/* ADD BOOK TO ARCHIVE
	 * ------------------------------------------------------------
	 * 1. Get book info from textbox.
	 * 2. Post AJAX request to add book into database.
	 * 3. Display appropriate message for success/failure request.
	 * 4. redirect user to specific page.
	 */
	$("#book-form").on("submit", function(event) {
		event.preventDefault(); // Stop default action of element (refresh page)

		var title = $("#title").val();
		var author = $("#author").val();
		
		if( ((title.match(/[^0-9a-zA-Z\s]/g)||[]).length)===0 
		&& ((author.match(/[^0-9a-zA-Z\s]/g)||[]).length)===0 	){
		$.ajax({
			type : $(this).attr("method"), // post request
			url : "../../AddBookServlet",
			data : {
				title : title,
				author : author
			},
			success : function(data, textStatus) {
				if (data === "Empty"){
					alert("Input is not valid");
				}
				else{
					alert("New book successfully added with ID = " + data);
				}
			},
			error : function(textStatus) {
				alert("Add book failed due to database issue.");
			},
			complete : function() {
				$(location).attr("href", "book-options.jsp");
			}
		})
		}
		else {
			alert("Oops we have detected an unwanted character!");
		}
	
	})

	/* DELETE ARCHIVE RECORD
	 * -------------------------------------------------------
	 * 1. Create JSON array out of book ID from checked book.
	 * 2. Post request.
	 */
	$("#book-delete").click(function() {

		/* CREATE JSON FOR BOOK DATA
		 * ------------------------------------------------
		 * 1. Create empty array.
		 * 2. Loop table entire for checking selected row.
		 * 3. Get data from selected row.
		 */
		var bookdata = [];

		$("table input[type='checkbox']:checked").each(function() {
			// Get required value from row.
			var row = $(this).closest("tr");
			var bookid = row.find("td.id").text();

			// Create object with multiple properties.
			var item = {};
			item["bookid"] = parseInt(bookid)

			// Insert the object into array.
			bookdata.push(item);
		})

		/* Check if there is selected return data.
		 *    YES : Post AJAX request the created JSON into server.
		 *    NO  : Display alert message.
		 */
		if(bookdata && bookdata.length > 0) {
			if(confirm("Are you sure to delete selected book(s)?")) {
				$.ajax({
					type : "post",
					url : "../../DeleteBookRecordServlet",
					data : {bookdata : JSON.stringify(bookdata)}, // Must convert to JSON String
					success : function() {
						alert("Delete book(s) process succeed.");
					},
					error : function() {
						alert("Delete book(s) process failed due to database issue.");
					},
					complete : function() {
						$(location).attr("href", "book-options.jsp");
					}
				})
			}
		}
		
		else {
			alert("Please select at least one book to delete.");
		}
	})

	/* VERIFY MEMBERSHIP ID
	 * -------------------------------------------------------------
	 * 1. Get member id from textboxes.
	 * 2. Post AJAX request to check existing record in database.
	 *       YES : Post AJAX request to get current rent count.
	 *       NO  : Display appropriate message for no match result.
	 */
	$("#rent-form #memberid").focusout(function() {

		var id = $("#memberid").val();

		$.ajax({
			type : "post",
			url : "../../CheckMemberIdIfExistServlet",
			data : {memberid:id},
			success : function(data) {
				if(data == 1) {
					$.ajax({
						type : "post",
						url : "../../CheckCurrentRentCountServlet",
						data : {memberid:id},
						success : function(data) {
							if(data >= 5) {
								alert("The member already reach renting limit of " + data + " books at once.");
								$(location).attr("href", "rental-options.jsp");
							}
						}
					})
				}

				else {
					alert("Specified member does not exist.");
					$("#memberid").val("");
				}
			}
		})
	})

	/* RENT BOOK
	 * ------------------------------------------------------------
	 * 1. Get rental info from textboxes.
	 * 2. Post AJAX request to record rental into database.
	 * 3. Display appropriate message for success/failure request.
	 * 4. redirect user to specific page.
	 */
	$("#rent-form").on("submit", function(event) {
		event.preventDefault(); // Stop default action of element (refresh page)

		var memberid = $("#memberid").val();
		var bookid = $("#bookid").val();

		$.ajax({
			type : $(this).attr("method"),
			url : "../../RentBookServlet",
			data : {
				memberid : memberid,
				bookid : bookid
			},
			success : function(textStatus) {
				alert("Rent Book successfully processed.");
			},
			error : function(textStatus) {
				alert("Rent book failed due to database issue.");
			},
			complete : function() {
				$(location).attr("href", "rental-options.jsp");
			}
		})
	})

	//------------------------------------------------------------------------------

	// Empty textbox & Hide rent table when focused.
	$("#memberid.return").focus(function() {
		$("#booklist-in-rent").css("display", "none");
		$("#memberid").val("");
	})

	/* VERIFY MEMBERSHIP ID WHEN OUT FOCUS
	 * -------------------------------------------------------------
	 * 1. Get member id from textboxes.
	 * 2. Post AJAX request to check existing record in database.
	 *       NO  : Display appropriate message for no match result.
	 */
	$("#memberid.return").focusout(function() {
		var id = $("#memberid").val();

		$.ajax({
			type : "post",
			url : "../../CheckMemberIdIfExistServlet",
			data : {memberid:id},
			success : function(data) {
				if(data != 1) {
					alert("Specified member does not exist.");
					$("#memberid").val("");
				}
			}
		})
	})

	/* VIEW BOOK LIST IN RENTAL BY SPECIFIC MEMBER
	 * ---------------------------------------------
	 * 1. Get Member ID from textbox.
	 * 2. Post request to find books in rental by specific member.
	 * 3. View the booklist into table.
	 * 4. View total penalty fee of selected book to return.
	 */
	$("#btn-show-book").click(function() {

		var memberid = $("#memberid").val();

		$.ajax({
			type : "post",
			url : "../../MemberRentListServlet",
			data : {memberid:memberid},
			dataType : "json",
			success : function(data, textStatus) {
				if(isEmpty(data)) {
					alert("No book currently rented by the specified member.");
				}

				else {
					// View books in rental in table
					$("#booklist-in-rent").css("display", "block");
					$("#table-body").empty();
					var rentedbook = "";
					$.each(data, function(key, value) {
						rentedbook += "<tr>";
						rentedbook += "<td><input type='checkbox'></td>";
						rentedbook += "<td class='id'>"+value.bookid+"</td>";
						rentedbook += "<td>"+value.title+"</td>";
						rentedbook += "<td>"+value.rentdate+"</td>";
						rentedbook += "<td>"+value.duedate+"</td>";
						rentedbook += "<td class='penalty'>"+value.penalty+"</td>";
						rentedbook += "</tr>";
					})
					
					$("#rent-table").append(rentedbook);

					var totalfee = 0;

					// Add/Subtract penalty fee checkbox selection
					$("input[type='checkbox']").change(function() {
						
						if($(this).prop("checked") == true) {
							var fee = parseFloat($(this).closest("tr").find("td.penalty").text());
							totalfee += fee;
							displayPenalty(totalfee);
						}

						else {
							var fee = parseFloat($(this).closest("tr").find("td.penalty").text());
							totalfee -= fee;
							displayPenalty(totalfee);
						}
					})
				}
			}
		})
	})

	/* RETURN BOOK
	 * ------------------------------------------------------------
	 * 1. Get member ID from textboxes.
	 * 2. Make list of book to return.
	 * 2. Post request to record rental completion in database.
	 * 3. Display appropriate message for success/failure request.
	 * 4. redirect user to specific page.
	 */
	$("#return-form").on("submit", function(event) {
		event.preventDefault(); // Stop default action of element (form submission)

		// Get Member ID from textbox.
		var memberid = $("#memberid.return").val();

		/* CREATE JSON FOR RETURN DATA
		 * ------------------------------------------------
		 * 1. Create empty array.
		 * 2. Loop table entire for checking selected row.
		 * 3. Get data from selected row.
		 */
		var returndata = [];

		$("#rent-table input[type='checkbox']:checked").each(function() {
			// Get required value from row.
			var row = $(this).closest("tr");
			var bookid = row.find("td.id").text();
			var fee = row.find("td.penalty").text();

			// Create object with multiple properties.
			var item = {};
			item["memberid"] = parseInt(memberid)
			item["bookid"] = parseInt(bookid);
			item["penalty"] = parseFloat(fee);

			// Insert the object into array.
			returndata.push(item);
		})

		/* RETURNING BOOK(S)
		 * ------------------------------------------
		 * Check if there is selected return data.
		 *    YES : post the JSON into server.
		 *    NO  : display alert message.
		 */
		if(returndata && returndata.length > 0) {
			$.ajax({
				type : "post",
				url : "../../ReturnBooksServlet",
				//contentType : "application/json",
				data : {returndata : JSON.stringify(returndata)},
				//dataType : "json",
				success : function() {
					alert("Return books process succeed.");
				},
				error : function() {
					alert("Return books process failed due to database issue.");
				},
				complete : function() {
					$(location).attr("href", "rental-options.jsp");
				}
			})
		}
		
		else {
			alert("Please select at least one book to return.");
		}
	})

	// Check if the object empty of not
	function isEmpty(obj) {
		for(var prop in obj) {
			if(obj.hasOwnProperty(prop))
				return false;
		}

		return true;
	}

	// Display value in textbox
	function displayPenalty(fee) {
		if(fee == 0) {
			document.getElementById("penaltyfee").value = "";
		}

		else {
			document.getElementById("penaltyfee").value = "RM" + fee.toFixed(2);
		}
	}

	//------------------------------------------------------------------------------s
})
