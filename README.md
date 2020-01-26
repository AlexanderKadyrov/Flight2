# Flight

Приложение Flight выполнено программистом Alexander Kadyrov.
С применением паттерна программирования MVVM и использованием библиотек ReactiveSwift & ReactiveCocoa.
В проект включены самостоятельно написанные библиотеки:
* [TabloidView](https://github.com/AlexanderKadyrov/TabloidView)
* [NWClient](https://github.com/AlexanderKadyrov/NWClient)

# Описание проекта

Суть проекта заключается в том, чтобы отображать тестовые данные, сформированные случайным образом, в виде табличного представления.
При нажатии на ячейку с данными, должен открываться экран детального вида.
В зависимости от выбранного типа данных открывается специально предназначенный экран.

## Типы данных в приложении

* struct Notice
* class Event
* class Move 

Для успешной работы с JSON структурой данных, используются инструменты Codable и JSONDecoder

# Light & Dark Mode

Приложение поддерживает светлую и темную темы (см. скриншоты в проекте)

# PS

В приложении используются логотипы и данные от известных авиакомпаний, данная информация была взята из открытых источников в сети Интернет. Программист не преследует цель прорекламировать ту или инную авиакомпанию или как-то навредить её имиджу. Информация была интегрирована в приложение с целью отображения тестовых данных, для того, чтобы интервьюверы оценили профессиональные качества и навыки работы программиста с теми или инными инструментами, не более. Все совпадения случайны и не отражают реальной ситуации в мире.
