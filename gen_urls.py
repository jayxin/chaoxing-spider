import re

PAGETYPE = {
    "cov": 0,  # 封面
    "bok": 1,  # 书名
    "leg": 2,  # 版权
    "fow": 3,  # 前言
    "dir": 4,  # 目录
    "cnt": 5,  # 正文
    "att": 6,  # 附录
    "bac": 7,  # 封底
}

PAGETYPEINFO = [
    {"v": PAGETYPE["cov"], "s": "cov"},  # 封面
    {"v": PAGETYPE["bok"], "s": "bok"},  # 书名
    {"v": PAGETYPE["leg"], "s": "leg"},  # 版权
    {"v": PAGETYPE["fow"], "s": "fow"},  # 前言
    {"v": PAGETYPE["dir"], "s": "!"},  # 目录
    {"v": PAGETYPE["cnt"], "s": ""},  # 正文
    {"v": PAGETYPE["att"], "s": "att"},  # 附录
    {"v": PAGETYPE["bac"], "s": "bac"},  # 封底
]

PREFIX = "https://readsvr.chaoxing.com"
SUFFIX = "?zoom=2"

jpgPath = ""
pageRanges = []

with open("在线试读.html", "r", encoding="utf-8") as f:
    pat = "jpgPath:.*?'(.*?)'.*?"
    text = f.readlines()
    jpgPath = re.findall(pat, str(text))
    if len(jpgPath) > 0:
        jpgPath = jpgPath[0]

# print(jpgPath)

with open("在线试读.html", "r", encoding="utf-8") as f:
    pat = "var pages =(.*?), startPage"
    text = f.readlines()
    pageRanges = re.findall(pat, str(text))
    if len(pageRanges) > 0:
        pageRanges = eval(pageRanges[0])

# print(pageRanges)

for i in range(8):
    url = PREFIX + jpgPath
    startPage = pageRanges[i][0]
    endPage = pageRanges[i][1] + 1
    pages = list(range(startPage, endPage))
    tlen = len(PAGETYPEINFO[i]["s"])
    entries = []
    for item in pages:
        entries.append(
            "{}{}{}".format(
                PAGETYPEINFO[i]["s"], "0" * (6 - tlen - len(str(item))), item
            )
        )
    for entry in entries:
        res = url + entry + SUFFIX
        print(res)
