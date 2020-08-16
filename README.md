# Admin Panel of a Books Rental System.
An enhanced version of the web application, book rental system, previously developed in INFO 3305 Web Application development.

## Developed by :
  - Muhammad Luqmanul Hakim bin Sa'ari          1813225                   
  - Muhammad Amir Izzat Bin Mohd Unzir          1811049
  - Muhammad Kamiel bin Samsudin                1713493
  
  
## Introduction

Our web application is an administration system for a website that rents books. The administrator can add or remove books from the 
catalog, as well as register new users to allow them to rent books. The administrator is also in charge of filling out the rental forms for users in case the user wants to rent a book.
Note that the web application was designed to only be used by the administrators.
## Issues with the previous application.

The previous web application had a few security vulnerabilities we could find. Here is a list of some of the issues that we managed to find.

* **Insecure input fields.**
<img src=https://raw.githubusercontent.com/kmil31/bookrentalsystem-secure/master/readme_images/xss_name.png
     />
The input field for adding book names and authors were vulnerable to XSS attacks, as well as SQL injections. This also applies to the input field for registering a new member's name.


* **One level of Authorization**
Having one level of authorization is quite vulnerable, as if the credentials are exposed, the attacker will have full control, over the  system.

* **Password stored in plaintext**
Previous username and passwords were not encrypted and was stored in plaintext file.

## Objective for Enhancement

To fix the previously stated vulnerabilities as well as making our web application more secure in general, as is recommended practise.

## Enhancement
In this section, we will discuss on the enhancement conducted in this application as countermeasure toward the security flaw specified in previous section.

* **Input Validation**
In the improved system, verification of user input is implemented in each textboxes used in the web application. For security purpose, the validation is conducted at both client-side which uses Regular Expression (Regex) and server-side which uses Jsoup Library to sanitize the malicious input.

* **Administrator Authorization**
Another authorization level of administrator was added to the system instead of authorizing all feature to a single user as in the previous prototype. This authorization is determined during the account login process that prompt the users to their enter username and password. The membership management was changed to be under privilege of administrator. This create limitation that only admin can add and delete customer membership of the application that can rent the books.

* **Hashing Password**
Hashing algorithm is added to the password the user of the application used to login into. The password stored in this hashed version to make the value unreadable in case of being hacked. The login module will convert the password input from user into predetermined hash algorithm before conducting match checking with users' login info in the database.

* **XSS And CSRF Prevention**
The vulnerable input fields are the name fields of our register membership page and the title and author fields of the add books page. We prevent the XSS attack by firstly, not reflecting the user input back to the user, to prevent the reflected XSS attack, and secondly, by doing input sanitisation both at the client-side and server-side by using javascript regular expressions as well as Jsoup library to clean the input fields and prevent unwanted input.All are queries are not done by URL,
and we have used jQuery's AJAX to POST our requests to servlets.Since we have tried to prevent XSS, the probability of CSRF is also low.

* **Database Security**
We have tried to prevent SQL injection by firstly disabling special characters in our input fields, as well as checking the input both client-side and server side. We have used parameterized queries by implementing the prepared statement methods provided by Java. This will hopefully make SQL injection a bit more difficult to perform, and will secure our database.

* **File Security**
Most of our business logic is compiled into servlets, with the jsp pages only displaying the input forms and necessary information. Our business logic is purely server-side Javascript and servlets, making extracting the source code difficult as most of it is compiled. 

* **Session Security**
Our website implements a 60 second timeout for a user session, if there is no activity within 60 seconds after your last action, the server will automatically log you out and destroy your session cookie. The server only provides access to a user if they are given a session cookie after login. This makes directly typing in the pages of the website in your URL not work, as navigating to those pages will simply redirect back to the login screen.


## References

* https://stackoverflow.com/questions/6649677/cleaning-the-string-in-java
* https://happycoding.io/tutorials/java-server/sanitizing-user-input
* https://www.rexegg.com/
* https://jsoup.org/
