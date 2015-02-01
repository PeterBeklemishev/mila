Linux
=====

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



Windows
=====

1.Скачиваем и ставим необходимое
---

У меня в `PATH` давно есть linux-стайл команды типа `uname`, поэтому мне норм.

[Тулчейн для компиляции](https://launchpad.net/gcc-arm-embedded) - справа выберите gcc-arm-non-...-win32.exe (Этот же файл есть на нашем фтп)

***При установке выбирайте английский язык - иначе в инсталлере будут одни кракозябры!*** Обязательно поставьте галочку "добавить в `PATH`" в конце установки! Теперь откройте консоль и наберите `arm-none-eabi-gcc`. Если в ответ вы получите что-то вроде 

```
c:\Users\%username%\Documents\GitHub\mila\linux>arm-none-eabi-gcc
arm-none-eabi-gcc: fatal error: no input files
compilation terminated.

c:\Users\Петр\Documents\GitHub\mila\linux>
```
то все нормально. Теперь наберите `make` и посмотрите, не вывалилится вам error или warning

гуглите ошибки, ...


Mac OS X
=====

First, setup gcc toolchain with arm-none-eabi. Install it with [homebrew](http://brew.sh), then try to run make. Everything should be fine now.
```
brew tap PX4/homebrew-px4
brew install gcc-arm-none-eabi-48
make
```
