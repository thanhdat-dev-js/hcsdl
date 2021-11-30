from random import shuffle, randint, random
from datetime import date

import pandas as pd
import numpy as np

from data import *
from functions import *
from generators import *

pd.options.mode.chained_assignment = None  # default='warn'

N_CHI_NHANH = 2
N_SDT_CHI_NHANH = 5
N_NHAN_VIEN = 10
N_THU_NGAN = 6
N_DON_HANG = 20
N_BAO_GOM = 30
N_DON_HANG_ONLINE = 5
N_BAO_GOM_ONLINE = 7
N_THANH_VIEN = 3
N_DAU_SACH = 10
N_QUYEN_SACH = 100
N_NHA_XUAT_BAN = 2
N_VOUCHER = 3
N_GIAM_GIA = 1
N_GIAM_GIA_VAN_CHUYEN = N_VOUCHER - N_GIAM_GIA
N_AP_DUNG_CHO = 3


def make_chi_nhanh(n=N_CHI_NHANH):
    g = IdGenerator(prefix="CNH")
    ma = [g.next() for _ in range(n)]
    ten = BRANCHES[:n]
    email = [make_email("lienhe" , org="sahafake." + ten[i], enforce_unique=False) for i in range(n)]
    dia_chi = [make_address() for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ten": ten,
        "email": email,
        "dia_chi": dia_chi,
    })


def make_sdt_chi_nhanh(n=N_SDT_CHI_NHANH):
    ma_chi_nhanh = [None for _ in range(n)]
    sdt = [make_phone() for _ in range(n)]

    return pd.DataFrame({
        "ma_chi_nhanh": ma_chi_nhanh,
        "sdt": sdt,
    })


def make_nhan_vien(n=N_NHAN_VIEN):
    g = IdGenerator(prefix="NVI")
    ma = [g.next() for _ in range(n)]
    names = [make_name() for _ in range(n)]
    ho = []
    ten = []
    for name in names:
        h, t = last_name_first_name(name)
        ho.append(h)
        ten.append(t)

    email = [make_email(names[i]) for i in range(n)]
    sdt = [make_phone() for _ in range(n)]
    dia_chi = [make_address() for _ in range(n)]

    ngay_sinh = [
        random_date(date(1980, 1, 1), date(2000, 1, 1))
        for _ in range(n)
    ]

    cccd = [make_ssn() for _ in range(n)]

    thoi_gian_bat_dau_lam = [
        random_date(date(2010, 1, 1), date.today())
        for _ in range(n)
    ]

    he_so_luong = [
        int((date.today() - thoi_gian_bat_dau_lam[i]).days/365.2425)//3 + 1
        for i in range(n)
    ]
    luong = [BASIC_WAGE*he_so_luong[i] for i in range(n)]

    ma_chi_nhanh = [None for _ in range(n)]
    ma_quan_ly = [None for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ho": ho,
        "ten": ten,
        "ngay_sinh": ngay_sinh,
        "email": email,
        "sdt": sdt,
        "dia_chi": dia_chi,
        "cccd": cccd,
        "luong": luong,
        "thoi_gian_bat_dau_lam": thoi_gian_bat_dau_lam,
        "ma_chi_nhanh": ma_chi_nhanh,
        "ma_quan_ly": ma_quan_ly,
    })


def make_thu_ngan(n=N_THU_NGAN):
    ma = [None for _ in range(n)]
    g = IdGenerator(prefix="QUA")
    ma_quay = [g.next() for _ in range(n)]

    doanh_so = [randint(10000, 20000) * 1000 for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ma_quay": ma_quay,
        "doanh_so": doanh_so,
    })


def make_quan_ly(n=N_CHI_NHANH):
    ma = [None for _ in range(n)]
    ma_chi_nhanh = [None for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ma_chi_nhanh": ma_chi_nhanh,
    })


def make_don_hang(n=N_DON_HANG):
    g = IdGenerator(prefix="DHA")
    ma = [g.next() for _ in range(n)]

    ngay_tao = [
        random_date(date(2020, 1, 1), date.today())
        for _ in range(n)
    ]

    so_luong = [randint(1, 10) for _ in range(n)]
    tong_tien = [randint(100, 10000)*1000 for _  in range(n)]

    ma_thu_ngan = [None for _ in range(n)]
    ma_thanh_vien = [None for _ in range(n)]
    ma_quan_ly = [None for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ngay_tao": ngay_tao,
        "so_luong": so_luong,
        "tong_tien": tong_tien,
        "ma_thu_ngan": ma_thu_ngan,
        "ma_thanh_vien": ma_thanh_vien,
        "ma_quan_ly": ma_quan_ly,
    })


def make_bao_gom(n=N_BAO_GOM):
    g = IdGenerator()
    ma = [None for _ in range(n)]
    ma_quyen_sach = [None for _ in range(n)]

    return pd.DataFrame({
        "ma_don": ma,
        "ma_quyen_sach": ma_quyen_sach,
    })


def make_don_hang_online(n=N_DON_HANG_ONLINE):
    g = IdGenerator(prefix="DHO")
    ma = [g.next() for _ in range(n)]

    ngay_dat = [
        random_date(date(2020, 1, 1), date.today())
        for _ in range(n)
    ]

    so_luong = [randint(1, 10) for _ in range(n)]
    tong_tien = [randint(100, 10000)*1000 for _  in range(n)]

    cccd = [None for _ in range(n)]
    ma_don_offline = [None for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ngay_dat": ngay_dat,
        "so_luong": so_luong,
        "tong_tien": tong_tien,
        "ma_thanh_vien": cccd,
        "ma_don_offline": ma_don_offline,
    })


def make_bao_gom_online(n=N_BAO_GOM_ONLINE):
    ma = [None for _ in range(n)]
    ma_dau_sach = [None for _ in range(n)]
    so_luong = [randint(1, 10) for _ in range(n)]

    return pd.DataFrame({
        "ma_don": ma,
        "ma_dau_sach": ma_dau_sach,
        "so_luong": so_luong,
    })


def make_thanh_vien(n=N_THANH_VIEN):
    cccd = [make_ssn() for _ in range(n)]

    names = [make_name() for _ in range(n)]
    ho = []
    ten = []
    for name in names:
        h, t = last_name_first_name(name)
        ho.append(h)
        ten.append(t)

    email = [make_email(names[i], org="gmail") for i in range(n)]
    sdt = [make_phone() for _ in range(n)]
    dia_chi = [make_address() for _ in range(n)]

    return pd.DataFrame({
        "cccd": cccd,
        "ho": ho,
        "ten": ten,
        "email": email,
        "sdt": sdt,
        "dia_chi": dia_chi,
    })


def make_dau_sach(n=N_DAU_SACH):
    g = IdGenerator(prefix="DSA")
    ma = [g.next() for _ in range(n)]

    g = SequenceRandomizer(BOOKS)
    ten = []
    the_loai = []
    for _ in range(n):
        book = g.next()
        ten.append(book["name"])
        the_loai.append(book["category"])

    tac_gia = [make_name() for _ in range(n)]

    gia_niem_yet = [randint(50, 3000)*1000 for _ in range(n)]
    gia_nhap = [(gia_niem_yet[i]//1000 * 9 // 10) * 1000 for i in range(n)]

    so_luong = [randint(1, 10) for _ in range(n)]
    ma_nha_xuat_ban = [None for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ten": ten,
        "tac_gia": tac_gia,
        "the_loai": the_loai,
        "gia_nhap": gia_nhap,
        "gia_niem_yet": gia_niem_yet,
        "so_luong": so_luong,
        "ma_nha_xuat_ban": ma_nha_xuat_ban,
    })


def make_quyen_sach(n=N_QUYEN_SACH):
    g = IdGenerator(prefix="QSA")
    ma = [g.next() for _ in range(n)]
    ma_dau_sach = [None for _ in range(n)]
    ma_chi_nhanh = [None for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ma_dau_sach": ma_dau_sach,
        "ma_chi_nhanh": ma_chi_nhanh,
    })


def make_nha_xuat_ban(n=N_NHA_XUAT_BAN):
    g = IdGenerator(prefix="NXB")
    ma = [g.next() for _ in range(n)]

    ten = [PUBLISHERS[i]["name"] for i in range(n)]

    email = [make_email("lienhe", ten[i], False) for i in range(n)]
    sdt = [make_phone() for _ in range(n)]
    dia_chi = [PUBLISHERS[i]["address"] for i in range(n)]
    website = ["www." + domainize(ten[i]) for i in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "ten": ten,
        "email": email,
        "sdt": sdt,
        "dia_chi": dia_chi,
        "website": website,
    })


def make_voucher(n=N_VOUCHER):
    g = IdGenerator(prefix="VOU")
    ma = [g.next() for _ in range(n)]

    thoi_gian_het_hieu_luc = [
        random_date(date(2021, 1, 2), date.today())
        for _ in range(n)
    ]
    thoi_gian_bat_dau_hieu_luc = [
        random_date(date(2021, 1, 1), thoi_gian_het_hieu_luc[i])
        for i in range(n)
    ]

    ma_don_hang = [None for _ in range(n)]
    ma_thanh_vien = [None for _ in range(n)]
    da_su_dung = [False for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "thoi_gian_bat_dau_hieu_luc": thoi_gian_bat_dau_hieu_luc,
        "thoi_gian_het_hieu_luc": thoi_gian_het_hieu_luc,
        "ma_don_hang": ma_don_hang,
        "ma_thanh_vien": ma_thanh_vien,
        "da_su_dung": da_su_dung,
    })


def make_giam_gia(n=N_GIAM_GIA):
    ma = [None for _ in range(n)]

    phan_tram_giam = [randint(10, 100)/100 for _ in range(n)]
    giam_toi_da = [randint(10, 1000)*1000 for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "phan_tram_giam": phan_tram_giam,
        "giam_toi_da": giam_toi_da,
    })


def make_giam_gia_van_chuyen(n=N_GIAM_GIA_VAN_CHUYEN):
    ma = [None for _ in range(n)]

    phan_tram_giam = [randint(10, 100)/100 for _ in range(n)]
    giam_toi_da = [randint(10, 100)*1000 for _ in range(n)]

    return pd.DataFrame({
        "ma": ma,
        "phan_tram_giam": phan_tram_giam,
        "giam_toi_da": giam_toi_da,
    })


def make_ap_dung_cho(n=N_AP_DUNG_CHO):
    ma_voucher = [None for _ in range(n)]
    ma_dau_sach = [None for _ in range(n)]

    return pd.DataFrame({
        "ma_voucher": ma_voucher,
        "ma_dau_sach": ma_dau_sach,
    })






def lookup(table, src, value, des):
    n = len(table)
    for i in range(n):
        if table[src][i] == value:
            return table[des][i]

    return None


def fk_sdt_chi_nhanh(sdt_chi_nhanh, chi_nhanh):
    g = SequenceRandomizer(chi_nhanh["ma"].tolist())
    n = len(sdt_chi_nhanh)
    ma_chi_nhanh = [g.next() for _ in range(n)]
    for i in range(n):
        sdt_chi_nhanh["ma_chi_nhanh"][i] = ma_chi_nhanh[i]


def fk_nhan_vien(nhan_vien, chi_nhanh, quan_ly, thu_ngan):
    g = SequenceRandomizer(nhan_vien["ma"].tolist())
    ql = {}
    lql = {}
    for ma_chi_nhanh in chi_nhanh["ma"]:
        ma_quan_ly = g.next()
        ql[ma_quan_ly] = ma_chi_nhanh
        lql[ma_quan_ly] = 0

    g = SequenceRandomizer(list(ql.keys()))
    n = len(nhan_vien)
    for i in range(n):
        ma = nhan_vien["ma"][i]
        if ma in ql:
            ma_quan_ly = ma
        else:
            ma_quan_ly = g.next()
        nhan_vien["ma_quan_ly"][i] = ma_quan_ly
        nhan_vien["ma_chi_nhanh"][i] = ql[ma_quan_ly]
        lql[ma_quan_ly] = max(lql[ma_quan_ly], nhan_vien["luong"][i])

    for i in range(n):
        ma = nhan_vien["ma"][i]
        if ma in ql:
            nhan_vien["luong"][i] = lql[ma]

    for i, ma_quan_ly in enumerate(ql.keys()):
        quan_ly["ma"][i] = ma_quan_ly
        quan_ly["ma_chi_nhanh"][i] = ql[ma_quan_ly]

    n = len(thu_ngan)
    g = SequenceRandomizer(nhan_vien["ma"].tolist())
    for i in range(n):
        while True:
            ma = g.next()
            if not ma in ql:
                break

        thu_ngan["ma"][i] = ma


def fk_don_hang(don_hang, thu_ngan, quan_ly, nhan_vien, thanh_vien, bao_gom, quyen_sach, dau_sach):
    tnql = {}
    for ma_thu_ngan in thu_ngan["ma"].tolist():
        tnql[ma_thu_ngan] = lookup(
                nhan_vien,
                "ma", ma_thu_ngan,
                "ma_quan_ly"
        )

    sl = {}
    tt = {}

    gdh = SequenceRandomizer(don_hang["ma"].tolist())
    gqs = SequenceRandomizer(quyen_sach["ma"].tolist())
    n = len(bao_gom)
    for i in range(n):
        ma_don = gdh.next()
        ma_quyen_sach = gqs.next()
        bao_gom["ma_don"][i] = ma_don
        bao_gom["ma_quyen_sach"][i] = ma_quyen_sach

        ma_dau_sach = lookup(quyen_sach, "ma", ma_quyen_sach, "ma_dau_sach")
        gia = lookup(dau_sach, "ma", ma_dau_sach, "gia_niem_yet")

        if not ma_don in sl:
            sl[ma_don] = 0
            tt[ma_don] = 0
        sl[ma_don] += 1
        tt[ma_don] += gia


    gtv = SequenceRandomizer(thanh_vien["cccd"].tolist())
    gtn = SequenceRandomizer(thu_ngan["ma"].tolist())
    n = len(don_hang)
    for i in range(n):
        ma_thanh_vien = None
        if randint(0, 99) < 30:
            ma_thanh_vien = gtv.next()
        ma_thu_ngan = gtn.next()

        don_hang["ma_thu_ngan"][i] = ma_thu_ngan
        don_hang["ma_thanh_vien"][i] = ma_thanh_vien
        don_hang["ma_quan_ly"][i] = tnql[ma_thu_ngan]
        don_hang["so_luong"][i] = sl[don_hang["ma"][i]]
        don_hang["tong_tien"][i] = tt[don_hang["ma"][i]]



def fk_don_hang_online(don_hang_online, don_hang, dau_sach, thanh_vien, bao_gom_online):
    sl = {}
    tt = {}

    gdho = SequenceRandomizer(don_hang_online["ma"].tolist())
    gds = SequenceRandomizer(dau_sach["ma"].tolist())
    n = len(bao_gom_online)
    for i in range(n):
        ma_don = gdho.next()
        ma_dau_sach = gds.next()
        c = randint(1, 10)
        bao_gom_online["ma_don"][i] = ma_don
        bao_gom_online["ma_dau_sach"][i] = ma_dau_sach
        bao_gom_online["so_luong"][i] = c

        gia = lookup(dau_sach, "ma", ma_dau_sach, "gia_niem_yet")

        if not ma_don in sl:
            sl[ma_don] = 0
            tt[ma_don] = 0
        sl[ma_don] += c
        tt[ma_don] += gia*c

    gtv = SequenceRandomizer(thanh_vien["cccd"].tolist())
    n = len(don_hang_online)
    for i in range(n):
        ma_thanh_vien = gtv.next()

        don_hang_online["ma_thanh_vien"][i] = ma_thanh_vien
        don_hang_online["so_luong"][i] = sl[don_hang_online["ma"][i]]
        don_hang_online["tong_tien"][i] = tt[don_hang_online["ma"][i]]


def fk_sach(dau_sach, nha_xuat_ban, quyen_sach, chi_nhanh):
    sl = {}
    for ma in dau_sach["ma"].tolist():
        sl[ma] = 0

    n = len(quyen_sach)
    g = SequenceRandomizer(dau_sach["ma"].tolist())
    gcn = SequenceRandomizer(chi_nhanh["ma"].tolist())
    for i in range(n):
        ma_dau_sach = g.next()
        quyen_sach["ma_dau_sach"][i] = ma_dau_sach
        quyen_sach["ma_chi_nhanh"][i] = gcn.next()
        sl[ma_dau_sach] += 1

    g = SequenceRandomizer(nha_xuat_ban["ma"].tolist())

    n = len(dau_sach)
    for i in range(n):
        dau_sach["ma_nha_xuat_ban"][i] = g.next()
        dau_sach["so_luong"] = sl[dau_sach["ma"][i]]



def fk_voucher(voucher, giam_gia, giam_gia_van_chuyen, thanh_vien, don_hang):
    g = SequenceRandomizer(thanh_vien["cccd"].tolist())
    n = len(thanh_vien)
    for i in range(n):
        voucher["ma_thanh_vien"][i] = g.next()

    g = SequenceRandomizer(voucher["ma"].tolist())
    n = len(giam_gia)
    for i in range(n):
        giam_gia["ma"][i] = g.next()
    n = len(giam_gia_van_chuyen)
    for i in range(n):
        giam_gia_van_chuyen["ma"][i] = g.next()


def fk_ap_dung_cho(ap_dung_cho, giam_gia, dau_sach):
    gds = SequenceRandomizer(dau_sach["ma"].tolist())
    ggg = SequenceRandomizer(giam_gia["ma"].tolist())

    n = len(ap_dung_cho)
    for i in range(n):
        ap_dung_cho["ma_voucher"][i] = ggg.next()
        ap_dung_cho["ma_dau_sach"][i] = gds.next()


def fk_thu_ngan(thu_ngan, don_hang):
    doanh_so = {}
    for ma in thu_ngan['ma']:
        doanh_so[ma] = 0.0
    for i in range(len(don_hang)):
        doanh_so[don_hang['ma_thu_ngan'][i]] += don_hang['tong_tien'][i]

    for i in range(len(thu_ngan)):
        thu_ngan['doanh_so'][i] = doanh_so[thu_ngan['ma'][i]]






def cc(make_table, table_name):
    table = make_table()
    commands = dumps_sql_insert_commands(table, table_name)
    return commands

if __name__ == "__main__":
    chi_nhanh = make_chi_nhanh()
    sdt_chi_nhanh = make_sdt_chi_nhanh()
    nhan_vien = make_nhan_vien()
    thu_ngan = make_thu_ngan()
    quan_ly = make_quan_ly()
    don_hang = make_don_hang()
    bao_gom = make_bao_gom()
    don_hang_online = make_don_hang_online()
    bao_gom_online = make_bao_gom_online()
    thanh_vien = make_thanh_vien()
    dau_sach = make_dau_sach()
    quyen_sach = make_quyen_sach()
    nha_xuat_ban = make_nha_xuat_ban()
    voucher = make_voucher()
    giam_gia = make_giam_gia()
    giam_gia_van_chuyen = make_giam_gia_van_chuyen()
    ap_dung_cho = make_ap_dung_cho()


    fk_sdt_chi_nhanh(sdt_chi_nhanh, chi_nhanh)
    fk_nhan_vien(nhan_vien, chi_nhanh, quan_ly, thu_ngan)
    fk_sach(dau_sach, nha_xuat_ban, quyen_sach, chi_nhanh)
    fk_don_hang(don_hang, thu_ngan, quan_ly, nhan_vien, thanh_vien, bao_gom, quyen_sach, dau_sach)
    fk_don_hang_online(don_hang_online, don_hang, dau_sach, thanh_vien, bao_gom_online)
    fk_voucher(voucher, giam_gia, giam_gia_van_chuyen, thanh_vien, don_hang)
    fk_ap_dung_cho(ap_dung_cho, giam_gia, dau_sach)
    fk_thu_ngan(thu_ngan, don_hang)


    commands = dumps_sql_insert_commands(chi_nhanh, "chi_nhanh")
    commands += dumps_sql_insert_commands(sdt_chi_nhanh, "sdt_chi_nhanh")
    commands += dumps_sql_insert_commands(nhan_vien, "nhan_vien")
    commands += dumps_sql_insert_commands(thu_ngan, "thu_ngan")
    commands += dumps_sql_insert_commands(quan_ly, "quan_ly")
    commands += dumps_sql_insert_commands(don_hang, "don_hang")
    commands += dumps_sql_insert_commands(bao_gom, "bao_gom")
    commands += dumps_sql_insert_commands(don_hang_online, "don_hang_online")
    commands += dumps_sql_insert_commands(bao_gom_online, "bao_gom_online")
    commands += dumps_sql_insert_commands(thanh_vien, "thanh_vien")
    commands += dumps_sql_insert_commands(dau_sach, "dau_sach")
    commands += dumps_sql_insert_commands(quyen_sach, "quyen_sach")
    commands += dumps_sql_insert_commands(nha_xuat_ban, "nha_xuat_ban")
    commands += dumps_sql_insert_commands(voucher, "voucher")
    commands += dumps_sql_insert_commands(giam_gia, "giam_gia")
    commands += dumps_sql_insert_commands(giam_gia_van_chuyen, "giam_gia_van_chuyen")
    commands += dumps_sql_insert_commands(ap_dung_cho, "ap_dung_cho")

    with open("inserts.sql", mode="wb+") as f:
        f.write(commands.encode())

    all_commands = ""
    with open("tables.sql", "r", encoding="utf-8") as f:
        all_commands = f.read()

    all_commands += "\n"*3 + commands

    with open("foreign_keys.sql", "r", encoding="utf-8") as f:
        all_commands += "\n"*3 + f.read()

    with open("all.sql", mode="w+", encoding="utf-8") as f:
        f.write(all_commands)

