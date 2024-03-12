Create Database if not exists QuanLyDiemSV CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa
(
    MaKhoa  char(2) primary key,
    TenKhoa nvarchar(30) not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV
(
    MaSV     char(3)      not null primary key,
    HoSV     nvarchar(15) not null,
    TenSV    nvarchar(7)  not null,
    Phai     nchar(7),
    NgaySinh datetime     not null,
    NoiSinh  nvarchar(20),
    MaKhoa   char(2),
    HocBong  float
);
/*===================MON HOC========================*/
create table DMMH
(
    MaMH   char(2)      not null,
    TenMH  nvarchar(25) not null,
    SoTiet tinyint,
    Constraint DMMH_MaMH_pk primary key (MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
    MaSV   char(3) not null,
    MaMH   char(2) not null,
    LanThi tinyint,
    Diem   decimal(4, 2),
    Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV, MaMH, LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
    add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
        References DMKhoa (MaKhoa);
Alter table KetQua
    add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
    add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('01', 'Cơ Sở Dữ Liệu', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('02', 'Trí Tuệ Nhân Tạo', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('03', 'Truyền Tin', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('04', 'Đồ Họa', 60);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('05', 'Văn Phạm', 60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('AV', 'Anh Văn');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TH', 'Tin Học');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TR', 'Triết');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('VL', 'Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values ('A01', 'Nguyễn Thị', 'Hải', 'Nữ', '1990-03-20', 'Hà Nội', 'TH', 130000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A02', 'Trần Văn', 'Chính', 'Nam', '1992-12-24', 'Bình Định', 'VL', 150000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A03', 'Lê Thu Bạch', 'Yến', 'Nữ', '1990-02-21', 'TP Hồ Chí Minh', 'TH', 170000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A04', 'Trần Anh', 'Tuấn', 'Nam', '1990-12-20', 'Hà Nội', 'AV', 80000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B01', 'Trần Thanh', 'Mai', 'Nữ', '1991-08-12', 'Hải Phòng', 'TR', 0);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B02', 'Trần Thị Thu', 'Thủy', 'Nữ', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 1, 3);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '02', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '03', 1, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 1, 4.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 2, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '03', 1, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '05', 1, 9);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 1, 2);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 2, 4);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A04', '05', 2, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '01', 1, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '02', 1, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '04', 1, 10);

-- Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
-- viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
-- sinh viên tăng dần
select MaSV, HoSV, TenSV, HocBong
from quanlydiemsv.dmsv
order by MaSV;

# Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
# Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select MaSV, HoSV, TenSV, Phai, NgaySinh
from quanlydiemsv.dmsv
order by Phai;

# Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
# tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select HoSV, TenSV, NgaySinh, HocBong
from quanlydiemsv.dmsv
order by NgaySinh, HocBong desc;

# Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
# môn, Tên môn, Số tiết.
select MaMH, TenMH, SoTiet
from DMMH
where TenMH like 'T%';

# Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
# các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
select HoSV, TenSV, MaSV, NgaySinh, Phai
from dmsv
where right(TenSV, 1) = 'i';

# . Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
# các thông tin: Mã khoa, Tên khoa.
select MaKhoa, TenKhoa
from dmkhoa
where substr(TenKhoa, 2, 1) = 'n';

# 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
select *
from dmsv
where HoSV like '%Thị%';

# Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
# thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
# được sắp xếp theo thứ tự Mã khoa giảm dần
select MaSV, HoSV, TenSV, MaKhoa, HocBong
from dmsv
where HocBong > 100000
order by MaKhoa desc;

# 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
# các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select HoSV, TenSV, MaKhoa, NoiSinh, HocBong
from dmsv
where NoiSinh = 'Hà Nội'
  and HocBong >= 150000;

# Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
# tin: Mã sinh viên, Mã khoa, Phái.
select MaSV, DMSV.MaKhoa, Phai
from dmsv
         join DMKhoa DK on dmsv.MaKhoa = DK.MaKhoa
where TenKhoa in ('Anh Văn', 'Vật lý');

# Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
# 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
# bổng.
SELECT MaSV, NgaySinh, NoiSinh, HocBong
FROM dmsv
WHERE NgaySinh BETWEEN '1991-01-01' AND '1992-06-05';

# Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
# thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
SELECT MaSV, NgaySinh, Phai, MaKhoa
FROM dmsv
WHERE HocBong BETWEEN 80000 AND 150000;

# Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
# tin: Mã môn học, Tên môn học, Số tiết.
select DMMH.MaMH, DMMH.TenMH, DMMH.SoTiet
from DMMH
where SoTiet between 30 and 45;

# Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các
# thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select dmsv.MaSV, dmsv.HoSV, dmsv.TenSV, TenKhoa, dmsv.Phai
from dmsv
         join DMKhoa DK on dmsv.MaKhoa = DK.MaKhoa
where Phai = 'Nam'
  and DK.MaKhoa in ('AV', 'TH');

# 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
select *
from dmsv
where Phai = 'Nữ'
  and TenSV like '%N%';

# 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các
# thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.

select HoSV, TenSV, NoiSinh, NgaySinh
from dmsv
where NoiSinh = 'Hà Nội'
  and month(NgaySinh) = 2;

# 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh
# viên, Tuổi,Học bổng.
select HoSV, TenSV, year(current_date) - year(NgaySinh) as Age, HocBong
from dmsv
where year(current_date) - year(NgaySinh) > 20;

# .Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
# viên, Tuổi, Tên khoa.
select HoSV, TenSV, year(current_date) - year(NgaySinh) as Age, TenKhoa
from dmsv
         join DMKhoa DK on dmsv.MaKhoa = DK.MaKhoa
where year(current_date) - year(NgaySinh) between 20 and 25;

# Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
# tên sinh viên,Phái, Ngày sinh.
select hosv, DMSV.TenSV, phai, dmsv.NgaySinh
from dmsv
where month(NgaySinh) in (1, 2, 3);

# .Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
# Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
# bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
# thị là “Mức trung bình”

select masv,
       phai,
       MaKhoa,
       case when HocBong > 500000 then 'Học bổng cao' else 'Mức trung bình' end as 'Mức học bổng'
from dmsv;

# 21.Cho biết tổng số sinh viên của toàn trường
select count(*)
from dmsv;

# 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
select count(*)
from dmsv
where Phai = 'Nữ';

# 23.Cho biết tổng số sinh viên của từng khoa.
select MaKhoa, count(*) as 'Số sinh viên'
from dmsv
group by MaKhoa;

#24.Cho biết số lượng sinh viên học từng môn.
select dmmh.MaMH, count(distinct KQ.MaSV)
from dmmh
         join KetQua KQ on dmmh.MaMH = KQ.MaMH
group by MaMH;

# 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
# trong bảng kq)
select dmsv.MaSV, count(distinct MaMH)
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
group by dmsv.MaSV;

# 26.Cho biết tổng số học bổng của mỗi khoa.
select MaKhoa, count(*)
from dmsv
where HocBong > 0
group by MaKhoa;

# 27.Cho biết học bổng cao nhất của mỗi khoa.
select MaKhoa, max(HocBong) as 'Học bổng cao nhất'
from dmsv
group by MaKhoa;

# 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select MaKhoa,
       SUM(CASE WHEN Phai = 'Nam' THEN 1 ELSE 0 END) AS Nam,
       SUM(CASE WHEN Phai = 'Nữ' THEN 1 ELSE 0 END)  AS Nu,
       COUNT(*)                                      AS Tong
from dmsv
group by MaKhoa;

# 29.Cho biết số lượng sinh viên theo từng độ tuổi.
select year(current_date) - year(NgaySinh) as Age, count(*)
from dmsv
group by year(current_date) - year(NgaySinh);

# 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select year(NgaySinh) as Year, count(*) as 'SoSV'
from dmsv
group by year(NgaySinh)
having count(*) >= 2;
# 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select NoiSinh, count(*)
from dmsv
group by NoiSinh
having count(*) >= 2;

# 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
select dmmh.MaMH, count(distinct KQ.MaSV) as 'SoSV'
from dmmh
         join KetQua KQ on dmmh.MaMH = KQ.MaMH
group by MaMH
having count(distinct KQ.MaSV) > 3;

# 33.Cho biết những sinh viên thi lại trên 2 lần.
select dmsv.MaSV, kq.MaMH, LanThi
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
where LanThi >= 2;

# 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select dmsv.MaSV, AVG(Diem) as 'Avg 1st try'
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
where LanThi = 1
  and Phai = 'Nam'
group by dmsv.MaSV
having avg(Diem) > 7;

# 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
select MaSV, MaMH, Diem
from ketqua
where Diem < 5
  and LanThi = 1;

# 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select MaKhoa, count(*)
from dmsv
where Phai = 'Nam'
group by MaKhoa
having count(*) >= 2;

# 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
select MaKhoa, count(*)
from dmsv
where HocBong between 200000 and 300000
group by MaKhoa
having count(*) >= 2;

# 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
# trong lần thi 1.

select MaMH, sum(case when Diem >= 5 then 1 else 0 end) as 'Do', sum(case when Diem < 5 then 1 else 0 end) as 'Truot'
from ketqua
where LanThi = 1
group by MaMH;

# 39.Cho biết sinh viên nào có học bổng cao nhất.
select *
from dmsv
order by HocBong desc
limit 1;

# 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
select KQ.MaSV, TenSV, TenMH, Diem, LanThi
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
         join quanlydiemsv.dmmh d on KQ.MaMH = d.MaMH
where TenMH = 'Cơ sở dữ liệu'
  and LanThi = 1
order by Diem desc
limit 1;

# 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
SELECT dmsv.MaSV, TenKhoa, HoSV, TenSV, NgaySinh, MAX(YEAR(CURRENT_DATE) - YEAR(NgaySinh)) AS 'Tuoi'
FROM dmsv
         JOIN DMKhoa DK ON dmsv.MaKhoa = DK.MaKhoa
WHERE TenKhoa = 'Anh Văn'
  and YEAR(CURRENT_DATE) - YEAR(NgaySinh) = (select (max(year(current_date) - year(NgaySinh))) from dmsv)
group by MaSV
;

# 42.Cho biết khoa nào có đông sinh viên nhất.
select MaKhoa, count(*) as 'SoSV'
from dmsv
group by MaKhoa
having count(*) =
       (select max(StudentCount) from (select count(*) as StudentCount from dmsv group by MaKhoa) as TotalCount);

# 43.Cho biết khoa nào có đông nữ nhất.
select MaKhoa, count(*) as 'SoSvNu'
from dmsv
where Phai = 'Nữ'
group by MaKhoa
having count(*) = (select max(StudentCount)
                   from (select count(*) as StudentCount from dmsv where Phai = 'Nữ' group by MaKhoa) as TotalCount);

# 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select dmmh.MaMH, TenMH, count(*) as 'So SV truot'
from dmmh
         join ketqua k on dmmh.MaMH = k.MaMH
where LanThi = 1
  and Diem < 5
group by MaMH
having count(*) = (select max(StudentCount)
                   from (select count(*) as StudentCount
                         from ketqua
                         where LanThi = 1
                           and Diem < 5
                         group by MaMH) as Subquery);

# 45.Cho biết sinh viên không học khoa anh văn có điểm thi môn văn phạm lớn hơn
# điểm thi văn phạm của sinh viên học khoa anh văn.
SELECT dmsv.MaSV, HoSV, TenSV, MAX(KQ.Diem) AS MaxDiem
FROM dmsv
         JOIN KetQua KQ ON dmsv.MaSV = KQ.MaSV
         JOIN quanlydiemsv.ketqua k ON KQ.LanThi = k.LanThi
         JOIN DMMH D ON k.MaMH = D.MaMH
         JOIN dmkhoa ON dmsv.MaKhoa = DMKhoa.MaKhoa
WHERE TenMH = 'Văn Phạm'
  AND TenKhoa != 'Anh Văn'
  AND KQ.Diem > (SELECT MAX(Kq.Diem)
                 FROM dmsv
                          JOIN KetQua KQ ON dmsv.MaSV = KQ.MaSV
                          JOIN quanlydiemsv.ketqua k ON KQ.LanThi = k.LanThi
                          JOIN DMMH D ON k.MaMH = D.MaMH
                          JOIN quanlydiemsv.dmsv d2 ON k.MaSV = d2.MaSV
                 WHERE TenMH = 'Văn Phạm'
                   AND TenKhoa = 'Anh Văn')
GROUP BY DMSV.MaSV, HoSV, TenSV;

# 46. Cho biết sinh viên có nơi sinh cùng với Hải.
select *
from dmsv
where NoiSinh = (select NoiSinh from dmsv where TenSV = 'Hải')
  and TenSV != 'Hải';

# Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
# sinh viên thuộc khoa anh văn
select dmsv.masv,
       hosv,
       tensv,
       phai,
       ngaysinh,
       noisinh,
       DMKhoa.makhoa,
       hocbong,
       tenkhoa
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
         join quanlydiemsv.dmmh d on KQ.MaMH = d.MaMH
         join dmkhoa on dmsv.MaKhoa = DMKhoa.MaKhoa
where DMKhoa.TenKhoa != 'Anh Văn'
  and DMSV.HocBong > (select max(HocBong)
                      from dmsv
                               join KetQua K on dmsv.MaSV = K.MaSV
                               join quanlydiemsv.dmkhoa d2 on dmsv.MaKhoa = d2.MaKhoa
                      where TenKhoa = 'Anh Văn')
group by KQ.MaSV;

# Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
# học khóa anh văn
select dmsv.masv,
       hosv,
       tensv,
       phai,
       ngaysinh,
       noisinh,
       DMKhoa.makhoa,
       hocbong,
       tenkhoa
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
         join quanlydiemsv.dmmh d on KQ.MaMH = d.MaMH
         join dmkhoa on dmsv.MaKhoa = DMKhoa.MaKhoa
where DMKhoa.TenKhoa != 'Anh Văn'
  and DMSV.HocBong > (select min(HocBong)
                      from dmsv
                               join KetQua K on dmsv.MaSV = K.MaSV
                               join quanlydiemsv.dmkhoa d2 on dmsv.MaKhoa = d2.MaKhoa
                      where TenKhoa = 'Anh Văn')
group by KQ.MaSV;

# Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm
# thi lần 1 môn cơ sở dữ liệu của những sinh viên khác
select dmsv.MaSV, TenSV, TenMH, Diem, LanThi
from dmsv
         join KetQua KQ on dmsv.MaSV = KQ.MaSV
         join dmmh d on KQ.MaMH = d.MaMH
where LanThi = 2
  and TenMH = 'Cơ sở dữ liệu'
  and Diem >= (select max(Diem)
               from KetQua KQ
                        join dmmh d on KQ.MaMH = d.MaMH
               where LanThi = 1
                 and TenMH = 'Cơ sở dữ liệu')
;

# 50. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
select dmsv.MaSV, HoSV, TenSV, d.MaMH, TenMH, Diem
from dmsv
         join KetQua K on dmsv.MaSV = K.MaSV
         join dmmh d on K.MaMH = d.MaMH
where (d.MaMH, diem) in (select mh.MaMH, max(kq.Diem) as MaxDiem
                         from dmsv sv
                                  join KetQua kq on sv.MaSV = kq.MaSV
                                  join dmmh mh
                                       on kq.MaMH = mh.MaMH
                         group by mh.MaMH)
order by dmsv.MaSV, d.MaMH;

# 51. Cho biết những khoa không có sinh viên học.
select dk.MaKhoa, TenKhoa, count(distinct sv.MaSV) as StudentCount
from dmsv sv
         join DMKhoa DK on sv.MaKhoa = DK.MaKhoa
group by dk.MaKhoa, TenKhoa
having count(distinct sv.MaSV) = 0;

# 52. Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
select sv.MaSV, HoSV, TenSV,Diem,TenMH
from dmsv sv
         left join ketqua kq on sv.MaSV = kq.MaSV and isnull(Diem)=isnull()
         join dmmh mh on kq.MaMH = mh.MaMH
where TenMH='Cơ sở dữ liệu';



