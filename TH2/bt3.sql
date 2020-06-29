
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOANG KIM TUYEN
-- Create date: 04/05/2020
-- Description:	Viết hàm tính điểm trung bình của sinh viên khi người dùng nhập mã sinh viên.
-- select dbo.FN_DiemTBSV ('B101')
-- =============================================
ALTER FUNCTION [dbo].[FN_DiemTBSV] 
(
	-- Add the parameters for the function here
	@masv varchar(20)
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @diemtb AS float

	-- Add the T-SQL statements to compute the return value here
	SELECT @diemtb = AVG(DiemLan1)
	FROM KetQua
	WHERE MaSV =  @masv

	-- Return the result of the function
	RETURN @diemtb

END