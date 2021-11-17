from function import *
from random import randint, shuffle

from no_accent_vietnamese import no_accent_vietnamese

from data import *

def email_namize(s: str):
    return no_accent_vietnamese(s).lower().replace(" ", ".")

def domainize(s: str, extension=".com"):
    return no_accent_vietnamese(s).lower().replace(" ", "") + extension

class EmailGenerator:
    def __init__(self):
        self.counter = randint(1, 10000)


    def make_email(self, name: str, domain: str, enforce_unique=True):
        unique_part = ""
        if enforce_unique:
            unique_part = "." + str(self.counter)
            self.counter += 1
        return name + unique_part + "@" + domain

    def make_email_org(self, name: str, org: str="sahafake", enforce_unique=True):
        return self.make_email(
            name=email_namize(name),
            domain=domainize(org),
            enforce_unique=enforce_unique
        )


def fixed_length_int_to_str(value: int, length=12):
    res = str(value)
    if len(res) > length:
        res = res[:length]
    if len(res) < length:
        res = '0'*(length - len(res)) + res
    return res


class IdGenerator:
    def __init__(self, length=12, prefix=''):
        self.length = length
        self.prefix = prefix[:min(length, len(prefix))]
        self.counter = 0

    def next(self):
        postfix_len = self.length - len(self.prefix)
        id = self.prefix + fixed_length_int_to_str(self.counter, postfix_len)
        self.counter += 1
        return id


class HumanNameGenerator:
    FIRST = FIRST_NAMES
    MIDDLE = MIDDLE_NAMES
    LAST = LAST_NAMES

    def __init__(self):
        pass

    def next(self):
        li = randint(0, len(self.LAST) - 1)
        mi = randint(0, len(self.MIDDLE) - 1)
        fi = randint(0, len(self.FIRST) - 1)

        if self.MIDDLE[mi] == "":
            return self.LAST[li] + " " + self.FIRST[fi]
        return self.LAST[li] + " " + self.MIDDLE[mi] + " " + self.FIRST[fi]


class SequenceRandomizer:
    def __init__(self, sequence):
        self.sequence = sequence
        self.reset()

    def reset(self):
        shuffle(self.sequence)
        self.index = 0

    def next(self):
        res = self.sequence[self.index]
        self.index += 1
        if self.index == len(self.sequence):
            self.reset()
        return res


address_generator = SequenceRandomizer(ADDRESS)
def make_address():
    return address_generator.next()


email_generator = EmailGenerator()
def make_email(name, org="sahafake", enforce_unique=True):
    return email_generator.make_email_org(name, org, enforce_unique)


phone_generator = IdGenerator(length=10, prefix="0989")
def make_phone():
    return phone_generator.next()


ssn_generator = IdGenerator(length=12, prefix="070802")
def make_ssn():
    return ssn_generator.next()


name_generator = HumanNameGenerator()
def make_name():
    return name_generator.next()




if __name__ == "__main__":
    hng = HumanNameGenerator()
    eg = EmailGenerator()
    for _ in range(20):
        name = hng.next()
        email = eg.make_email_org(name)
        print(name)
        print(email)
