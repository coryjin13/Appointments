class DBConfig(object):
    """ DB_ON must be True to use the DB! """
    DB_ON = True
    DB_DRIVER = 'mysql'
    DB_ORM = False

class DevelopmentDBConfig(DBConfig):
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_DATABASE_NAME = 'appointments'
    DB_HOST = 'localhost'
    DB_PORT = 8889
    DB_OPTIONS = {
        'unix_socket': '/Applications/MAMP/tmp/mysql/mysql.sock'
    }

class StagingDBConfig(DBConfig):
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_DATABASE_NAME = 'appointments'
    DB_HOST = 'localhost'

class ProductionDBConfig(DBConfig):
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_DATABASE_NAME = 'appointments'
    DB_HOST = 'localhost'
