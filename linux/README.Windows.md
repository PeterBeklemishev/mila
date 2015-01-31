Заставляем все работать под виндой
==========
----

1.Скачиваем и ставим необходимое
---

[Тулчейн для компиляции](https://launchpad.net/gcc-arm-embedded) - справа выберите gcc-arm-non-...-win32.exe

(Этот же файл есть на нашем фтп)

```
!!! При установке выбирайте английский язык - иначе в инсталлере будут одни кракозябры
```

Обязательно поставьте галочку "добавить в `PATH`" в конце установки!

Теперь откройте консоль (`cmd.exe`) и наберите `arm-none-eabi-gcc`

Если в ответ вы получите что-то вроде 

```
c:\Users\Петр\Documents\GitHub\mila\linux>arm-none-eabi-gcc
arm-none-eabi-gcc: fatal error: no input files
compilation terminated.

c:\Users\Петр\Documents\GitHub\mila\linux>
```

то все нормально.

Теперь наберите `make` и посмотрите, не вывалилится вам error или warning

гуглите ошибки, ...