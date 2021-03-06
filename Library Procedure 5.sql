CREATE PROCEDURE [dbo].[getTotalDueByBranch]
AS
SELECT a.libraryBranch_branchName, COUNT(*) AS 'Books Loaned Out' FROM tbl_libraryBranch a 
	INNER JOIN tbl_Book_Loans b ON a.libraryBranch_branchID = b.Book_Loans_BranchID
	GROUP BY libraryBranch_branchName
;