import mysql.connector
from mysql.connector import Error


def create_connection(host_name: str, user_name: str, user_password: str, name_db: str):
    """
    функция осуществляет подключение к базе mysql
    :param host_name:
    :param user_name:
    :param user_password:
    :param name_db:
    :return:
    """
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=name_db)
        print(f"Подключение к базе данных MySQL " + name_db + " прошло успешно")
    except Error as e:
        print(f"Произошла ошибка '{e}'")

    return connection


def execute_query1(connection, query):
    """
    функция выполняет запрос в базу
    :param connection:
    :param query:
    :return:
    """
    with connection.cursor() as cursor:
        cursor.execute(query)

        # connection.commit()
        for i in cursor:
            print(i)


def execute_query2(connection, query):
    """
        функция выполняет запрос в базу с сохранением записей
        :param connection:
        :param query:
        :return:
        """
    with connection.cursor() as cursor:
        cursor.execute(query)
        connection.commit()


def read_from_table(name_table: str) -> str:
    """
    запрос для чтения всех данных из таблицы
    :param name_table:
    :return:
    """
    query = "SELECT * FROM " + name_table + ";"
    return query


def create_table(name_table: str, data: dict) -> str:
    """
    запрос для создания новой таблицы
    :param name_table:
    :param data:
    :return:
    """
    query = "CREATE TABLE IF NOT EXISTS " + name_table + " ("
    for i in data.items():
        query = query + i[0] + ' ' + i[1] + ','
    query = query[:-1]
    query = query + ');'
    return query


def insert_table(name_table: str, column_name: str, data: str) -> str:
    """
    запрос для ввода новых данных в таблицу
    :param name_table:
    :param column_name:
    :param data:
    :return:
    """
    query = "INSERT INTO " + name_table + " (" + column_name + ")"
    query = query + ' VALUES' + data + ";"
    return query


def update_table(name_table: str, data: dict) -> str:
    """
    запрос для обновления всех данных в колонках
    :param name_table:
    :param data:
    :return:
    """
    query = "UPDATE " + name_table + " SET "
    for i in data.items():
        query = query + i[0] + '=' + i[1] + ', '
    query = query[:-2]
    query += ";"
    return query


def delete_table(name_table: str) -> str:
    """
    pfgрос для удаления таблицы
    :param name_table:
    :return:
    """
    query = "DROP TABLE IF EXISTS " + name_table + ";"
    return query

