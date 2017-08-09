# _*_ coding: utf-8 _*_
import MySQLdb

# 获取连接
try:
    conn = MySQLdb.connect(
        host='127.0.0.1',
        user='root',
        passwd='root',# 你的password
        db='news',
        port=3306,
        charset='utf8'
    )

    # 获取数据
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM `new` WHERE `author` = 'bart' ORDER BY `id` LIMIT 0,10;")
    rest = cursor.fetchone()
    print(rest)

    # 关闭连接
    conn.close()
except MySQLdb.Error as e:
    print('Error: %s' % e)





