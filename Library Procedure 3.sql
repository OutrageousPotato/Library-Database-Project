CREATE PROCEDURE [dbo].[getPatronsWithNoBooks]
AS
SELECT borrower_Name, borrower_address
FROM tbl_borrower a
LEFT JOIN tbl_Book_Loans b ON a.borrower_CardNo = b.Book_Loans_CardNo
WHERE b.Book_Loans_CardNo IS NULL
