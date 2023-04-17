import connector
from mysql.connector import Error
import view
import yaml
from yaml.loader import SafeLoader

# считываем данные из yaml файла с параметрами и паролями
with open('mysql.yaml') as file:
    key = yaml.load(file, Loader=SafeLoader)

# подключаемся к базе данных
connection = connector.create_connection(str(key['host']), str(key['user']), str(key['passwd']), str(key['database']))

while True:
    value = view.start_menu()
    if value == '1':
        name_table = view.input_name_table()
        data = dict()
        while True:
            if view.input_data() != 'q':
                data = view.data_for_create_table(data)
            else:
                break
        query = connector.create_table(name_table, data)
        try:
            connector.execute_query1(connection, query)
            print("Таблица успешно создана")
        except Error as e:
            print(f"Таблица не создана, произошла ошибка '{e}'")
    elif value == '2':
        name_table = view.input_name_table()
        columns_name = view.column_name_for_insert()
        list_coumns = columns_name.split(',')
        len_columns = len(list_coumns)
        value = view.column_data_for_insert(len_columns)
        query = connector.insert_table(name_table, columns_name, value)

        try:
            connector.execute_query2(connection, query)
            print("Данные успешно добавлены в таблицу")
        except Error as e:
            print(f"Данные не добавлены, произошла ошибка '{e}'")

    elif value == '3':
        name_table = view.input_name_table()
        query = connector.read_from_table(name_table)
        try:
            print(f"Данные из  таблицу {name_table} :")
            connector.execute_query1(connection, query)
        except Error as e:
            print(f"Произошла ошибка '{e}'")

    elif value == '4':
        name_table = view.input_name_table()
        data = dict()
        while True:
            if view.input_data() != 'q':
                data = view.data_for_update_values(data)
            else:
                break
        query = connector.update_table(name_table, data)
        print(query)
        try:
            print(f"Данные в таблице {name_table} изменены:")
            connector.execute_query2(connection, query)
        except Error as e:
            print(f"Произошла ошибка '{e}'")

    elif value == '5':
        name_table = view.input_name_table()
        query = connector.delete_table(name_table)

        try:
            print(f"Таблица {name_table} успешно удалена!")
            connector.execute_query1(connection, query)
        except Error as e:
            print(f"Произошла ошибка '{e}'")

    elif value == 'q':
        break
    else:
        print("Не верно указаны пункты, попробуйте еще раз")
