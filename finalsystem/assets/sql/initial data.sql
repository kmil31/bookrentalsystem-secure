INSERT INTO users VALUES ("admin", "d033e22ae348aeb5660fc2140aec35850c4da997", "admin");
INSERT INTO users VALUES ("username", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", "staff");

INSERT INTO members (membername, phone) VALUES ("Luqman Sa'ari", "0178738963");
INSERT INTO members (membername, phone) VALUES ("Amir Izzat", "0126705667");

INSERT INTO books (title, author, available) VALUES ("7 Wonders of the World", "Samanthan Glos", "yes");
INSERT INTO books (title, author, available) VALUES ("Web Programming HTML, CSS, JavaScript", "Eric Zeyni", "yes");
INSERT INTO books (title, author, available) VALUES ("Fashion design", "Senoria Vil", "no");
INSERT INTO books (title, author, available) VALUES ("History of Malaysia", "Ahmad Razali", "no");
INSERT INTO books (title, author, available) VALUES ("Islamic Jurisprudence", "Saifullah ibnu Salem", "no");
INSERT INTO books (title, author, available) VALUES ("Why are you here?", "Julia Malpher", "yes");
INSERT INTO books (title, author, available) VALUES ("Marvel Comic", "Marks Grey", "no");
INSERT INTO books (title, author, available) VALUES ("Business Marketing", "Cecilia Campbell", "no");
INSERT INTO books (title, author, available) VALUES ("Travel Journal", "Roy William", "yes");
INSERT INTO books (title, author, available) VALUES ("Futuristic Technology", "Christopher Myll", "no");

INSERT INTO rentals (memberid, bookid, rentdate, duedate, returndate, rentstatus)
   VALUES (1, 2, "2019-12-10", "2019-12-12", "2019-12-12", "completed");
   
INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus)
   VALUES (1, 7, "2019-12-27", "2019-12-29", "rent");
   
INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus)
   VALUES (1, 10, "2019-12-27", "2019-12-29", "rent");
   
INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus)
   VALUES (1, 4, "2019-12-28", "2019-12-30", "rent");
   
INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus)
   VALUES (1, 5, "2019-12-28", "2019-12-30", "rent");
   
INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus)
   VALUES (1, 8, "2019-12-28", "2019-12-30", "rent");
   
INSERT INTO rentals (memberid, bookid, rentdate, duedate, rentstatus)
   VALUES (2, 3, "2019-12-29", "2019-12-31", "rent");