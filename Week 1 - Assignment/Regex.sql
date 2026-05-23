-- REGEX Basic Assignment
-- Platform: db-fiddle.com (MySQL 8.0)

DROP TABLE IF EXISTS regex_practice;
CREATE TABLE regex_practice (
    id INT,
    full_text VARCHAR(200),
    email VARCHAR(100),
    phone VARCHAR(30),
    mixed_value VARCHAR(100)
);

INSERT INTO regex_practice VALUES
(1,'EMP001_IN_91','karthik@gmail.com','+91-9876543210','abc123xyz'),
(2,'EMP002_US_01','rahul@yahoo.com','+1-7654321098','test45done'),
(3,'EMP003_UK_44','john@outlook.com','+44-9988776655','run9fast'),
(4,'EMP004_AU_61','steve@gmail.com','+61-8899776655','go88home'),
(5,'EMP005_IN_91','arjun@company.in','+91-7788996655','data77lake'),
(6,'EMP006_US_01','meera@gmail.com','+1-9090909090','spark12sql'),
(7,'EMP007_UK_44','rohan@yahoo.com','+44-7878787878','etl999job'),
(8,'EMP008_AU_61','alice@company.au','+61-6665554443','cloud7aws'),
(9,'EMP009_IN_91','vinay@gmail.com','+91-9988776655','hdfs34node'),
(10,'EMP010_US_01','sam@outlook.com','+1-6767676767','map5reduce'),
(11,'USR11_IN','neha@gmail.com','91-8899001122','abc1'),
(12,'USR12_US','tom@yahoo.com','01-9988776655','x9'),
(13,'USR13_UK','harry@company.co.uk','44-6677889900','z88'),
(14,'USR14_AU','olivia@gmail.com','61-4455667788','q777'),
(15,'USR15_IN','ankit@company.in','91-9988001122','karthik99'),
(16,'ACC_1001_91','user1@gmail.com','+91-8877665544','etl1'),
(17,'ACC_1002_01','user2@yahoo.com','+1-2233445566','etl22'),
(18,'ACC_1003_44','user3@outlook.com','+44-3344556677','etl333'),
(19,'ACC_1004_61','user4@gmail.com','+61-5566778899','etl4444'),
(20,'ACC_1005_91','user5@company.in','+91-6677889900','etl55555'),
(21,'ORD-11-IN','a@gmail.com','91-9998887776','a1b2'),
(22,'ORD-22-US','b@yahoo.com','01-1112223334','x2y'),
(23,'ORD-33-UK','c@outlook.com','44-5556667778','m33n'),
(24,'ORD-44-AU','d@gmail.com','61-8887776665','k444'),
(25,'ORD-55-IN','e@company.in','91-4445556667','job5'),
(26,'LOG91DATA','x@gmail.com','91-9090909090','log99'),
(27,'LOG01DATA','y@yahoo.com','01-8080808080','log8'),
(28,'LOG44DATA','z@outlook.com','44-7070707070','log777'),
(29,'LOG61DATA','p@gmail.com','61-6060606060','log6666'),
(30,'LOG91DATA','q@company.in','91-5050505050','log55555'),
(31,'IND91CODE','aa@gmail.com','+91-8889990001','aa1'),
(32,'USA01CODE','bb@yahoo.com','+1-7776665554','bb22'),
(33,'UK44CODE','cc@outlook.com','+44-6665554443','cc333'),
(34,'AUS61CODE','dd@gmail.com','+61-5554443332','dd4444'),
(35,'IND91CODE','ee@company.in','+91-4443332221','ee55555'),
(36,'TEST001','test1@gmail.com','91-1111111111','t1'),
(37,'TEST002','test2@yahoo.com','01-2222222222','t22'),
(38,'TEST003','test3@outlook.com','44-3333333333','t333'),
(39,'TEST004','test4@gmail.com','61-4444444444','t4444'),
(40,'TEST005','test5@company.in','91-5555555555','t55555');


-- Q1. Extract numeric characters from the very beginning of mixed_value
-- stops at first non-numeric character
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '^[0-9]+') AS leading_numbers
FROM regex_practice;

-- Q2. Extract numeric characters from the very end of mixed_value
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '[0-9]+$') AS trailing_numbers
FROM regex_practice;

-- Q3. Extract only the first single character of mixed_value
SELECT id, mixed_value,
    LEFT(mixed_value, 1) AS first_char
FROM regex_practice;

-- Q4. Extract only the last single character of mixed_value
SELECT id, mixed_value,
    RIGHT(mixed_value, 1) AS last_char
FROM regex_practice;

-- Q5. Extract exactly two consecutive numeric characters from mixed_value
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '[0-9]{2}') AS two_digits
FROM regex_practice;

-- Q6. Extract exactly one numeric character from mixed_value
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '[0-9]{1}') AS one_digit
FROM regex_practice;

-- Q7. Extract the country code from the beginning of phone number
SELECT id, phone,
    REGEXP_SUBSTR(LTRIM(REPLACE(phone, '+', '')), '^[0-9]+') AS country_code
FROM regex_practice;

-- Q8. Extract numeric portion between alphabetic characters in mixed_value
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '(?<=[a-zA-Z])[0-9]+(?=[a-zA-Z])') AS digits_between_alpha
FROM regex_practice;

-- Q9. Extract text before the @ symbol in email
SELECT id, email,
    SUBSTRING_INDEX(email, '@', 1) AS email_username
FROM regex_practice;

-- Q10. Extract text after the @ symbol including domain in email
SELECT id, email,
    SUBSTRING_INDEX(email, '@', -1) AS email_domain_full
FROM regex_practice;

-- Q11. Extract only the domain name without the @ symbol
SELECT id, email,
    SUBSTRING_INDEX(email, '@', -1) AS domain_name
FROM regex_practice;

-- Q12. Extract only the text after the last dot in the email
SELECT id, email,
    SUBSTRING_INDEX(email, '.', -1) AS tld
FROM regex_practice;

-- Q13. Extract only alphabetic characters that appear as a continuous sequence
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '[a-zA-Z]+') AS alpha_sequence
FROM regex_practice;

-- Q14. Extract only numeric characters that appear as a continuous sequence
SELECT id, mixed_value,
    REGEXP_SUBSTR(mixed_value, '[0-9]+') AS numeric_sequence
FROM regex_practice;

-- Q15. Extract exactly the first three characters of full_text
SELECT id, full_text,
    LEFT(full_text, 3) AS first_three_chars
FROM regex_practice;

-- Q16. Extract exactly the last two characters of full_text
SELECT id, full_text,
    RIGHT(full_text, 2) AS last_two_chars
FROM regex_practice;

-- Q17. Extract the employee number between the alphabetic prefix and first underscore
SELECT id, full_text,
    REGEXP_SUBSTR(full_text, '[0-9]+') AS emp_number
FROM regex_practice;

-- Q18. Extract the country code at the end of full_text
SELECT id, full_text,
    REGEXP_SUBSTR(full_text, '[0-9]+$') AS country_code_end
FROM regex_practice;

-- Q19. Extract alphabetic text between two underscore characters
SELECT id, full_text,
    REGEXP_SUBSTR(full_text, '(?<=_)[a-zA-Z]+(?=_)') AS text_between_underscores
FROM regex_practice;

-- Q20. Extract digits immediately after the plus sign in phone (country code only)
SELECT id, phone,
    REGEXP_SUBSTR(phone, '(?<=\\+)[0-9]+') AS digits_after_plus
FROM regex_practice;