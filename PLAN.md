Проект “Мила”
=====

Mila team
-----
@PeterBeklemishev @ReDetection @dubkov @ko10ok 
Остальные в режиме ворчащих и бета-тестеров

Цель
-----
Cоздание на основе отечественного микроконтроллера К1986ВЕ92QI программно-аппаратную платформу, идеологически сходную с Arduino:
 + хардверно это плата с микроконтроллером К1986ВЕ92QI, необходимой обвязкой, разъемами для штыревого подключения внешних устройств к портам ввода\вывода и цифровым шинам, USB-гнездом для подключения к ПК и разъемом внешнего питания.
 + софтверно это набор библиотек с высоким уровнем абстракции от железа, подключаемых к редактору кода, интегрируемые в программную среду набор инструментов для компиляции и загрузчик прошивки (Для Windows, Linux, Mac). 

Общий план работ
=====

Software
-----
Написать библиотеки, которые бы позволяли пользователю абстрагироваться от железа и при написании кода оперировать понятиями "пин", "порт", "устройство", "соединение" и т.д.

Реализовать следующий функционал:
- [ ] + GPIO: инициализация, запись, чтение *порта* и отдельного *пина*
- [ ] + Timers: формирование задержки, ШИМ
- [ ] + UART: обмен данными с ПК и внешними устройствами
- [ ] + ADC: чтение аналоговых датчиков
- [ ] + EXT_INT: обработка внешних прерываний
- [ ] + I2C, SPI: обмен данными с внешними устройствами
- [ ] + DAC: формирование напряжения
- [ ] + COMP: компарирование входов

Hardware
-----
- [ ] Разработать плату и изготовить небольшую партию образцов. 
 + Требования к размеру пока не определены. 
 + Требования к составу пока не определены. 
 + Требования к модульной расширяемости пока не определены.


Кратковременный план работ
=====

1. Определиться с конфигурацией пинов на будущей плате
2. Реализовать функции инициализации и чтения-записи пинов и портов
3. Реализовать обмен данными с ПК по UART
4. Выполнить настройку таймеров и PLL, реализовать задержку
5. Реализовать функции ШИМ
6. Реализовать функции АЦП
7. Реализовать обработку внешних прерываний с пинов
8. Изготовить прототип платы для дальнейших разработок ПО в режиме хакатонов с привлечением заинтересованных лиц
9. Реализовать функции обмена данными с внешними устройствами по последовательным протоколам (Uart, SPI, I2C)
10. Реализовать функции компаратора и ЦАП
11. Выявить и задокументировать недостатки в реализации платы
12. Изготовить пререлизную версию платы и софта
13. Бета-софт выложить в открытый доступ, давать пользоваться бета-платами всем заинтересованным
14. Допилить всё
15. Реализовать библиотеки для работы с контретными устройствами (датчиками различного назначения)
16. Релиз
