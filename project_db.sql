-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 05 Ιουν 2019 στις 22:39:01
-- Έκδοση διακομιστή: 10.1.40-MariaDB
-- Έκδοση PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `project_db`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `author`
--

CREATE TABLE `author` (
  `authorID` int(11) NOT NULL,
  `AFrirst` text,
  `ALast` text,
  `Abirthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `author`
--

INSERT INTO `author` (`authorID`, `AFrirst`, `ALast`, `Abirthdate`) VALUES
(1, 'Giorgos', 'Papas', '1987-03-08'),
(2, 'Marios', 'Gevrgiou', '1999-06-01'),
(3, 'Dhmhtrhs', 'Sotiropoulos', '1999-01-01'),
(4, 'Katerina', 'Papadopoulou', '1999-05-25'),
(5, 'nefeli', 'Rous', '1998-12-01'),
(6, 'Anna', 'Tsipra', '2001-11-30');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `belongs_to`
--

CREATE TABLE `belongs_to` (
  `ISBN` int(11) NOT NULL,
  `categoryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `belongs_to`
--

INSERT INTO `belongs_to` (`ISBN`, `categoryName`) VALUES
(1, 'Literature'),
(2, 'Chemistry'),
(3, 'Physics'),
(4, 'Mechanical'),
(5, 'Electrical'),
(6, 'Literature');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `title` text,
  `pubYear` int(11) DEFAULT NULL,
  `numpages` int(11) DEFAULT NULL,
  `pubName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `book`
--

INSERT INTO `book` (`ISBN`, `title`, `pubYear`, `numpages`, `pubName`) VALUES
(1, 'Sherlock Holmes', 1990, 210, 'Ekdoseis Kritis'),
(2, 'Detective Hole', 2001, 350, 'Ekdoseis Kleidarithmos'),
(3, 'The bat', 2002, 472, 'Ekdoseis Kritis'),
(4, 'The secret life of Nefeli', 2018, 998, 'Ekdoseis Georgias'),
(5, 'Mouro Power', 2000, 500, 'Ekdoseis Georgias'),
(6, 'Chess lessons', 1950, 197, 'Oxford Book Institute'),
(7, 'Data Base', 2009, 1004, 'Ekdoseis Tziola'),
(8, 'abc', 98, 2541, 'Ekdoseis Kritis'),
(10, 'fagafd', 2000, 2541, 'Ekdoseis Kritis'),
(80, 'ooo', 1999, 90, 'Ekdoseis Kritis'),
(87, 'Hello world', 2009, 445, 'Ekdoseis Tziola'),
(101, 'Nefeli secret ', 1998, 1000, 'Ekdoseis Tziola'),
(206, 'fg', 1999, 571, 'Ekdoseis Kritis');

--
-- Δείκτες `book`
--
DELIMITER $$
CREATE TRIGGER `new_copy_added` AFTER INSERT ON `book` FOR EACH ROW INSERT INTO copies (ISBN, copyNr,shelf)
  VALUES (NEW.ISBN, 1, 20)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `book_view`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `book_view` (
`ISBN` int(11)
,`title` text
,`pubYear` int(11)
,`numpages` int(11)
,`pubName` varchar(50)
);

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `book_view_unupdatable`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `book_view_unupdatable` (
`ISBN` int(11)
,`title` text
,`pubYear` int(11)
,`numpages` int(11)
,`pubName` varchar(50)
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `borrows`
--

CREATE TABLE `borrows` (
  `memberID` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `copyNr` int(11) NOT NULL,
  `date_of_borrowing` date NOT NULL,
  `date_of_return` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `borrows`
--

INSERT INTO `borrows` (`memberID`, `ISBN`, `copyNr`, `date_of_borrowing`, `date_of_return`) VALUES
(1, 1, 2, '2019-05-25', '2019-07-31'),
(2, 2, 4, '2019-10-28', '2019-11-28'),
(3, 3, 3, '2019-08-20', '2019-08-28'),
(4, 4, 5, '2019-04-28', '2019-04-30'),
(5, 5, 1, '2019-05-25', '2019-05-29'),
(6, 6, 8, '2019-05-25', '2019-06-25');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category`
--

CREATE TABLE `category` (
  `categoryName` varchar(20) NOT NULL,
  `supercategoryName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `category`
--

INSERT INTO `category` (`categoryName`, `supercategoryName`) VALUES
('Electrical', 'Engineering'),
('Engineering', 'Engineering'),
('Mechanical', 'Engineering'),
('Literature', 'Literature'),
('Chemistry', 'Science'),
('Maths', 'Science'),
('Physics', 'Science'),
('Science', 'Science');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `copies`
--

CREATE TABLE `copies` (
  `ISBN` int(11) NOT NULL,
  `copyNr` int(11) NOT NULL,
  `shelf` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `copies`
--

INSERT INTO `copies` (`ISBN`, `copyNr`, `shelf`) VALUES
(1, 1, 5),
(1, 2, 2),
(1, 3, 2),
(2, 4, 3),
(3, 3, 4),
(4, 5, 9),
(5, 1, 5),
(6, 8, 1),
(10, 1, 20),
(80, 1, 20),
(87, 1, 20),
(101, 1, 20),
(206, 1, 20);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `employee`
--

CREATE TABLE `employee` (
  `empID` int(11) NOT NULL,
  `EFirst` text,
  `ELast` text,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `employee`
--

INSERT INTO `employee` (`empID`, `EFirst`, `ELast`, `salary`) VALUES
(1, 'Kostas', 'Gevrgiou', 600),
(2, 'Margarita', 'Papadopoulou', 650),
(3, 'Giwrgos', 'Sotiropoulos', 1000),
(4, 'Nefeli', 'Sotiropoulou', 110),
(5, 'Nasia', 'Mourogianni', 350),
(6, 'Michaela', 'Marinou', 600),
(7, 'Eleni', 'Christou', 600);

--
-- Δείκτες `employee`
--
DELIMITER $$
CREATE TRIGGER `new_employee_added` AFTER INSERT ON `employee` FOR EACH ROW INSERT INTO temporary_employee (empID, contractNr)
  VALUES (NEW.empID, 1)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `MFirst` text,
  `MLast` text,
  `Street` text,
  `street_number` int(11) DEFAULT NULL,
  `postalCode` int(11) DEFAULT NULL,
  `Mbirthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `member`
--

INSERT INTO `member` (`member_id`, `MFirst`, `MLast`, `Street`, `street_number`, `postalCode`, `Mbirthdate`) VALUES
(1, 'Giannis', 'Papadopoulos', 'Kolokotroni', 14, 33172, '1997-10-28'),
(2, 'Georgia', 'Papadopoulou', 'Kolokotroni', 14, 33172, '1998-07-17'),
(3, 'Tzoutzoux', 'Sotiropoulos', 'Baker Street', 22, 33172, '2001-04-01'),
(4, 'Nefeli', 'Papa', 'Baker Street', 21, 33172, '1998-05-25'),
(5, 'Konstantinos', 'Mouro', 'Baker Street', 21, 33172, '1998-07-31'),
(6, 'Rookie', 'Tsipras', 'Kolokotroni', 13, 33172, '2000-05-01'),
(7, 'Alex', 'Dimitriou', 'Kolokotroni', 8, 33172, '1995-03-03'),
(8, 'Maria', 'Melou', 'Karpathou', 8, 33172, '1995-03-03'),
(50, 'Admin', 'admin', 'Polytexneio', 55, 14655, '2017-07-24');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `permanent_employee`
--

CREATE TABLE `permanent_employee` (
  `empID` int(11) NOT NULL,
  `hiringDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `permanent_employee`
--

INSERT INTO `permanent_employee` (`empID`, `hiringDate`) VALUES
(1, '1999-05-25'),
(2, '2013-06-01'),
(3, '2006-10-28'),
(4, '2009-10-28');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `publisher`
--

CREATE TABLE `publisher` (
  `pubName` varchar(50) NOT NULL,
  `estYear` int(11) DEFAULT NULL,
  `street` text,
  `street_number` int(11) DEFAULT NULL,
  `postalCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `publisher`
--

INSERT INTO `publisher` (`pubName`, `estYear`, `street`, `street_number`, `postalCode`) VALUES
('Ekdoseis Georgias', 2018, 'Panepistimiou', 20, 33172),
('Ekdoseis Kleidarithmos', 2001, 'Ipokratous', 7, 33172),
('Ekdoseis Kritis', 1990, 'Ipokratous', 6, 33172),
('Ekdoseis MRF', 2011, 'Voula', 27, 33172),
('Ekdoseis Tziola', 1990, 'Panepistimiou', 16, 33172),
('Oxford Book Institute', 1950, 'Baker Street', 23, 33172);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `reminder`
--

CREATE TABLE `reminder` (
  `empID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `copyNr` int(11) NOT NULL,
  `date_of_borrowing` date NOT NULL,
  `date_of_reminder` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `reminder`
--

INSERT INTO `reminder` (`empID`, `memberID`, `ISBN`, `copyNr`, `date_of_borrowing`, `date_of_reminder`) VALUES
(1, 1, 1, 2, '2019-05-25', '2019-06-25'),
(1, 1, 1, 2, '2019-05-25', '2019-07-30'),
(2, 3, 3, 3, '2019-08-20', '2019-08-22'),
(3, 2, 2, 4, '2019-10-28', '2019-10-30'),
(4, 4, 4, 5, '2019-04-28', '2019-04-29'),
(5, 6, 6, 8, '2019-05-25', '2019-06-24'),
(6, 5, 5, 1, '2019-05-25', '2019-05-26');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `supercategory`
--

CREATE TABLE `supercategory` (
  `supercategoryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `supercategory`
--

INSERT INTO `supercategory` (`supercategoryName`) VALUES
('Comic Books'),
('Engineering'),
('Literature'),
('Mindgames'),
('Science');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `temporary_employee`
--

CREATE TABLE `temporary_employee` (
  `empID` int(11) NOT NULL,
  `contractNr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `temporary_employee`
--

INSERT INTO `temporary_employee` (`empID`, `contractNr`) VALUES
(5, 19),
(6, 20),
(7, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `written_by`
--

CREATE TABLE `written_by` (
  `ISBN` int(11) NOT NULL,
  `authorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `written_by`
--

INSERT INTO `written_by` (`ISBN`, `authorID`) VALUES
(1, 5),
(2, 4),
(3, 1),
(4, 2),
(5, 3),
(6, 6);

-- --------------------------------------------------------

--
-- Δομή για προβολή `book_view`
--
DROP TABLE IF EXISTS `book_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view`  AS  select `book`.`ISBN` AS `ISBN`,`book`.`title` AS `title`,`book`.`pubYear` AS `pubYear`,`book`.`numpages` AS `numpages`,`book`.`pubName` AS `pubName` from `book` ;

-- --------------------------------------------------------

--
-- Δομή για προβολή `book_view_unupdatable`
--
DROP TABLE IF EXISTS `book_view_unupdatable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view_unupdatable`  AS  select `book`.`ISBN` AS `ISBN`,`book`.`title` AS `title`,`book`.`pubYear` AS `pubYear`,`book`.`numpages` AS `numpages`,`book`.`pubName` AS `pubName` from `book` group by `book`.`ISBN` ;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`);

--
-- Ευρετήρια για πίνακα `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`ISBN`,`categoryName`),
  ADD KEY `categoryName` (`categoryName`);

--
-- Ευρετήρια για πίνακα `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `pubName` (`pubName`);

--
-- Ευρετήρια για πίνακα `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`memberID`,`ISBN`,`copyNr`,`date_of_borrowing`),
  ADD KEY `borrows_ibfk_3` (`ISBN`,`copyNr`);

--
-- Ευρετήρια για πίνακα `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryName`),
  ADD KEY `supercategoryName` (`supercategoryName`);

--
-- Ευρετήρια για πίνακα `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`ISBN`,`copyNr`);

--
-- Ευρετήρια για πίνακα `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empID`);

--
-- Ευρετήρια για πίνακα `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Ευρετήρια για πίνακα `permanent_employee`
--
ALTER TABLE `permanent_employee`
  ADD PRIMARY KEY (`empID`);

--
-- Ευρετήρια για πίνακα `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`pubName`);

--
-- Ευρετήρια για πίνακα `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`empID`,`memberID`,`ISBN`,`copyNr`,`date_of_borrowing`,`date_of_reminder`),
  ADD KEY `reminder_ibfk_4` (`memberID`,`ISBN`,`copyNr`,`date_of_borrowing`),
  ADD KEY `reminder_ibfk_5` (`ISBN`,`copyNr`);

--
-- Ευρετήρια για πίνακα `supercategory`
--
ALTER TABLE `supercategory`
  ADD PRIMARY KEY (`supercategoryName`);

--
-- Ευρετήρια για πίνακα `temporary_employee`
--
ALTER TABLE `temporary_employee`
  ADD PRIMARY KEY (`empID`);

--
-- Ευρετήρια για πίνακα `written_by`
--
ALTER TABLE `written_by`
  ADD PRIMARY KEY (`ISBN`,`authorID`),
  ADD KEY `authorID` (`authorID`);

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`categoryName`) REFERENCES `category` (`categoryName`);

--
-- Περιορισμοί για πίνακα `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`pubName`) REFERENCES `publisher` (`pubName`);

--
-- Περιορισμοί για πίνακα `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`ISBN`,`copyNr`) REFERENCES `copies` (`ISBN`, `copyNr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`supercategoryName`) REFERENCES `supercategory` (`supercategoryName`);

--
-- Περιορισμοί για πίνακα `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `permanent_employee`
--
ALTER TABLE `permanent_employee`
  ADD CONSTRAINT `permanent_employee_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `reminder`
--
ALTER TABLE `reminder`
  ADD CONSTRAINT `reminder_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_3` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_4` FOREIGN KEY (`memberID`,`ISBN`,`copyNr`,`date_of_borrowing`) REFERENCES `borrows` (`memberID`, `ISBN`, `copyNr`, `date_of_borrowing`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_5` FOREIGN KEY (`ISBN`,`copyNr`) REFERENCES `copies` (`ISBN`, `copyNr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `temporary_employee`
--
ALTER TABLE `temporary_employee`
  ADD CONSTRAINT `temporary_employee_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `written_by`
--
ALTER TABLE `written_by`
  ADD CONSTRAINT `written_by_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `written_by_ibfk_2` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
