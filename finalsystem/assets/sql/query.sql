SELECT COUNT(*) FROM rentals
WHERE memberid = 1
AND rentstatus = 'rent';

SELECT m.id, m.membername, m.phone
FROM members m
WHERE EXISTS (SELECT r.memberid FROM rentals r WHERE r.memberid = m.id AND rentstatus = "rent");

SELECT m.id, m.membername, m.phone
FROM members m
WHERE NOT EXISTS (SELECT r.memberid FROM rentals r WHERE r.memberid = m.id AND rentstatus = "rent");
