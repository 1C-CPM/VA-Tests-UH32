﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для настройки пользователей и прав доступа

Сценарий: Я создаю профиль с именем 'TheName' на основании профиля 'TheProfile'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'

	* Удаляем существующий профиль
		И Я в списке "Профили групп доступа" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'Список'
			* Переименовываем
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Профиль групп доступа)"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "* (Профиль групп доступа) *" в течение 20 секунд

	* Ищем предопределенный профиль
		Тогда открылось окно "Профили групп доступа"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'				
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Профили групп доступа"
		И в таблице 'Список' количество строк 'равно' 1

	* Копируем профиль
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюСкопировать' на элементе формы с именем "Список"
		Тогда открылось окно "Профиль групп доступа (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'	
	
	* Закрываем окна
		Тогда открылось окно "[TheName] (Профиль групп доступа)"	
		И я закрываю окно "[TheName] (Профиль групп доступа)"
		Тогда открылось окно "Профили групп доступа"
		И Я закрываю окно "Профили групп доступа"	

Сценарий: Я добавляю в профиль 'TheProfile' ограничение доступа с видом 'TheType' значением	'TheValue'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'

	* Ищем существующий профиль
		И Я в списке "Профили групп доступа" по полю "Наименование" ищу элемент '[TheProfile]' "По точному совпадению"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку

	* Удаляем вид доступа если он уже задан
		Тогда открылось окно "[TheProfile] (Профиль групп доступа)"
		И я перехожу к закладке с именем 'ВидыИЗначенияДоступа'
		И Я запоминаю значение выражения '[TheType]' в переменную 'ТекущийТип'
		Если в таблице 'ВидыДоступа' есть строка Тогда
			| "Вид доступа"  |
			| '$ТекущийТип$' |
			И в таблице 'ВидыДоступа' я перехожу к строке
				| "Вид доступа" |
				| '$ТекущийТип$' |
			И я выбираю пункт контекстного меню с именем 'ВидыДоступаКонтекстноеМенюУдалить' на элементе формы с именем 'ВидыДоступа'
						
	* Добавляем ограничение доступа		
		И в таблице 'ВидыДоступа' я нажимаю на кнопку с именем 'ВидыДоступаДобавить'
		И в таблице 'ВидыДоступа' из выпадающего списка с именем 'ВидыДоступаВидДоступаПредставление' я выбираю точное значение '[TheType]'
		И я перехожу к следующему реквизиту
		И в таблице 'ВидыДоступа' из выпадающего списка с именем 'ВидыДоступаВсеРазрешеныПредставление' я выбираю точное значение '[TheValue]'
		И в таблице 'ВидыДоступа' я завершаю редактирование строки
		И я делаю 5 раз
			И в таблице 'ВидыДоступа' я нажимаю на кнопку с именем 'ВидыДоступаПереместитьВверх'

	* Записываем элемент
		Когда открылось окно "[TheProfile] (Профиль групп доступа) *"		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'		
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		И я жду закрытия окна "[TheProfile] (Профиль групп доступа) *" в течение 20 секунд
		Тогда открылось окно "Профили групп доступа"
		И Я закрываю окно "Профили групп доступа"

Сценарий: Я добавляю в профиль 'TheProfile' роль 'TheRole'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'

	* Ищем существующий профиль
		И Я в списке "Профили групп доступа" по полю "Наименование" ищу элемент '[TheProfile]' "По точному совпадению"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку

	* Добавляем роль
		Тогда открылось окно "[TheProfile] (Профиль групп доступа)"
		И в таблице 'Роли' я нажимаю на кнопку с именем 'РолиПоказатьТолькоВыбранныеРоли'
		
	* Ищем существующую роль
		И в таблице 'Роли' я нажимаю на кнопку с именем 'РолиНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Пометка, Разрешенное действие (роль)'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И в поле с именем 'Pattern' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'Роли' количество строк 'равно' 1
		И в таблице 'Роли' я выбираю текущую строку

	* Устанавливаем флаг роли
		И в таблице 'Роли' я устанавливаю флаг с именем 'РолиПометка'
		И в таблице 'Роли' я завершаю редактирование строки

	* Записываем элемент
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "[TheProfile] (Профиль групп доступа) *" в течение 20 секунд
		И Я закрываю окно "Профили групп доступа"
		Тогда открылось окно "Настройки пользователей и прав"
		И Я закрываю окно "Настройки пользователей и прав"

Сценарий: Я удаляю из профиля 'TheProfile' роль 'TheRole'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'

	* Ищем существующий профиль
		И Я в списке "Профили групп доступа" по полю "Наименование" ищу элемент '[TheProfile]' "По точному совпадению"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку

	* Удаляем роль
		Тогда открылось окно "[TheProfile] (Профиль групп доступа)"
		И в таблице 'Роли' я нажимаю на кнопку с именем 'РолиПоказатьТолькоВыбранныеРоли'
		
	* Ищем существующую роль
		И в таблице 'Роли' я нажимаю на кнопку с именем 'РолиНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Пометка, Разрешенное действие (роль)'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И в поле с именем 'Pattern' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'Роли' количество строк 'равно' 1
		И в таблице 'Роли' я выбираю текущую строку

	* Устанавливаем флаг роли
		И в таблице 'Роли' я снимаю флаг с именем 'РолиПометка'
		И в таблице 'Роли' я завершаю редактирование строки

	* Записываем элемент
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "[TheProfile] (Профиль групп доступа) *" в течение 20 секунд
		И Я закрываю окно "Профили групп доступа"
		Тогда открылось окно "Настройки пользователей и прав"
		И Я закрываю окно "Настройки пользователей и прав"

Сценарий: Я создаю группу доступа с именем 'TheName' по профилю 'TheProfile'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьГруппыДоступа'

	И Я в списке "Группы доступа" по полю "Наименование" ищу элемент '[TheProfile]' "По точному совпадению"	

	Если '"[TheName]" = "Открытие внешних отчетов и обработок" ИЛИ "[TheName]" = "Open external reports and data processors"' Тогда

		* Проверяем, что у гурппы доступа правильный профиль
			И в таблице 'Список' количество строк 'равно' 1
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Открытие внешних отчетов и обработок (Группа доступа)"
			Тогда элемент формы с именем 'Профиль' стал равен '[TheProfile]'

	Иначе

		* Удаляем существующую группу доступа			
			И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление	
					И Я удаляю текущую строку в списке 'Список'
				* Переименовываем
					И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
					И в таблице 'Список' я выбираю текущую строку
					Тогда открылось окно "* (Группа доступа)"
					И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					И я жду закрытия окна "* (Группа доступа) *" в течение 20 секунд

		* Создаем группу доступа
			Тогда открылось окно "Группы доступа"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Группа доступа (создание)"
			И в поле с именем 'Наименование' я ввожу текст '[TheName]'

		* Обновляем настройки
			И из выпадающего списка с именем "Профиль" я выбираю по строке '[TheProfile]'
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "[TheName] (Группа доступа)"

	И я закрываю окно "[TheName] (Группа доступа)"
	Тогда открылось окно "Группы доступа"
	И Я закрываю окно "Группы доступа"		

Сценарий: Я добавляю в группу доступа 'TheProfile' значения доступа с видом 'TheType' из таблицы

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьГруппыДоступа'
	
	* Ищем группу доступа
		И Я в списке "Группы доступа" по полю "Наименование" ищу элемент '[TheProfile]' "По точному совпадению"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку

	* Настраиваем ограничения
		Тогда открылось окно "[TheProfile] (Группа доступа)"
		И я перехожу к закладке с именем 'Доступ'
		И я заполняю таблицу 'ЗначенияДоступа' данными
			| '$ТекущаяТаблица$' |

	* Сохраняем профиль
		Когда открылось окно "[TheProfile] (Группа доступа) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "[TheProfile] (Группа доступа) *" в течение 20 секунд
		Тогда открылось окно "Группы доступа"
		И Я закрываю окно "Группы доступа"

Сценарий: Я нахожу или создаю группу пользователей с именем 'TheName'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПользователи'
		Тогда открылось окно "Пользователи"

	* Ищем или создаем нужную группу
		И я выбираю пункт контекстного меню с именем 'ГруппыПользователейКонтекстноеМенюНайти' на элементе формы с именем 'ГруппыПользователей'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Пользователи"
		Если в таблице 'ГруппыПользователей' количество строк "равно" 0 Тогда
			И я нажимаю на кнопку с именем 'СоздатьГруппуПользователей'	
			Когда открылось окно "Группа пользователей (создание)"
			И в поле с именем 'Наименование' я ввожу текст '[TheName]'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Группа пользователей (создание) *" в течение 20 секунд

	Тогда открылось окно "Пользователи"
	И Я закрываю окно "Пользователи"

Сценарий: Я нахожу или создаю пользователя 'TheUser' группа доступа 'TheProfile' группа 'TheGroup'

	* Открываем список
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПользователи'
		Тогда открылось окно "Пользователи"

	* Ищем или создаем нужного пользователя
		И я выбираю пункт контекстного меню с именем 'ПользователиСписокКонтекстноеМенюНайти' на элементе формы с именем 'ПользователиСписок'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Полное имя"
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"				
		И в поле с именем 'Pattern' я ввожу текст '[TheUser]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Пользователи"
		И пауза 1
		Если в таблице 'ПользователиСписок' количество строк "равно" 0 Тогда
			И я нажимаю на кнопку с именем 'СоздатьПользователя'
			Тогда открылось окно "Пользователь (создание)"
			И в поле с именем 'Наименование' я ввожу текст '[TheUser]'
		Иначе
			И в таблице 'ПользователиСписок' я выбираю текущую строку
							
	* Обновляем настройки
		И я устанавливаю флаг с именем 'ВходВПрограммуРазрешен'
		И я устанавливаю флаг с именем 'ПользовательИБАутентификацияСтандартная'
		И я устанавливаю флаг с именем 'ПользовательИБПоказыватьВСпискеВыбора'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'		
		Если открылось окно "Обсуждения (система взаимодействий)" Тогда
			И я устанавливаю флаг с именем 'БольшеНеЗадаватьЭтотВопрос'
			И я нажимаю на кнопку с именем 'Команда2'
		Тогда открылось окно "[TheUser] (Пользователь)"

	Если 'NOT IsBlankString("[TheProfile]")' Тогда
		И В текущем окне я нажимаю кнопку командного интерфейса "Права доступа"
		Если '"[TheProfile]" = "Администраторы"' Тогда
			* Группа "Администраторы"
				Если в таблице 'ГруппыДоступа' есть строка Тогда
					| "Наименование"   | "Профиль"        |
					| "Администраторы" | "Администратор"  |
					И в таблице 'ГруппыДоступа' я перехожу к строке:
						| "Наименование"   |
						| "Администраторы" |	
				Иначе
					И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаВключитьВГруппу'
					Тогда открылось окно "Группы доступа"
					И в таблице 'ГруппыДоступа' я перехожу к строке:
						| "Наименование"   |
						| "Администраторы" |
					И в таблице 'ГруппыДоступа' я выбираю текущую строку	
			* Группа "Открытие внешних отчетов и обработок"
				Если в таблице 'ГруппыДоступа' есть строка Тогда
					| "Наименование"                         | "Профиль"                              |
					| "Открытие внешних отчетов и обработок" | "Открытие внешних отчетов и обработок" |
					И в таблице 'ГруппыДоступа' я перехожу к строке:
						| "Наименование"                         |
						| "Открытие внешних отчетов и обработок" |
				Иначе
					И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаВключитьВГруппу'
					Тогда открылось окно "Группы доступа"
					И в таблице 'ГруппыДоступа' я перехожу к строке:
						| "Наименование"                         |
						| "Открытие внешних отчетов и обработок" |
					И в таблице 'ГруппыДоступа' я выбираю текущую строку
		Иначе
			* Очищаем группы и устанавливаем переданную				
				И пока в таблице 'ГруппыДоступа' количество строк ">" 0 Тогда
					И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаИсключитьИзГруппы'	
				И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаВключитьВГруппу'
				Тогда открылось окно "Группы доступа"
				И я выбираю пункт контекстного меню с именем 'ГруппыДоступаНайти' на элементе формы с именем 'ГруппыДоступа'
				Тогда открылось окно "Найти"
				И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Группы доступа"
				И в таблице 'ГруппыДоступа' я выбираю текущую строку

	Если 'NOT IsBlankString("[TheGroup]")' Тогда
		Когда открылось окно "[TheUser] (Пользователь)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Группы"
		И Я запоминаю значение выражения '[TheGroup]' в переменную 'CurrentGroup'
		И в таблице 'ДеревоГрупп' я перехожу к строке:
			| 'Группа'         |
			| '$CurrentGroup$' |
		И в таблице 'ДеревоГрупп' я устанавливаю флаг с именем 'ДеревоГруппПометка'
		И в таблице 'ДеревоГрупп' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'					

	Когда открылось окно "[TheUser] (Пользователь)"	
	И я закрываю окно "[TheUser] (Пользователь)"			
	Тогда открылось окно "Пользователи"
	И Я закрываю окно "Пользователи"				

Сценарий: Я включаю производительный режим работы ограничений на уровне записей

	Если '$$ЭтоЕРПУХ$$' Тогда
		И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
	Иначе			
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
	Тогда открылось окно "Настройки пользователей и прав"
	И я разворачиваю группу с именем 'ГруппаГруппыДоступа'
	Если элемент формы с именем 'ОграничиватьДоступНаУровнеЗаписейУниверсально' присутствует на форме Тогда
		И из выпадающего списка с именем 'ОграничиватьДоступНаУровнеЗаписейУниверсально' я выбираю точное значение "Производительный"
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		
	Тогда открылось окно "Настройки пользователей и прав"
	И я нажимаю на кнопку с именем 'ОбновлениеДоступаНаУровнеЗаписей'
	Тогда открылось окно "Обновление доступа на уровне записей"
	И Пауза 1

	И я разворачиваю группу с именем 'КраткоПодробно'
	И я устанавливаю флаг 'Автообновление'
	Если элемент формы с именем 'ЗапуститьОбновлениеДоступаСейчас' доступен Тогда
		И я нажимаю на кнопку с именем 'ЗапуститьОбновлениеДоступаСейчас'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
	И у элемента с именем 'ПоследнееЗавершениеОбновленияДоступа' я жду значения "(завершено *)" в течение 1000 секунд по шаблону
	И я жду, что в таблице 'Списки' количество строк будет "равно" 0 в течение 300 секунд
	Когда в таблице 'Списки' количество строк "равно" 0

	Когда открылось окно "Обновление доступа на уровне записей"
	И Я закрываю окно "Обновление доступа на уровне записей"
