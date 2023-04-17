def start_menu() -> str:
    """
    Вывод стартового меню
    :return:
    """
    value = input("Выберите пункт меню: \n"
                  "1 - создания новой таблицы \n"
                  "2 - вставить значения в таблицу\n"
                  "3 - чтение всех данных из таблицы \n"
                  "4 - редактирование полей таблицы \n"
                  "5 - удаление таблицы \n"
                  "q - выход из программы \n")
    return value


def data_for_create_table(dict_data: dict) -> dict:
    """
    Сбор данных для создания таблицы: имя тип
    :param dict_data:
    :return:
    """
    column_name = input("Введите название столбца (на английском): ")
    column_type = input("Введите тип данных и атрибуты столбца: ")
    new_dict = {column_name: column_type}
    dict_data.update(new_dict)
    return dict_data


def data_for_update_values(dict_data: dict) -> dict:
    """
    Собирает в словарь имя столбца и новые данные
    :param dict_data:
    :return:
    """
    column_name = input("Введите название столбца (на английском): ")
    new_value = input("Введите новое значение: ")
    new_dict = {column_name: new_value}
    dict_data.update(new_dict)
    return dict_data


def column_name_for_insert() -> str:
    '''
    функция для ввода имени колонки
    :return:
    '''
    columns_name = ''
    while True:
        column_name = input("Введите название колонки или q для выхода: ")
        if column_name == "q":
            break
        else:
            columns_name += column_name + ", "
    columns_name = columns_name[:-2]
    return columns_name


def column_data_for_insert(len_column: int) -> str:
    '''
    aeyкция формирует возвращает значения VALUES для запроса при добавлении данных в таблицу
    :param len_column:
    :return: str
    '''
    value = "("
    for i in range(len_column):
        value = value + input(
            f"Введите данные для {i + 1}-го столбца (используйте кавычки для ввода строковых данных)") + ", "
    value = value[:-2]
    value += ")"
    return value


def input_name_table() -> str:
    """
    функция возвращает введенное название таблицы
    :return:
    """
    name_table = input("Введите название таблицы: ")
    return name_table


def input_data() -> str:
    '''
    функция возвращает введенные данные
    :return:
    '''
    name_table = input("Для продолжения нажмите Enter или q для выхода: ")
    return name_table
