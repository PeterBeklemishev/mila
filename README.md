mila LINUX Hardcore
====

Пульнул мой бранч? Велкам ту хелл!

Подготовка
----------
Для сборки тебе понадобится кросс-компилятор. Если ты убунтовод, хватай пакеты apt-getом:

    sudo apt-get install gcc-arm-none-eabi binutils-arm-none-eabi
  
Если ты всякий арчевод или гентушник, придумай сам, что делать, но помни, что тебе нужны binutils и gcc, да не простые, а arm-none-eabi.

Для прошивки тебе понадобится кой-чего из питона. Есди ты всё ещё убунтовод, то делай

    sudo apt-get install python3-pip
    sudo pip3 install pyserial

Работа
------

1. Делай `make` из корня. (Проверь, что из твоего проекта вылез hex)
2. Делай `./burner.sh` из корня. (Не забудь ткнуть ребут на плате)
3. Получается? Пиши код.

[test.c](test.c) в корне - это скетч, пили его.

[src/mila](src/mila) - это оболочка, пили её.

Смена скетча
------------

Если хочешь вести другой проект, пока можно тока так:

1. открывай `Makefile` в текстовом редакторе, ищи строку `PROG_NAME = test`, меняй `test` на  *%что_хочешь%*
2. создавай в корне файл *%что_хочешь%.c* и пиши в нем код. 
3. КОДЬ МЭЙКАЙ АПЛОУДЬ

Траблшут
--------

Если что-то не работает, открывай ишью, а лучше просто пиши вконтактике.
