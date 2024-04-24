use mark_management;

# Tạo view lấy ra thông tin những học sinh chưa thi môn nào
CREATE VIEW StudentsNotTakenAnyExam AS
SELECT *
FROM Students
WHERE id NOT IN (SELECT DISTINCT student_id FROM Marks);

# Đánh index cho bảng môn học ở cột tên môn học
CREATE INDEX idx_SubjectName ON Subjects(SubjectName);

# Tạo view lấy ra những lớp học mà có học sinh được điểm môn toán bằng 10 điểm
CREATE VIEW ClassesWithMathScoreTen AS
SELECT DISTINCT c.*
FROM Classes c
         JOIN Students s ON c.id = s.class_id
         JOIN Marks m ON s.id = m.student_id
         JOIN Subjects sb ON m.subject_id = sb.id
WHERE sb.SubjectName = 'Toán' AND m.point = 10;

# Tạo view lấy ra những môn học có xuất hiện điểm 10
CREATE VIEW SubjectsWithScoreTen AS
SELECT DISTINCT sb.*
FROM Subjects sb
         JOIN Marks m ON sb.id = m.subject_id
WHERE m.point = 10;

# Tạo view lấy ra những học sinh đạt điểm 10 môn “Toán”
CREATE VIEW StudentsWithMathScoreTen AS
SELECT DISTINCT s.*
FROM Students s
         JOIN Marks m ON s.id = m.student_id
         JOIN Subjects sb ON m.subject_id = sb.id
WHERE sb.SubjectName = 'Toán' AND m.point = 10;
