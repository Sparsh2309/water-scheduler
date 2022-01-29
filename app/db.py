import pymysql
from flaskext.mysql import MySQL
from app import app

mysql = MySQL()

# MySQL configurations
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = "root"
app.config["MYSQL_DATABASE_DB"] = "water_scheduler"
app.config["MYSQL_DATABASE_HOST"] = "db"
mysql.init_app(app)


def select_cursor(query):
    """
    This generic function will be used to run select query in mysql db
    """
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(query)
    rows = cursor.fetchall()
    return rows


def insert_cursor(query):
    """
    This generic function will be used to run insert query in mysql db
    """
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.Cursor)
    cursor.execute(query)
    conn.commit()
    conn.close()
    return True
