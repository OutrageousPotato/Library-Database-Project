CREATE PROCEDURE [dbo].[getBorrowersWithMoreThanFiveBooks]
AS
SELECT b.borrower_Name AS 'Name', b.borrower_Address AS 'Address', COUNT(a.Book_Loans_CardNo) AS 'Books checked out' FROM tbl_Book_Loans a
	INNER JOIN tbl_borrower b ON a.Book_Loans_CardNo = b.borrower_CardNo
	GROUP BY b.borrower_Name, b.borrower_address
	HAVING COUNT(a.Book_Loans_CardNo) > 5
;