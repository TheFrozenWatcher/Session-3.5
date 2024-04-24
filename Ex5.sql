
use mark_management;
# Tạo store procedure Lấy ra tất cả sinh viên có điểm môn “Toán” trên 7
DELIMITER //

CREATE PROCEDURE GetStudentsWithMathScoreOverSeven()
BEGIN
    SELECT s.*
    FROM Students s
             JOIN Marks m ON s.id = m.student_id
             JOIN Subjects sb ON m.subject_id = sb.id
    WHERE sb.SubjectName = 'Toán' AND m.point > 7;
END //

DELIMITER ;

# Tạo store procedure thống kê những môn học có điểm thi trên 8
DELIMITER //

CREATE PROCEDURE GetSubjectsAboveEight()
BEGIN
    SELECT sb.*
    FROM Subjects sb
             JOIN Marks m ON sb.id = m.subject_id
    WHERE m.point > 8
    GROUP BY sb.id;
END //

DELIMITER ;

# Tạo store procedure Thống kê những học sinh thuộc lớp “A1” có điểm toán lớn hơn 7
DELIMITER //

CREATE PROCEDURE GetStudentsInClassA1WithMathScoreOverSeven()
BEGIN
    SELECT s.*
    FROM Students s
             JOIN Classes c ON s.class_id = c.id
             JOIN Marks m ON s.id = m.student_id
             JOIN Subjects sb ON m.subject_id = sb.id
    WHERE c.ClassName = 'A1' AND sb.SubjectName = 'Toán' AND m.point > 7;
END //

DELIMITER ;

# Tạo store procedure Thống kê những học sinh thuộc lớp “A2” chưa thi môn nào
DELIMITER //

CREATE PROCEDURE GetStudentsInClassA2NotTakenAnyExam()
BEGIN
    SELECT s.*
    FROM Students s
             LEFT JOIN Marks m ON s.id = m.student_id
             JOIN Classes c ON s.class_id = c.id
    WHERE c.ClassName = 'A2' AND m.student_id IS NULL;
END //

DELIMITER ;

# Tạo store procedure Tìm ra lớp học có nhiều học sinh có điểm thi là 10 điểm
DELIMITER //

CREATE PROCEDURE GetClassWithMostStudentsScoringTen()
BEGIN
    SELECT c.*, COUNT(*) AS NumStudentsWithTen
    FROM Classes c
             JOIN Students s ON c.id = s.class_id
             JOIN Marks m ON s.id = m.student_id
    WHERE m.point = 10
    GROUP BY c.id
    ORDER BY NumStudentsWithTen DESC
    LIMIT 1;
END //

DELIMITER ;

