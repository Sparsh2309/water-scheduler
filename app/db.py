from flaskext.mysql import MySQL
from app import app

mysql = MySQL()

# MySQL configurations
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = "root"
app.config["MYSQL_DATABASE_DB"] = "water_scheduler"
app.config["MYSQL_DATABASE_HOST"] = "db"
mysql.init_app(app)
