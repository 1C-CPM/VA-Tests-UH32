﻿#language: ru
@tree

@UH32_Budget
@ERPUH32_Budget
@Perform_Budget

Функционал: 13. Рекурсия в расчетах

	Как Администратор я хочу
	Проверить что рекурсия в расчетах отлавливается

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 13.00 Определеняем тип приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 13.01 Создаем вид отчета с рекурсией расчета показателей

	* Создаем вид отчета
		И Я создаю группу видов отчетов с именем "ВА - Трансформации периодов (группа)" и родителем "ВА - Группа отчетов"
		И Я создаю вид отчета с именем "ВА - Трансформация периодов" и родителем "ВА - Трансформации периодов (группа)"
		
	* Настраиваем структуру вида отчета
		И Я открываю контруктор отчета с именем "ВА - Трансформация периодов"
		И Я в конструкторе отчета добавляю строку с именем "Источник"
		И Я в конструкторе отчета добавляю строку с именем "Приемник"
		И Я в конструкторе отчета добавляю строку с именем "Накопление"
		И Я в конструкторе отчета добавляю строку с именем "Итог"
		И Я в конструкторе отчета добавляю колонку с именем "Сумма"

	* Настраиваем формулы расчета
		Когда открылось окно "Конструктор отчета"
		И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R3C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'КнопкаПлюс'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R5C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R3C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R5C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'				

	* Создаем бланк сводной таблицы
		И Я для вида отчета "ВА - Трансформация периодов" создаю бланк сводной таблицы по умолчанию с отборами "Статьи ДДС"

Сценарий: 13.02 Вводим данные в сводную таблицу, получаем ошибку рекурсивного расчета

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "ВА - Трансформация периодов"
		И Я устанавливаю отборы сводной таблицы: дата начала '01.01.2024', дата конца '31.03.2024', валюта 'RUB', сценарий "ВА - Основной сценарий", организация "Меркурий ООО"	
		И я запоминаю заголовок формы в переменную 'ЗаголовокОкна'	

	* Вводим значение
		Когда открылось окно '$ЗаголовокОкна$'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличный документ 'ПолеТабличногоДокументаМакет' я ввожу текст '100,00000'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C3'
		Тогда открылось окно "Протокол"
		И я нажимаю на кнопку с именем 'ФормаТехническаяИнформация'
		Тогда табличный документ 'ПолеТабличногоДокумента' равен:
				| "Ошибки"                                                                                                                                | '' | ''                                                                                                                     |
				| "Обнаружена рекурсия в связях при расчете показателя: \"Приемник сумма\".\nПроверьте формулы расчета и перезапишите правило расчета."   | '' | "{\"S\",\"Дерево расчета:\n	Итог сумма\n		Накопление сумма\n			Приемник сумма\n				Источник сумма\n				Итог сумма\"}"      |
				| "Обнаружена рекурсия в связях при расчете показателя: \"Накопление сумма\".\nПроверьте формулы расчета и перезапишите правило расчета." | '' | "{\"S\",\"Дерево расчета:\n	Приемник сумма\n		Источник сумма\n		Итог сумма\n			Накопление сумма\n				Приемник сумма\"}"    |
				| "Обнаружена рекурсия в связях при расчете показателя: \"Итог сумма\".\nПроверьте формулы расчета и перезапишите правило расчета."       | '' | "{\"S\",\"Дерево расчета:\n	Накопление сумма\n		Приемник сумма\n			Источник сумма\n			Итог сумма\n				Накопление сумма\"}" |
		И Я закрываю окно "Протокол"
		Когда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 13.03 Перенастраиваем структуру вида отчета

	* Настраиваем структуру вида отчета
		И Я открываю контруктор отчета с именем "ВА - Трансформация периодов"

	* Приемник
		Когда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R3C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст "[ВАТрансформацияПериодов_Источник_Сумма]"
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'				

	* Накопление
		Когда открылось окно "Конструктор отчета"	
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
		Тогда открылось окно "Источники данных"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Источник данных (создание)"
		И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Трансформация периодов"
		И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
		И Я выбираю показатель с кодом "Накопление_Сумма"
		Тогда открылось окно "Источник данных (создание) *"
		И я перехожу к закладке с именем 'СтраницаОтборы'
		И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
			| "Отбор"         | "Поле"            |
			| "Период отчета" | "[Период отчета]" |
		И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
		И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Период отчета со сдвигом"
		И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
 		И в таблице 'ДеревоПараметровОтбораБД' в поле с именем 'УточнениеСпособаОпределения' я ввожу текст '-1'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
		Тогда открылось окно "Источники данных"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Конструктор отчета *"
		И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст "[ВАТрансформацияПериодов_Накопление_Сумма01] + [ВАТрансформацияПериодов_Приемник_Сумма]"
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

	* Итог
		Когда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R5C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
		Тогда открылось окно "Источники данных"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем 'Список'
		Тогда открылось окно "ВА - Трансформация периодов_Накопление сумма (Источник данных)"
		И я перехожу к закладке с именем 'СтраницаОтборы'
		И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
			| "Отбор"         | "Поле"            |
			| "Период отчета" | "[Период отчета]" |
		И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
		И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
		И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
		И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Отбор не производится"
		И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - Трансформация периодов_Накопление сумма (Источник данных) *" в течение 20 секунд
		Тогда открылось окно "Источники данных"
		И Я закрываю окно "Источники данных"
		Тогда открылось окно "Конструктор отчета"
		И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'
				
Сценарий: 13.04 Проверяем расчет в сводной таблице

	* Открываем сводную таблиц
		И Я октрываю сводную таблицу отчета с именем "ВА - Трансформация периодов"

	* Вводим значения
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличный документ 'ПолеТабличногоДокументаМакет' я ввожу текст '100,00000'
		Когда открылось окно '$ЗаголовокОкна$ *'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Трансформация периодов (сводная таблица)" | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| "ВА - Трансформация периодов (сводная таблица)" | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "Источник"                                      | '100'            | '0'               | '0'            | '100'   |
			| "Приемник"                                      | '100'            | '0'               | '0'            | '100'   |
			| "Накопление"                                    | '100'            | '100'             | '100'          | '300'   |
			| "Итог"                                          | '300'            | '300'             | '300'          | '900'   |

	* Вводим значения			
		Когда открылось окно '$ЗаголовокОкна$ *'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличный документ 'ПолеТабличногоДокументаМакет' я ввожу текст '200,00000'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C4'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличный документ 'ПолеТабличногоДокументаМакет' я ввожу текст '300,00000'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Трансформация периодов (сводная таблица)" | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| "ВА - Трансформация периодов (сводная таблица)" | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "Источник"                                      | '100'            | '200'             | '300'          | '600'   |
			| "Приемник"                                      | '100'            | '200'             | '300'          | '600'   |
			| "Накопление"                                    | '100'            | '300'             | '600'          | '1 000' |
			| "Итог"                                          | '1 000'          | '1 000'           | '1 000'        | '3 000' |
			
	* Сохраняем результат
		Когда открылось окно '$ЗаголовокОкна$ *'
		И Я закрываю окно '$ЗаголовокОкна$ *'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
									