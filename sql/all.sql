-- ma:                                  CHAR(12)            12 ky tu bao gom A-Z, 0-9, co the chon ma chi dung so
-- ho/ten:                              VARCHAR(20)
-- ten day du:                          VARCHAR(40)
-- email:                               VARCHAR(60)
-- sdt:                                 CHAR(10)
-- dia chi:                             VARCHAR(200)
-- cccd:                                CHAR(12)
-- tien:                                DECIMAL(11, 2)      max = 10^9 = 1 ty

DROP SCHEMA sahafake;

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
    ma_don_hang             CHAR(12),
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


-- CREATE INDEX ma_nhan_vien_index ON nhan_vien(ma_nhan_vien);



INSERT INTO chi_nhanh VALUES("CNH000000000", "Đà Nẵng", "lienhe@sahafake.danang.com", "179 Đ. Lê Văn Việt, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO chi_nhanh VALUES("CNH000000001", "Hồ Chí Minh", "lienhe@sahafake.hochiminh.com", "15D Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000001", "0989000000");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000000", "0989000001");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000000", "0989000002");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000001", "0989000003");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000000", "0989000004");
INSERT INTO nhan_vien VALUES("NVI000000000", "Lãng", "Hồ Thanh", STR_TO_DATE("18-5-1995", "%d-%m-%Y"), "ho.thanh.lang.7327@sahafake.com", "0989000005", "14A Số 12, Khu Phố 4, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000000", 44200000, STR_TO_DATE("25-8-2012", "%d-%m-%Y"), "CNH000000001", "NVI000000003");
INSERT INTO nhan_vien VALUES("NVI000000001", "Khoá", "Võ Thanh", STR_TO_DATE("13-7-1995", "%d-%m-%Y"), "vo.thanh.khoa.7328@sahafake.com", "0989000006", "7/11A,Đường 182,Phường Tăng Nhơn Phú A,Quận 9,Tp, Thành phố Hồ Chí Minh 70000, Vietnam", "070802000001", 26520000, STR_TO_DATE("10-4-2016", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000002", "Cửu", "Huỳnh Gia", STR_TO_DATE("22-8-1992", "%d-%m-%Y"), "huynh.gia.cuu.7329@sahafake.com", "0989000007", "Lô I5-3a, 3b, Khu Công Nghệ Cao, Tăng Nhơn Phú A, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam", "070802000002", 17680000, STR_TO_DATE("17-4-2018", "%d-%m-%Y"), "CNH000000001", "NVI000000003");
INSERT INTO nhan_vien VALUES("NVI000000003", "Lạp", "Lý", STR_TO_DATE("2-6-1988", "%d-%m-%Y"), "ly.lap.7330@sahafake.com", "0989000008", "Khu Công Nghệ Cao, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000003", 53040000, STR_TO_DATE("13-7-2018", "%d-%m-%Y"), "CNH000000001", "NVI000000003");
INSERT INTO nhan_vien VALUES("NVI000000004", "Cảo", "Đặng Gia", STR_TO_DATE("14-8-1988", "%d-%m-%Y"), "dang.gia.cao.7331@sahafake.com", "0989000009", "43 Đường Số 245, khu phố 5, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000004", 22100000, STR_TO_DATE("2-5-2017", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000005", "Khổng", "Phạm Gia", STR_TO_DATE("4-8-1994", "%d-%m-%Y"), "pham.gia.khong.7332@sahafake.com", "0989000010", "12/86C Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000005", 53040000, STR_TO_DATE("13-8-2010", "%d-%m-%Y"), "CNH000000001", "NVI000000003");
INSERT INTO nhan_vien VALUES("NVI000000006", "Hạt", "Võ Anh", STR_TO_DATE("20-5-1998", "%d-%m-%Y"), "vo.anh.hat.7333@sahafake.com", "0989000011", "262 Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000006", 39780000, STR_TO_DATE("13-4-2013", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000007", "Tùng", "Lý Anh", STR_TO_DATE("28-4-1989", "%d-%m-%Y"), "ly.anh.tung.7334@sahafake.com", "0989000012", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000007", 30940000, STR_TO_DATE("23-11-2014", "%d-%m-%Y"), "CNH000000001", "NVI000000003");
INSERT INTO nhan_vien VALUES("NVI000000008", "Sứ", "Lê Thanh", STR_TO_DATE("14-12-1999", "%d-%m-%Y"), "le.thanh.su.7335@sahafake.com", "0989000013", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000008", 44200000, STR_TO_DATE("30-3-2012", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000009", "Thi", "Đặng Thanh", STR_TO_DATE("30-10-1997", "%d-%m-%Y"), "dang.thanh.thi.7336@sahafake.com", "0989000014", "4 Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000009", 39780000, STR_TO_DATE("25-1-2013", "%d-%m-%Y"), "CNH000000000", "NVI000000008");
INSERT INTO thu_ngan VALUES("NVI000000007", "QUA000000000", 15623000);
INSERT INTO thu_ngan VALUES("NVI000000009", "QUA000000001", 13364000);
INSERT INTO thu_ngan VALUES("NVI000000000", "QUA000000002", 14355000);
INSERT INTO thu_ngan VALUES("NVI000000006", "QUA000000003", 12727000);
INSERT INTO thu_ngan VALUES("NVI000000001", "QUA000000004", 14371000);
INSERT INTO thu_ngan VALUES("NVI000000005", "QUA000000005", 10040000);
INSERT INTO quan_ly VALUES("NVI000000008", "CNH000000000");
INSERT INTO quan_ly VALUES("NVI000000003", "CNH000000001");
INSERT INTO don_hang VALUES("DHA000000000", STR_TO_DATE("1-2-2020", "%d-%m-%Y"), 2, 2317000, "NVI000000001", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000001", STR_TO_DATE("29-6-2021", "%d-%m-%Y"), 1, 2254000, "NVI000000009", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000002", STR_TO_DATE("25-1-2021", "%d-%m-%Y"), 1, 1501000, "NVI000000005", null, "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000003", STR_TO_DATE("9-3-2020", "%d-%m-%Y"), 1, 2122000, "NVI000000000", "070802000011", "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000004", STR_TO_DATE("28-9-2020", "%d-%m-%Y"), 1, 2574000, "NVI000000007", "070802000010", "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000005", STR_TO_DATE("24-6-2021", "%d-%m-%Y"), 1, 663000, "NVI000000006", "070802000012", "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000006", STR_TO_DATE("19-10-2020", "%d-%m-%Y"), 2, 4075000, "NVI000000007", "070802000012", "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000007", STR_TO_DATE("7-9-2020", "%d-%m-%Y"), 2, 4457000, "NVI000000009", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000008", STR_TO_DATE("18-7-2020", "%d-%m-%Y"), 2, 2283000, "NVI000000005", null, "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000009", STR_TO_DATE("1-1-2021", "%d-%m-%Y"), 2, 3623000, "NVI000000001", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000010", STR_TO_DATE("10-10-2020", "%d-%m-%Y"), 1, 2335000, "NVI000000006", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000011", STR_TO_DATE("22-5-2021", "%d-%m-%Y"), 1, 63000, "NVI000000000", null, "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000012", STR_TO_DATE("11-9-2021", "%d-%m-%Y"), 1, 2122000, "NVI000000005", "070802000010", "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000013", STR_TO_DATE("18-10-2020", "%d-%m-%Y"), 2, 726000, "NVI000000009", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000014", STR_TO_DATE("4-3-2021", "%d-%m-%Y"), 1, 2254000, "NVI000000007", "070802000011", "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000015", STR_TO_DATE("31-7-2020", "%d-%m-%Y"), 2, 3692000, "NVI000000001", "070802000010", "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000016", STR_TO_DATE("21-10-2021", "%d-%m-%Y"), 2, 3905000, "NVI000000006", "070802000012", "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000017", STR_TO_DATE("7-4-2021", "%d-%m-%Y"), 1, 1570000, "NVI000000000", "070802000011", "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000018", STR_TO_DATE("20-7-2021", "%d-%m-%Y"), 2, 2317000, "NVI000000007", null, "NVI000000003");
INSERT INTO don_hang VALUES("DHA000000019", STR_TO_DATE("13-1-2021", "%d-%m-%Y"), 2, 4177000, "NVI000000009", "070802000012", "NVI000000008");
INSERT INTO bao_gom VALUES("DHA000000012", "QSA000000039");
INSERT INTO bao_gom VALUES("DHA000000019", "QSA000000001");
INSERT INTO bao_gom VALUES("DHA000000011", "QSA000000027");
INSERT INTO bao_gom VALUES("DHA000000014", "QSA000000096");
INSERT INTO bao_gom VALUES("DHA000000009", "QSA000000082");
INSERT INTO bao_gom VALUES("DHA000000018", "QSA000000083");
INSERT INTO bao_gom VALUES("DHA000000001", "QSA000000041");
INSERT INTO bao_gom VALUES("DHA000000006", "QSA000000026");
INSERT INTO bao_gom VALUES("DHA000000016", "QSA000000074");
INSERT INTO bao_gom VALUES("DHA000000008", "QSA000000062");
INSERT INTO bao_gom VALUES("DHA000000015", "QSA000000053");
INSERT INTO bao_gom VALUES("DHA000000010", "QSA000000011");
INSERT INTO bao_gom VALUES("DHA000000017", "QSA000000078");
INSERT INTO bao_gom VALUES("DHA000000007", "QSA000000023");
INSERT INTO bao_gom VALUES("DHA000000003", "QSA000000058");
INSERT INTO bao_gom VALUES("DHA000000002", "QSA000000048");
INSERT INTO bao_gom VALUES("DHA000000004", "QSA000000075");
INSERT INTO bao_gom VALUES("DHA000000000", "QSA000000016");
INSERT INTO bao_gom VALUES("DHA000000013", "QSA000000002");
INSERT INTO bao_gom VALUES("DHA000000005", "QSA000000020");
INSERT INTO bao_gom VALUES("DHA000000015", "QSA000000076");
INSERT INTO bao_gom VALUES("DHA000000007", "QSA000000084");
INSERT INTO bao_gom VALUES("DHA000000018", "QSA000000071");
INSERT INTO bao_gom VALUES("DHA000000009", "QSA000000008");
INSERT INTO bao_gom VALUES("DHA000000016", "QSA000000038");
INSERT INTO bao_gom VALUES("DHA000000000", "QSA000000031");
INSERT INTO bao_gom VALUES("DHA000000008", "QSA000000021");
INSERT INTO bao_gom VALUES("DHA000000019", "QSA000000066");
INSERT INTO bao_gom VALUES("DHA000000013", "QSA000000061");
INSERT INTO bao_gom VALUES("DHA000000006", "QSA000000050");
INSERT INTO don_hang_online VALUES("DHO000000000", STR_TO_DATE("18-4-2020", "%d-%m-%Y"), 10, 23589000, "070802000011", null);
INSERT INTO don_hang_online VALUES("DHO000000001", STR_TO_DATE("15-6-2020", "%d-%m-%Y"), 1, 1570000, "070802000010", null);
INSERT INTO don_hang_online VALUES("DHO000000002", STR_TO_DATE("30-5-2021", "%d-%m-%Y"), 5, 11270000, "070802000012", null);
INSERT INTO don_hang_online VALUES("DHO000000003", STR_TO_DATE("21-2-2020", "%d-%m-%Y"), 4, 252000, "070802000010", null);
INSERT INTO don_hang_online VALUES("DHO000000004", STR_TO_DATE("31-3-2020", "%d-%m-%Y"), 7, 14461000, "070802000011", null);
INSERT INTO bao_gom_online VALUES("DHO000000002", "DSA000000005", 5);
INSERT INTO bao_gom_online VALUES("DHO000000001", "DSA000000001", 1);
INSERT INTO bao_gom_online VALUES("DHO000000003", "DSA000000009", 4);
INSERT INTO bao_gom_online VALUES("DHO000000004", "DSA000000007", 5);
INSERT INTO bao_gom_online VALUES("DHO000000000", "DSA000000008", 1);
INSERT INTO bao_gom_online VALUES("DHO000000004", "DSA000000000", 2);
INSERT INTO bao_gom_online VALUES("DHO000000000", "DSA000000004", 9);
INSERT INTO thanh_vien VALUES("070802000010", "Hiếu", "Đặng Gia", "dang.gia.hieu.7337@gmail.com", "0989000015", "20/1/3 Đường Số 295, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam");
INSERT INTO thanh_vien VALUES("070802000011", "Giàu", "Dương Thanh", "duong.thanh.giau.7338@gmail.com", "0989000016", "1 Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien VALUES("070802000012", "Ðang", "Nguyễn Thanh", "nguyen.thanh.ðang.7339@gmail.com", "0989000017", "RQQW+HJX, Tăng Nhơn Phú A, Quận 9, Quận 9 Hồ Chí Minh, Vietnam");
INSERT INTO dau_sach VALUES("DSA000000000", "Mind Map cho người mới bắt đầu", "Đỗ Anh Ly", "the loai", 1275000, 713000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000001", "Nhà hóa học", "Ngô Thanh Thược", "the loai", 1805000, 1570000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000002", "WWW 2021", "Lê Kiều", "the loai", 1538000, 663000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000003", "Vãn tình", "Bùi Anh Tôn", "the loai", 2445000, 2122000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000004", "Trò chơi con mực", "Hồ Gia Quyền", "the loai", 1426000, 2335000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000005", "Lời giải tiếng Anh 12", "Trần Củng", "the loai", 2991000, 2254000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000006", "Nghệ thuật đầu tư", "Phạm Anh Kỷ", "the loai", 2950000, 1501000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000007", "Tâm lý học cơ bản", "Lê Thanh Liên", "the loai", 2837000, 2607000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000008", "Đam mê để làm gì", "Huỳnh Gia Cương", "the loai", 300000, 2574000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000009", "Đọc nhanh cảm xúc và ngôn ngữ cơ thể", "Huỳnh Thanh Lãng", "the loai", 1265000, 63000, 10, "NXB000000001");
INSERT INTO quyen_sach VALUES("QSA000000000", "DSA000000008", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000001", "DSA000000001", "CNH000000001", "DHA000000019");
INSERT INTO quyen_sach VALUES("QSA000000002", "DSA000000009", "CNH000000001", "DHA000000013");
INSERT INTO quyen_sach VALUES("QSA000000003", "DSA000000000", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000004", "DSA000000005", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000005", "DSA000000006", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000006", "DSA000000002", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000007", "DSA000000007", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000008", "DSA000000003", "CNH000000001", "DHA000000009");
INSERT INTO quyen_sach VALUES("QSA000000009", "DSA000000004", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000010", "DSA000000007", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000011", "DSA000000004", "CNH000000001", "DHA000000010");
INSERT INTO quyen_sach VALUES("QSA000000012", "DSA000000006", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000013", "DSA000000000", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000014", "DSA000000009", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000015", "DSA000000008", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000016", "DSA000000005", "CNH000000000", "DHA000000000");
INSERT INTO quyen_sach VALUES("QSA000000017", "DSA000000001", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000018", "DSA000000002", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000019", "DSA000000003", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000020", "DSA000000002", "CNH000000001", "DHA000000005");
INSERT INTO quyen_sach VALUES("QSA000000021", "DSA000000001", "CNH000000000", "DHA000000008");
INSERT INTO quyen_sach VALUES("QSA000000022", "DSA000000000", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000023", "DSA000000004", "CNH000000001", "DHA000000007");
INSERT INTO quyen_sach VALUES("QSA000000024", "DSA000000005", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000025", "DSA000000003", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000026", "DSA000000008", "CNH000000000", "DHA000000006");
INSERT INTO quyen_sach VALUES("QSA000000027", "DSA000000009", "CNH000000001", "DHA000000011");
INSERT INTO quyen_sach VALUES("QSA000000028", "DSA000000006", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000029", "DSA000000007", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000030", "DSA000000008", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000031", "DSA000000009", "CNH000000001", "DHA000000000");
INSERT INTO quyen_sach VALUES("QSA000000032", "DSA000000000", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000033", "DSA000000002", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000034", "DSA000000007", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000035", "DSA000000005", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000036", "DSA000000006", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000037", "DSA000000004", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000038", "DSA000000001", "CNH000000000", "DHA000000016");
INSERT INTO quyen_sach VALUES("QSA000000039", "DSA000000003", "CNH000000001", "DHA000000012");
INSERT INTO quyen_sach VALUES("QSA000000040", "DSA000000007", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000041", "DSA000000005", "CNH000000001", "DHA000000001");
INSERT INTO quyen_sach VALUES("QSA000000042", "DSA000000008", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000043", "DSA000000001", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000044", "DSA000000003", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000045", "DSA000000002", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000046", "DSA000000009", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000047", "DSA000000000", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000048", "DSA000000006", "CNH000000000", "DHA000000002");
INSERT INTO quyen_sach VALUES("QSA000000049", "DSA000000004", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000050", "DSA000000006", "CNH000000000", "DHA000000006");
INSERT INTO quyen_sach VALUES("QSA000000051", "DSA000000004", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000052", "DSA000000008", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000053", "DSA000000001", "CNH000000000", "DHA000000015");
INSERT INTO quyen_sach VALUES("QSA000000054", "DSA000000005", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000055", "DSA000000009", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000056", "DSA000000007", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000057", "DSA000000000", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000058", "DSA000000003", "CNH000000000", "DHA000000003");
INSERT INTO quyen_sach VALUES("QSA000000059", "DSA000000002", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000060", "DSA000000006", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000061", "DSA000000002", "CNH000000000", "DHA000000013");
INSERT INTO quyen_sach VALUES("QSA000000062", "DSA000000000", "CNH000000000", "DHA000000008");
INSERT INTO quyen_sach VALUES("QSA000000063", "DSA000000001", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000064", "DSA000000004", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000065", "DSA000000009", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000066", "DSA000000007", "CNH000000001", "DHA000000019");
INSERT INTO quyen_sach VALUES("QSA000000067", "DSA000000003", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000068", "DSA000000005", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000069", "DSA000000008", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000070", "DSA000000009", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000071", "DSA000000005", "CNH000000001", "DHA000000018");
INSERT INTO quyen_sach VALUES("QSA000000072", "DSA000000002", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000073", "DSA000000006", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000074", "DSA000000004", "CNH000000001", "DHA000000016");
INSERT INTO quyen_sach VALUES("QSA000000075", "DSA000000008", "CNH000000000", "DHA000000004");
INSERT INTO quyen_sach VALUES("QSA000000076", "DSA000000003", "CNH000000000", "DHA000000015");
INSERT INTO quyen_sach VALUES("QSA000000077", "DSA000000007", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000078", "DSA000000001", "CNH000000000", "DHA000000017");
INSERT INTO quyen_sach VALUES("QSA000000079", "DSA000000000", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000080", "DSA000000001", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000081", "DSA000000008", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000082", "DSA000000006", "CNH000000000", "DHA000000009");
INSERT INTO quyen_sach VALUES("QSA000000083", "DSA000000009", "CNH000000001", "DHA000000018");
INSERT INTO quyen_sach VALUES("QSA000000084", "DSA000000003", "CNH000000000", "DHA000000007");
INSERT INTO quyen_sach VALUES("QSA000000085", "DSA000000005", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000086", "DSA000000000", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000087", "DSA000000004", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000088", "DSA000000007", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000089", "DSA000000002", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000090", "DSA000000002", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000091", "DSA000000001", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000092", "DSA000000009", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000093", "DSA000000008", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000094", "DSA000000006", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000095", "DSA000000003", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000096", "DSA000000005", "CNH000000001", "DHA000000014");
INSERT INTO quyen_sach VALUES("QSA000000097", "DSA000000000", "CNH000000000", null);
INSERT INTO quyen_sach VALUES("QSA000000098", "DSA000000004", "CNH000000001", null);
INSERT INTO quyen_sach VALUES("QSA000000099", "DSA000000007", "CNH000000000", null);
INSERT INTO nha_xuat_ban VALUES("NXB000000000", "ten NXB", "lienhe.7340@tennxb.com", "0989000018", "72 Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "www.nxb.com");
INSERT INTO nha_xuat_ban VALUES("NXB000000001", "ten NXB", "lienhe.7341@tennxb.com", "0989000019", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "www.nxb.com");
INSERT INTO voucher VALUES("VOU000000000", STR_TO_DATE("9-3-2021", "%d-%m-%Y"), STR_TO_DATE("4-4-2021", "%d-%m-%Y"), null, "070802000011", False);
INSERT INTO voucher VALUES("VOU000000001", STR_TO_DATE("26-1-2021", "%d-%m-%Y"), STR_TO_DATE("5-2-2021", "%d-%m-%Y"), null, "070802000012", False);
INSERT INTO voucher VALUES("VOU000000002", STR_TO_DATE("14-2-2021", "%d-%m-%Y"), STR_TO_DATE("31-8-2021", "%d-%m-%Y"), null, "070802000010", False);
INSERT INTO giam_gia VALUES("VOU000000002", 0.33, 250000);
INSERT INTO giam_gia_van_chuyen VALUES("VOU000000001", 0.52, 49000);
INSERT INTO giam_gia_van_chuyen VALUES("VOU000000000", 0.1, 34000);
INSERT INTO ap_dung_cho VALUES("VOU000000002", "DSA000000009");
INSERT INTO ap_dung_cho VALUES("VOU000000002", "DSA000000005");
INSERT INTO ap_dung_cho VALUES("VOU000000002", "DSA000000000");


ALTER TABLE
    sdt_chi_nhanh
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    nhan_vien
ADD FOREIGN KEY
    (ma_quan_ly) REFERENCES nhan_vien(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    thu_ngan
ADD FOREIGN KEY
    (ma) REFERENCES nhan_vien(ma);

ALTER TABLE
    quan_ly
ADD FOREIGN KEY
    (ma) REFERENCES nhan_vien(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    don_hang
ADD FOREIGN KEY
    (ma_thu_ngan) REFERENCES thu_ngan(ma),
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd),
ADD FOREIGN KEY
    (ma_quan_ly) REFERENCES quan_ly(ma);

ALTER TABLE
    bao_gom
ADD FOREIGN KEY
    (ma_don) REFERENCES don_hang(ma),
ADD FOREIGN KEY
    (ma_quyen_sach) REFERENCES quyen_sach(ma);

ALTER TABLE
    don_hang_online
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd),
ADD FOREIGN KEY
    (ma_don_offline) REFERENCES don_hang(ma);

ALTER TABLE
    bao_gom_online
ADD FOREIGN KEY
    (ma_don) REFERENCES don_hang_online(ma),
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma);

ALTER TABLE
    dau_sach
ADD FOREIGN KEY
    (ma_nha_xuat_ban) REFERENCES nha_xuat_ban(ma);

ALTER TABLE
    quyen_sach
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma),
ADD FOREIGN KEY
    (ma_don_hang) REFERENCES don_hang(ma);

ALTER TABLE
    voucher
ADD FOREIGN KEY
    (ma_don_hang) REFERENCES don_hang(ma),
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd);

ALTER TABLE
    giam_gia
ADD FOREIGN KEY
    (ma) REFERENCES voucher(ma);

ALTER TABLE
    giam_gia_van_chuyen
ADD FOREIGN KEY
    (ma) REFERENCES voucher(ma);

ALTER TABLE
    ap_dung_cho
ADD FOREIGN KEY
    (ma_voucher) REFERENCES voucher(ma),
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma);


