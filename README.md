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


*  **One level of Authorization**
Having one level of authorization is quite vulnerable, as if the credentials are exposed, the attacker will have full control, over the  system.

* **Password stored in plaintext**
Previous username and passwords were not encrypted and was stored in plaintext file.

## Objective for Enhancement

To fix the previously stated vulnerabilities as well as making our web application more secure in general, as is recommended practise.
