﻿#language: ru
@tree

@UH32_Treasury

Функционал: 01. Начальные данные для казначейства

	Как бизнес-аналитик я хочу
	проверить работоспособность документа заявки на операцию
	чтобы исключить ошибки при работе с заявками на оплату

Контекст:

	И я подключаю TestClient "УХ - Казначейство" логин "Администратор" пароль ""
	И я закрыл все окна клиентского приложения

Сценарий: 01.00. Инициализация данных

	И я закрываю TestClient "УХ - НСИ"
	И я закрываю TestClient "УХ - Бюджетирование"
	И я закрываю TestClient "УХ - Закупки"
	И я закрываю TestClient "УХ - Дымовые"	

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ВерсияУправлениеХолдингом()' в переменную "$$ВерсияУХ$$"
	И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "$$ТекущаяДата$$"	
	И я устанавливаю в константу "ИспользоватьВыплатыСамозанятым" значение "Ложь"
	
Сценарий: 01.01. Общие справочники и настройки - Казначейство

	И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Казначейство'
	Тогда открылось окно 'Казначейство'
	
	И я разворачиваю группу с именем "ГруппаЗаявкиИПлатежи"
	И я изменяю флаг с именем 'ЗапрещатьСозданиеПлатежныхПорученийБезУказанияЗаявокНаОплату'
	И я изменяю флаг с именем 'СоздаватьЗаявкиНаОплатуВместоПлатежныхПоручений'
	И я изменяю флаг с именем 'ОбъединятьПозицииПриСозданииПлатежныхПоручений'

	И Я закрываю окно 'Казначейство'

Сценарий: 01.1. Трудовые функции 

		Дано Я открываю основную форму списка справочника "ТрудовыеФункции"
		
		Если не существует элемент справочника "ТрудовыеФункции" с "Наименование" равным "Творческая" Тогда

			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно 'Трудовая функция (создание)'
			И в поле с именем 'Наименование' я ввожу текст 'Творческая'
			И я перехожу к следующему реквизиту
			И я нажимаю кнопку выбора у поля с именем "КодПоОКЗ"
			Тогда открылось окно 'Общероссийский классификатор занятий'
			
			И я нажимаю на кнопку с именем 'ФормаСписок'
			И в таблице "Список" я перехожу к строке:
				| 'Код'     | 'Наименование групп занятий'           |
				| '1211, 1' | 'Управляющие финансовой деятельностью' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Трудовая функция (создание) *'      
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		
		Тогда открылось окно 'Трудовые функции'
		И я закрываю окно 'Трудовые функции'

Сценарий: 01.2. Прием на работу физических лиц

	* Болтон Рамси, Королевство Севера [223], Магнат 

		И В командном интерфейсе я выбираю 'Зарплата и кадры' 'Физические лица'
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'          |
			| 'Болтон Рамси' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Болтон Рамси (Физическое лицо)'
		
		И я перехожу к закладке с именем "ГруппаИстория"
		
		* Создание нового места работы
	
		И я нажимаю на кнопку с именем 'НовоеМестоРаботы'
		Тогда открылось окно 'Сотрудник (создание)'
		И я нажимаю кнопку выбора у поля с именем "ГоловнаяОрганизация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Севера [223]' |
		И в таблице "Список" я выбираю текущую строку
		
		* Запись элемента Сотрудник	
	
		И я нажимаю на кнопку с именем 'КомандаЗаписать'
	
		* Прием на работу	

		И я нажимаю на кнопку с именем 'КнопкаНовогоОформитьПриемНаРаботу'
		Тогда открылось окно 'Прием на работу (создание)'
		И я нажимаю кнопку выбора у поля с именем "Должность"
		Тогда открылось окно 'Должности'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Магнат'       |	
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (создание) *'
		
		И в поле с именем 'ДатаПриема' я ввожу текст '01.01.2023'
		И я перехожу к следующему реквизиту
		И из выпадающего списка с именем "ВидЗанятости" я выбираю точное значение 'Основное место работы'

		И я нажимаю кнопку выбора у поля с именем "ТрудоваяФункция"
		Тогда открылось окно 'Трудовые функции'
		И в таблице "Список" я перехожу к строке:	
			|'Наименование'|
			|'Творческая'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (Создание) *'
		
		И в поле с именем 'Оклад' я ввожу текст '1 000 000,00'
		И я перехожу к следующему реквизиту
		И я снимаю флаг с именем 'ОтразитьВТрудовойКнижке'
	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Прием на работу (создание) *' в течение 20 секунд
		Тогда открылось окно 'Болтон Рамси (Сотрудник)'
		
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Болтон Рамси (Сотрудник)' в течение 20 секунд
		Тогда открылось окно 'Болтон Рамси (Физическое лицо)'
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Болтон Рамси (Физическое лицо)' в течение 20 секунд
		Тогда открылось окно 'Физические лица'

	* Старк Бран, Королевство Гор и Долин, Снабженец 

		И В командном интерфейсе я выбираю 'Зарплата и кадры' 'Физические лица'
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'          |
			| 'Старк Бран' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Старк Бран (Физическое лицо)'
		
		И я перехожу к закладке с именем "ГруппаИстория"
		
		* Создание нового места работы
	
		И я нажимаю на кнопку с именем 'НовоеМестоРаботы'
		Тогда открылось окно 'Сотрудник (создание)'
		И я нажимаю кнопку выбора у поля с именем "ГоловнаяОрганизация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Гор и Долин'  |
		И в таблице "Список" я выбираю текущую строку
		
		* Запись элемента Сотрудник	
	
		И я нажимаю на кнопку с именем 'КомандаЗаписать'
	
		* Прием на работу	

		И я нажимаю на кнопку с именем 'КнопкаНовогоОформитьПриемНаРаботу'
		Тогда открылось окно 'Прием на работу (создание)'
		
		И в поле с именем 'ДатаПриема' я ввожу текст '01.01.2023'
		И я перехожу к следующему реквизиту
		И из выпадающего списка с именем "ВидЗанятости" я выбираю точное значение 'Основное место работы'
		
		И я нажимаю кнопку выбора у поля с именем "ТрудоваяФункция"
		Тогда открылось окно 'Трудовые функции'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Творческая'   |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (создание) *'

		И я нажимаю кнопку выбора у поля с именем "Должность"
		Тогда открылось окно 'Должности'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Снабженец'    |	
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (создание) *'
		
		И в поле с именем 'Оклад' я ввожу текст '48 000,00'
		И я перехожу к следующему реквизиту
		И я изменяю флаг с именем 'ОтразитьВТрудовойКнижке'
	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Прием на работу (создание) *' в течение 20 секунд
		Тогда открылось окно 'Старк Бран (Сотрудник)'
		
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Старк Бран (Сотрудник)' в течение 20 секунд
		Тогда открылось окно 'Старк Бран (Физическое лицо)'
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Старк Бран (Физическое лицо)' в течение 20 секунд
		Тогда открылось окно 'Физические лица'
		
	* Ланнистер Террион, Королевство Гор и Долин, Инженер 

		И В командном интерфейсе я выбираю 'Зарплата и кадры' 'Физические лица'
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'               |
			| 'Ланнистер Террион' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Ланнистер Террион (Физическое лицо)'
		
		И я перехожу к закладке с именем "ГруппаИстория"
		
		* Создание нового места работы
	
		И я нажимаю на кнопку с именем 'НовоеМестоРаботы'
		Тогда открылось окно 'Сотрудник (создание)'
		И я нажимаю кнопку выбора у поля с именем "ГоловнаяОрганизация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Скал'         |
		И в таблице "Список" я выбираю текущую строку
		
		* Запись элемента Сотрудник	
	
		И я нажимаю на кнопку с именем 'КомандаЗаписать'
	
		* Прием на работу	

		И я нажимаю на кнопку с именем 'КнопкаНовогоОформитьПриемНаРаботу'
		Тогда открылось окно 'Прием на работу (создание)'
		
		И в поле с именем 'ДатаПриема' я ввожу текст '01.01.2023'
		И я перехожу к следующему реквизиту
		И из выпадающего списка с именем "ВидЗанятости" я выбираю точное значение 'Основное место работы'
		И я нажимаю кнопку выбора у поля с именем "ТрудоваяФункция"
		Тогда открылось окно 'Трудовые функции'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Творческая'   |
		И в таблице "Список" я выбираю текущую строку		

		И я нажимаю кнопку выбора у поля с именем "Должность"
		Тогда открылось окно 'Должности'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Инженер'      |	
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (создание) *'
	
		И я нажимаю кнопку выбора у поля с именем "ТрудоваяФункция"
		Тогда открылось окно 'Трудовые функции'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Творческая'   |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "Должность"
		Тогда открылось окно 'Должности'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Инженер'      |	
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием на работу (создание) *'
		
		И в поле с именем 'Оклад' я ввожу текст '250 000,00'
		И я перехожу к следующему реквизиту
		И я изменяю флаг с именем 'ОтразитьВТрудовойКнижке'
	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Прием на работу (создание) *' в течение 20 секунд
		Тогда открылось окно 'Ланнистер Террион (Сотрудник)'
		
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Ланнистер Террион (Сотрудник)' в течение 20 секунд
		Тогда открылось окно 'Ланнистер Террион (Физическое лицо)'
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Ланнистер Террион (Физическое лицо)' в течение 20 секунд
		Тогда открылось окно 'Физические лица'
		
		И Я закрываю окно 'Физические лица'

Сценарий: 01.2. Начисление заработной платы

	* Открываем список начислений

		И В командном интерфейсе я выбираю 'Зарплата и кадры' 'Все начисления'
		Тогда открылось окно 'Все начисления'
	
	* Королевство Севера [223-ФЗ]
	
		И я нажимаю на кнопку с именем 'ФормаСоздатьНачислениеЗарплаты'
		Тогда открылось окно 'Начисление зарплаты (создание)'
		
		И я нажимаю кнопку выбора у поля с именем "МесяцНачисленияСтрокой"
		Тогда открылось окно 'Выбор периода'
		И я нажимаю на кнопку с именем 'ВыбратьМесяц7'
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "Организация"
		Тогда открылось окно 'Организационные единицы'
		
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Севера [223]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "ПодразделениеОрганизации"
		Тогда открылось окно 'Подразделения'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'           |
			| 'Основное подразделение' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я меняю значение переключателя с именем 'ВидНачисленияЧислом' на 'Аванс'
		
		И в таблице "Сотрудники" я нажимаю на кнопку с именем 'Заполнить'
		Тогда таблица "Сотрудники" стала равной:
			| 'Сотрудник'    | 'Начислено'  |
			| 'Болтон Рамси' | '400 000,00' |
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Начисление зарплаты (создание) *' в течение 20 секунд

	* Королевство Гор и Долин
	
		И я нажимаю на кнопку с именем 'ФормаСоздатьНачислениеЗарплаты'
		Тогда открылось окно 'Начисление зарплаты (создание)'
		
		И я нажимаю кнопку выбора у поля с именем "МесяцНачисленияСтрокой"
		Тогда открылось окно 'Выбор периода'
		И я нажимаю на кнопку с именем 'ВыбратьМесяц7'
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "Организация"
		Тогда открылось окно 'Организационные единицы'
		
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Гор и Долин' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "ПодразделениеОрганизации"
		Тогда открылось окно 'Подразделения'
		Тогда таблица "Список" стала равной:
			| 'Наименование'           |
			| 'Основное подразделение' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И в таблице "Сотрудники" я нажимаю на кнопку с именем 'Заполнить'
		Тогда таблица "Сотрудники" стала равной:
			| 'Сотрудник'  | 'Начислено' |
			| 'Старк Бран' | '*' |
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Начисление зарплаты (создание) *' в течение 20 секунд
			
	* Королевство Скал
	
		И я нажимаю на кнопку с именем 'ФормаСоздатьНачислениеЗарплаты'
		Тогда открылось окно 'Начисление зарплаты (создание)'
		
		И я нажимаю кнопку выбора у поля с именем "МесяцНачисленияСтрокой"
		Тогда открылось окно 'Выбор периода'
		И я нажимаю на кнопку с именем 'ВыбратьМесяц7'
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "Организация"
		Тогда открылось окно 'Организационные единицы'
		
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Скал'         |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И я нажимаю кнопку выбора у поля с именем "ПодразделениеОрганизации"
		Тогда открылось окно 'Подразделения'
		Тогда таблица "Список" стала равной:
			| 'Наименование'           |
			| 'Основное подразделение' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Начисление зарплаты (создание) *'
		
		И в таблице "Сотрудники" я нажимаю на кнопку с именем 'Заполнить'
		Тогда таблица "Сотрудники" стала равной:
			| 'Сотрудник'         | 'Начислено'  |
			| 'Ланнистер Террион' | '*' |
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Начисление зарплаты (создание) *' в течение 20 секунд

	* Закрываем список начислений
	
		И Я закрываю окно 'Все начисления'
	
Сценарий: 01.3. Курсы валют для целей планирования	

	* Открываем рабочее место Управление планами и лимитами
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Управление планами и лимитами'
		Тогда открылось окно 'Управление планами и лимитами'

	* открываем форму ввода курса
	
		И я нажимаю на кнопку с именем 'КурсыВалютДляЦелейПланирования'
		Тогда открылось окно 'Курсы валют для целей планирования/лимитирования'
	
	* Создаем новый курс
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Курсы валют для целей планирования/лимитирования (создание)'
		И в поле с именем 'Период' я ввожу текст '01.01.2023'
		И я перехожу к следующему реквизиту
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'USD'
		И в поле с именем 'Курс' я ввожу текст '100,0000'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Кратность' я ввожу текст '1'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Курсы валют для целей планирования/лимитирования (создание) *' в течение 20 секунд
		Тогда открылось окно 'Курсы валют для целей планирования/лимитирования'
	
	* Закрываем открытые формы
		
		И Я закрываю окно 'Курсы валют для целей планирования/лимитирования'
		Тогда открылось окно 'Управление планами и лимитами'
		И Я закрываю окно 'Управление планами и лимитами'

		