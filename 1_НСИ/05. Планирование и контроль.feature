﻿#language: ru
@tree

@UH32_NSI
@ERPUH32_NSI
@Perform_Budget

Функционал: 05. Первоначальные настройки и ввод НСИ - "Планирование"

	Как Администратор я хочу
	Ввести все НСИ
	чтобы проверить ввод НСИ и начать тестирование блока Планирование и лимитирование 

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 01.00 Определеняем тип приложения

	Пусть Инициализация переменных

Сценарий: 01.01 Настройка информационной базы
	* Настройка программы
		Если '$$ЭтоЕРПУХ$$' Тогда
			* Предприятие
				И В командном интерфейсе я выбираю "НСИ и администрирование" "Предприятие"
				Тогда открылось окно "Предприятие"
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоОрганизаций'
				И я разворачиваю группу с именем 'ГруппаНастройкиВалют'
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоВалют'
				Тогда открылось окно "Предприятие"
				И Я закрываю окно "Предприятие"
			* CRM и маркетинг
				И В командном интерфейсе я выбираю "НСИ и администрирование" "CRM и маркетинг"
				Тогда открылось окно "CRM и маркетинг"
				И я разворачиваю группу с именем "ГруппаНастройкиCRM"
				И я устанавливаю флаг с именем 'ИспользоватьПартнеровИКонтрагентов'								
				И я разворачиваю группу с именем 'ГруппаМаркетинг'
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоВидовЦен'
				Тогда открылось окно "CRM и маркетинг"	
				И Я закрываю окно "CRM и маркетинг"	
			* Склад и доставка
				И В командном интерфейсе я выбираю "НСИ и администрирование" "Склад и доставка"
				Тогда открылось окно "Склад и доставка"
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоСкладов'
				Тогда открылось окно "Склад и доставка"
				И Я закрываю окно "Склад и доставка"																

		Если '$$ЭтоУХ$$' Тогда
			* Вести учет по организациям
				И В командном интерфейсе я выбираю 'Администрирование' 'Функциональность'
				Тогда открылось окно 'Функциональность программы'
				И в таблице "СписокРазделов" я перехожу к строке:
					| 'Представление' |
					| 'Организация'   |
				И я устанавливаю флаг с именем 'ВестиУчетПоОрганизациям'
			* Отключаем дату запрета изменений
				И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
				Тогда открылось окно 'Настройки пользователей и прав'
				И я разворачиваю группу с именем "ГруппаДатыЗапретаИзменения"
				Если флаг 'Даты запрета изменения' равен 'Да' тогда
					И я снимаю флаг с именем 'ИспользоватьДатыЗапретаИзменения'
				И Я закрываю окно 'Настройки пользователей и прав'			

Сценарий: 01.02 Создание НСИ

	* Статья ДДС
		И Я создаю группу статей ДДС с именем 'Группа автотест БДДС'
		И Я создаю статью ДДС с именем 'Статья автотест БДДС' родителем 'Группа автотест БДДС'
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Статьи движения денежных средств'
		Тогда открылось окно 'Статьи движения денежных средств'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'Статья автотест БДДС'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Статьи движения денежных средств'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Статья автотест БДДС (Статья движения денежных средств)'
		И в таблице "ВидыАналитик" я активизирую поле с именем "ВидыАналитикВидАналитики"
		И в таблице "ВидыАналитик" я выбираю текущую строку			
		И в таблице "ВидыАналитик" из выпадающего списка с именем "ВидыАналитикВидАналитики" я выбираю по строке 'УХ00000160'
		И в таблице "ВидыАналитик" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Статья автотест БДДС (Статья движения денежных средств) *' в течение 20 секунд	

	* Статья ДиР		
		И Я создаю группу статей ДиР с именем 'Группа автотест БДР'
		И Я создаю статью ДиР с именем 'Статья автотест БДР' родителем 'Группа автотест БДР'
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Статьи доходов и расходов'
		Тогда открылось окно 'Статьи доходов и расходов'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'Статья автотест БДР'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Статья автотест БДР (Статья доходов и расходов)'
		И в таблице "ВидыАналитик" я активизирую поле с именем "ВидыАналитикВидАналитики"
		И в таблице "ВидыАналитик" я выбираю текущую строку
		И в таблице "ВидыАналитик" из выпадающего списка с именем "ВидыАналитикВидАналитики" я выбираю по строке 'НГ00000000'
		И в таблице "ВидыАналитик" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Статья автотест БДР (Статья доходов и расходов) *' в течение 20 секунд

	И Я создаю проект с именем 'Автотест проект'
	И Я создаю организацию с именем 'Автотест Организация' типом 'ВыбратьРФ' видом 'ВыбратьЮЛ' налогооблажением 'СистемаНалогообложенияУСНДоходыЮЛ'

	Если '$$ЭтоЕРПУХ$$' Тогда
		И Я для организации 'Автотест Организация' создаю подразделение с именем 'Автотест Подразделение' в 1C:ERPУХ

	Если '$$ЭтоУХ$$' Тогда
		И Я создаю вид номенклатуры с именем 'Товары'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И Я создаю вид номенклатуры с именем 'Товары' тип 'Товар' в 1C:ERPУХ

	* Номенклатура 
		* Открываем список 
			Если '$$ЭтоPerform$$' Тогда
				И В командном интерфейсе я выбираю "Главное" "Номенклатура"		
			ИначеЕсли '$$ЭтоУХ$$' Тогда
				И В командном интерфейсе я выбираю "Справочники" "Номенклатура"
			ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
				И В командном интерфейсе я выбираю "Главное" "Номенклатура"
				И я снимаю флаг с именем 'ИспользоватьФильтры'		
			Тогда открылось окно "Номенклатура"

		* Удаляем текущий элемент
			Если '$$ЭтоУХ$$' Тогда
				И Я в списке "Номенклатура" по полю "Наименование" ищу элемент 'Автотест номенклатура' "По началу строки"		
				И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
					И в таблице 'Список' я выбираю текущую строку
					И Я удаляю текущий элемент в окне "* (Номенклатура)" очищая 'Артикул'
			ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
				И пауза 1
				И я нажимаю кнопку очистить у поля с именем 'СтрокаПоискаНоменклатура'					
				И в поле с именем 'СтрокаПоискаНоменклатура' я ввожу текст 'Автотест номенклатура'
				И я нажимаю на кнопку с именем 'Найти'				
				Если появилось окно с заголовком 'Поиск' в течение 1 секунд Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "Номенклатура"
				И Пока в таблице 'СписокРасширенныйПоискНоменклатура' количество строк 'больше' 0 Тогда
					* Ставим пометку на удаление
						Если в таблице 'СписокРасширенныйПоискНоменклатура' текущая строка не помечена на удаление Тогда
							И я выбираю пункт контекстного меню с именем 'СписокРасширенныйПоискНоменклатураКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'СписокРасширенныйПоискНоменклатура'
							Тогда открылось окно "1С:Предприятие"
							И я нажимаю на кнопку с именем 'Button0'
					* Переименовываем
						И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
						И в таблице 'СписокРасширенныйПоискНоменклатура' я выбираю текущую строку
						Когда открылось окно "* (Номенклатура)"
						И я перехожу к закладке с именем 'СтраницаРеквизитыНоменклатуры'
						Если появилось окно с заголовком 'Полезный совет' в течение 1 секунд Тогда
							И я нажимаю на кнопку с именем 'Button0'
						Когда открылось окно "* (Номенклатура)"								
						Тогда в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
						И в поле с именем 'Артикул' я ввожу текст ' '	
						И я нажимаю на кнопку с именем 'ЗаполнитьНаименованиеДляПечатиПоШаблону'
						И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
						И я жду закрытия окна "* (Номенклатура)" в течение 20 секунд
						Если появилось окно с заголовком 'Поиск' в течение 1 секунд Тогда
							И я нажимаю на кнопку с именем 'Button0'

		* Создаем новый элемент
			Когда открылось окно "Номенклатура"
			Если '$$ЭтоУХ$$' Тогда			
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Номенклатура (создание)"
				И в поле с именем 'Наименование' я ввожу текст 'Автотест номенклатура'
				И в поле с именем 'Артикул' я ввожу текст '123'
				И из выпадающего списка с именем 'ЕдиницаИзмерения' я выбираю по строке "шт"
				Если 'НЕ $$ЭтоPerform$$' Тогда
					И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'Товары'
			ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
				И я нажимаю на кнопку с именем 'СписокРасширенныйПоискНоменклатураСоздать'
				Тогда открылось окно "Номенклатура (создание)"
				И из выпадающего списка с именем 'ВидНоменклатурыОбязательныеПоля' я выбираю по строке 'Товары'
				И я меняю значение переключателя с именем 'НастройкаВидимостиФормы' на 'Показать все'
				И в поле с именем 'Наименование' я ввожу текст 'Автотест номенклатура'
				И в поле с именем 'Артикул' я ввожу текст '123'	
				Когда открылось окно 'Номенклатура (создание) *'
				И из выпадающего списка с именем "ЕдиницаИзмерения" я выбираю по строке 'шт'			
									
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Номенклатура (создание) *" в течение 20 секунд

		* Закрываем список
			Когда открылось окно "Номенклатура"
			Если '$$ЭтоЕРПУХ$$' Тогда
				И я устанавливаю флаг с именем 'ИспользоватьФильтры'
			И Я закрываю окно "Номенклатура"	
	
	Если '$$ЭтоУХ$$' Тогда
		И Я создаю группу контрагентов с именем 'Автотест клиенты'
		И Я создаю контрагента с именем 'Автотест контрагент' родителем 'Автотест клиенты' страной регистрации 'РОССИЯ'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда					
		И Я создаю партнера с именем 'Автотест контрагент' тип 'Поставщик' в 1C:ERPУХ
		И Для партнера 'Автотест контрагент' я создаю контрагента с именем 'Автотест контрагент' вид 'Юридическое лицо' в 1C:ERPУХ

	И Я создаю условие оплаты с именем 'Автотест условие оплаты'
	Если '$$ЭтоУХ$$' Тогда
		И Я создаю договор для контрагента 'Автотест контрагент' номер '12345' дата '01.01.2024' валюта 'RUB' организация 'Автотест Организация' вид 'С поставщиком' сумма '500000' условие оплаты 'Автотест условие оплаты'
		И Я создаю договор для контрагента 'Автотест контрагент' номер '56789' дата '01.01.2024' валюта 'RUB' организация 'Автотест Организация' вид 'С поставщиком' сумма '500000' условие оплаты 'Автотест условие оплаты'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И Для партнера 'Автотест контрагент' контрагента 'Автотест контрагент' я создаю договор с видом 'С поставщиком' номер '12345' от '01.01.2024' организация 'Автотест Организация' валюта 'RUB' сумма '500000' соглашение 'Соглашение' в 1C:ERPУХ
		И Для партнера 'Автотест контрагент' контрагента 'Автотест контрагент' я создаю договор с видом 'С поставщиком' номер '56789' от '01.01.2024' организация 'Автотест Организация' валюта 'RUB' сумма '500000' соглашение 'Соглашение' в 1C:ERPУХ

	Если '$$ЭтоУХ$$' Тогда
		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Банки'
		Тогда открылось окно 'Банки'
		И в таблице "Список" я активизирую поле с именем "Код"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст '047567567'
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'Список' количество строк 'равно' 0 Тогда			
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button1'
			Тогда открылось окно 'Банк (создание)'
			И в поле с именем 'Наименование' я ввожу текст 'Автотест банк организации'
			И из выпадающего списка с именем "Страна" я выбираю по строке 'Россия'
			И в поле с именем 'Код' я ввожу текст '047567567'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банк (создание) *' в течение 20 секунд
		И Я закрываю окно 'Банки'
					

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Банки'
		Тогда открылось окно 'Банки'
		И в таблице "Список" я активизирую поле с именем "Код"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст '044525148'
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'Список' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button1'
			Тогда открылось окно 'Банк (создание)'
			И в поле с именем 'Наименование' я ввожу текст 'Автотест банк контрагента'
			И из выпадающего списка с именем "Страна" я выбираю по строке 'Россия'
			И в поле с именем 'Код' я ввожу текст '044525148'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банк (создание) *' в течение 20 секунд
		И Я закрываю окно 'Банки'	
				
Сценарий: 01.03 Создание БС Организации

	* Создание элемента
		Если '$$ЭтоУХ$$' Тогда
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Организационные единицы"
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
			И я нажимаю на кнопку с именем 'Find'
			И в таблице "Список" я выбираю текущую строку
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'
			И я нажимаю на кнопку с именем 'СоздатьБанковскийСчет'
			И из выпадающего списка с именем "Банк" я выбираю по строке '047567567'
			И я перехожу к следующему реквизиту
			И в поле с именем 'НомерСчета' я ввожу текст '40700810000000000011'
			И я нажимаю на кнопку с именем 'ФормаКомандаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет (создание) *' в течение 20 секунд
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Организации"
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
			И я нажимаю на кнопку с именем 'Find'
			И в таблице "Список" я выбираю текущую строку
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'	
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
			Тогда открылось окно 'Банковский счет организации (создание)'
			И в поле с именем 'НомерСчета' я ввожу текст '40700810000000000011'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет организации (создание) *' в течение 20 секунд					

Сценарий: 01.04 Создание БС Контрагента

	* Создание элемента
		Если '$$ЭтоУХ$$' Тогда
			И В командном интерфейсе я выбираю 'Справочники' 'Контрагенты'
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест контрагент'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Контрагенты'
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Автотест контрагент (Контрагент)'
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно 'Банковский счет (создание)'
			И из выпадающего списка с именем "Банк" я выбираю по строке '044525148'
			И в поле с именем 'НомерСчета' я ввожу текст '40701810200010000027'
			И я нажимаю на кнопку с именем 'ФормаКомандаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет (создание) *' в течение 20 секунд
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Контрагенты'	
			Когда открылось окно 'Контрагенты (юридические или физические лица)'
			Когда открылось окно 'Контрагенты (юридические или физические лица)'
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'			
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест контрагент'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Контрагенты (юридические или физические лица)'
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Автотест контрагент (Контрагент (юридическое или физическое лицо)'
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно 'Банковский счет (создание)'
			И в поле с именем 'НомерСчета' я ввожу текст '40701810200010000027'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет (создание) *' в течение 20 секунд							

//Дополнительные сценарии по вводу НСИ по блоку Планирование и лимитирование

Сценарий: 01.06 Виды аналитик (корпоративные)
	* Создаем аналитику с произвольным классификатором
		И Я создаю вид аналитики с кодом "ВА1ОбъектР" именем "ВА - Объект расчетов" типом 'СправочникСсылка.ПроизвольныйКлассификаторУХ'
		И Я для вида аналитики с кодом "ВА1ОбъектР" делаю ключом реквизит "Код"
		И Я создаю субконто УХ с именем 'ВА - Автотранспорт' и видом аналитики с кодом 'ВА1ОбъектР'
		И Я создаю субконто УХ с именем 'ВА - Здания' и видом аналитики с кодом 'ВА1ОбъектР'
		И Я создаю субконто УХ с именем 'ВА - Прочее' и видом аналитики с кодом 'ВА1ОбъектР'

Сценарий: 01.07 Группы аналитик статей
	* Создаем группы раскрытия с разным набором аналитик
		и Я создаю группу аналитики статей 'ВА - Группа на 1 вид аналитик' с видами аналитик 'Контрагенты', '', '', '', '', ''
		и Я создаю группу аналитики статей 'ВА - Группа на 2 вид аналитик' с видами аналитик 'Контрагенты', 'Номенклатурные группы', '', '', '', ''
		и Я создаю группу аналитики статей 'ВА - Группа на 3 вид аналитик' с видами аналитик 'Контрагенты', 'Номенклатурные группы', 'Места поставки', '', '', ''
		и Я создаю группу аналитики статей 'ВА - Группа на 4 вид аналитик' с видами аналитик 'Контрагенты', 'Номенклатурные группы', 'Места поставки', 'Подразделения организаций', '', ''
		и Я создаю группу аналитики статей 'ВА - Группа на 5 вид аналитик' с видами аналитик 'Контрагенты', 'Номенклатурные группы', 'Места поставки', 'Подразделения организаций', 'Ресурсы', ''
		и Я создаю группу аналитики статей 'ВА - Группа на 6 вид аналитик' с видами аналитик 'Контрагенты', 'Номенклатурные группы', 'Места поставки', 'Подразделения организаций', 'Ресурсы', 'ВА - Объект расчетов'

		и Я создаю группу аналитики статей 'ВА - Контрагенты-НоменклатурныеГруппы' с видами аналитик 'Контрагенты', 'Номенклатурные группы', '', '', '', ''
	
	* Проверяем количество аналитик в группах
		И Я проверяю у группы аналитик 'ВА - Группа на 1 вид аналитик' в таблице количество заполненных аналитик '1' 
		И Я проверяю у группы аналитик 'ВА - Группа на 2 вид аналитик' в таблице количество заполненных аналитик '2' 
		И Я проверяю у группы аналитик 'ВА - Группа на 3 вид аналитик' в таблице количество заполненных аналитик '3' 
		И Я проверяю у группы аналитик 'ВА - Группа на 4 вид аналитик' в таблице количество заполненных аналитик '4' 
		И Я проверяю у группы аналитик 'ВА - Группа на 5 вид аналитик' в таблице количество заполненных аналитик '5' 
		И Я проверяю у группы аналитик 'ВА - Группа на 6 вид аналитик' в таблице количество заполненных аналитик '6' 
		
Сценарий: 01.08 Статьи БДДС
	* Создаем тестовую группу и добавляем в нее статьи
		И Я создаю группу статей ДДС с именем 'ВА - Тестовая группа'
		И Я создаю статью ДДС с именем 'ВА - Статья 1' родителем 'ВА - Тестовая группа'
		И Я создаю статью ДДС с именем 'ВА - Статья 2' родителем 'ВА - Тестовая группа'
		И Я создаю статью ДДС с именем 'ВА - Статья 3' родителем 'ВА - Тестовая группа'
		И Я создаю статью ДДС с именем 'ВА - Статья 4' родителем 'ВА - Тестовая группа'	
		И Я создаю статью ДДС с именем 'ВА - Статья 5' родителем 'ВА - Тестовая группа'	

	* Для новых статей определяем тип движения "Приход/Расход"
		И Я для статьи ДДС с именем 'ВА - Статья 1' определяю тип движения статьи 'Только расход'
		И Я для статьи ДДС с именем 'ВА - Статья 2' определяю тип движения статьи 'Только расход'
		И Я для статьи ДДС с именем 'ВА - Статья 3' определяю тип движения статьи 'Приход или расход'
		И Я для статьи ДДС с именем 'ВА - Статья 4' определяю тип движения статьи 'Приход или расход'
		И Я для статьи ДДС с именем 'ВА - Статья 5' определяю тип движения статьи 'Только приход'

	* Назначаем дополнительные аналитики (разрезы) для статьи
		И Я для статьи ДДС с именем 'ВА - Статья 1' определяю виды аналитики 'ВА - Объект расчетов', '', '', '', '', ''
		И Я для статьи ДДС с именем 'ВА - Статья 3' определяю виды аналитики 'Места поставки', '', '', '', '', ''

	* Назначаем дополнительные аналитики (разрезы) группой раскрытия
		И Я для статьи ДДС с именем 'ВА - Статья 2' определяю группу раскрытия 'ВА - Контрагенты-НоменклатурныеГруппы'
		
Сценарий: 01.09 Статьи БДР
	* Создание тестовую группу и добавляем в нее статьи
		И Я создаю группу статей ДиР с именем 'ВА - Тестовая группа'
		И Я создаю статью ДиР с именем 'ВА - Статья 1' родителем 'ВА - Тестовая группа'
		И Я создаю статью ДиР с именем 'ВА - Статья 2' родителем 'ВА - Тестовая группа'
		И Я создаю статью ДиР с именем 'ВА - Статья 3' родителем 'ВА - Тестовая группа'
		И Я создаю статью ДиР с именем 'ВА - Статья 4' родителем 'ВА - Тестовая группа'	
		И Я создаю статью ДиР с именем 'ВА - Статья 5' родителем 'ВА - Тестовая группа'	

	* Для новых статей определяем тип движения "Доход/Расход"
		И Я для статьи ДиР с именем 'ВА - Статья 1' определяю тип движения статьи 'Доход или расход'
		И Я для статьи ДиР с именем 'ВА - Статья 2' определяю тип движения статьи 'Только расход'
		И Я для статьи ДиР с именем 'ВА - Статья 3' определяю тип движения статьи 'Доход или расход'
		И Я для статьи ДиР с именем 'ВА - Статья 4' определяю тип движения статьи 'Доход или расход'
		И Я для статьи ДиР с именем 'ВА - Статья 5' определяю тип движения статьи 'Только доход'

	* Назначаем дополнительные аналитики (разрезы) для статьи
		И Я для статьи ДиР с именем 'ВА - Статья 1' определяю виды аналитики 'ВА - Объект расчетов', '', '', '', '', ''
		И Я для статьи ДиР с именем 'ВА - Статья 3' определяю виды аналитики 'Места поставки', '', '', '', '', ''

	* Назначаем дополнительные аналитики (разрезы) группой раскрытия
		И Я для статьи ДиР с именем 'ВА - Статья 2' определяю группу раскрытия 'ВА - Контрагенты-НоменклатурныеГруппы'

	* Указываем хоз.операцию
		Если '$$ЭтоЕРПУХ$$' Тогда
			И Я для статьи ДДС с именем 'ВА - Статья 3' определяю хозяйственную операцию 'Оплата поставщику' в 1C:ERPУХ

Сценарий: 01.10 Организационная структура
	* Создаюм ЮЛ
		И Я создаю организацию с именем 'ВА - ООО Тест' типом 'ВыбратьРФ' видом 'ВыбратьЮЛ' налогооблажением 'СистемаНалогообложенияОбщаяЮЛ'
		И Я для организации с именем 'ВА - ООО Тест' указываю ИНН '7708090124', КПП '770801001', ОГРН '1027739529300', дата регистрации '01.01.2001'
		И Я для организации 'ВА - ООО Тест' создаю банковский счет '047567567' '40700810000000000011' 
		И Я для организации 'ВА - ООО Тест' создаю банковский счет '047567567' '40701840145250000973'
		И Я для организации 'ВА - ООО Тест' создаю банковский счет '047567567' '40701978100000000014'
	
	* Создаем ЦФО	
		И Я создаю организацию с именем 'ВА - ЦФО 1 (АХО)' типом 'ВыбратьЦФО' видом '' налогооблажением ''
		И Я для организации 'ВА - ЦФО 1 (АХО)' для реквизита 'Родитель' выбираю значение 'ВА - ООО Тест' 
		И Я создаю организацию с именем 'ВА - ЦФО 2 (ИТ)' типом 'ВыбратьЦФО' видом '' налогооблажением ''
		И Я для организации 'ВА - ЦФО 2 (ИТ)' для реквизита 'Родитель' выбираю значение 'ВА - ООО Тест' 
		И Я создаю организацию с именем 'ВА - ЦФО 3 (СБ)' типом 'ВыбратьЦФО' видом '' налогооблажением ''
		И Я для организации 'ВА - ЦФО 3 (СБ)' для реквизита 'Родитель' выбираю значение 'ВА - ООО Тест' 
		И Я создаю организацию с именем 'ВА - ЦФО 4 (ДП)' типом 'ВыбратьЦФО' видом '' налогооблажением ''
		И Я для организации 'ВА - ЦФО 4 (ДП)' для реквизита 'Родитель' выбираю значение 'ВА - ООО Тест' 
		И Я создаю организацию с именем 'ВА - ЦФО 5 (ДР)' типом 'ВыбратьЦФО' видом '' налогооблажением ''
		И Я для организации 'ВА - ЦФО 5 (ДР)' для реквизита 'Родитель' выбираю значение 'ВА - ООО Тест' 

	* Относим к 223-ФЗ
		И я нахожу организацию с именем 'ВА - ООО Тест'
		Если '$$ЭтоУХ$$' Тогда
			И я устанавливаю флаг с именем 'ЗакупкаПоФЗ223'
			И из выпадающего списка с именем "СуммаМалыхЗакупок" я выбираю точное значение '500 000'					
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я перехожу к закладке "Регламент"
			И я устанавливаю флаг 'Закупка по 223-ФЗ'
			И из выпадающего списка "Сумма малых закупок" я выбираю точное значение '500 000'
		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "* (Организаци*) *" в течение 20 секунд		

Сценарий: 01.11 Проекты
		И Я создаю проект с именем 'ВА - Проект 1'
		И Я создаю проект с именем 'ВА - Проект 2'

Сценарий: 01.12 Контрагенты
	Если '$$ЭтоУХ$$' Тогда
		И Я создаю группу контрагентов с именем 'ВА - Поставщики'
		И Я создаю контрагента с именем 'ВА - Поставщик1' родителем 'ВА - Поставщики' страной регистрации 'РОССИЯ'
		И Я создаю контрагента с именем 'ВА - Поставщик2' родителем 'ВА - Поставщики' страной регистрации 'РОССИЯ'
		И Я создаю группу контрагентов с именем 'ВА - Покупатели'
		И Я создаю контрагента с именем 'ВА - Покупатель1' родителем 'ВА - Покупатели' страной регистрации 'РОССИЯ'
	
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда	
		И Я создаю партнера с именем 'ВА - Поставщик1' тип 'Поставщик' в 1C:ERPУХ
		И Для партнера 'ВА - Поставщик1' я создаю контрагента с именем 'ВА - Поставщик1' вид 'Юридическое лицо' в 1C:ERPУХ
		И Я создаю партнера с именем 'ВА - Поставщик2' тип 'Поставщик' в 1C:ERPУХ
		И Для партнера 'ВА - Поставщик2' я создаю контрагента с именем 'ВА - Поставщик2' вид 'Юридическое лицо' в 1C:ERPУХ

	И Я для контрагента с именем 'ВА - Поставщик1' создаю банковский счет '044525148' '40701810200010000027' 
	И Я для контрагента с именем 'ВА - Поставщик1' создаю банковский счет '044525148' '40701840000000000016'
	И Я для контрагента с именем 'ВА - Поставщик1' создаю банковский счет '044525148' '40701978000000000027'
	И Я для контрагента с именем 'ВА - Поставщик1' указываю ИНН '7714774531' и КПП '649701844' 
 
Сценарий: 01.13 Номенклатура
	Если '$$ЭтоУХ$$' Тогда
		И Я создаю группу номенклатуры с именем 'ВА - Тестовая группа'	
		И Я создаю вид номенклатуры с именем 'ВА - Товары'
		И Я создаю номенклатурную группу с именем 'ВА - Основная номенклатурная группа'
		И Я создаю тип цен с именем 'ВА - Цена1' валютой 'RUB'
		
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И Я создаю вид номенклатуры с именем 'ВА - Товары' тип 'Товар' в 1C:ERPУХ
		И Я создаю группы финансового учета номенклатуры с именем 'ВА - Основная номенклатурная группа' в 1C:ERPУХ
		И Я создаю вид цены с именем 'ВА - Цена1' валютой 'RUB' в 1C:ERPУХ
		
	И Я создаю номенклатуру с именем 'ВА - Товар1' родителем 'ВА - Тестовая группа' видом номенклатуры 'ВА - Товары' артикулом ''
	И Я создаю номенклатуру с именем 'ВА - Товар2' родителем 'ВА - Тестовая группа' видом номенклатуры 'ВА - Товары' артикулом ''
	И Я создаю номенклатуру с именем 'ВА - Товар3' родителем 'ВА - Тестовая группа' видом номенклатуры 'ВА - Товары' артикулом ''

	Если '$$ЭтоУХ$$' Тогда
		И Я для номенклатуры с именем 'ВА - Товар1' для типа цен с именем 'ВА - Цена1' устанавливаю значение '85 000'
		И Я для номенклатуры с именем 'ВА - Товар2' для типа цен с именем 'ВА - Цена1' устанавливаю значение '100 000'

Сценарий: 01.14 Склады
		И Я создаю склад с именем 'ВА - Склад1' с видом 'Оптовый склад' с типом цен 'ВА - Цена1'
		И Я создаю склад с именем 'ВА - Склад2' с видом 'Оптовый склад' с типом цен 'ВА - Цена1'
		И Я создаю склад с именем 'ВА - Склад3' с видом 'Оптовый склад' с типом цен 'ВА - Цена1'

Сценарий: 01.15 Места поставки
		И Я создаю места поставки с именем 'ВА - МестаПоставки1' с видом 'Склад' на складе 'ВА - Склад1'
		И Я создаю места поставки с именем 'ВА - МестаПоставки2' с видом 'Склад' на складе 'ВА - Склад2'
		И Я создаю места поставки с именем 'ВА - МестаПоставки3' с видом 'Склад' на складе 'ВА - Склад3'

Сценарий: 01.16 Приказ о назначении закупкочной комиссии
		И Я создаю Приказ о назначении закупочной комиссии для организации 'ВА - ООО Тест'

Сценарий: 01.17 Условия оплаты
	Если '$$ЭтоУХ$$' Тогда 
		И Я создаю условие оплаты аванс '1'\'100' и постоплата ''\''

Сценарий: 01.18 Транспорт
	Если '$$ЭтоУХ$$' Тогда 
		И Я создаю транспорта с именем 'ВА - Транспорт1' гос.знак 'ххх'
		И Я для транспорта с именем 'ВА - Транспорт1' заполняю организация 'ВА - ООО Тест' VIN 'ххх' топливо 'Топливо1' норма '5'
