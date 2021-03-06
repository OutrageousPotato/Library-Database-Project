CREATE PROCEDURE [dbo].[getCentralStephenKingInventory]
AS
SELECT e.book_Title AS 'Title', a.book_copies_no_of_copies 'Central Branch Qty' FROM tbl_book_copies a
	INNER JOIN tbl_book_authors b ON a.book_copies_bookID = b.book_authors_BookID
	INNER JOIN tbl_libraryBranch c ON a.book_copies_branchID = c.libraryBranch_branchID
	INNER JOIN tbl_book e ON a.book_copies_bookID = e.book_ID
	WHERE c.libraryBranch_branchName = 'Central'
	AND b.book_authors_Name LIKE '%Stephen King%'
;