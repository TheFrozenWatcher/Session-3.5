use mark_management;
# Tạo view lấy ra tất cả sinh viên chưa thi môn nào
CREATE VIEW StudentsNotTakenAnyExam AS
SELECT *
FROM Students
WHERE id NOT IN (SELECT DISTINCT student_id FROM Marks);

# Đánh index cho bảng student vào cột studentName
CREATE INDEX idx_StudentName ON Students(StudentName);

# Tạo view lấy ra tất cả sinh viên có điểm “Toán” cao nhất lớp “A1”
CREATE VIEW StudentsHighestMathScoreInA1 AS
SELECT s.*
FROM Students s
         JOIN Marks m ON s.id = m.student_id
         JOIN Subjects sb ON m.subject_id = sb.id
         JOIN Classes c ON s.class_id = c.id
WHERE sb.SubjectName = 'Toán' AND c.ClassName = 'A1'
ORDER BY m.point DESC
LIMIT 1;

# Tạo store procedure thêm mới môn học
DELIMITER //
CREATE PROCEDURE AddNewSubject(
    IN p_SubjectName VARCHAR(100),
    IN p_Credit INT,
    IN p_Status BIT
)
BEGIN
    INSERT INTO Subjects (SubjectName, credit, status)
    VALUES (p_SubjectName, p_Credit, p_Status);
END //
DELIMITER ;

# Tạo store procedure chinh sửa thông tin sinh viên
DELIMITER //
CREATE PROCEDURE UpdateStudentInfo(
    IN p_StudentId INT,
    IN p_StudentName VARCHAR(100),
    IN p_Address VARCHAR(255),
    IN p_Phone VARCHAR(11),
    IN p_ClassId INT,
    IN p_Status BIT
)
BEGIN
    UPDATE Students
    SET StudentName = p_StudentName,
        Address = p_Address,
        Phone = p_Phone,
        class_id = p_ClassId,
        status = p_Status
    WHERE id = p_StudentId;
END //
DELIMITER ;
