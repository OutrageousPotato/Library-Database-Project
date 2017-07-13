CREATE PROCEDURE [dbo].[getSharpstownLostTribeQty]
AS
SELECT b.libraryBranch_branchName AS 'Branch Name', c.book_Title AS 'Title', a.book_copies_no_of_copies AS 'Qty on Hand'FROM tbl_book_copies a
	INNER JOIN tbl_libraryBranch b ON a.book_copies_branchID = b.libraryBranch_branchID
	INNER JOIN tbl_book c ON a.book_copies_bookID = c.book_ID
	WHERE a.book_copies_branchID = 3000 AND a.book_copies_bookID = 1025
