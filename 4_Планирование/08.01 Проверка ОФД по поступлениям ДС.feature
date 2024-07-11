﻿#language: ru
@tree

@UH32_Planning_OFD_CF

Функционал: 08.01 Проверить создание ОФД по платежам - поступление

	Как Администратор я хочу
	создать и провести документы движения денежных средств
	чтобы проверить автоматическое создание, заполнение и проведение документа Отражение фактических данных по аналитикам планирования

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Переменные:
	ВАПроект = 'ВА - Проект 1'
	ВАЦФО = 'ВА - ЦФО 5 (ДР)'
	ВАСтатья = 'ВА - Статья 4'
	ВАОрганизация = 'ВА - ООО Тест'
	ВАКонтрагент = 'Автотест контрагент'
	ВАСуммаДокумента = '1000'
	ВАФизЛицо = 'Старк Бран'

Сценарий: 08.00 Определеняем тип приложения

	Пусть Инициализация переменных	

Структура сценария: 08.01 Поступление на расчетный счет в рублях

	* Создаем договор
		Если не существует элемент справочника "ДоговорыКонтрагентов" с "Номер" равным <ТекВидДоговора> Тогда
			И Я создаю договор с именем <ТекВидДоговора> с видом <ТекВидДоговора> 

	* Создаем документ
    	И Я создаю поступление ДС по виду операции <ТекВидОперации> по договору <ТекВидДоговора>	
	
	* Проверка создания ОФД
        И Я проверяю создание ОФД "Поступление на расчетный счет" с параметром "Нет"
		И Я проверяю заполнение аналитик по виду бюджета 'БДДС' в ОФД
		И Я проверяю движения по виду бюджета 'БДДС' в ОФД

Примеры:
	| ТекВидОперации                       | ТекВидДоговора                          |
	| "Оплата от покупателя"               | "С хранителем"                          |
	| "Оплата от покупателя"               | "С покупателем"                         |
	| "Оплата от покупателя"               | "С комиссионером (агентом) на продажу"  |
	| "Оплата от покупателя"               | "С комитентом (принципалом) на продажу" |
	| "Оплата от покупателя"               | "С комитентом (принципалом) на закупку" |
	| "Оплата от покупателя"               | "С комиссионером (агентом) на закупку"  |
	| "Оплата от покупателя"               | "С давальцем"                           |
	| "Возврат от поставщика"              | "С комиссионером (агентом) на продажу"  |
	| "Возврат от поставщика"              | "С комитентом (принципалом) на продажу" |
	| "Возврат от поставщика"              | "С комитентом (принципалом) на закупку" |
	| "Возврат от поставщика"              | "С комиссионером (агентом) на закупку"  |
	| "Возврат от поставщика"              | "Ввоз из ЕАЭС"                          |
	| "Возврат от поставщика"              | "Импорт"                                |
	| "Возврат от поставщика"              | "С переработчиком"                      |
	| "Возврат от поставщика"              | "С поклажедателем"                      |
	| "Возврат от поставщика"              | "Расчетно-кассовое обслуживание"        |
	| "Возврат от поставщика"              | "Страхование"                           |
	| "Получение займа от контрагента"     | "Заем полученный"                       |
	| "Получение кредита в банке"          | "Овердрафт"                             |
	| "Получение кредита в банке"          | "Кредит"                                |
	| "Возврат займа контрагентом"         | "Заем выданный"                         |
	| "Прочие поступления от контрагентов" | "Аккредитив выданный"                   |
	| "Прочие поступления от контрагентов" | "Гарантия выданная"                     |
	| "Прочие поступления от контрагентов" | "Залоги и поручительства входящие"      |
	| "Прочие поступления от контрагентов" | "Залоги и поручительства исходящие"     |
	| "Прочие поступления от контрагентов" | "Расчеты с брокером"                    |
	| "Прочие поступления от контрагентов" | "Минимальный неснижаемый остаток"       |
	| "Прочие поступления от контрагентов" | "Универсальное размещение"              |
	| "Прочие поступления от контрагентов" | "Универсальное привлечение"             |
	| "Прочие поступления от контрагентов" | "Прочее"                                |
	| "Прочие поступления от контрагентов" | "Расчетный валютный форвард"            |
	| "Прочие поступления от контрагентов" | "Процентный своп"                       |
	| "Прочие поступления от контрагентов" | "Валютно-процентный своп"               |
	| "Оплата от факторинговой компании"   | "Факторинг"                             |
	| "Поступление по платежным картам"    | "Прочее"                                |
	| "Возврат депозита"                   | "Депозит"                               |
	| "Поступления по депозитам"           | "Депозит"                               |
	| "Поступление от цессионария"         | "Цессия исходящая"                      |
	| "Возврат займа работником"           | ""                                      |
	| "Прочее поступление"                 | ""                                      |
	| "Возврат от подотчетного лица"       | ""                                      |
	| "Поступления по ценным бумагам"      | ""                                      |
	| "Взнос в уставный капитал"           | ""                                      |
	| "Возврат налога"                     | ""                                      |
	| "Депозит (упрощенная схема)"         | ""                                      |
	
