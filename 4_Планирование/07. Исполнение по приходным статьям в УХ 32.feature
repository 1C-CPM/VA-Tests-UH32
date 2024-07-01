﻿#language: ru
@tree

@UH32_Planning

Функционал: 07. Исполнение по приходным статьям в УХ32

	Как Администратор я хочу
	сформировать Заказ покупателю и РТУ
	чтобы проверить возможность заполнения графиков расчетов и проведения по РН Операции бюджетов по статьям бюджетов 

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Переменные:
	ВАПроект = 'ВА - Проект 1'
	ВАЦФО = 'ВА - ЦФО 5 (ДР)'
	ВАСтатья = 'ВА - Статья 5'
	ВАОрганизация = 'ВА - ООО Тест'
	ВАПокупатель = 'ВА - Покупатель1'
	ВАПоставщик = 'ВА - Поставщик1'

Сценарий: 07.00 Определеняем тип приложения

	Пусть Инициализация переменных			

Сценарий: 07.01 Расчеты по заказам
		
	* Создаем новый заказ покупателя
		И В командном интерфейсе я выбираю 'Казначейство' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Заказ покупателя (создание)'
		
		И в поле с именем "Организация" я ввожу значение выражения 'ВАОрганизация'
		//И в поле с именем "Контрагент" я ввожу значение выражения 'ВАПокупатель'
		И я нажимаю кнопку выбора у поля с именем "Контрагент"
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВАПокупатель" "По точному совпадению" 		
		И я перехожу к следующему реквизиту		

	* Создаем договор с покупателем: расчеты "по заказам" без графика	
		И я нажимаю на кнопку создать поля с именем "ДоговорКонтрагента"
		Тогда открылось окно 'Выберите вид договора'
		И Я в таблице 'ВидыДоговоров' по полю 'Вид договора' ищу значение 'С покупателем' 	
		И я нажимаю на кнопку 'Выбрать'
		Тогда открылось окно 'С покупателем (создание)'
		И я активизирую поле с именем "Номер"		
		И в поле с именем 'Номер' я ввожу текст '07.01'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Дата' я ввожу значение выражения 'ТекущаяДата()'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Наименование' я ввожу текст '07.01'
		И я перехожу к следующему реквизиту
		И я перехожу к закладке с именем "ГруппаРасчеты"
		И из выпадающего списка с именем "УсловиеОплаты" я выбираю по строке 'Автотест условие оплаты'
		И из выпадающего списка с именем "ПорядокРасчетов" я выбираю по строке 'По заказам'
		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
		И в поле с именем "ОсновнойЦФО" я ввожу значение выражения 'ВАЦФО'
		И в поле с именем "ОсновнойПроект" я ввожу значение выражения 'ВАПроект'
		И в поле с именем "СтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И в поле с именем "ОсновнаяСтатьяИсполнение" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'С покупателем (создание) *' в течение 20 секунд

		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю по строке '07.01'
		И я удаляю переменную '$Договор$'
		И я запоминаю значение поля с именем 'ДоговорКонтрагента' как 'Договор'	
				
	* Заполняем заказ покупателя
		Когда открылось окно 'Заказ покупателя (создание) *'
		И в таблице "Номенклатура" я нажимаю на кнопку с именем 'НоменклатураДобавить'
		И в таблице "Номенклатура" я нажимаю кнопку выбора у реквизита с именем "НоменклатураТоварнаяКатегория"
		И Я в таблице '' по полю '' ищу значение 'Номенклатура' 	
		И я нажимаю на кнопку 'ОК'
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Товар1" "По точному совпадению"	
		И в таблице "Номенклатура" я активизирую поле с именем "НоменклатураКоличество"
		И в таблице "Номенклатура" в поле с именем 'НоменклатураКоличество' я ввожу текст '1,000'
		И в таблице "Номенклатура" я активизирую поле с именем "НоменклатураЦена"
		И в таблице "Номенклатура" в поле с именем 'НоменклатураЦена' я ввожу текст '1 000,00'
		И в таблице "Номенклатура" я активизирую поле с именем "НоменклатураСтавкаНДС"
		И в таблице "Номенклатура" из выпадающего списка с именем "НоменклатураСтавкаНДС" я выбираю по строке 'Без НДС'
		И я перехожу к следующему реквизиту
		И в таблице "Номенклатура" в поле с именем 'НоменклатураДатаОтгрузки' я ввожу значение выражения 'ТекущаяДата()'
		И в таблице "Номенклатура" я завершаю редактирование строки
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'НоменклатураСумма' таблицы 'Номенклатура' как '$Сумма$'
						
		И я нажимаю на кнопку с именем 'ФормаПровести'
		Если открылось окно '1С:Предприятие' тогда
			И я нажимаю на кнопку с именем 'Button0'
	
	* Проверяем график расчетов
		И Я открываю и проверяю График расчетов с покупателем
			
	* Проверяем Заказ в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "НачалоГода(ТекущаяДата())" по  "КонецГода(ТекущаяДата()" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВАЦФО'
		
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R18C8' равна '-$Сумма$'
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

	* Отражаем РТУ по заказу покупателя
		Когда открылось окно 'Заказ покупателя * от *'
		И я нажимаю на кнопку с именем 'ФормаДокументРеализацияТоваровУслугСоздатьНаОсновании'
		Тогда открылось окно 'Форма документа'
		И Я в таблице 'СписокВидовОпераций' по полю 'Представление' ищу значение 'Товары (накладная, УПД)' 	
		И я нажимаю на кнопку 'Выбрать'
		Тогда открылось окно 'Реализация товаров: Накладная, УПД (создание)'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'
		И я перехожу к следующему реквизиту

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
		И я удаляю переменную '$ДатаДок$'
		И я запоминаю значение поля с именем 'Дата' как '$ДатаДок$'

        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Реализация товаров: Накладная, УПД *' в течение 20 секунд	
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД "Реализация (акты, накладные, УПД)" с параметром 'Нет'
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД

	* Проверяем факт исполнения в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "НачалоГода(ТекущаяДата())" по  "КонецГода(ТекущаяДата()" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВАЦФО'
        '
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R18C8' равна ''
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R18C10' равна '-$Сумма$'
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'			

Сценарий: 07.02 Расчеты по накладным
		
	* Создаем новую Реализацию товаров
		И В командном интерфейсе я выбираю 'Продажи' 'Реализация (акты, накладные, УПД)'
		Тогда открылось окно 'Реализация (акты, накладные, УПД)'
		И я нажимаю на кнопку с именем 'ФормаСоздатьРеализацияТовары'
		Тогда открылось окно 'Реализация товаров: Накладная, УПД (создание)'
		
//		И в поле с именем "Контрагент" я ввожу значение выражения 'ВАПокупатель'
		И я нажимаю кнопку выбора у поля с именем "Контрагент"
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВАПокупатель" "По точному совпадению" 		
		И я перехожу к следующему реквизиту
		И в поле с именем "Организация" я ввожу значение выражения 'ВАОрганизация'
		И я перехожу к следующему реквизиту

		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'

	* Создаем договор с покупателем: расчеты "по накладным" с графиком расчетов	
		И я нажимаю на кнопку создать поля с именем "ДоговорКонтрагента"
		Тогда открылось окно 'Выберите вид договора'
		И Я в таблице 'ВидыДоговоров' по полю 'Вид договора' ищу значение 'С покупателем' 	
		И я нажимаю на кнопку 'Выбрать'
		Тогда открылось окно 'С покупателем (создание)'
		И я активизирую поле с именем "Номер"		
		И в поле с именем 'Номер' я ввожу текст '07.02'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Дата' я ввожу значение выражения 'ТекущаяДата()'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Наименование' я ввожу текст '07.02'
		И я перехожу к следующему реквизиту
		И я перехожу к закладке с именем "ГруппаРасчеты"
		И из выпадающего списка с именем "УсловиеОплаты" я выбираю по строке 'Автотест условие оплаты'
		И из выпадающего списка с именем "ПорядокРасчетов" я выбираю по строке 'По накладным'
		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
		И в поле с именем "ОсновнойЦФО" я ввожу значение выражения 'ВАЦФО'
		И в поле с именем "ОсновнойПроект" я ввожу значение выражения 'ВАПроект'
		И в поле с именем "СтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И в поле с именем "ОсновнаяСтатьяИсполнение" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И я меняю значение переключателя с именем 'ГрафикДоговора' на 'Только расчетов'
		И я перехожу к закладке с именем "ГруппаГрафик"
		И я активизирую поле с именем 'ДатаПервойОперации'
		И в поле с именем 'ДатаПервойОперации' я ввожу значение выражения 'ТекущаяДата()'
		И я перехожу к следующему реквизиту						
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'С покупателем (создание) *' в течение 20 секунд

		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю по строке '07.02'
		И я удаляю переменную '$Договор$'
		И я запоминаю значение поля с именем 'ДоговорКонтрагента' как 'Договор'	

	* Заполняем РТУ
		Когда открылось окно 'Реализация товаров: Накладная, УПД (создание) *'		
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю по строке 'ВА - Товар1'
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,000'
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1 000,00'
		И в таблице "Товары" я активизирую поле с именем "ТоварыСтавкаНДС"
		И в таблице "Товары" из выпадающего списка с именем "ТоварыСтавкаНДС" я выбираю по строке 'Без НДС'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я завершаю редактирование строки

		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как '$Сумма$'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
	
	* Проверяем график расчетов
		И Я открываю и проверяю График расчетов с покупателем
			
	* Проверяем резерв в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "НачалоГода(ТекущаяДата())" по  "КонецГода(ТекущаяДата()" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВАЦФО'

		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R18C8' равна '-$Сумма$'
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

	* Проводим документ РТУ
		Когда открылось окно 'Реализация товаров: Накладная, УПД *'
		И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
		И я удаляю переменную '$ДатаДок$'
		И я запоминаю значение поля с именем 'Дата' как '$ДатаДок$'

		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'			

	* Проверяем ОФД по РН Операции бюджетов
		И Я проверяю создание ОФД "Реализация (акты, накладные, УПД)" с параметром 'Нет'
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД

	* Проверяем факт исполнения в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "НачалоГода(ТекущаяДата())" по  "КонецГода(ТекущаяДата()" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВАЦФО'
		
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R18C8' равна ''
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'			
