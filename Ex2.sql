use quanlydiemsv;

# Tao procedure cho phép in danh sách các sinh viên sắp xếp theo khoa
DELIMITER //
CREATE PROCEDURE GetAllStudentsOrderByFaculty()
BEGIN
    SELECT sv.*
    FROM dmsv sv
             JOIN dmkhoa k ON sv.MaKhoa = k.MaKhoa
    ORDER BY k.TenKhoa;
END //
DELIMITER ;

# Tạo procedure cho phép thêm mới 1 một sinh
DELIMITER //
CREATE PROCEDURE AddNewStudent(
    IN p_HoSV NVARCHAR(15),
    IN p_TenSV NVARCHAR(7),
    IN p_Phai NCHAR(1),
    IN p_NgaySinh DATETIME,
    IN p_NoiSinh NVARCHAR(20),
    IN p_MaKhoa CHAR(2),
    IN p_HocBong FLOAT
)
BEGIN
    INSERT INTO DMSV (HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
    VALUES (p_HoSV, p_TenSV, p_Phai, p_NgaySinh, p_NoiSinh, p_MaKhoa, p_HocBong);
END //
DELIMITER ;


# Tạo procedure cho phép lấy tất cả thông tin các khoa
DELIMITER //
CREATE PROCEDURE GetAllFaculties()
BEGIN
    SELECT * FROM DMKhoa;
END //
DELIMITER ;

# Tạo procedure cho phép thêm mới 1 khoa
DELIMITER //
CREATE PROCEDURE AddNewFaculty(
    IN p_MaKhoa CHAR(2),
    IN p_TenKhoa NVARCHAR(30)
)
BEGIN
    INSERT INTO DMKhoa (MaKhoa, TenKhoa)
    VALUES (p_MaKhoa, p_TenKhoa);
END //
DELIMITER ;

# Tạo procedure cho phép thêm mới 1 khoa và trả ra số lượng của khoa hiện tại
DELIMITER //
CREATE PROCEDURE AddNewFacultyAndReturnCount(
    IN p_TenKhoa NVARCHAR(30)
)
BEGIN
    DECLARE total_faculties INT;
    INSERT INTO DMKhoa (TenKhoa)
    VALUES (p_TenKhoa);

    SELECT COUNT(*) INTO total_faculties FROM DMKhoa;
    SELECT total_faculties AS TotalFaculties;
END //
DELIMITER ;

# Viết procedure cho phép cập nhật dữ liệu 1 khoa
DELIMITER //
CREATE PROCEDURE UpdateFaculty(
    IN p_MaKhoa CHAR(2),
    IN p_TenKhoa NVARCHAR(30)
)
BEGIN
    UPDATE DMKhoa
    SET TenKhoa = p_TenKhoa
    WHERE MaKhoa = p_MaKhoa;
END //
DELIMITER ;

# Viết procedure nhập vào 2 mã sinh viên và 1 mã môn học, trả ra thông tin sinh viên có điểm cao nhất trong lần thi 1 .
DELIMITER //
CREATE PROCEDURE GetStudentWithHighestScoreFirstExam(
    IN p_MaSV1 CHAR(3),
    IN p_MaSV2 CHAR(3),
    IN p_MaMH CHAR(2)
)
BEGIN
    SELECT sv.*
    FROM DMSV sv
             JOIN KetQua kq ON sv.MaSV = kq.MaSV
    WHERE (sv.MaSV = p_MaSV1 OR sv.MaSV = p_MaSV2)
      AND kq.MaMH = p_MaMH
      AND kq.LanThi = 1
    ORDER BY kq.Diem DESC
    LIMIT 1;
END //
DELIMITER ;

# Viết procedure nhập vào 1 môn học và 1 mã sinh viên, kiểm tra xem sinh viên có đậu môn này hay không trong lần thi đầu tiên. Nếu đậu thì trả ra “PASS”, không đậu trả ra “FAIL”, Chưa có điểm trả ra “NOT MARK”
DELIMITER //
CREATE PROCEDURE CheckStudentPassFirstExam(
    IN p_MaSV CHAR(3),
    IN p_MaMH CHAR(2),
    OUT p_Result VARCHAR(20)
)
BEGIN
    DECLARE exam_result DECIMAL(4,2);

    SELECT Diem INTO exam_result
    FROM KetQua
    WHERE MaSV = p_MaSV AND MaMH = p_MaMH AND LanThi = 1;

    IF exam_result IS NULL THEN
        SET p_Result = 'NOT MARK';
    ELSEIF exam_result >= 5 THEN
        SET p_Result = 'PASS';
    ELSE
        SET p_Result = 'FAIL';
    END IF;
END //
DELIMITER ;

# Viết procedure nhập vào mã sinh viên và môn học, trả ra các điểm thi của sinh viên môn học đó .
DELIMITER //
CREATE PROCEDURE GetStudentMarksBySubject(
    IN p_MaSV CHAR(3),
    IN p_MaMH CHAR(2)
)
BEGIN
    SELECT Diem
    FROM KetQua
    WHERE MaSV = p_MaSV AND MaMH = p_MaMH;
END //
DELIMITER ;

# Viết procedure nhập vào mã sinh viên, in ra các môn học sinh viên đã học
DELIMITER //
CREATE PROCEDURE GetSubjectsStudiedByStudent(
    IN p_MaSV CHAR(3)
)
BEGIN
    SELECT DISTINCT mh.*
    FROM DMMH mh
             JOIN KetQua kq ON mh.MaMH = kq.MaMH
    WHERE kq.MaSV = p_MaSV;
END //
DELIMITER ;

# Viết procedure nhập vào mã môn học, in ra các sinh viên đã học môn đó
DELIMITER //
CREATE PROCEDURE GetStudentsStudiedSubject(
    IN p_MaMH CHAR(2)
)
BEGIN
    SELECT DISTINCT sv.*
    FROM DMSV sv
             JOIN KetQua kq ON sv.MaSV = kq.MaSV
    WHERE kq.MaMH = p_MaMH;
END //
DELIMITER ;

