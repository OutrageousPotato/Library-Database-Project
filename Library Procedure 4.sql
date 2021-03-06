CREATE PROCEDURE [dbo].[getSharpstownDueToday]
AS
SELECT c.book_Title AS 'Book Due Today', b.borrower_Name AS 'Deadbeat who has it', b.borrower_Address AS 'Where to find them', b.borrower_Phone AS 'Number to berate them at' FROM tbl_Book_Loans a
	INNER JOIN tbl_borrower b ON a.Book_Loans_CardNo = b.borrower_CardNo
	INNER JOIN tbl_book c ON a.Book_Loans_BookID = c.book_ID
	WHERE Book_Loans_BranchID = 3000 AND Book_Loans_DueDate = CAST(GETDATE() AS DATE);