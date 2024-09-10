﻿#language: ru
@tree

@UH32_Planning_OFD_CF_outflow

Функционал: 08.02 Проверить создание ОФД по платежам - списание

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

Структура сценария: 08.01 Списание с расчетного счета в рублях

	* Создаем договор
		Если не существует элемент справочника "ДоговорыКонтрагентов" с "Номер" равным <ТекВидДоговора> Тогда
			И Я создаю договор с именем <ТекВидДоговора> с видом <ТекВидДоговора> 

	* Создаем документ
    	И Я создаю списание ДС по виду операции <ТекВидОперации> по договору <ТекВидДоговора>	
	
	* Проверка создания ОФД
        И Я проверяю создание ОФД "Списание с расчетного счета" с параметром "Нет"
		И Я проверяю заполнение аналитик по виду бюджета 'БДДС' в ОФД
		И Я проверяю движения по виду бюджета 'БДДС' в ОФД

Примеры:
	| ТекВидОперации                                    | ТекВидДоговора                          |
	| "Возврат покупателю"                              | "С хранителем"                          |
	| "Возврат покупателю"                              | "С покупателем"                         |
	| "Возврат покупателю"                              | "С комиссионером (агентом) на продажу"  |
	| "Возврат покупателю"                              | "С комитентом (принципалом) на продажу" |
	| "Возврат покупателю"                              | "С комитентом (принципалом) на закупку" |
	| "Возврат покупателю"                              | "С комиссионером (агентом) на закупку"  |
	| "Возврат покупателю"                              | "С давальцем"                           |
	| "Оплата поставщику"                               | "С комиссионером (агентом) на продажу"  |
	| "Оплата поставщику"                               | "С комитентом (принципалом) на продажу" |
	| "Оплата поставщику"                               | "С комитентом (принципалом) на закупку" |
	| "Оплата поставщику"                               | "С комиссионером (агентом) на закупку"  |
	| "Оплата поставщику"                               | "Ввоз из ЕАЭС"                          |
	| "Оплата поставщику"                               | "Импорт"                                |
	| "Оплата поставщику"                               | "С переработчиком"                      |
	| "Оплата поставщику"                               | "С поклажедателем"                      |
	| "Оплата поставщику"                               | "Расчетно-кассовое обслуживание"        |
	| "Оплата поставщику"                               | "Страхование"                           |
	| "Возврат займа контрагенту"                       | "Заем полученный"                       |
	| "Возврат кредита банку"                           | "Овердрафт"                             |
	| "Возврат кредита банку"                           | "Кредит"                                |
	| "Выдача займа контрагенту"                        | "Заем выданный"                         |
	| "Прочие платежи контрагенту"                      | "Аккредитив выданный"                   |
	| "Прочие платежи контрагенту"                      | "Гарантия выданная"                     |
	| "Прочие платежи контрагенту"                      | "Залоги и поручительства входящие"      |
	| "Прочие платежи контрагенту"                      | "Залоги и поручительства исходящие"     |
	| "Прочие платежи контрагенту"                      | "Расчеты с брокером"                    |
	| "Прочие платежи контрагенту"                      | "Минимальный неснижаемый остаток"       |
	| "Прочие платежи контрагенту"                      | "Универсальное размещение"              |
	| "Прочие платежи контрагенту"                      | "Универсальное привлечение"             |
	| "Прочие платежи контрагенту"                      | "Прочее"                                |
	| "Прочие платежи контрагенту"                      | "Расчетный валютный форвард"            |
	| "Прочие платежи контрагенту"                      | "Процентный своп"                       |
	| "Прочие платежи контрагенту"                      | "Валютно-процентный своп"               |
	| "Приобретение валюты по кросс курсу"              | "Поставочный валютный форвард"          |
	| "Приобретение валюты по кросс курсу"              | "Расчетно-кассовое обслуживание"        |
	| "Приобретение валюты по кросс курсу"              | "Валютный своп"                         |
	| "Продажа валюты по кросс курсу"                   | "Поставочный валютный форвард"          |
	| "Продажа валюты по кросс курсу"                   | "Расчетно-кассовое обслуживание"        |
	| "Продажа валюты по кросс курсу"                   | "Валютный своп"                         |
	| "Уплата налога за третьих лиц"                    | "Прочее"                                |
	| "Размещение средств на депозите"                  | "Депозит"                               |
	| "Оплата лизингодателю"                            | "Лизинг полученный"                     |
	| "Платеж цеденту"                                  | "Цессия входящая"                       |
	| "Депозит (упрощенная схема)"                      | ""                                      |
	| "Уплата налога"                                   | ""                                      |
	| "Перечисление подотчетному лицу"                  | ""                                      |
	| "Перечисление сотруднику по договору подряда"     | ""                                      |
	| "Перечисление дивидендов"                         | ""                                      |
	| "Выдача займа работнику"                          | ""                                      |
	| "Прочее списание"                                 | ""                                      |
	| "Комиссия банка"                                  | ""                                      |
	| "Платежи по ценным бумагам"                       | ""                                      |
	| "Перечисление таможне"                            | ""                                      |
	| "Перечисление по исполнительному листу работника" | ""                                      |
	| "Личные средства предпринимателя"                 | ""                                      |
	| "Перечисление сотруднику по договору подряда"     | ""                                      |
