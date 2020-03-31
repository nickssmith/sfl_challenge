import mysql.connector
import pandas
import os
import json
import csv
import copy
import uuid


# Create your models here.

class db_connection():

    def run_sql(self, sql_cmd):
        """

        :param sql_cmd: takes a mysql command as a string
        :return: list of tuples where each tuple corresponds to a returned row of the command
        """

        cursor = self.connection.cursor()
        cursor.execute(sql_cmd)
        self.connection.commit()
        list_of_rows_returned = []
        for (sql_cmd) in cursor:
            list_of_rows_returned.append(sql_cmd)
        return list_of_rows_returned

    def get_db(self):
        with open('config.json') as json_file:
            config = json.load(json_file)
            return config["db"]

    def get_db_addr(self):
        with open('config.json') as json_file:
            config = json.load(json_file)
            return config["db_addr"]

    def get_db_user(self):
        with open('config.json') as json_file:
            config = json.load(json_file)
            return config["db_user"]

    def get_db_password(self):
        with open('config.json') as json_file:
            config = json.load(json_file)
            return config["db_password"]

    def get_db_root_user(self):
        with open('config.json') as json_file:
            config = json.load(json_file)
            return config["db_root_user"]

    def get_db_root_password(self):
        with open('config.json') as json_file:
            config = json.load(json_file)
            return config["db_root_password"]

    def get_connection(self):
        conn = mysql.connector.connect(user=self.db_user, password=self.db_password,
                                       host=self.db_addr, buffered=True, database=self.db,
                                       auth_plugin='mysql_native_password')
        return conn

    def __init__(self):
        self.db = self.get_db()
        self.db_addr = self.get_db_addr()
        self.db_user = self.get_db_user()
        self.db_password = self.get_db_password()
        self.db_root_user = self.get_db_root_user()
        self.db_root_password = self.get_db_root_password()
        self.connection = self.get_connection()


conn = db_connection()

sql_cmd = "select * from users;"
SQL_Query = pandas.read_sql_query(sql_cmd,conn.connection)

df = pandas.DataFrame(SQL_Query, columns=["username", "password", "role", "projects", "full_name", "birthday"])
print(df)
