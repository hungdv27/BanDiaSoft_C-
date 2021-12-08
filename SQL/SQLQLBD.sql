-- create database QUANLIBANDIA
-- drop database QUANLIBANDIA

use QUANLIBANDIA

create table NhanVien(
	MaNV nchar(10) PRIMARY KEY,
	TenNV nvarchar(50),
	GioiTinh nvarchar(10),
	NgaySinh date,
	DienThoai nchar(10),
	DiaChi nvarchar(50),
	MaCV nchar(10)
);
create table KhachHang(
	MaKH nchar(10) PRIMARY KEY,
	TenKH nvarchar(50),
	DienThoai nchar(10),
	DiaChi nvarchar(50)
);
create table CongViec(
	MaCV nchar(10) PRIMARY KEY,
	TenCV nvarchar(50)
);
create table NoiSanXuat(
	MaNSX nchar(10) PRIMARY KEY,
	TenNSX nvarchar(50)
);
create table TheLoai(
	MaTL nchar(10) PRIMARY KEY,
	TenTL nvarchar(50)
);
create table NhaCungCap(
	MaNCC nchar(10) PRIMARY KEY,
	TenNCC nvarchar(50),
	DienThoai nchar(10),
	DiaChi nvarchar(50)
);
create table KhoDia(
	MaDia nchar(10) PRIMARY KEY,
	TenDia nvarchar(50),
	SoLuong int,
	DonGiaBan money,
	DonGiaNhap money,
	MaNSX nchar(10),
	MaTL nchar(10),
	GiamGia int,
	Anh nchar(255),
	GhiChu nvarchar(200)
);
create table Mat_Hong(
	MaMat nchar(10) PRIMARY KEY,
	MaDia nchar(10),
	SoLuongMat int,
	NgayMat date,
);
create table HoaDonBan(
	MaHDB nchar(10) PRIMARY KEY,
	MaNV nchar(10),
	NgayBan date,
	MaKH nchar(10),
	ThanhTien money
);
create table HoaDonNhap(
	MaHDN nchar(10) PRIMARY KEY,
	MaNV nchar(10),
	NgayNhap date,
	MaNCC nchar(10),
	ThanhTien money
);
create table ChiTietHoaDonBan(
	MaHDB nchar(10) not null,
	MaDia nchar(10) not null,
	SoLuong int,
	GiamGia float,
	ThanhTien money
);
create table ChiTietHoaDonNhap(
	MaHDN nchar(10) not null,
	MaDia nchar(10) not null,
	SoLuong int,
	DonGia money,
	GiamGia float,
	ThanhTien money
);

Alter table ChitietHoaDonNhap add constraint pk_ChitietHDN primary key (MaDia, MaHDN);

Alter table ChitietHoaDonBan add constraint pk_ChitietHDB primary key (MaDia, MaHDB);

Alter table ChitietHoaDonNhap add constraint fk_ChitietHDN_HDN foreign key (MaHDN) references HoaDonNhap (MaHDN);

Alter table ChitietHoaDonBan add constraint fk_ChitietHDN_HDB foreign key (MaHDB) references HoaDonBan (MaHDB);

ALter table ChitietHoaDonNhap add constraint fk_ChitietHDN_KhoDia foreign key (MaDia) references KhoDia(MaDia);

ALter table ChitietHoaDonBan add constraint fk_ChitietHDB_KhoDia foreign key (MaDia) references KhoDia(MaDia);

Alter table HoaDonBan add constraint fk_HoaDonBan_NhanVien foreign key (MaNV) references NhanVien(MaNV);

Alter table HoaDonNhap add constraint fk_HoaDonNhap_NhanVien foreign key (MaNV) references NhanVien(MaNV);

Alter table HoaDonBan add constraint fk_HoaDonBan_KhachHang foreign key (MaKH) references KhachHang(MaKH);

Alter table HoaDonNhap add constraint fk_HoaDonNhap_NhaCungCap foreign key (MaNCC) references NhaCungCap(MaNCC);

Alter table NhanVien add constraint fk_NhanVien_CongViec foreign key (MaCV) references CongViec(MaCV);

Alter table KhoDia add constraint fk_KhoDia_NoiSanXuat foreign key (MaNSX) references NoiSanXuat(MaNSX);

Alter table KhoDia add constraint fk_KhoDia_TheLoai foreign key (MaTL) references TheLoai(MaTL);

Alter table Mat_Hong add constraint fk_MatHong_KhoDia foreign key (MaDia) references KhoDia(MaDia);




insert into CongViec(MaCV, TenCV) values ('1', 'GiamDoc');
insert into CongViec(MaCV, TenCV) values ('2', 'Quanli');
insert into CongViec(MaCV, TenCV) values ('3', 'BanHang');
insert into CongViec(MaCV, TenCV) values ('4', 'DonVeSinh');



insert into NoiSanXuat(MaNSX, TenNSX) values ('123456', 'Shotacon');
insert into NoiSanXuat(MaNSX, TenNSX) values ('235461', 'Lolicon');
insert into NoiSanXuat(MaNSX, TenNSX) values ('345621', 'Brocon');
insert into NoiSanXuat(MaNSX, TenNSX) values ('345216', 'Siscon');

insert into TheLoai(MaTL, TenTL) values ('234567', 'Shoujo');
insert into TheLoai(MaTL, TenTL) values ('435672', 'Kodomo');
insert into TheLoai(MaTL, TenTL) values ('234576', 'Seinen');
insert into TheLoai(MaTL, TenTL) values ('245673', 'Redikomi');
insert into TheLoai(MaTL, TenTL) values ('245674', 'Seijin'); /* Sửa MaTL từ 245673 do trùng bên trên */
insert into TheLoai(MaTL, TenTL) values ('254376', 'Yaoi');
insert into TheLoai(MaTL, TenTL) values ('224567', 'Shonen-ai');
insert into TheLoai(MaTL, TenTL) values ('334562', 'Shonen');
insert into TheLoai(MaTL, TenTL) values ('442356', 'Yuri');
insert into TheLoai(MaTL, TenTL) values ('553246', 'Shoujo-ai');
insert into TheLoai(MaTL, TenTL) values ('667345', 'Doujinshi');
insert into TheLoai(MaTL, TenTL) values ('772345', 'Horror');


insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('617746', 'Blogtag', '6769482622', '519 Annamark Trail');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('279181', 'Minyx', '2528870938', '43196 Havey Pass');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('290211', 'Babbleblab', '4103987124', '2 Golf View Lane');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('375602', 'Myworks', '8088937433', '96 Browning Crossing');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('381571', 'Tagpad', '9008586054', '15 Columbus Park');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('245101', 'Voonte', '3714936856', '095 Novick Trail');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('756398', 'Skynoodle', '3828270162', '37870 Bartillon Plaza');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('322775', 'Snaptags', '5015945311', '1744 Muir Avenue');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('657177', 'Jetwire', '8373676517', '3 Meadow Valley Pass');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('975620', 'Realpoint', '2613696003', '72 Mallard Point');


insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('697799', 'Benjamin Tubble', 'Female', '1992/04/26', '5587549807', '77113 Butterfield Court', '1');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('607444', 'Rancell Polley', 'Male', '1999/10/05', '9477911589', '4 Springview Parkway', '2');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('322655', 'Annaliese Curson', 'Male', '1998/08/08', '7379794947', '4438 Hazelcrest Avenue', '2');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('676421', 'Leo Yggo', 'Non-binary', '1990/11/15', '8175027478', '4 Butterfield Way', '4');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('750731', 'Mitzi Menis', 'Female', '1992/02/23', '1352566997', '4 Prentice Place', '4');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('020102', 'Tallou Dando', 'Non-binary', '1990/01/17', '3209227811', '86986 Green Ridge Crossing', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('621456', 'Levey Reding', 'Male', '1997/05/31', '8487074474', '47 Garrison Crossing', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('579502', 'Lynelle Tomaszczyk', 'Female', '1995/03/24', '7638074571', '78 Manley Pass', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('047222', 'Shayna Anstee', 'Female', '1990/02/20', '2101786692', '4940 Aberg Park', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('710507', 'Enrique Salvage', 'Male', '1993/12/11', '7777859203', '7 Vidon Road', '3');


insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('919760', 'Hanni McShee', '6715542144', '0 Vernon Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('888853', 'Perri Mival', '7812052228', '02790 Meadow Ridge Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('176240', 'Salvador Bullar', '1524142550', '8 Charing Cross Road');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('824210', 'Carlene Najera', '8623566491', '1 Cordelia Parkway');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('924356', 'Stanley Treeby', '2184071049', '19107 Kim Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('373461', 'Cornelia Duffil', '2668141859', '5345 Pleasure Alley');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('331305', 'Ermina Kiff', '2547902893', '325 Utah Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('265572', 'Charlotte Skinner', '5659851492', '99784 Havey Alley');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('265656', 'Clarisse Harmour', '5375629240', '90352 School Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('305962', 'Kelley Flintoff', '4622935397', '14281 Dottie Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('139227', 'Karen Wooton', '5439436098', '677 Nobel Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('426355', 'Hazel Bickers', '7931153809', '3 Burrows Trail');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('514509', 'Sileas Rubi', '7703980221', '07 Hallows Street');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('565452', 'Min Give', '5654302099', '66 Delaware Center');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('116136', 'Celestia Casley', '3415190028', '30 Fuller Street');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('273410', 'Richart Tawse', '2751088395', '45819 5th Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('244580', 'Shaina Puxley', '1668986863', '3298 Leroy Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('124911', 'Rad MacCumiskey', '5598414599', '749 Dixon Drive');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('630603', 'Mamie Poole', '9123280994', '5039 Sommers Avenue');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('695006', 'Jemie Trewin', '6156735651', '7852 Talmadge Alley');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('963846', 'Kerry Zaple', '8687076391', '7 Alpine Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('613721', 'Pooh Pilger', '1552369767', '2 Spohn Crossing');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('844256', 'Riobard Lawling', '3392561858', '4259 Elka Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('736044', 'Avis Reidie', '9554081173', '5 Hudson Crossing');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('109219', 'Latisha Dundon', '5978893514', '1749 Sommers Court');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('738019', 'Junie Cornejo', '7039245261', '8 Oak Valley Park');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('348110', 'Garreth Pamphilon', '2542466270', '57 Swallow Plaza');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('833505', 'Audrey Ketcher', '3143835904', '176 Mendota Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('541710', 'Amery Kulas', '3136033407', '2148 Helena Park');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('898798', 'Maude Grunder', '1825367093', '4 Eliot Trail');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('066087', 'Yolande Cramond', '3136056773', '8 Schiller Place');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('860894', 'Earlie Capper', '1532414066', '0 Victoria Avenue');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('668285', 'Piggy Iacovini', '7935499233', '624 Schmedeman Parkway');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('031617', 'Audre Broxton', '4342434000', '2 Hansons Junction');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('410256', 'Anjanette Gremane', '3291295128', '087 Judy Crossing');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('936833', 'Irwinn Norman', '7354477791', '8016 Coleman Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('994443', 'Guglielma Mirams', '2196049105', '238 Waxwing Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('093879', 'Noby Antrum', '3548718821', '44 Oak Valley Plaza');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('285101', 'Jerrome Tatteshall', '8801028119', '619 Hagan Road');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('613369', 'Jaquelin Petschelt', '3757367902', '64 Hazelcrest Center');

insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('118560', 'Edgepulse', 10, 10000, 5000, '123456', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('822499', 'Shufflebeat', 20, 20000, 10000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('558190', 'Twinder', 30, 30000, 10000, '235461', '234576');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('743246', 'Trupe', 40, 15000, 5000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('230089', 'Digitube', 50, 20000, 10000, '235461', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('315647', 'Centimia', 60, 30000, 15000, '123456', '234576');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('796207', 'Jabbercube', 70, 20000, 10000, '345621', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('267257', 'Jamia', 80, 20000, 10000, '235461', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('045156', 'Roomm', 90, 10000, 2000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('265891', 'Rhynoodle', 10, 20000, 10000, '345621', '234576');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('550261', 'Dazzlesphere', 11, 30000, 15000, '345621', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('160326', 'Devcast', 12, 20000, 10000, '345621', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('538006', 'Dynava', 13, 15000, 5000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('364951', 'Avamm', 14, 30000, 15000, '345216', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('056106', 'Rhybox', 15, 20000, 10000, '235461', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('689349', 'Yoveo', 16, 15000, 5000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('655790', 'Twitterlist', 17, 15000, 5000, '123456', '245673');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('364748', 'Rhynyx', 18, 20000, 10000, '235461', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('598034', 'Chatterpoint', 19, 15000, 5000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('128006', 'Twitterwire', 20, 30000, 15000, '345216', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('591254', 'Viva', 21, 10000, 5000, '235461', '245673');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('849299', 'Aibox', 22, 20000, 10000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('420625', 'Abatz', 23, 10000, 5000, '345216', '772345');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('670920', 'Eabox', 24, 10000, 5000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('914345', 'Realcube', 25, 15000, 5000, '345216', '254376');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('902269', 'Yabox', 26, 10000, 5000, '345216', '254376');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('137778', 'Browseblab', 27, 20000, 10000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('429443', 'Jetpulse', 28, 10000, 5000, '235461', '254376');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('234585', 'Shufflebeat', 29, 15000, 5000, '345621', '245673');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('056113', 'Jaxbean', 30, 10000, 5000, '345621', '245673');

insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770001, '118560', 10, '2021/09/27');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770002, '056113', 5, '2021/05/02');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770003, '234585', 6, '2021/08/16');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770004, '137778', 12, '2021/03/06');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770005, '670920', 24, '2021/05/04');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770006, '420625', 3, '2020/10/20');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770007, '598034', 5, '2021/07/01');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770008, '128006', 6, '2021/08/19');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770009, '538006', 2, '2021/10/14');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770010, '265891', 8, '2021/04/20');
 
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800001', '020102', '2021/10/02', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800002', '621456', '2021/07/29', '888853', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800003', '579502', '2021/05/03', '305962', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800004', '020102', '2021/08/26', '613721', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800005', '047222', '2021/08/06', '176240', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800006', '579502', '2020/11/26', '613721', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800007', '047222', '2021/07/09', '844256', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800008', '047222', '2021/02/26', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800009', '047222', '2021/07/24', '541710', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800010', '020102', '2021/06/20', '305962', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800011', '621456', '2021/06/04', '888853', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800012', '047222', '2021/01/15', '844256', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800013', '579502', '2021/01/30', '109219', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800014', '047222', '2021/07/06', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800015', '020102', '2021/04/12', '176240', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800016', '047222', '2021/09/13', '109219', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800017', '710507', '2021/05/10', '305962', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800018', '621456', '2021/06/08', '541710', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800019', '047222', '2021/08/16', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800020', '047222', '2021/09/09', '844256', null);

insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200001', '607444', '2017/07/05', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200002', '607444', '2016/09/03', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200003', '607444', '2017/06/02', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200004', '607444', '2016/01/29', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200005', '607444', '2018/11/25', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200006', '607444', '2018/12/11', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200007', '607444', '2017/12/24', '975620', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200008', '607444', '2017/12/15', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200009', '607444', '2019/03/09', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200010', '607444', '2018/11/22', '975620', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200011', '607444', '2018/10/01', '975620', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200012', '607444', '2015/06/05', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200013', '607444', '2016/09/09', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200014', '322655', '2019/05/02', '756398', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200015', '322655', '2018/09/25', '756398', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200016', '322655', '2018/09/15', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200017', '322655', '2017/01/31', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200018', '322655', '2019/11/10', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200019', '322655', '2018/12/21', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200020', '322655', '2019/05/18', '756398', null);

insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '558190', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800002', '822499', 7, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800003', '118560', 8, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800004', '558190', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800005', '558190', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800006', '822499', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800007', '743246', 7, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800008', '743246', 8, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800009', '118560', 2, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800010', '743246', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800011', '230089', 8, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800012', '230089', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800013', '230089', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800014', '230089', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800015', '822499', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800016', '315647', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800017', '267257', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800018', '267257', 2, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800019', '267257', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800020', '045156', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800011', '558190', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800012', '822499', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800013', '118560', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800014', '558190', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800015', '558190', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800016', '822499', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800017', '743246', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800018', '743246', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800019', '118560', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '743246', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '230089', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800002', '230089', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800003', '230089', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800004', '230089', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800005', '822499', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800006', '315647', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800007', '267257', 2, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800008', '267257', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800009', '267257', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '045156', 2, null, null);


insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200001', '822499', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200001', '118560', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200002', '822499', 70, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200003', '558190', 80, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200004', '743246', 90, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200005', '230089', 40, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200006', '315647', 40, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200007', '796207', 40, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200008', '267257', 40, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200009', '045156', 50, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200010', '265891', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200011', '550261', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200012', '538006', 70, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200013', '364951', 90, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200014', '056106', 40, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200015', '689349', 40, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200016', '364748', 60, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200017', '655790', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200018', '598034', 50, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200019', '128006', 70, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200020', '591254', 60, 15000, null, null);


