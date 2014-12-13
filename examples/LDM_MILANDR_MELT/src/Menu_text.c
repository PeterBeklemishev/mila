/*============================================================================================
 *
 *  (C) 2013, LDM-SYSTEMS
 *
 *  Демонстрационный проект для отладочной платы LDM-K1986BE92QI
 *
 *  Данное ПО предоставляется "КАК ЕСТЬ", т.е. исключительно как пример, призванный облегчить
 *  пользователям разработку их приложений для процессоров Milandr K1986BE92QI. Компания LDM-SYSTEMS
 *  не несет никакой ответственности за возможные последствия использования данного, или
 *  разработанного пользователем на его основе, ПО.
 *
 *--------------------------------------------------------------------------------------------
 *
 *  Файл Menu_text.c: Функции-обработчики меню - вывод текста
 *
 *============================================================================================*/

#include <string.h>

#include <lcd.h>
#include <Menu.h>
#include <Menu_items.h>
#include <text.h>
#include <joystick.h>


void FontFunc(void) {
    FONT *OldFont = CurrentFont;

    /* Выводим заголовок и ждем key up */
    LCD_CLS();
    CurrentMethod = MET_AND;
    CurrentFont = &Font_6x8;
    DisplayMenuTitle("Примеры шрифтов");
    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* Примеры шрифтов */
    LCD_PUTS(0, 12, "Шрифт6X8");

#ifndef __CMCARM_DEMO__

    CurrentFont = &Font_12x16;
    LCD_PUTS(0, 22, "Шрифт12X16");

    CurrentFont = &Font_7x10_thin;
    LCD_PUTS(0, 40, "Шрифт7X10");

    CurrentFont = &Font_7x10_bold;
    LCD_PUTS(0, 52, "Шрифт7X10 жирный");

#endif /* __CMCARM_DEMO__ */

    /* Ждем нажатия SEL и возвращаемся в главное меню */
    CurrentFont = OldFont;
    BackToMenuOnSel();
}


void StyleFunc(void) {
    FONT *OldFont = CurrentFont;

    /* Выводим заголовок и ждем key up */
    LCD_CLS();
    CurrentMethod = MET_AND;
    CurrentFont = &Font_6x8;
    DisplayMenuTitle("Примеры стилей");
    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* Примеры стилей */
    do {
        LCD_PUTS_Ex(0, 12, "Мерцающий", StyleBlink);
        if (KEY_PRESSED(SEL)) break;
        LCD_PUTS_Ex(0, 32, "Переменный", StyleFlipFlop);
        if (KEY_PRESSED(SEL)) break;
        LCD_PUTS_Ex(0, 52, "Дрожащий", StyleVibratory);
    } while (!KEY_PRESSED(SEL));

    /* Нажата SEL - возвращаемся в главное меню */
    CurrentFont = OldFont;
    DisplayMenu();
}


void ShiftFunc(void) {
    FONT *OldFont = CurrentFont;

    /* Выводим заголовок и ждем key up */
    LCD_CLS();
    CurrentMethod = MET_AND;
    CurrentFont = &Font_6x8;
    DisplayMenuTitle("Бегущая строка");
    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* TODO - бегущая строка */
    do {

    } while (!KEY_PRESSED(SEL));

    /* Нажата SEL - возвращаемся в главное меню */
    CurrentFont = OldFont;
    DisplayMenu();
}

/* Текст для демонстрации "электронной книги" */
static char LongMasBook = 10;
static char Book[10][22] = {
        {"Микроконтроллеры се- "},
        {"рии K1986BE92QI явля-"},
        {"ются микроконтрол-   "},
        {"лерами со встроенной "},
        {"Flash памятью прог-  "},
        {"рамм и построены на  "},
        {"базе высокопроизводи-"},
        {"тельного процессорно-"},
        {"го RISC ядра         "},
        {"Cortex-M3.           "}};

void BookFunc(void){
    u32 top_ind, key, i, LineD, LinS;

    // Определяем количество строк на экране и количество строк скролинга
    if(LongMasBook > 8)
    {
      LineD = 8;
      LinS = LongMasBook - LineD;
    }
    else
    {
      LineD = LongMasBook;
      LinS = 0;
    }

    /* Очищаем экран и ждем key up */
    LCD_CLS();
    CurrentMethod = MET_AND;
    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* Цикл обработки нажатий кнопок */
    for (top_ind = 0, key = NOKEY; key != SEL; ){
        /* Выводим текст и ждем нажатия кнопки */
        for (i = 0; i < LineD; i++)
            LCD_PUTS(0, (CurrentFont->Height) * i, Book[top_ind + i]);
        WAIT_UNTIL_ANY_KEY;

        /* Обработка нажатия кнопки */
        key = GetKey();
        switch (key) {
            /* Скроллирование вверх */
            case UP:
                if (top_ind > 0)
                    top_ind--;
                break;
            /* Скроллирование вниз */
            case DOWN:
                if (top_ind < LinS)
                    top_ind++;
                break;
    }
  }

  /* Нажата SEL - возвращаемся в главное меню */
  WAIT_UNTIL_KEY_RELEASED(key);
  DisplayMenu();
}


void AboutFunc(void) {

    /* Выводим текст About */
    LCD_CLS();
    CurrentMethod = MET_AND;

    LCD_PUTS(0, 0,                             "   LDM-K1986BE92QI     ");
    LCD_PUTS(0, CurrentFont->Height + 1,       "  Отладочная  плата    ");
    LCD_PUTS(0, (CurrentFont->Height) * 2 + 2, "                    ");
    LCD_PUTS(0, (CurrentFont->Height) * 3 + 2, "                    ");
    LCD_PUTS(0, (CurrentFont->Height) * 4 + 3, "  Демо пример  v.1.0 ");
    LCD_PUTS(0, (CurrentFont->Height) * 5 + 4, "   LDM-SYSTEMS 2013     ");
    LCD_PUTS(0, (CurrentFont->Height) * 6 + 5, "  www.ldm-systems.ru    ");

    /* Ждем нажатия SEL и возвращаемся в главное меню */
    BackToMenuOnSel();
}

/*============================================================================================
 * Конец файла Menu_text.c
 *============================================================================================*/

