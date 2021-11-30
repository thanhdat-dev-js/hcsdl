-- ma:                                  CHAR(12)            12 ky tu bao gom A-Z, 0-9, co the chon ma chi dung so
-- ho/ten:                              VARCHAR(20)
-- ten day du:                          VARCHAR(40)
-- email:                               VARCHAR(60)
-- sdt:                                 CHAR(10)
-- dia chi:                             VARCHAR(200)
-- cccd:                                CHAR(12)
-- tien:                                DECIMAL(11, 2)      max = 10^9 = 1 ty

DROP SCHEMA IF EXISTS sahafake;

CREATE SCHEMA sahafake;

USE sahafake;

CREATE TABLE chi_nhanh (
    ma                      CHAR(12)        PRIMARY KEY,
    ten                     VARCHAR(40)     NOT NULL,
    email                   VARCHAR(60)     NOT NULL    CHECK (email LIKE '%@%'),
    dia_chi                 VARCHAR(200)    NOT NULL
);

CREATE TABLE sdt_chi_nhanh (
    ma_chi_nhanh            CHAR(12)        NOT NULL,
    sdt                     CHAR(10)        NOT NULL,
    PRIMARY KEY (ma_chi_nhanh, sdt)
);

CREATE TABLE nhan_vien (
    ma                      CHAR(12)        PRIMARY KEY,
    ho                      VARCHAR(20),
    ten                     VARCHAR(20)     NOT NULL,
    ngay_sinh               DATE            NOT NULL,
    email                   VARCHAR(60)     NOT NULL UNIQUE,
    sdt                     CHAR(10)        NOT NULL UNIQUE,
    dia_chi                 VARCHAR(200),
    cccd                    CHAR(12)        NOT NULL UNIQUE,
    luong                   DECIMAL(11, 2)  NOT NULL,
    thoi_gian_bat_dau_lam   DATE            NOT NULL,
    ma_chi_nhanh            CHAR(12)        NOT NULL,
    ma_quan_ly              CHAR(12)        NOT NULL
);

CREATE TABLE thu_ngan (
    ma                      CHAR(12)        NOT NULL,
    ma_quay                 CHAR(12)        NOT NULL,
    doanh_so                DECIMAL(11,2)   NOT NULL
);

CREATE TABLE quan_ly (
    ma                      CHAR(12)        PRIMARY KEY,
    ma_chi_nhanh            CHAR(12)        NOT NULL
);

CREATE TABLE don_hang (
    ma                      CHAR(12)        PRIMARY KEY,
    ngay_tao                DATE            NOT NULL,
    so_luong                INT             NOT NULL,
    tong_tien               DECIMAL(11,2)   NOT NULL,
    ma_thu_ngan             CHAR(12)        NOT NULL,
    ma_thanh_vien           CHAR(12),
    ma_quan_ly              CHAR(12)        NOT NULL
);

CREATE TABLE bao_gom (
    ma_don                  CHAR(12)        NOT NULL,
    ma_quyen_sach           CHAR(12)        NOT NULL,
    PRIMARY KEY (ma_don, ma_quyen_sach)
);

CREATE TABLE don_hang_online (
    ma                      CHAR(12)        PRIMARY KEY,
    ngay_dat                DATE            NOT NULL,
    so_luong                INT             NOT NULL,
    tong_tien               DECIMAL(10,2)   NOT NULL,
    ma_thanh_vien           CHAR(12)        NOT NULL,
    ma_don_offline          CHAR(12)
);

CREATE TABLE bao_gom_online (
    ma_don                  CHAR(12)        NOT NULL,
    ma_dau_sach             CHAR(12)        NOT NULL,
    so_luong                INT             NOT NULL,
    PRIMARY KEY (ma_don, ma_dau_sach)
);

CREATE TABLE thanh_vien (
    cccd                    CHAR(12)        PRIMARY KEY,
    ho                      VARCHAR(20)     NOT NULL,
    ten                     VARCHAR(20)     NOT NULL,
    email                   VARCHAR(60)     NOT NULL UNIQUE,
    sdt                     CHAR(10)        UNIQUE,
    dia_chi                 VARCHAR(200)
);

CREATE TABLE dau_sach (
    ma                      CHAR(12)        PRIMARY KEY,
    ten                     VARCHAR(40)     NOT NULL,
    tac_gia                 VARCHAR(50)     NOT NULL,
    the_loai                VARCHAR(255),
    gia_nhap                DECIMAL(11, 2)  NOT NULL,
    gia_niem_yet            DECIMAL(11, 2)  NOT NULL,
    so_luong                INT             NOT NULL,
    ma_nha_xuat_ban         CHAR(12)        NOT NULL
);

CREATE TABLE quyen_sach (
    ma                      CHAR(12)        NOT NULL,
    ma_dau_sach             CHAR(12)        NOT NULL,
    ma_chi_nhanh            CHAR(12)        NOT NULL,
    PRIMARY KEY (ma, ma_dau_sach)
);

CREATE TABLE nha_xuat_ban (
    ma                      CHAR(12)        PRIMARY KEY,
    ten                     VARCHAR(40)     NOT NULL,
    email                   VARCHAR(60)     NOT NULL UNIQUE,
    sdt                     CHAR(10)        UNIQUE,
    dia_chi                 VARCHAR(200),
    website                 VARCHAR(255)
);


CREATE TABLE voucher (
    ma                      CHAR(12)        PRIMARY KEY,
    thoi_gian_bat_dau_hieu_luc DATE         NOT NULL,
    thoi_gian_het_hieu_luc  DATE,
    ma_don_hang             CHAR(12),
    ma_thanh_vien           CHAR(12)        NOT NULL,
    da_su_dung              BIT             NOT NULL
);

CREATE TABLE giam_gia (
    ma                      CHAR(12)        PRIMARY KEY,
    phan_tram_giam          DECIMAL(3, 2)   NOT NULL,
    giam_toi_da             DECIMAL(11, 2)
);


CREATE TABLE giam_gia_van_chuyen (
    ma                      CHAR(12)        PRIMARY KEY,
    phan_tram_giam          DECIMAL(3, 2)   NOT NULL,
    giam_toi_da             DECIMAL(11, 2)
);


CREATE TABLE ap_dung_cho (
    ma_voucher              CHAR(12)        NOT NULL,
    ma_dau_sach             CHAR(12)        NOT NULL,
    PRIMARY KEY (ma_voucher, ma_dau_sach)
);



INSERT INTO chi_nhanh(ma, ten, email, dia_chi) VALUES("CNH000000000", "Cơ Sở 1", "lienhe@sahafake.coso1.com", "20/1/3 Đường Số 295, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam");
INSERT INTO chi_nhanh(ma, ten, email, dia_chi) VALUES("CNH000000001", "Cơ Sở 2", "lienhe@sahafake.coso2.com", "7/11A,Đường 182,Phường Tăng Nhơn Phú A,Quận 9,Tp, Thành phố Hồ Chí Minh 70000, Vietnam");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000000");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000001");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000002");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000003");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000000", "Ngô Thanh", "Tuy", STR_TO_DATE("18-3-1997", "%d-%m-%Y"), "ngo.thanh.tuy.1644@sahafake.com", "0989000005", "1 Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000000", 13260000, STR_TO_DATE("23-12-2013", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000001", "Phan Thanh", "Phê", STR_TO_DATE("5-5-1984", "%d-%m-%Y"), "phan.thanh.phe.1645@sahafake.com", "0989000006", "12/86C Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000001", 17680000, STR_TO_DATE("19-3-2020", "%d-%m-%Y"), "CNH000000000", "NVI000000001");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000002", "Trần Gia", "Từ", STR_TO_DATE("4-12-1995", "%d-%m-%Y"), "tran.gia.tu.1646@sahafake.com", "0989000007", "Lô I5-3a, 3b, Khu Công Nghệ Cao, Tăng Nhơn Phú A, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam", "070802000002", 8840000, STR_TO_DATE("3-7-2016", "%d-%m-%Y"), "CNH000000000", "NVI000000001");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000003", "Lý Anh", "Thể", STR_TO_DATE("31-7-1981", "%d-%m-%Y"), "ly.anh.the.1647@sahafake.com", "0989000008", "Lô I5-1, đường N7, Khu Công Nghệ Cao, Phường Tăng Nhơn Phú A, Hồ Chí Minh, Vietnam", "070802000003", 13260000, STR_TO_DATE("9-11-2015", "%d-%m-%Y"), "CNH000000000", "NVI000000001");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000004", "Phạm", "Tiêu", STR_TO_DATE("9-5-1991", "%d-%m-%Y"), "pham.tieu.1648@sahafake.com", "0989000009", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000004", 17680000, STR_TO_DATE("29-12-2012", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000005", "Lê Thanh", "Thư", STR_TO_DATE("6-12-1992", "%d-%m-%Y"), "le.thanh.thu.1649@sahafake.com", "0989000010", "15D Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000005", 8840000, STR_TO_DATE("5-9-2017", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000006", "Dương Thanh", "Hạc", STR_TO_DATE("19-7-1985", "%d-%m-%Y"), "duong.thanh.hac.1650@sahafake.com", "0989000011", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000006", 17680000, STR_TO_DATE("27-5-2012", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000007", "Lê Thanh", "Chuyển", STR_TO_DATE("27-1-1991", "%d-%m-%Y"), "le.thanh.chuyen.1651@sahafake.com", "0989000012", "14A Số 12, Khu Phố 4, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000007", 17680000, STR_TO_DATE("6-12-2010", "%d-%m-%Y"), "CNH000000000", "NVI000000001");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000008", "Phan Anh", "Giai", STR_TO_DATE("18-5-1983", "%d-%m-%Y"), "phan.anh.giai.1652@sahafake.com", "0989000013", "72 Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000008", 4420000, STR_TO_DATE("7-1-2021", "%d-%m-%Y"), "CNH000000000", "NVI000000001");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000009", "Lý Anh", "Loan", STR_TO_DATE("1-11-1985", "%d-%m-%Y"), "ly.anh.loan.1653@sahafake.com", "0989000014", "Lot I-5C Saigon Hi-Tech Park, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000009", 4420000, STR_TO_DATE("20-5-2019", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000006", "QUA000000000", 19340000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000008", "QUA000000001", 17916000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000007", "QUA000000002", 13120000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000000", "QUA000000003", 17754000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000002", "QUA000000004", 10495000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000005", "QUA000000005", 10134000);
INSERT INTO quan_ly(ma, ma_chi_nhanh) VALUES("NVI000000001", "CNH000000000");
INSERT INTO quan_ly(ma, ma_chi_nhanh) VALUES("NVI000000004", "CNH000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000000", STR_TO_DATE("12-5-2021", "%d-%m-%Y"), 2, 5350000, "NVI000000008", "070802000011", "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000001", STR_TO_DATE("10-1-2020", "%d-%m-%Y"), 2, 5462000, "NVI000000002", null, "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000002", STR_TO_DATE("12-7-2020", "%d-%m-%Y"), 2, 5232000, "NVI000000007", "070802000012", "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000003", STR_TO_DATE("8-2-2021", "%d-%m-%Y"), 1, 466000, "NVI000000005", "070802000010", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000004", STR_TO_DATE("17-10-2021", "%d-%m-%Y"), 2, 1726000, "NVI000000006", "070802000011", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000005", STR_TO_DATE("14-6-2021", "%d-%m-%Y"), 2, 3761000, "NVI000000000", "070802000010", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000006", STR_TO_DATE("28-8-2020", "%d-%m-%Y"), 1, 1801000, "NVI000000005", "070802000012", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000007", STR_TO_DATE("2-1-2020", "%d-%m-%Y"), 1, 280000, "NVI000000008", "070802000012", "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000008", STR_TO_DATE("31-3-2021", "%d-%m-%Y"), 2, 4302000, "NVI000000002", null, "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000009", STR_TO_DATE("27-1-2020", "%d-%m-%Y"), 1, 466000, "NVI000000007", null, "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000010", STR_TO_DATE("6-4-2021", "%d-%m-%Y"), 1, 1834000, "NVI000000000", "070802000010", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000011", STR_TO_DATE("5-10-2020", "%d-%m-%Y"), 2, 4241000, "NVI000000006", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000012", STR_TO_DATE("6-2-2020", "%d-%m-%Y"), 1, 1801000, "NVI000000002", "070802000011", "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000013", STR_TO_DATE("21-11-2020", "%d-%m-%Y"), 1, 466000, "NVI000000006", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000014", STR_TO_DATE("13-9-2021", "%d-%m-%Y"), 2, 4565000, "NVI000000005", "070802000012", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000015", STR_TO_DATE("18-4-2020", "%d-%m-%Y"), 2, 4532000, "NVI000000008", "070802000011", "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000016", STR_TO_DATE("24-2-2020", "%d-%m-%Y"), 1, 466000, "NVI000000000", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000017", STR_TO_DATE("14-5-2021", "%d-%m-%Y"), 2, 2649000, "NVI000000007", null, "NVI000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000018", STR_TO_DATE("26-5-2020", "%d-%m-%Y"), 1, 2731000, "NVI000000000", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000019", STR_TO_DATE("22-11-2021", "%d-%m-%Y"), 1, 2501000, "NVI000000008", null, "NVI000000001");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000018", "QSA000000043");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000011", "QSA000000045");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000012", "QSA000000000");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000019", "QSA000000014");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000000", "QSA000000041");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000001", "QSA000000028");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000007", "QSA000000056");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000008", "QSA000000009");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000015", "QSA000000035");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000017", "QSA000000092");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000003", "QSA000000010");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000009", "QSA000000044");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000016", "QSA000000037");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000002", "QSA000000032");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000006", "QSA000000016");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000004", "QSA000000095");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000014", "QSA000000011");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000013", "QSA000000091");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000005", "QSA000000024");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000010", "QSA000000090");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000001", "QSA000000074");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000017", "QSA000000067");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000000", "QSA000000087");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000011", "QSA000000078");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000005", "QSA000000025");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000014", "QSA000000073");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000015", "QSA000000042");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000004", "QSA000000075");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000008", "QSA000000031");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000002", "QSA000000098");
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000000", STR_TO_DATE("20-3-2020", "%d-%m-%Y"), 7, 12607000, "070802000010", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000001", STR_TO_DATE("5-3-2021", "%d-%m-%Y"), 3, 3780000, "070802000012", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000002", STR_TO_DATE("7-8-2020", "%d-%m-%Y"), 12, 4290000, "070802000011", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000003", STR_TO_DATE("28-3-2020", "%d-%m-%Y"), 7, 18573000, "070802000011", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000004", STR_TO_DATE("8-6-2021", "%d-%m-%Y"), 1, 892000, "070802000012", null);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000004", "DSA000000009", 1);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000003", "DSA000000004", 5);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000001", "DSA000000008", 3);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000002", "DSA000000000", 7);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000000", "DSA000000006", 7);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000003", "DSA000000007", 2);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000002", "DSA000000003", 5);
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000010", "Lý Thanh", "Thuận", "ly.thanh.thuan.1654@gmail.com", "0989000015", "262 Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam");
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000011", "Võ Gia", "Bố", "vo.gia.bo.1655@gmail.com", "0989000016", "Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000012", "Vũ", "Chiêu", "vu.chieu.1656@gmail.com", "0989000017", "179 Đ. Lê Văn Việt, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000000", "Giao tiếp tiếng Nhật", "Võ Hạo", "giáo dục", 252000, 280000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000001", "Chú bé đội mũ trắng", "Võ Thanh Hạp", "kỹ năng", 2132000, 2369000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000002", "Đam mê để làm gì", "Đặng Cung", "kỹ năng", 2457000, 2731000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000003", "Những người vui sướng", "Hồ Thanh Xa", "truyện", 419000, 466000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000004", "Nhà hóa học", "Lý Thanh Tụng", "truyện", 2682000, 2981000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000005", "Chúa và con người", "Huỳnh Thanh Giai", "kiến thức", 2250000, 2501000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000006", "Lời giải tiếng Anh 12", "Hồ Trực", "giáo dục", 1620000, 1801000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000007", "Đọc nhanh cảm xúc và ngôn ngữ cơ thể", "Huỳnh Thoa", "kỹ năng", 1650000, 1834000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000008", "Vãn tình", "Lý Thanh Khai", "truyện", 1134000, 1260000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000009", "Ngệ thuật làm tiền", "Dương Thụ", "kỹ năng", 802000, 892000, 10, "NXB000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000000", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000001", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000002", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000003", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000004", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000005", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000006", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000007", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000008", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000009", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000010", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000011", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000012", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000013", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000014", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000015", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000016", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000017", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000018", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000019", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000020", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000021", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000022", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000023", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000024", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000025", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000026", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000027", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000028", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000029", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000030", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000031", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000032", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000033", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000034", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000035", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000036", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000037", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000038", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000039", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000040", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000041", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000042", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000043", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000044", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000045", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000046", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000047", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000048", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000049", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000050", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000051", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000052", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000053", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000054", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000055", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000056", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000057", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000058", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000059", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000060", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000061", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000062", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000063", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000064", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000065", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000066", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000067", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000068", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000069", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000070", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000071", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000072", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000073", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000074", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000075", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000076", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000077", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000078", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000079", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000080", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000081", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000082", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000083", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000084", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000085", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000086", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000087", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000088", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000089", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000090", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000091", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000092", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000093", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000094", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000095", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000096", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000097", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000098", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000099", "DSA000000006", "CNH000000000");
INSERT INTO nha_xuat_ban(ma, ten, email, sdt, dia_chi, website) VALUES("NXB000000000", "Hồng Đức", "lienhe@hongduc.com", "0989000018", "65 Tràng Thi, Hà Nội", "www.hongduc.com");
INSERT INTO nha_xuat_ban(ma, ten, email, sdt, dia_chi, website) VALUES("NXB000000001", "Kim đồng", "lienhe@kimdong.com", "0989000019", "55 Quang Trung, Hà Nội, Việt Nam", "www.kimdong.com");
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000000", STR_TO_DATE("24-4-2021", "%d-%m-%Y"), STR_TO_DATE("14-11-2021", "%d-%m-%Y"), null, "070802000012", False);
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000001", STR_TO_DATE("12-1-2021", "%d-%m-%Y"), STR_TO_DATE("13-4-2021", "%d-%m-%Y"), null, "070802000011", False);
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000002", STR_TO_DATE("2-1-2021", "%d-%m-%Y"), STR_TO_DATE("3-1-2021", "%d-%m-%Y"), null, "070802000010", False);
INSERT INTO giam_gia(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000000", 0.48, 629000);
INSERT INTO giam_gia_van_chuyen(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000001", 0.9, 41000);
INSERT INTO giam_gia_van_chuyen(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000002", 0.56, 30000);
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000000", "DSA000000009");
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000000", "DSA000000005");
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000000", "DSA000000008");



ALTER TABLE
    sdt_chi_nhanh
ADD
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma) ON DELETE CASCADE;

ALTER TABLE
    nhan_vien
ADD
    FOREIGN KEY (ma_quan_ly) REFERENCES nhan_vien(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma) ON DELETE CASCADE;

ALTER TABLE
    thu_ngan
ADD
    FOREIGN KEY (ma) REFERENCES nhan_vien(ma) ON DELETE CASCADE;

ALTER TABLE
    quan_ly
ADD
    FOREIGN KEY (ma) REFERENCES nhan_vien(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma) ON DELETE CASCADE;

ALTER TABLE
    don_hang
ADD
    FOREIGN KEY (ma_thu_ngan) REFERENCES thu_ngan(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_thanh_vien) REFERENCES thanh_vien(cccd) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_quan_ly) REFERENCES quan_ly(ma) ON DELETE CASCADE;

ALTER TABLE
    bao_gom
ADD
    FOREIGN KEY (ma_don) REFERENCES don_hang(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_quyen_sach) REFERENCES quyen_sach(ma) ON DELETE CASCADE;

ALTER TABLE
    don_hang_online
ADD
    FOREIGN KEY (ma_thanh_vien) REFERENCES thanh_vien(cccd) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_don_offline) REFERENCES don_hang(ma) ON DELETE CASCADE;

ALTER TABLE
    bao_gom_online
ADD
    FOREIGN KEY (ma_don) REFERENCES don_hang_online(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_dau_sach) REFERENCES dau_sach(ma) ON DELETE CASCADE;

ALTER TABLE
    dau_sach
ADD
    FOREIGN KEY (ma_nha_xuat_ban) REFERENCES nha_xuat_ban(ma) ON DELETE CASCADE;

ALTER TABLE
    quyen_sach
ADD
    FOREIGN KEY (ma_dau_sach) REFERENCES dau_sach(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma) ON DELETE CASCADE;

ALTER TABLE
    voucher
ADD
    FOREIGN KEY (ma_don_hang) REFERENCES don_hang(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_thanh_vien) REFERENCES thanh_vien(cccd) ON DELETE CASCADE;

ALTER TABLE
    giam_gia
ADD
    FOREIGN KEY (ma) REFERENCES voucher(ma) ON DELETE CASCADE;

ALTER TABLE
    giam_gia_van_chuyen
ADD
    FOREIGN KEY (ma) REFERENCES voucher(ma) ON DELETE CASCADE;

ALTER TABLE
    ap_dung_cho
ADD
    FOREIGN KEY (ma_voucher) REFERENCES voucher(ma) ON DELETE CASCADE,
ADD
    FOREIGN KEY (ma_dau_sach) REFERENCES dau_sach(ma) ON DELETE CASCADE;
