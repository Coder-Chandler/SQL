# _*_ coding: utf-8 _*_
import MySQLdb

class MysqlSearch(object):
    def __init__(self):
        self.get_conn()

    def get_conn(self):
        # 获取连接
        try:
            self.conn = MySQLdb.connect(
                host='127.0.0.1',
                user='root',
                passwd='root',  # 你的password
                db='news',
                port=3306,
                charset='utf8'
            )
        except MySQLdb.Error as e:
            print('Error: %s' % e)

    def close_conn(self):
        try:
            if self.conn:
                # 关闭连接
                self.conn.close()
        except MySQLdb.Error as e:
            print('Error: %s' % e)

    def get_one(self):
        # 准备SQL
        sql = 'SELECT * FROM `new` WHERE `types` = %s ORDER BY `id` DESC;'
        # 找到cursor
        cursor = self.conn.cursor()
        # 执行SQL
        cursor.execute(sql, ('新闻',))
        # 拿到结果
        rest = dict(zip([k[0] for k in cursor.description], cursor.fetchone()))
        # 处理数据
        # 关闭链接/cursor
        cursor.close()
        self.close_conn()
        return rest
    
    def get_more(self):
        # 准备SQL
        sql = 'SELECT * FROM `new` WHERE `types` = %s ORDER BY `id` DESC;'
        # 找到cursor
        cursor = self.conn.cursor()
        # 执行SQL
        cursor.execute(sql, ('pornhub',))
        # 拿到结果
        rest = [dict(zip([k[0] for k in cursor.description],  row)) for row in cursor.fetchall()]
        # 处理数据
        # 关闭链接/cursor
        cursor.close()
        self.close_conn()
        return rest
        
    def get_more_page(self, page, page_size):
        offset = int((page - 1)*page_size)
        # 准备SQL
        sql = 'SELECT * FROM `new` WHERE `types` = %s ORDER BY `id` DESC LIMIT offset, page_size;'
        # 找到cursor
        cursor = self.conn.cursor()
        # 执行SQL
        cursor.execute(sql, ('pornhub',))
        # 拿到结果
        rest = [dict(zip([k[0] for k in cursor.description],  row)) for row in cursor.fetchall()]
        # 处理数据
        # 关闭链接/cursor
        cursor.close()
        self.close_conn()
        return rest
    
def main():
    obj = MysqlSearch()
    #rest = obj.get_one()
    #print(rest['title'])
    rest = obj.get_more()
    for item in rest:
        print('-----------')
        print(item)
        
def page():
    obj = MysqlSearch()
    rest = obj.get_more_page(1,3)
    for item in rest:
        print('-----------')
        print(item)

if __name__ == '__main__':
    #main()
    page()


