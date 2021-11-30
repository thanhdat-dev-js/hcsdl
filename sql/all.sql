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



INSERT INTO chi_nhanh(ma, ten, email, dia_chi) VALUES("CNH000000000", "Cơ Sở 1", "lienhe@sahafake.coso1.com", "43 Đường Số 245, khu phố 5, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam");
INSERT INTO chi_nhanh(ma, ten, email, dia_chi) VALUES("CNH000000001", "Cơ Sở 2", "lienhe@sahafake.coso2.com", "7/11A,Đường 182,Phường Tăng Nhơn Phú A,Quận 9,Tp, Thành phố Hồ Chí Minh 70000, Vietnam");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000000");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000001");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000002");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000003");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000000", "Hồ Gia", "Kỷ", STR_TO_DATE("17-8-1993", "%d-%m-%Y"), "ho.gia.ky.6128@sahafake.com", "0989000005", "1 Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000000", 8840000, STR_TO_DATE("6-6-2018", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000001", "Võ", "Khảng", STR_TO_DATE("16-4-1999", "%d-%m-%Y"), "vo.khang.6129@sahafake.com", "0989000006", "179 Đ. Lê Văn Việt, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000001", 13260000, STR_TO_DATE("12-1-2014", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000002", "Lý Thanh", "Thắng", STR_TO_DATE("3-9-1983", "%d-%m-%Y"), "ly.thanh.thang.6130@sahafake.com", "0989000007", "4 Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000002", 8840000, STR_TO_DATE("12-2-2016", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000003", "Lý Thanh", "Trứ", STR_TO_DATE("30-11-1985", "%d-%m-%Y"), "ly.thanh.tru.6131@sahafake.com", "0989000008", "15D Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000003", 8840000, STR_TO_DATE("13-10-2017", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000004", "Hoàng", "Bốn", STR_TO_DATE("23-9-1985", "%d-%m-%Y"), "hoang.bon.6132@sahafake.com", "0989000009", "Lô I5-3a, 3b, Khu Công Nghệ Cao, Tăng Nhơn Phú A, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam", "070802000004", 17680000, STR_TO_DATE("19-10-2015", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000005", "Bùi", "Hào", STR_TO_DATE("15-7-1981", "%d-%m-%Y"), "bui.hao.6133@sahafake.com", "0989000010", "14A Số 12, Khu Phố 4, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000005", 4420000, STR_TO_DATE("29-9-2021", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000006", "Lê Anh", "Hựu", STR_TO_DATE("7-8-1986", "%d-%m-%Y"), "le.anh.huu.6134@sahafake.com", "0989000011", "Lô I5-1, đường N7, Khu Công Nghệ Cao, Phường Tăng Nhơn Phú A, Hồ Chí Minh, Vietnam", "070802000006", 17680000, STR_TO_DATE("10-3-2012", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000007", "Hoàng Gia", "Hộ", STR_TO_DATE("18-8-1989", "%d-%m-%Y"), "hoang.gia.ho.6135@sahafake.com", "0989000012", "Lot I-5C Saigon Hi-Tech Park, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000007", 8840000, STR_TO_DATE("30-10-2016", "%d-%m-%Y"), "CNH000000001", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000008", "Lý Thanh", "Ðược", STR_TO_DATE("21-9-1998", "%d-%m-%Y"), "ly.thanh.ðuoc.6136@sahafake.com", "0989000013", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000008", 17680000, STR_TO_DATE("19-2-2021", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000009", "Huỳnh", "Tiết", STR_TO_DATE("22-8-1981", "%d-%m-%Y"), "huynh.tiet.6137@sahafake.com", "0989000014", "Khu Công Nghệ Cao, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000009", 17680000, STR_TO_DATE("10-6-2010", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000005", "QUA000000000", 10640000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000002", "QUA000000001", 6821000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000006", "QUA000000002", 9881000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000000", "QUA000000003", 2875000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000001", "QUA000000004", 5710000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000003", "QUA000000005", 2990000);
INSERT INTO quan_ly(ma, ma_chi_nhanh) VALUES("NVI000000008", "CNH000000000");
INSERT INTO quan_ly(ma, ma_chi_nhanh) VALUES("NVI000000004", "CNH000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000000", STR_TO_DATE("15-11-2020", "%d-%m-%Y"), 2, 4161000, "NVI000000005", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000001", STR_TO_DATE("7-4-2021", "%d-%m-%Y"), 1, 273000, "NVI000000003", "070802000011", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000002", STR_TO_DATE("10-7-2020", "%d-%m-%Y"), 1, 1222000, "NVI000000000", "070802000012", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000003", STR_TO_DATE("18-7-2021", "%d-%m-%Y"), 1, 158000, "NVI000000001", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000004", STR_TO_DATE("12-9-2021", "%d-%m-%Y"), 1, 2121000, "NVI000000006", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000005", STR_TO_DATE("22-11-2021", "%d-%m-%Y"), 2, 2804000, "NVI000000002", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000006", STR_TO_DATE("23-11-2020", "%d-%m-%Y"), 2, 956000, "NVI000000001", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000007", STR_TO_DATE("21-4-2020", "%d-%m-%Y"), 2, 431000, "NVI000000000", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000008", STR_TO_DATE("4-1-2021", "%d-%m-%Y"), 1, 265000, "NVI000000003", "070802000010", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000009", STR_TO_DATE("6-10-2021", "%d-%m-%Y"), 1, 1043000, "NVI000000002", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000010", STR_TO_DATE("18-4-2021", "%d-%m-%Y"), 1, 2701000, "NVI000000005", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000011", STR_TO_DATE("8-8-2021", "%d-%m-%Y"), 2, 4596000, "NVI000000006", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000012", STR_TO_DATE("8-8-2020", "%d-%m-%Y"), 2, 1922000, "NVI000000003", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000013", STR_TO_DATE("24-1-2021", "%d-%m-%Y"), 1, 1222000, "NVI000000000", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000014", STR_TO_DATE("27-3-2020", "%d-%m-%Y"), 1, 1657000, "NVI000000005", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000015", STR_TO_DATE("13-2-2021", "%d-%m-%Y"), 2, 3164000, "NVI000000006", "070802000012", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000016", STR_TO_DATE("1-6-2020", "%d-%m-%Y"), 2, 4596000, "NVI000000001", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000017", STR_TO_DATE("21-10-2021", "%d-%m-%Y"), 2, 2974000, "NVI000000002", "070802000011", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000018", STR_TO_DATE("23-1-2021", "%d-%m-%Y"), 2, 530000, "NVI000000003", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000019", STR_TO_DATE("10-5-2020", "%d-%m-%Y"), 1, 2121000, "NVI000000005", null, "NVI000000008");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000019", "QSA000000013");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000015", "QSA000000077");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000010", "QSA000000073");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000014", "QSA000000091");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000009", "QSA000000046");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000001", "QSA000000086");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000006", "QSA000000079");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000002", "QSA000000080");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000017", "QSA000000022");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000016", "QSA000000058");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000012", "QSA000000017");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000013", "QSA000000064");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000005", "QSA000000034");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000004", "QSA000000036");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000000", "QSA000000026");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000003", "QSA000000096");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000007", "QSA000000021");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000011", "QSA000000047");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000008", "QSA000000093");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000018", "QSA000000055");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000000", "QSA000000041");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000005", "QSA000000097");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000007", "QSA000000004");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000018", "QSA000000031");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000012", "QSA000000062");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000016", "QSA000000053");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000006", "QSA000000085");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000015", "QSA000000094");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000017", "QSA000000051");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000011", "QSA000000076");
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000000", STR_TO_DATE("29-6-2020", "%d-%m-%Y"), 5, 7927000, "070802000012", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000001", STR_TO_DATE("21-11-2021", "%d-%m-%Y"), 7, 1855000, "070802000011", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000002", STR_TO_DATE("25-9-2021", "%d-%m-%Y"), 6, 7332000, "070802000010", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000003", STR_TO_DATE("10-2-2020", "%d-%m-%Y"), 18, 40266000, "070802000010", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000004", STR_TO_DATE("2-6-2021", "%d-%m-%Y"), 4, 8484000, "070802000012", null);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000000", "DSA000000006", 2);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000003", "DSA000000003", 8);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000001", "DSA000000005", 7);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000002", "DSA000000008", 6);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000004", "DSA000000004", 4);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000000", "DSA000000000", 3);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000003", "DSA000000007", 10);
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000010", "Trần Thanh", "Hanh", "tran.thanh.hanh.6138@gmail.com", "0989000015", "12/86C Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000011", "Nguyễn Gia", "Luận", "nguyen.gia.luan.6139@gmail.com", "0989000016", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000012", "Lê", "Cử", "le.cu.6140@gmail.com", "0989000017", "RQQW+HJX, Tăng Nhơn Phú A, Quận 9, Quận 9 Hồ Chí Minh, Vietnam");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000000", "Những người vui sướng", "Trần Thanh Nhu", "truyện", 614000, 683000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000001", "Chinh phục IELTS", "Vũ Gia Doãn", "giáo dục", 938000, 1043000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000002", "Những con người vĩ đại", "Đỗ Trân", "truyện", 142000, 158000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000003", "Tâm lý học đặc biệt", "Hoàng Gia Huynh", "kiến thức", 1491000, 1657000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000004", "Chúa và con người", "Dương Gia Diêm", "kiến thức", 1908000, 2121000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000005", "WWW 2021", "Nguyễn Quyết", "kiến thức", 238000, 265000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000006", "Giao tiếp tiếng Nhật", "Ngô Anh Nghi", "giáo dục", 2645000, 2939000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000007", "Nhà hóa học", "Nguyễn Anh Phàm", "truyện", 2430000, 2701000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000008", "Đòi nợ", "Đặng Thanh Xuân", "truyện", 1099000, 1222000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000009", "Nghệ thuật đầu tư", "Lý Anh Ngãi", "kỹ năng", 245000, 273000, 10, "NXB000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000000", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000001", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000002", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000003", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000004", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000005", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000006", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000007", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000008", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000009", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000010", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000011", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000012", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000013", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000014", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000015", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000016", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000017", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000018", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000019", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000020", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000021", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000022", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000023", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000024", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000025", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000026", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000027", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000028", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000029", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000030", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000031", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000032", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000033", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000034", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000035", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000036", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000037", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000038", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000039", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000040", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000041", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000042", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000043", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000044", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000045", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000046", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000047", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000048", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000049", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000050", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000051", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000052", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000053", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000054", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000055", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000056", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000057", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000058", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000059", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000060", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000061", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000062", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000063", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000064", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000065", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000066", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000067", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000068", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000069", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000070", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000071", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000072", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000073", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000074", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000075", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000076", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000077", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000078", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000079", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000080", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000081", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000082", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000083", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000084", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000085", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000086", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000087", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000088", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000089", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000090", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000091", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000092", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000093", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000094", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000095", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000096", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000097", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000098", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000099", "DSA000000000", "CNH000000001");
INSERT INTO nha_xuat_ban(ma, ten, email, sdt, dia_chi, website) VALUES("NXB000000000", "Hồng Đức", "lienhe@hongduc.com", "0989000018", "65 Tràng Thi, Hà Nội", "www.hongduc.com");
INSERT INTO nha_xuat_ban(ma, ten, email, sdt, dia_chi, website) VALUES("NXB000000001", "Kim đồng", "lienhe@kimdong.com", "0989000019", "55 Quang Trung, Hà Nội, Việt Nam", "www.kimdong.com");
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000000", STR_TO_DATE("5-8-2021", "%d-%m-%Y"), STR_TO_DATE("20-9-2021", "%d-%m-%Y"), null, "070802000011", False);
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000001", STR_TO_DATE("24-2-2021", "%d-%m-%Y"), STR_TO_DATE("18-11-2021", "%d-%m-%Y"), null, "070802000012", False);
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000002", STR_TO_DATE("22-2-2021", "%d-%m-%Y"), STR_TO_DATE("12-5-2021", "%d-%m-%Y"), null, "070802000010", False);
INSERT INTO giam_gia(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000002", 0.74, 989000);
INSERT INTO giam_gia_van_chuyen(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000000", 0.74, 23000);
INSERT INTO giam_gia_van_chuyen(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000001", 0.79, 22000);
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000002", "DSA000000002");
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000002", "DSA000000008");
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000002", "DSA000000000");



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
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_dau_sach`(
    IN `gia_nhap` DECIMAL(11, 2),
    IN `gia_niem_yet` DECIMAL(11, 2),
    IN `ma_nha_xuat_ban` CHAR(12),
    IN `so_luong` INT(11),
    IN `tac_gia` VARCHAR(50),
    IN `ten` VARCHAR(40),
    IN `the_loai` VARCHAR(255)
)
BEGIN
    DECLARE ma CHAR(12) ;
    SET ma =( SELECT MAX(dau_sach.ma) FROM dau_sach) ;
    SET ma = next_id(ma) ;

    IF gia_nhap < gia_niem_yet AND so_luong > 0 THEN
        INSERT INTO dau_sach( gia_nhap, gia_niem_yet, ma, ma_nha_xuat_ban, so_luong, tac_gia, ten, the_loai)
        VALUES( gia_nhap, gia_niem_yet, ma, ma_nha_xuat_ban, so_luong, tac_gia, ten, the_loai) ;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "gia niem yet phai lon hon gia nhap va so luong sach phai lon hon 0" ;
    END IF ;
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER `giam_so_luong_dau_sach`
BEFORE INSERT ON `bao_gom_online`
FOR EACH ROW
BEGIN
    DECLARE soluong INT;
    SET soluong = ( SELECT so_luong FROM dau_sach WHERE ma = NEW.ma_dau_sach);

    IF NEW.so_luong > soluong THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'So luong sach khong du';
    ELSE
        UPDATE dau_sach SET so_luong = soluong - NEW.so_luong WHERE ma = NEW.ma_dau_sach;
    END IF;
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER `hoan_so_luong_dau_sach`
AFTER DELETE ON `bao_gom_online`
FOR EACH ROW
BEGIN
    DECLARE soluong INT;
    SET soluong = ( SELECT so_luong FROM dau_sach WHERE ma = OLD.ma_dau_sach);

    UPDATE dau_sach
    SET so_luong = soluong + OLD.so_luong
    WHERE ma = OLD.ma_dau_sach;
END $$
DELIMITER ;


 DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `get_data_1`(
    IN `ten_nha_xuat_ban` VARCHAR(50)
)
BEGIN
    SELECT
        dau_sach.ten AS ten_dau_sach,
        tac_gia,
        the_loai,
        nha_xuat_ban.ten AS ten_nha_xuat_ban,
        gia_niem_yet
    FROM
        dau_sach,
        nha_xuat_ban
    WHERE
        dau_sach.ma_nha_xuat_ban = nha_xuat_ban.ma AND nha_xuat_ban.ten = ten_nha_xuat_ban
    ORDER BY
        gia_niem_yet ;
END $$
DELIMITER ;


DELIMITER $$
CREATE DEFINER = `root`@`localhost`
PROCEDURE `get_data_2`(
    IN `soluong` INT
)
BEGIN
    SELECT
        COUNT(ma_nha_xuat_ban), nha_xuat_ban.ten
    FROM
        dau_sach, nha_xuat_ban
    WHERE
        dau_sach.ma_nha_xuat_ban = nha_xuat_ban.ma
    GROUP BY
        ma_nha_xuat_ban
    HAVING
        COUNT(ma_nha_xuat_ban) > soluong
    ORDER BY
        COUNT(ma_nha_xuat_ban) ;
END $$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_dau_sach_gia_nhap_lon_n` (`gianhap` DECIMAL(11,2)) RETURNS INT(11) BEGIN
DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT gia_nhap from dau_sach;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF gianhap <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số đầu vào (giá nhập) phải > 0';
    END IF;
    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > gianhap
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END$$
DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_dau_sach_it_hon_n_cuon` (`max_sl` INT)
RETURNS INT(11)
BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT so_luong from dau_sach;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF max_sl <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số đầu vào max_sl phải > 0';
    END IF;

    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp < max_sl
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `get_dau_sach`() 
BEGIN
        SELECT * 
        FROM `dau_sach` 
        ORDER BY ma_nha_xuat_ban;
END $$
DELIMITER ;
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_voucher`(
    IN `ma` CHAR(12),
    IN `thoi_gian_bat_dau_hieu_luc` DATE,
    IN `thoi_gian_het_hieu_luc` DATE,
    IN `ma_don_hang` CHAR(12),
    IN `ma_thanh_vien` CHAR(12),
    IN `da_su_dung` BIT
)
BEGIN
    IF thoi_gian_bat_dau_hieu_luc < thoi_gian_het_hieu_luc THEN
        INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung)
        VALUES(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) ;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Thoi gian bat dau hieu luc phai truoc thoi gian het hieu luc (YYYY/MM/DD)" ;
    END IF ;
END $$

-- CALL them_voucher("VC0001234",DATE "2021-10-30",DATE "2021-12-12","DHA000000017","D070802000010",0)
-- CALL them_voucher("VC000123456",DATE "2021-12-30",DATE "2021-12-12","DHA000000018","070802000010",0)


-- DELIMITER $$
-- CREATE TRIGGER `before_giam_gia_insert`
-- BEFORE INSERT ON `voucher`
-- FOR EACH ROW
-- BEGIN
--     DECLARE tongtien DECIMAL(11,2);
--     DECLARE madon CHAR(12);

--     DECLARE giamtheophantram DECIMAL(11,2);
--     DECLARE phantramgiam DECIMAL(3, 2);
--     DECLARE giamtoida DECIMAL(11,2);

--     SET madon = (SELECT ma_don_hang FROM voucher WHERE ma = NEW.ma);
--     SET tongtien = ( SELECT tong_tien FROM don_hang WHERE don_hang.ma = madon );
--     SET phantramgiam = NEW.phan_tram_giam;
--     SET giamtoida = NEW.giam_toi_da;

--     SET giamtheophantram = tongtien * phantramgiam;

--     IF giamtheophantram >= giamtoida THEN
--         UPDATE don_hang SET tong_tien = tongtien - giamtoida WHERE don_hang.ma = madon;
--     ELSE
--         UPDATE don_hang SET tong_tien = tongtien - giamtheophantram WHERE don_hang.ma = madon;
--     END IF;
--     UPDATE voucher SET da_su_dung = 1 WHERE ma = NEW.ma;
-- END $$
-- DELIMITER ;


DELIMITER $$
CREATE TRIGGER `before_danh_dau_insert`
BEFORE INSERT ON `giam_gia`
FOR EACH ROW
BEGIN
    UPDATE voucher SET da_su_dung = 1 WHERE ma = NEW.ma;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER after_xoa_quyen_sach_khoi_bao_gom
AFTER DELETE ON bao_gom
FOR EACH ROW
BEGIN
	DECLARE update_ma_don_hang varchar(12);
    DECLARE update_tong_tien DECIMAL;
    DECLARE update_so_luong INT;
    DECLARE update_tien DECIMAL;
    DECLARE update_ma_dau_sach varchar(12);

    SELECT ma_dau_sach
    INTO update_ma_dau_sach
    FROM quyen_sach
    WHERE quyen_sach.ma = OLD.ma_quyen_sach;

    SELECT so_luong, tong_tien
    INTO update_so_luong, update_tong_tien
    FROM don_hang
    WHERE don_hang.ma= OLD.ma_don;

    SELECT gia_niem_yet
    INTO update_tien
    FROM dau_sach
    WHERE dau_sach.ma = update_ma_dau_sach;

    SET update_tong_tien = update_tong_tien + update_tien;
    set update_so_luong = update_so_luong - 1;

    UPDATE don_hang
    SET so_luong = update_so_luong, tong_tien = update_tong_tien
    WHERE ma = OLD.ma_don;
END $$
DELIMITER ;




DELIMITER $$
CREATE DEFINER = `root`@`localhost`
PROCEDURE `get_voucher`(
IN `sdt_thanh_vien` CHAR(10)
)
BEGIN
SELECT
voucher.ma,
thoi_gian_bat_dau_hieu_luc,
thoi_gian_het_hieu_luc,
thanh_vien.sdt,
da_su_dung
FROM
voucher,
thanh_vien
WHERE
voucher.ma_thanh_vien = thanh_vien.cccd
AND thanh_vien.sdt = sdt_thanh_vien
ORDER BY
voucher.ma;
END $$

-- CALL get_voucher('0989000015')

DELIMITER $$
CREATE DEFINER = `root`@`localhost`
PROCEDURE `get_voucher_1`(
IN `soluong` INT
)
BEGIN
SELECT
COUNT(voucher.ma_thanh_vien),
thanh_vien.ho,
thanh_vien.ten
FROM
thanh_vien,
voucher
WHERE
voucher.ma_thanh_vien = thanh_vien.cccd
GROUP BY
voucher.ma_thanh_vien
HAVING
COUNT(voucher.ma_thanh_vien) > soluong
ORDER BY
COUNT(voucher.ma_thanh_vien) ;
END $$

-- CALL get_voucher_1(1)


DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_voucher_giam_gia_giam_toi_da_lon_hon_n` (`giagiam` DECIMAL(11,2)) RETURNS INT(11) BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT giam_toi_da from giam_gia;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF giagiam <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số giagiam phải > 0';
    END IF;
    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > giagiam
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_voucher_co_thoi_gian_hieu_luc_sau_ngay` (`ngay` DATE) RETURNS INT(11) BEGIN
    DECLARE total INT;
    DECLARE temp DATE;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT thoi_gian_bat_dau_hieu_luc FROM voucher;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;


    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > ngay
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END$$
DELIMITER ;

CREATE INDEX ten_nha_xuat_ban_index ON nha_xuat_ban(ten);
CREATE INDEX sdt_thanh_vien_index ON thanh_vien(sdt);
CREATE INDEX ngay_tao_don_hang_index ON don_hang(ngay_tao);

-- Tạo Mã đơn cho đơn hàng tiếp theo.

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `ma_don_moi`(
    `ma_don` CHAR(12))
RETURNS CHAR(12)
BEGIN
    DECLARE loai_don CHAR(3);
    DECLARE ma_so CHAR(9);
    DECLARE temp INT;

    SET loai_don = LEFT(ma_don, 3);
    SET ma_so = RIGHT(ma_don, 9);
    SET temp = CAST(ma_so AS SIGNED) + 1;
    SET ma_so = LPAD(CAST(temp AS CHAR), 9, "0");

    RETURN CONCAT(loai_don, ma_so);
END $$

DELIMITER ;



-- Tạo Đơn hàng Online mới.

DELIMITER $$

CREATE PROCEDURE `tao_don_hang_online`(
	IN `ma_thanh_vien` CHAR(12))
BEGIN
	DECLARE ma_don CHAR(12);
    SET ma_don = (SELECT MAX(ma) FROM don_hang_online);
	SET ma_don = ma_don_moi(ma_don);
	-- Kiem tra Ma thanh vien nhap vao.
	IF (SELECT COUNT(*) FROM thanh_vien WHERE cccd = ma_thanh_vien) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã Thành viên không tồn tại !";
	END IF;
	-- Tao don hang Online moi
	INSERT INTO don_hang_online
	VALUES (ma_don, CURDATE(), 0, 0, ma_thanh_vien, NULL);

END $$

DELIMITER ;

-- CALL tao_don_hang_online()


-- Thêm Đầu sách vào một Đơn hàng Online đã có

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `them_bao_gom_online` (
	IN `ma_don` CHAR(12),
	IN `ma_dau_sach` CHAR(12),
	IN `so_luong` INT)
BEGIN
	-- Kiem tra ma don hang nhap vao.
	IF (SELECT COUNT(*)  FROM don_hang_online WHERE ma = ma_don) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã Đơn hàng không tồn tại !";
	END IF;
	-- Kiem tra ma dau sach nhap vao.
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_dau_sach) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã đầu sách không tồn tại !";
	END IF;
	-- Kiem tra dau sach dã co trong don hang hay chua
	IF (SELECT COUNT(*)
		FROM bao_gom_online
		WHERE bao_gom_online.ma_don = ma_don AND bao_gom_online.ma_dau_sach = ma_dau_sach ) > 0 THEN

		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Đầu sách đã có trong đơn hàng !";
	END IF;
	-- Kiem tra so luong sach them vao.
	IF so_luong <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Số lượng nhập phải lớn hơn 0";
	END IF;
	-- Them dau sach vao don hang online.
	INSERT INTO bao_gom_online
	VALUES (ma_don, ma_dau_sach, so_luong);
END $$

DELIMITER ;

-- CALL them_bao_gom_online ("DHO000000003", "DSA000000009", 1);

-- Mã đơn hàng không hợp lệ
-- CALL them_bao_gom_online ("DHO000000005", "DSA000000009", 1);

-- Mã đầu sách không hợp lệ
-- CALL them_bao_gom_online ("DHO000000003", "DSA00000000A", 1);

-- Đầu sách đã có trong đơn hàng
-- CALL them_bao_gom_online ("DHO000000003", "DSA000000009", 1);

-- Số lượng không hợp lệ
-- CALL them_bao_gom_online ("DHO000000003", "DSA000000009", 0);

-- Trigger: Cập nhật số lượng và tổng tiền của Đon hàng sau khi thêm sách.

DELIMITER $$

CREATE TRIGGER `them_bao_gom_online`
AFTER INSERT
ON `bao_gom_online` FOR EACH ROW
BEGIN
	DECLARE so_luong_sach INT;
	DECLARE tong_tien_sach DECIMAL(10,2);
	-- Tinh tong so luong sach co trong don hang online.
	SELECT
		SUM(so_luong) INTO so_luong_sach
	FROM
		bao_gom_online
	WHERE
		ma_don = NEW.ma_don;
	-- Tinh tong tien sach cua don hang online.
	SELECT
		SUM(bao_gom_online.so_luong * gia_niem_yet) INTO tong_tien_sach
	FROM
		bao_gom_online,
		dau_sach
	WHERE
		ma_don = NEW.ma_don AND ma_dau_sach = ma;
	-- Cap nhat tong so luong sach, tong tien trong don hang online.
	UPDATE
		don_hang_online
	SET
		so_luong = so_luong_sach,
		tong_tien = tong_tien_sach
	WHERE
		ma = NEW.ma_don;

END $$

DELIMITER ;



-- CALL them_bao_gom_online ("DHO000000000", "DSA000000005", 2);

-- Trigger: Cập nhật số lượng và tổng tiền của Đon hàng sau khi cập nhật số lượng sách.

DELIMITER $$

CREATE TRIGGER `sua_bao_gom_online`
AFTER  UPDATE
ON `bao_gom_online` FOR EACH ROW
BEGIN
	DECLARE so_luong_sach INT;
	DECLARE tong_tien_sach DECIMAL(10,2);
	-- Tinh tong so luong sach co trong don hang online
	SELECT
		SUM(so_luong) INTO so_luong_sach
	FROM
		bao_gom_online
	WHERE
		ma_don = OLD.ma_don;
	-- Tinh tong tien sach cua don hang online
	SELECT
		SUM(bao_gom_online.so_luong * gia_niem_yet) INTO tong_tien_sach
	FROM
		bao_gom_online, dau_sach
	WHERE
		ma_don = OLD.ma_don AND ma_dau_sach = ma;
	-- Cap nhat tong so luong sach, tong tien trong don hang sau
	UPDATE
		don_hang_online
	SET
		so_luong = so_luong_sach,
		tong_tien = tong_tien_sach
	WHERE
		ma = OLD.ma_don;

END $$

DELIMITER ;

-- UPDATE
-- 	bao_gom_online
-- SET
-- 	so_luong = 4
-- WHERE
-- 	ma_don = "DHO000000004" AND
-- 	ma_dau_sach = "DSA000000009";


-- Trigger: Xoá các bao_gom_online tương ứng khi xoá một Đon hàng.

DELIMITER $$

CREATE TRIGGER `xoa_don_hang_online`
BEFORE DELETE
ON `don_hang_online` FOR EACH ROW
BEGIN
	DELETE FROM
		bao_gom_online
	WHERE
		ma_don = OLD.ma;
END $$

DELIMITER ;

-- DELETE FROM
-- 	don_hang_online
-- WHERE
-- 	ma = "DHO000000004";


-- Thông tin các Đầu sách trong một Đơn hàng Online.

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `thong_tin_don_hang_online` (
	IN `ma_don_hang_online` CHAR(12))
BEGIN
	-- Kiem tra ma don hang nhap vao.
	IF (SELECT COUNT(*)  FROM don_hang_online WHERE ma = ma_don_hang_online) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã Đơn hàng không tồn tại !";
	END IF;
	SELECT
		ma_dau_sach,
		ten,
		the_loai,
		bao_gom_online.so_luong,
		FORMAT(gia_niem_yet,0) AS gia_niem_yet,
		FORMAT(bao_gom_online.so_luong * gia_niem_yet, 0) AS tong_cong
	FROM
		don_hang_online,
		bao_gom_online,
		dau_sach
	WHERE
		don_hang_online.ma = ma_don_hang_online AND
		ma_don = don_hang_online.ma AND
		ma_dau_sach = dau_sach.ma
	ORDER BY
		ma_dau_sach;

END $$

DELIMITER ;


-- CALL thong_tin_don_hang_online("DHO000000000");

-- Mã đơn hàng không hợp lệ
-- CALL thong_tin_don_hang_online("DHO00000000A");

-- Các khách hàng mua Đầu sách với số lượng > x

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `mua_dau_sach_nhieu_hon_x` (
	IN `ma_dau_sach_kt` CHAR(12),
	IN `so_luong_kt` INT)
BEGIN
	-- Kiem tra ma dau sach nhap vao.
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_dau_sach_kt) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã đầu sách không tồn tại !";
	END IF;
	SELECT
		ma_thanh_vien,
		CONCAT(ho," ", ten) AS ho_ten,
		SUM(bao_gom_online.so_luong) AS so_luong_mua
	FROM
		don_hang_online,
		bao_gom_online,
		thanh_vien
	WHERE
		ma_dau_sach = ma_dau_sach_kt AND
		ma_don = don_hang_online.ma AND
		ma_thanh_vien = cccd
	GROUP BY
		ma_thanh_vien
	HAVING
		SUM(bao_gom_online.so_luong) > so_luong_kt
	ORDER BY
		SUM(bao_gom_online.so_luong) DESC;
END $$

DELIMITER ;

-- CALL mua_dau_sach_nhieu_hon_x("DSA000000005",2);

-- Mã đầu sách không tồn tại
-- CALL mua_dau_sach_nhieu_hon_x("DSA00000000A",2);

-- Số Đơn hàng Online có số lượng sách > x

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `don_mua_nhieu_hon_x_cuon` (
	`SoLuong` INT)
RETURNS INT
BEGIN
	DECLARE total INT DEFAULT 0;
	DECLARE num INT;
	DECLARE finished INT DEFAULT 0;
	DECLARE curSoLuong CURSOR FOR SELECT so_luong FROM don_hang_online;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	IF SoLuong <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Số lượng nhập phải lớn hơn 0";
	END IF;

	OPEN curSoLuong;
	getSoLuong: LOOP
		FETCH curSoLuong INTO num;
		IF finished = 1 THEN
			LEAVE getSoLuong;
		END IF;
		IF num > SoLuong THEN
			SET total = total + 1;
		END IF;
	END LOOP getSoLuong;
	CLOSE curSoLuong;

	RETURN total;

END $$

DELIMITER ;

-- SELECT don_mua_nhieu_hon_x_cuon(4);

-- Số lượng nhập không hợp lệ.
-- SELECT don_mua_nhieu_hon_x_cuon(-1);


-- So sánh độ lệnh doanh thu Online của một Đầu sách

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `do_lech_doanh_thu` (
	`ma_sach` CHAR(12),
	`ngay_nhap_vao` VARCHAR(12))
RETURNS DECIMAL
BEGIN
	DECLARE ngay DATE;
	DECLARE doanh_thu DECIMAL(11,2); 			   -- Doanh thu ngay nhap vao
	DECLARE doanh_thu_ngay_gan_nhat DECIMAL(11,2); -- Doanh thu ngay gan nhat voi ngay nhap
	DECLARE ngay_gan_nhat DATE; 				   -- ngay gan nhat (co doanh thu)
	DECLARE i INT; 								   -- Bien chay i

	SET ngay = STR_TO_DATE(ngay_nhap_vao, "%d-%m-%Y");
	-- Kiem tra ngay nhap vao phai tu 01-01-2021
	IF ngay < '2021-01-01' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Ngày nhập vào phải từ ngày 01-01-2021";
	END IF;
	-- Kiem tra ma dau sach nhap vao
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_sach) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Không tìm thấy mã đầu sách";
	END IF;
	-- Bang chua doanh thu online cua dau sach theo ngay
	CREATE TEMPORARY TABLE doanh_thu_theo_ngay (
		ngay_dat_dau_sach DATE,
		doanh_thu_dau_sach DECIMAL(11,2));
	-- Them du lieu doanh thu dau sach theo ngay vao bang
	INSERT INTO doanh_thu_theo_ngay (ngay_dat_dau_sach, doanh_thu_dau_sach)
	SELECT
		ngay_dat,
		SUM(bao_gom_online.so_luong * (gia_niem_yet - gia_nhap)) AS doanh_thu_sach
	FROM
		dau_sach,
		bao_gom_online,
		don_hang_online
	WHERE
		bao_gom_online.ma_dau_sach = ma_sach  AND
		bao_gom_online.ma_dau_sach = dau_sach.ma AND
		ma_don = don_hang_online.ma
	GROUP BY
		ngay_dat;

	-- Neu trong ngay nhap vao, dau sach khong duoc dat thi doanh thu bang 0,
	-- nguoc lai, lay doanh thu trong ngay do.
	IF (SELECT COUNT(*)
		FROM doanh_thu_theo_ngay
		WHERE doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay) = 0 THEN

		SET doanh_thu = 0;

	ELSE
		SELECT
			doanh_thu_theo_ngay.doanh_thu_dau_sach INTO doanh_thu
		FROM
			doanh_thu_theo_ngay
		WHERE
			doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay;
	END IF;

	-- Thuc hien loop de kiem tra ngay gan nhat co doanh thu
	SET ngay_gan_nhat = ngay;
	SET i = 0;

	WHILE (i<365) DO
		SET ngay_gan_nhat = DATE_SUB(ngay_gan_nhat, INTERVAL 1 DAY);
		IF (SELECT COUNT(*)
			FROM doanh_thu_theo_ngay
			WHERE doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay_gan_nhat) > 0 THEN

			SELECT
				doanh_thu_theo_ngay.doanh_thu_dau_sach INTO doanh_thu_ngay_gan_nhat
			FROM
				doanh_thu_theo_ngay
			WHERE
				doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay_gan_nhat;

			DROP TEMPORARY TABLE doanh_thu_theo_ngay;
			RETURN doanh_thu - doanh_thu_ngay_gan_nhat;
		END IF;

		SET i = i + 1;
	END WHILE;
	-- Khong tim thay ngay gan nhat co doanh thu thi xem nhu doanh thu ngay gan nhat la 0.
	-- Tra ve doanh thu ngay nhap vao
	DROP TEMPORARY TABLE doanh_thu_theo_ngay;
	RETURN doanh_thu;
END $$

DELIMITER ;



-- SELECT FORMAT(do_lech_doanh_thu("DSA000000008","14-04-2021"),0) AS do_lech;

-- Ngày nhập không hợp lệ
-- SELECT FORMAT(do_lech_doanh_thu("DSA000000008","21-11-2020"),0) AS do_lech;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `doanh_so_ban_online_dau_sach`(
	IN ma_sach CHAR(12))
BEGIN
	-- Kiem tra ma dau sach nhap vao
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_sach) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã đầu sách không tồn tại !";
	END IF;

	SELECT
		DATE_FORMAT(ngay_dat, '%d-%m-%Y') AS ngay,
		SUM(bao_gom_online.so_luong) AS doanh_so_ban
	FROM
		bao_gom_online,
		don_hang_online
	WHERE
		bao_gom_online.ma_dau_sach = ma_sach AND
		ma_don = don_hang_online.ma
	GROUP BY
		ngay_dat
	HAVING
		ngay_dat > DATE_SUB(CURDATE() , INTERVAL 365 DAY)
	ORDER BY
		ngay_dat;

END $$

DELIMITER ;


-- CALL doanh_so_ban_online_dau_sach("DSA000000005")

-- Tổng doanh số bán Online của các đầu sách theo ngày


DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `tong_doanh_so_ban_online`()
BEGIN
	SELECT
		DATE_FORMAT(ngay_dat, '%d-%m-%Y') AS ngay,
		SUM(don_hang_online.so_luong) AS tong_doanh_so_ban
	FROM
		don_hang_online
	GROUP BY
		ngay_dat
	HAVING
		ngay_dat > DATE_SUB(CURDATE() , INTERVAL 365 DAY)
	ORDER BY
		ngay_dat;

END $$

DELIMITER ;


-- CALL tong_doanh_so_ban_online();




DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `them_nha_xuat_ban`(
    IN  ten                     VARCHAR(40),
    IN  email                   VARCHAR(60),
    IN  sdt                     CHAR(10),
    IN  dia_chi                 VARCHAR(200),
    IN  website                 VARCHAR(255)
)
BEGIN
    DECLARE ma CHAR(12);

    IF ISNULL(email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Email khong duoc null";
    END IF;
    IF email = "" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Email khong duoc rong";
    END IF;

    IF ISNULL(ten) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ten khong duoc null";
    END IF;
    IF ten = "" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ten khong duoc rong";
    END IF;

    IF NOT (SELECT email REGEXP '^.+@.+\..+$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Email";
    END IF;

    IF NOT (SELECT sdt REGEXP '^0[0-9]{9}$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Phone";
    END IF;

    SET ma = (SELECT MAX(nha_xuat_ban.ma) FROM nha_xuat_ban);
    SET ma = next_id(ma);
    INSERT INTO nha_xuat_ban
    VALUES (ma, ten, email, sdt, dia_chi, website);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `kiem_tra_nha_xuat_ban`
BEFORE UPDATE ON `nha_xuat_ban`
FOR EACH ROW
BEGIN
    IF NOT (SELECT NEW.email REGEXP '^.+@.+\..+$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Email";
    END IF;

    IF NOT (SELECT NEW.sdt REGEXP '^0[0-9]{9}$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Phone";
    END IF;
    -- CALL assert_valid_email(NEW.email);
    -- CALL assert_valid_phone(NEW.sdt);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `after_them_quyen_sach_vao_bao_gom`
AFTER INSERT ON `bao_gom`
FOR EACH ROW
BEGIN
	DECLARE update_ma_don_hang varchar(12);
    DECLARE update_tong_tien DECIMAL;
    DECLARE update_so_luong INT;
    DECLARE update_tien DECIMAL;
    DECLARE update_ma_dau_sach varchar(12);

    SELECT ma_dau_sach
    INTO update_ma_dau_sach
    FROM quyen_sach
    WHERE quyen_sach.ma = NEW.ma_quyen_sach;

    SELECT so_luong, tong_tien
    INTO update_so_luong, update_tong_tien
    FROM don_hang
    WHERE don_hang.ma= NEW.ma_don;

    SELECT gia_niem_yet
    INTO update_tien
    FROM dau_sach
    WHERE dau_sach.ma = update_ma_dau_sach;

    SET update_tong_tien = update_tong_tien + update_tien;
    set update_so_luong = update_so_luong + 1;

    UPDATE don_hang
    SET so_luong = update_so_luong, tong_tien = update_tong_tien
    WHERE ma = NEW.ma_don;
END $$
DELIMITER ;


DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `phuoc_get_data_1`(
    IN `ngay_bat_dau` DATE,
    IN `ngay_ket_thuc` DATE
)
BEGIN
    IF ngay_bat_dau > ngay_ket_thuc THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Date Range";
    END IF;
    SELECT
        thu_ngan.ma_quay, COUNT(ma_quay)
    FROM
        thu_ngan,
        don_hang
    WHERE
        don_hang.ma_thu_ngan = thu_ngan.ma AND
        don_hang.ngay_tao >= ngay_bat_dau AND
        don_hang.ngay_tao <= ngay_ket_thuc
    GROUP BY
        thu_ngan.ma_quay
    ORDER BY
        COUNT(ma_quay);
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `phuoc_get_data_2`(
    IN `min_tien` DECIMAL(11,2)
)
BEGIN
    SELECT
       ma_quay ,AVG(tong_tien)
    FROM
        thu_ngan,
        don_hang
    WHERE
        don_hang.ma_thu_ngan = thu_ngan.ma
    GROUP BY
        ma_quay
    HAVING
        AVG(tong_tien) > min_tien
    ORDER BY
        AVG(tong_tien);
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_don_hang_trong_ngay` (`check_date` DATE)
RETURNS INT(11)
BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT ngay_tao from don_hang;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    set @dif = TIMESTAMPDIFF(DAY, check_date, CURDATE());
    IF @dif < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ngay nay chua xay ra';
    END IF;

    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp = check_date
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_don_hang_co_tong_tien_lon_hon` (`num` INT)
RETURNS INT(11)
BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT tong_tien from don_hang;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF num <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số đầu vào num phải > 0';
    END IF;

    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > num
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;
    CLOSE cur;
    RETURN total;
END $$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `next_id`(
    `id` CHAR(12)
)
RETURNS char(12)
BEGIN
    DECLARE prefix CHAR(3);
    DECLARE postfix CHAR(9);
    DECLARE num INT;

    SET prefix = LEFT(id, 3);
    SET postfix = RIGHT(id, 9);
    SET num = CAST(postfix AS INT) + 1;
    SET postfix = LPAD(num, 9, '0');

    RETURN CONCAT(prefix, postfix);
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_id_length`(
    IN  `id`                    CHAR(255)
)
BEGIN
    IF ISNULL(id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'id is null';
    END IF;
    IF LENGTH(id) <> 12 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'length of id is not 12';
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_varchar`(
    IN  `val`                   VARCHAR(255),
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "VARCHAR");
    IF ISNULL(val) THEN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
    IF val = "" THEN
        set @message = CONCAT(@name, " is empty");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_char`(
    IN  `val`                   CHAR(255),
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "CHAR");
    IF ISNULL(val) THEN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
    IF val = "" THEN
        set @message = CONCAT(@name, " is empty");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_date`(
    IN  `val`                   DATE,
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "DATE");
    IF ISNULL(val) THEN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_decimal`(
    IN  `val`                   DECIMAL(11, 2),
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "DECIMAL");
    IF ISNULL(val) THEN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `is_valid_email`(
    `email` VARCHAR(60)
)
RETURNS tinyint(1)
BEGIN
    DECLARE res BOOLEAN;
    SET res = (SELECT email REGEXP '^.+@.+\..+$');
    RETURN res;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_valid_email`(
    IN  email                   VARCHAR(60)
)
leave_label:
BEGIN
    IF ISNULL(email) THEN
        LEAVE leave_label;
    END IF;
    IF NOT is_valid_email(email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid email';
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `is_valid_phone`(
    `phone` CHAR(10)
)
RETURNS tinyint(1)
BEGIN
    DECLARE res BOOLEAN;
    SET res = (SELECT phone REGEXP '^0[0-9]{9}$');
    RETURN res;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_valid_phone`(
    IN  `phone`                 CHAR(10)
)
leave_label:
BEGIN
    IF ISNULL(phone) THEN
        LEAVE leave_label;
    END IF;
    IF NOT is_valid_phone(phone) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone';
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `is_valid_ssn`(
    `ssn` CHAR(12)
)
RETURNS tinyint(1)
BEGIN
    DECLARE res BOOLEAN;
    SET res = (SELECT ssn REGEXP '^[0-9]{12}$');
    RETURN res;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_valid_ssn`(
    IN  `ssn`                 CHAR(12)
)
leave_label:
BEGIN
    IF ISNULL(ssn) THEN
        LEAVE leave_label;
    END IF;
    IF NOT is_valid_ssn(ssn) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid ssn';
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_age_aleast`(
    IN  `date_of_birth`         DATE,
    IN  `age_lower_bound`       INT
)
leave_label:
BEGIN
    IF ISNULL(date_of_birth) THEN
        LEAVE leave_label;
    END IF;

    set @age = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
    IF @age < age_lower_bound THEN
        SET @age_str = CAST(@age AS CHAR);
        SET @alb_str = CAST(age_lower_bound AS CHAR);
        SET @message = CONCAT('age is ', @age_str, ', which is smaller than ', @alb_str);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `employee_minimum_salary`(
    `start_date`            DATE
)
RETURNS DECIMAL(11, 2)
BEGIN
    set @worked_years = TIMESTAMPDIFF(YEAR, start_date, CURDATE());
    set @salary = (FLOOR(@worked_years / 3) + 1) * 4420000;
    RETURN @salary;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_employee_has_minimum_salary`(
    IN  `start_date`            DATE,
    IN  `salary`                DECIMAL(11, 2)
)
leave_label:
BEGIN
    IF ISNULL(start_date) OR ISNULL(salary) THEN
        LEAVE leave_label;
    END IF;

    set @min_salary = employee_minimum_salary(start_date);
    IF salary < @min_salary THEN
        SET @salary_str = CAST(salary AS CHAR);
        SET @min_salary_str = CAST(@min_salary AS CHAR);
        SET @message = CONCAT('salary is ', @salary_str, ', which is smaller minimun salary ', @min_salary_str);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `supervisor_minimum_salary`(
    `branch_id`                 CHAR(12)
)
RETURNS DECIMAL(11, 2)
BEGIN
    SET @salary = (
        SELECT MAX(nhan_vien.luong)
        FROM nhan_vien
        WHERE nhan_vien.ma_chi_nhanh = branch_id
    );
    return @salary;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_supervisor_has_minimum_salary`(
    IN  `branch_id`             CHAR(12),
    IN  `salary`                DECIMAL(11, 2)
)
leave_label:
BEGIN
    IF ISNULL(branch_id) OR ISNULL(salary) THEN
        LEAVE leave_label;
    END IF;

    set @min_salary = supervisor_minimum_salary(branch_id);
    IF salary < @min_salary THEN
        SET @salary_str = CAST(salary AS CHAR);
        SET @min_salary_str = CAST(@min_salary AS CHAR);
        SET @message = CONCAT('supervisor salary is ', @salary_str, ', which is smaller their employee maximum salary ', @min_salary_str);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



-- cau 1: thu tuc insert du lieu
DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `them_nhan_vien`(
    IN  `ho`                    VARCHAR(20),
    IN  `ten`                   VARCHAR(20),
    IN  `ngay_sinh`             DATE,
    IN  `email`                 VARCHAR(60),
    IN  `sdt`                   CHAR(10),
    IN  `dia_chi`               VARCHAR(200),
    IN  `cccd`                  CHAR(12),
    IN  `luong`                 DECIMAL(11,2),
    IN  `thoi_gian_bat_dau_lam` DATE,
    IN  `ma_chi_nhanh`          CHAR(12),
    IN  `la_quan_ly`            BOOLEAN
)
BEGIN
    DECLARE ma                  CHAR(12);
    DECLARE ma_quan_ly          CHAR(12);

    CALL assert_has_value_varchar(ten, "ten");
    CALL assert_has_value_date(ngay_sinh, "ngay_sinh");
    CALL assert_age_aleast(ngay_sinh, 18);
    CALL assert_has_value_varchar(email, "email");
    CALL assert_valid_email(email);
    CALL assert_has_value_char(sdt, "sdt");
    CALL assert_valid_phone(sdt);
    CALL assert_has_value_char(cccd, "cccd");
    CALL assert_valid_ssn(cccd);
    CALL assert_has_value_decimal(luong, "luong");
    CALL assert_employee_has_minimum_salary(thoi_gian_bat_dau_lam, luong);
    CALL assert_has_value_date(thoi_gian_bat_dau_lam, "thoi_gian_bat_dau_lam");

    SET ma = (
        SELECT max(nhan_vien.ma) FROM nhan_vien
    );
    SET ma = next_id(ma);

    IF la_quan_ly THEN
        SET ma_quan_ly = ma;
        CALL assert_supervisor_has_minimum_salary(ma_chi_nhanh, luong);
        -- test da co quan ly
        -- not tested
    ELSE
        SET ma_quan_ly = (
            SELECT quan_ly.ma
            FROM quan_ly
            WHERE quan_ly.ma_chi_nhanh = ma_chi_nhanh
        );
        IF ISNULL(ma_chi_nhanh) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'khong tim thay quan ly';
            -- not tested
        END IF;
    END IF;

    INSERT INTO nhan_vien
    VALUES (ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly);

    IF la_quan_ly THEN
        INSERT INTO nhan_vien
        VALUES (ma, ma_chi_nhanh);
    END IF;
END$$
DELIMITER ;
-- CALL them_nhan_vien("Nguyễn Văn", "Hoàng", CAST("1997-08-29" AS DATE), "nguyen.van.hoang.9999@sahafake.com", "0989000111", null, "070802000100", 100000000, CAST("2017-07-20" AS DATE), "CNH000000000", 0);



-- cau 2: trigger
DELIMITER $$
CREATE TRIGGER `kiem_tra_nhan_vien_update`
BEFORE UPDATE ON `nhan_vien`
FOR EACH ROW
BEGIN
    CALL assert_age_aleast(NEW.ngay_sinh, 18);
    CALL assert_valid_email(NEW.email);
    CALL assert_valid_phone(NEW.sdt);
    CALL assert_valid_ssn(NEW.cccd);
    CALL assert_employee_has_minimum_salary(NEW.thoi_gian_bat_dau_lam, NEW.luong);
END $$
DELIMITER ;
-- CALL them_nhan_vien("Nguyễn Văn", "Hoàng", CAST("1997-08-29" AS DATE), "nguyen.van.hoang.9999@sahafake.com", "0989000111", null, "070802000100", 100000000, CAST("2017-07-20" AS DATE), "CNH000000000", 0);



DELIMITER $$
CREATE TRIGGER `kiem_tra_nhan_vien_insert`
BEFORE INSERT ON `nhan_vien`
FOR EACH ROW
BEGIN
    CALL assert_age_aleast(NEW.ngay_sinh, 18);
    CALL assert_valid_email(NEW.email);
    CALL assert_valid_phone(NEW.sdt);
    CALL assert_valid_ssn(NEW.cccd);
    CALL assert_employee_has_minimum_salary(NEW.thoi_gian_bat_dau_lam, NEW.luong);
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `cap_nhap_doanh_so_khi_them_don_hang`
AFTER INSERT ON `don_hang`
FOR EACH ROW
BEGIN
    UPDATE thu_ngan
    SET thu_ngan.doanh_so = thu_ngan.doanh_so + NEW.tong_tien
    WHERE thu_ngan.ma = NEW.ma_thu_ngan;
END $$
DELIMITER ;
-- not tested



DELIMITER $$
CREATE TRIGGER `cap_nhap_doanh_so_khi_sua_don_hang`
AFTER UPDATE ON `don_hang`
FOR EACH ROW
BEGIN
    UPDATE thu_ngan
    SET thu_ngan.doanh_so = thu_ngan.doanh_so + NEW.tong_tien - OLD.tong_tien
    WHERE thu_ngan.ma = NEW.ma_thu_ngan;
END $$
DELIMITER ;
-- not tested



DELIMITER $$
CREATE TRIGGER `cap_nhap_doanh_so_khi_xoa_don_hang`
AFTER DELETE ON `don_hang`
FOR EACH ROW
BEGIN
    UPDATE thu_ngan
    SET thu_ngan.doanh_so = thu_ngan.doanh_so - OLD.tong_tien
    WHERE thu_ngan.ma = OLD.ma_thu_ngan;
END $$
DELIMITER ;
-- not tested


-- cau 3: thu tuc chua cau SQL
DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `tom_tat_thong_tin_nhap_sach_theo_nha_xuat_ban`()
leave_label:
BEGIN
    SELECT
        nha_xuat_ban.ten, COUNT(*) AS so_luong_sach, SUM(dau_sach.gia_nhap) as tien_tra_nha_xuat_ban
    FROM
        nha_xuat_ban, dau_sach, quyen_sach
    WHERE
        dau_sach.ma_nha_xuat_ban = nha_xuat_ban.ma AND
        quyen_sach.ma_dau_sach = dau_sach.ma
    GROUP BY
        nha_xuat_ban.ma
    ORDER BY
        quyen_sach.ma;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `doanh_thu_chi_nhanh`()
leave_label:
BEGIN
    SELECT
        chi_nhanh.ten, SUM(thu_ngan.doanh_so) as doanh_so
    FROM
        chi_nhanh, nhan_vien, thu_ngan
    WHERE
        chi_nhanh.ma = nhan_vien.ma_chi_nhanh AND
        nhan_vien.ma = thu_ngan.ma
    GROUP BY
        chi_nhanh.ma;
END$$
DELIMITER ;



-- cau 4: ham
DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `luong_trung_binh_chi_nhanh`(
    `ma_chi_nhanh`          CHAR(12)
)
RETURNS DECIMAL(11, 2)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE ton_tai INT DEFAULT 0;
    DECLARE l DECIMAL(11, 2);
    DECLARE tong_luong DECIMAL(11, 2);
    DECLARE so_luong INT;
    DECLARE cur CURSOR FOR SELECT luong FROM nhan_vien WHERE nhan_vien.ma_chi_nhanh = ma_chi_nhanh;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SET ton_tai = (SELECT COUNT(*) FROM chi_nhanh WHERE chi_nhanh.ma = ma_chi_nhanh);
    IF NOT ton_tai THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã chi nhánh không hợp lệ';
    END IF;

    SET tong_luong = 0.0;
    SET so_luong = 0;
    OPEN cur;
    loop_label: LOOP
        FETCH cur INTO l;
        IF done THEN
            LEAVE loop_label;
        END IF;
        SET tong_luong = tong_luong + l;
        SET so_luong = so_luong + 1;
    END LOOP loop_label;
    CLOSE cur;

    RETURN tong_luong / so_luong;
END$$
DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_nhan_vien_co_luong_it_nhat_x`(
    `x`                 DECIMAL(11, 2)
)
RETURNS INT
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE l DECIMAL(11, 2);
    DECLARE so_luong INT;
    DECLARE cur CURSOR FOR SELECT luong FROM nhan_vien;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    IF x < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đầu vào không được nhỏ hơn 0';
    END IF;

    SET so_luong = 0;
    OPEN cur;
    loop_label: LOOP
        FETCH cur INTO l;
        IF done THEN
            LEAVE loop_label;
        END IF;
        IF l >= x THEN
            SET so_luong = so_luong + 1;
        END IF;
    END LOOP loop_label;
    CLOSE cur;

    RETURN so_luong;
END$$
DELIMITER ;


