"""Chương trình chuyển đổi từ Tiếng Việt có dấu sang Tiếng Việt không dấu
Chỉnh sửa từ mã nguồn của anh NamNT
http://www.vithon.org/2009/06/14/x%E1%BB%AD-ly-ti%E1%BA%BFng-vi%E1%BB%87t-trong-python
"""

import re

INTAB = "ạảãàáâậầấẩẫăắằặẳẵóòọõỏôộổỗồốơờớợởỡéèẻẹẽêếềệểễúùụủũưựữửừứíìịỉĩýỳỷỵỹđẠẢÃÀÁÂẬẦẤẨẪĂẮẰẶẲẴÓÒỌÕỎÔỘỔỖỒỐƠỜỚỢỞỠÉÈẺẸẼÊẾỀỆỂỄÚÙỤỦŨƯỰỮỬỪỨÍÌỊỈĨÝỲỶỴỸĐ"
# INTAB = [ch.encode('utf8') or ch in unicode(INTAB, 'utf8')]


OUTTAB = "a" * 17 + "o" * 17 + "e" * 11 + "u" * 11 + "i" * 5 + "y" * 5 + "d" + \
         "A" * 17 + "O" * 17 + "E" * 11 + "U" * 11 + "I" * 5 + "Y" * 5 + "D"

r = re.compile("|".join(INTAB))
replaces_dict = dict(zip(INTAB, OUTTAB))


def no_accent_vietnamese(utf8_str):
    return r.sub(lambda m: replaces_dict[m.group(0)], utf8_str)