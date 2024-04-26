﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Планы счетов - ФормаСписка
# Конфигурация: Управление холдингом, редакция 3.2
# Версия: 3.2.8.21

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Открытие формы списка плана счетов "План счетов МСФО" (МСФО)

	Дано Я открываю основную форму списка плана счетов "МСФО"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана счетов МСФО"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана счетов МСФО"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка плана счетов "План счетов бухгалтерского учета" (Хозрасчетный)

	Дано Я открываю основную форму списка плана счетов "Хозрасчетный"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана счетов Хозрасчетный"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана счетов Хозрасчетный"
	И Я закрываю текущее окно
