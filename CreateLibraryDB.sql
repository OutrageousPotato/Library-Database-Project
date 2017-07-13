CREATE DATABASE db_library;
GO

USE db_library;
GO

CREATE TABLE tbl_publisher (
	publisher_Name Varchar(50) PRIMARY KEY NOT NULL,
	publisher_Address varchar(50) NOT NULL,
	publisher_Phone varchar (50) NOT NULL )	
;

INSERT INTO tbl_publisher (publisher_Name, publisher_Address, publisher_Phone)
	VALUES
	('Penguin', '123 Fake Street, New York City, NY 12345', '586-869-9685')
	,('Random House', '456 Made Up Ln, Berkeley, CA 60334', '748-857-1456')
	,('Simon and Schuster','12 Another St, Chicago, IL 83749', '748-857-1234')
	,('MIT Press', '99 Whatever Cir, Boston, MA 99876', '888-888-9999')
	,('Oxford University Press', '1 One Street, New York City, NY 85467', '234-345-6547')	
	,('HarperCollins', '2008 W. Real Street Name, Real City, USA 84736', '888-256-1674')
;

CREATE TABLE tbl_book (
	book_ID int PRIMARY KEY NOT NULL IDENTITY (1000,1),
	book_Title varchar(100),
	book_PublisherName varchar(50)FOREIGN KEY REFERENCES tbl_publisher(publisher_Name) )
;

INSERT INTO tbl_book (book_Title, book_PublisherName)
	VALUES
	('Elbow Room: The Varieties of Free Will Worth Wanting', 'Penguin')
	,('The Ancestor''s Tale', 'Random House')
	,('Candide', 'Random House')
	,('Racing the Beam', 'MIT Press')
	,('Watership Down', 'HarperCollins')
	,('The Professor and the Madman', 'Oxford University Press')
	,('Xenocide','Simon and Schuster')
	,('Notes on a Small Island', 'Random House')
	,('The Twits', 'Oxford University Press')
	,('George''s Marvelous Medicine','Oxford University Press')
	,('Guns, Germs, and Steel','Simon and Schuster')
	,('When Will Jesus Bring the Pork Chops?','Penguin')
	,('The Moral Landscape','Random House')
	,('Intuition Pumps and Other Tools for Thinking','Random House')
	,('Ender''s Shadow','Penguin')
	,('Slaughterhouse Five','Random House')
	,('I''ll Sleep When I''m Dead: The Dirty Life and Times of Warren Zevon','MIT Press')
	,('How Right You Are, Jeeves','Oxford University Press')
	,('The Sirens of Titan','Simon and Schuster')
	,('Politics','Oxford University Press')
	,('Rising Tide','HarperCollins')
	,('I Am Error','MIT Press')
	,('Breakfast of Champions','MIT Press')
	,('Darwin''s Dangerous Idea','Simon and Schuster')
	,('Consciousness Explained','Random House')
	,('The Lost Tribe','Random House')
	,('The Stand', 'Penguin')
	,('The Dark Half', 'Penguin')
	,('Misery','Penguin')
;

CREATE TABLE tbl_book_authors (
	book_authors_BookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_ID),
	book_authors_Name varchar(50))
;

INSERT INTO tbl_book_authors (book_authors_BookID, book_authors_Name)
	VALUES
	(1000, 'Daniel Dennett'),
	(1001,'Richard Dawkins'),
	(1002,'Voltaire'),
	(1003,'Ian Bogost & Nick Montfort'),
	(1004,'Richard Adams'),
	(1005,'Simon Winchester'),
	(1006,'Orson Scott Card'),
	(1007,'Bill Bryson'),
	(1008,'Roald Dahl'),
	(1009,'Roald Dahl'),
	(1010,'Jared Diamond'),
	(1011,'George Carlin'),
	(1012,'Sam Harris'),
	(1013,'Daniel Dennett'),
	(1014,'Orson Scott Card'),
	(1015,'Kurt Vonnegut'),
	(1016,'Crystal Zevon'),
	(1017,'P.G. Wodehouse'),
	(1018,'Kurt Vonnegut'),
	(1019,'Plato'),
	(1020,'John Barry'),
	(1021,'Nathan Altice'),
	(1022,'Kurt Vonnegut'),
	(1023,'Daniel Dennett'),
	(1024,'Daniel Dennett'),
	(1025,'Matthew Caldwell'),
	(1026,'Stephen King'),
	(1027,'Stephen King'),
	(1028,'Stephen King')
;

CREATE TABLE tbl_borrower (
	borrower_CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000000,1),
	borrower_Name varchar(50) NOT NULL,
	borrower_Address varchar(50) NOT NULL,
	borrower_Phone varchar(50) NOT NULL	)
;

INSERT INTO tbl_borrower (borrower_Name, borrower_Address, borrower_Phone)
	VALUES
	('Steve Hansen', '4800 W. Broadway, Cincinnatti OH', '866-650-2673')
	,('Bilbo Baggins','The Shire','1-800-ONE-RING')
	,('Abraham Lincoln','1600 Pennsylvania Ave, Washington DC','765-968-9897')
	,('Ted Danson','647 West Ave','503-754-8096')
	,('Tony Danza','85743 Tony Danza St','928-857-7368')
	,('Mr. Horse','Horse Way','874-948-2678')
	,('Ayatollah Khomeini','12000 Iranian Revolution Freeway','777-748-7439')
	,('Spongebob Squarepants','Under The Sea','123-456-3200')
	,('Bill "Lbry H8er" Johnson', '9300 Kill Literacy Dr', '758-938-9988')
	,('Stanley Bookcrusher', 'Secret Lair, CT', '746-234-5463')
;

CREATE TABLE tbl_libraryBranch (
	libraryBranch_branchID INT PRIMARY KEY NOT NULL IDENTITY (3000,1),
	libraryBranch_branchName varchar(50) NOT NULL,
	libraryBranch_Address varchar(50) NOT NULL,
);

INSERT INTO tbl_libraryBranch (libraryBranch_branchName, libraryBranch_Address)
	VALUES
	('Sharpstown','99 West Libary St')
	,('Central','1447 Central St')
	,('HorseBranch','9000 HorseLand Highway')
	,('Hollywood','4040 NE Tillamook St')
;

CREATE TABLE tbl_book_copies (
	book_copies_bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_ID),
	book_copies_branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_libraryBranch(librarybranch_branchID),
	book_copies_no_of_copies INT NOT NULL,)
;

INSERT INTO tbl_book_copies (book_copies_bookID, book_copies_branchID, book_copies_no_of_copies)
	VALUES
	(1000, 3000, 8)
	,(1000, 3001, 2)
	,(1000, 3002, 1)
	,(1000, 3003, 2)
	,(1001, 3000, 2)
	,(1001, 3001, 3)
	,(1001, 3002, 5)
	,(1001, 3003, 7)
	,(1002, 3000, 8)
	,(1002, 3001, 3)
	,(1002, 3002, 3)
	,(1002, 3003, 2)
	,(1003, 3000, 2)
	,(1003, 3001, 2)
	,(1003, 3002, 5)
	,(1003, 3003, 6)
	,(1004, 3000, 6)
	,(1004, 3001, 5)
	,(1004, 3002, 7)
	,(1004, 3003, 11)
	,(1005, 3000, 23)
	,(1005, 3001, 5)
	,(1005, 3002, 7)
	,(1005, 3003, 6)
	,(1006, 3000, 5)
	,(1006, 3001, 3)
	,(1006, 3002, 3)
	,(1006, 3003, 3)
	,(1007, 3000, 3)
	,(1007, 3001, 4)
	,(1007, 3002, 4)
	,(1007, 3003, 5)
	,(1008, 3000, 3)
	,(1008, 3001, 2)
	,(1008, 3002, 6)
	,(1008, 3003, 7)
	,(1009, 3000, 4)
	,(1009, 3001, 6)
	,(1009, 3002, 5)
	,(1009, 3003, 3)
	,(1010, 3000, 2)
	,(1010, 3001, 4)
	,(1010, 3002, 5)
	,(1010, 3003, 6)
	,(1011, 3000, 4)
	,(1011, 3001, 5)
	,(1011, 3002, 8)
	,(1011, 3003, 8)
	,(1012, 3000, 8)
	,(1012, 3001, 7)
	,(1012, 3002, 6)
	,(1012, 3003, 4)
	,(1013, 3000, 4)
	,(1013, 3001, 4)
	,(1013, 3002, 3)
	,(1013, 3003, 5)
	,(1014, 3000, 23)
	,(1014, 3001, 3)
	,(1014, 3002, 3)
	,(1014, 3003, 3)
	,(1015, 3000, 4)
	,(1015, 3001, 6)
	,(1015, 3002, 3)
	,(1015, 3003, 6)
	,(1016, 3000, 4)
	,(1016, 3001, 4)
	,(1016, 3002, 5)
	,(1016, 3003, 5)
	,(1017, 3000, 6)
	,(1017, 3001, 7)
	,(1017, 3002, 8)
	,(1017, 3003, 6)
	,(1018, 3000, 5)
	,(1018, 3001, 4)
	,(1018, 3002, 3)
	,(1018, 3003, 12)
	,(1019, 3000, 1)
	,(1019, 3001, 12)
	,(1019, 3002, 5)
	,(1019, 3003, 5)
	,(1020, 3000, 4)
	,(1020, 3001, 6)
	,(1020, 3002, 3)
	,(1020, 3003, 6)
	,(1021, 3000, 6)
	,(1021, 3001, 7)
	,(1021, 3002, 7)
	,(1021, 3003, 6)
	,(1022, 3000, 8)
	,(1022, 3001, 2)
	,(1022, 3002, 9)
	,(1022, 3003, 1)
	,(1023, 3000, 10)
	,(1023, 3001, 1)
	,(1023, 3002, 3)
	,(1023, 3003, 4)
	,(1024, 3000, 4)
	,(1024, 3001, 5)
	,(1024, 3002, 6)
	,(1024, 3003, 3)
	,(1025, 3000, 2)
	,(1025, 3001, 6)
	,(1025, 3002, 7)
	,(1025, 3003, 5)
	,(1026, 3000, 4)
	,(1026, 3001, 4)
	,(1026, 3002, 3)
	,(1026, 3003, 2)
	,(1027, 3001, 4)
	,(1028, 3001, 6)
;

CREATE TABLE tbl_Book_Loans (
	Book_Loans_BookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_ID),
	Book_Loans_BranchID INT NOT NULL FOREIGN KEY REFERENCES tbl_libraryBranch(LibraryBranch_BranchID),
	Book_Loans_CardNo INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(borrower_CardNo),
	Book_Loans_DateOut DATE,
	Book_Loans_DueDate DATE)
;

INSERT INTO tbl_Book_Loans (
	Book_Loans_BookID, Book_Loans_BranchID, Book_Loans_CardNo, Book_Loans_DateOut, Book_Loans_DueDate )
	VALUES
	(1000, 3000, 1000000, '2017-06-15', '2017-07-15')
	,(1002, 3000, 1000000, '2017-06-09', '2017-07-09')
	,(1013, 3000, 1000000, '2017-06-10', '2017-07-10')
	,(1024, 3000, 1000000, '2017-06-23', '2017-07-23')
	,(1008, 3000, 1000000, '2017-06-28', '2017-07-28')
	,(1020, 3000, 1000000, '2017-06-09', '2017-07-09')
	,(1025, 3000, 1000000, '2017-06-09', '2017-07-09')
	,(1026, 3000, 1000000, '2017-06-10', '2017-07-10')
	,(1004, 3000, 1000001, '2017-06-10', '2017-07-10')
	,(1005, 3002, 1000001, '2017-06-14', '2017-07-14')
	,(1006, 3002, 1000001, '2017-06-14', '2017-07-14')
	,(1007, 3002, 1000001, '2017-06-21', '2017-07-21')
	,(1008, 3003, 1000001, '2017-06-22', '2017-07-22')
	,(1013, 3003, 1000001, '2017-06-23', '2017-07-23')
	,(1014, 3003, 1000002, '2017-06-24', '2017-07-24')
	,(1015, 3003, 1000002, '2017-06-24', '2017-07-24')
	,(1017, 3000, 1000002, '2017-06-09', '2017-07-09')
	,(1019, 3000, 1000002, '2017-06-09', '2017-07-09')
	,(1022, 3000, 1000002, '2017-06-10', '2017-07-10')
	,(1000, 3001, 1000003, '2017-06-01', '2017-07-01')
	,(1012, 3001, 1000003, '2017-06-01', '2017-07-01')
	,(1015, 3001, 1000003, '2017-06-01', '2017-07-01')
	,(1016, 3001, 1000003, '2017-06-01', '2017-07-01')
	,(1018, 3000, 1000003, '2017-06-09', '2017-07-09')
	,(1021, 3000, 1000004, '2017-06-10', '2017-07-10')
	,(1024, 3000, 1000004, '2017-06-29', '2017-07-29')
	,(1003, 3003, 1000004, '2017-06-29', '2017-07-29')
	,(1005, 3003, 1000004, '2017-06-29', '2017-07-29')
	,(1007, 3003, 1000004, '2017-06-30', '2017-07-30')
	,(1011, 3000, 1000004, '2017-06-09', '2017-07-09')
	,(1010, 3000, 1000004, '2017-06-09', '2017-07-09')
	,(1010, 3000, 1000005, '2017-06-10', '2017-07-10')
	,(1016, 3000, 1000005, '2017-06-10', '2017-07-10')
	,(1017, 3000, 1000005, '2017-06-10', '2017-07-10')
	,(1018, 3002, 1000005, '2017-06-11', '2017-07-11')
	,(1019, 3002, 1000005, '2017-06-18', '2017-07-18')
	,(1020, 3002, 1000005, '2017-06-18', '2017-07-18')
	,(1002, 3002, 1000005, '2017-06-18', '2017-07-18')
	,(1000, 3001, 1000006, '2017-06-17', '2017-07-17')
	,(1009, 3001, 1000006, '2017-06-17', '2017-07-17')
	,(1019, 3001, 1000006, '2017-06-22', '2017-07-22')
	,(1025, 3001, 1000006, '2017-06-22', '2017-07-22')
	,(1024, 3001, 1000006, '2017-06-27', '2017-07-27')
	,(1011, 3001, 1000006, '2017-06-27', '2017-07-27')
	,(1007, 3001, 1000006, '2017-06-28', '2017-07-28')
	,(1008, 3001, 1000006, '2017-06-28', '2017-07-28')
	,(1001, 3002, 1000006, '2017-07-10', '2017-08-10')
	,(1002, 3002, 1000006, '2017-07-10', '2017-08-10')
	,(1003, 3002, 1000006, '2017-07-10', '2017-08-10')
	,(1018, 3002, 1000006, '2017-07-10', '2017-08-10')
	,(1003, 3000, 1000007, '2017-06-09', '2017-07-09')
	,(1009, 3000, 1000007, '2017-06-10', '2017-07-10')
;