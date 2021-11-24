from datetime import date, time, datetime
from random import random

from no_accent_vietnamese import no_accent_vietnamese


def last_name_first_name(name):
    isep = name.rindex(' ')
    return name[:isep].strip(), name[isep:].strip()


def random_date(begin: date, end: date):
    begin_ts = datetime(begin.year, begin.month, begin.day).timestamp()
    end_ts = datetime(end.year, end.month, end.day).timestamp()

    duration = (end_ts - begin_ts)
    value_ts = random()*duration + begin_ts
    value = date.fromtimestamp(value_ts)

    return value


def dumps_sql_value(value):
    if value == None:
        return "null"
    if type(value) == str:
        return f"\"{value}\""
    if type(value) == date:
        return f"STR_TO_DATE(\"{value.day}-{value.month}-{value.year}\", \"%d-%m-%Y\")"
    return str(value)


def dumps_sql_insert_commands(table, table_name):
    commands = ""
    tbl = ", ".join(table.columns)
    tbl = f"{table_name}({tbl})"
    prefix = f"INSERT INTO {tbl} VALUES"
    for row in table.itertuples(index=False):
        command = prefix + "("
        command += ", ".join(
            map(dumps_sql_value, row)
        )
        command += ");\n"

        commands += command

    return commands



if __name__ == "__main__":
    res = random_date(date(2010, 1, 1), date(2020, 1, 1))
    print(res)
