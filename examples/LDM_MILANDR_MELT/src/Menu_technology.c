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

void TechnologyText(u32 nam);

/* Текст */
#ifndef __CMCARM_DEMO__

static char LongMasLDM[4] = {19, 13, 10, 23};

static char BookLDM[19][22] = {
        {"LDM-SYSTEMS          "},
        {" Российская компания-"},
        {"разработчик и произ- "},
        {"водитель электронных "},
        {"устройств.           "},
        {" Выпускает линейки   "},
        {"отладочных плат на   "},
        {"базе контроллеров:   "},
        {"MILANDR, MultiClet,  "},
        {"НИИЭТ (Россия),      "},
        {"ATMEL (США)          "},
        {"и ПЛИС ALTERA, XILINX"},
        {"(США).               "},
        {" Предлагает комплекс-"},
        {"ные услуги от разра- "},
        {"ботки проекта до     "},
        {"серийного производ-  "},
        {"ства.                "},
        {"www.LDM-SYSTEMS.ru   "}};




static char BookMILAND[13][22] = {
        {"ЗАО ПКК Миландр      "},
        {" Российская компания-"},
        {"разработчик и произ- "},
        {"водитель микро-      "},
        {"электронной элемент- "},
        {"ной базы, ориентиро- "},
        {"ванной на использова-"},
        {"нии в изделиях с повы"},
        {"шенными требованиями "},
        {"к надёжности (авиа-  "},
        {"космическая техника, "},
        {"спецтехника и т. п.)."},
        {"www.milandr.ru       "}};

static char BookMELT[10][22] = {
        {"ООО МЭЛТ             "},
        {"Российский производи-"},
        {"тель электроники:    "},
        {"1) Индикаторы ЖК;    "},
        {"2) Источники питания;"},
        {"3) Телефоны с АОН;   "},
        {"4) LED ветильники;   "},
        {"5) Корпуса для источ-"},
        {"   ников питания.    "},
        {"www.melt.com.ru      "}};




static char BookPHYTON[23][22] = {
        {"ООО Фирма ФИТОН      "},
        {" Специализируется на "},
        {"разработке и поставке"},
        {"инструментальных     "},
        {"средств для микро-   "},
        {"контроллеров.        "},
        {"|                    "},
        {"Основные направления:"},
        {"1) Внутрисхемные и   "},
        {"   JTAG эмуляторы;   "},
        {"2) Программно-логи-  "},
        {"   ческие модели     "},
        {"   (симуляторы);     "},
        {"3) Кросс-ассемблеры и"},
        {"   кросс-компиляторы "},
        {"   Си;               "},
        {"4) Универсальные     "},
        {"   программаторы;    "},
        {"5) Программаторы-    "},
        {"   копировщики;      "},
        {"6) Заказные разработ-"},
        {"  ки по ТЗ заказчика."},
        {"www.phyton.ru        "}};



#else /* __CMCARM_DEMO__ defined */

static char LongMasLDM[4] = {2, 2, 2, 2};
static char BookLDM[2][22] = {
        {"LDM-SYSTEMS          "},
        {"www.LDM-SYSTEMS.ru   "}};

static char BookMILAND[2][22] = {
        {"ЗАО ПКК Миландр      "},
        {"www.milandr.ru       "}};

static char BookMELT[2][22] = {
        {"ООО МЭЛТ             "},
        {"www.melt.com.ru      "}};

static char BookPHYTON[2][22] = {
        {"ООО Фирма ФИТОН      "},
        {"www.phyton.ru        "}};

#endif /* __CMCARM_DEMO__ */


void LDM(void)
{
  TechnologyText(0);
}

void MILAND(void)
{
  TechnologyText(1);
}

void MELT(void)
{
  TechnologyText(2);
}

void PHYTON(void)
{
  TechnologyText(3);
}



void TechnologyText(u32 nam){
    u32 top_ind, key, i, LineD, LinS;

    // Определяем количество строк на экране и количество строк скролинга
    if(LongMasLDM[nam] > 8)
    {
      LineD = 8;
      LinS = LongMasLDM[nam] - LineD;
    }
    else
    {
      LineD = LongMasLDM[nam];
      LinS = 0;
    }

    /* Очищаем экран и ждем key up */
    LCD_CLS();
    CurrentMethod = MET_AND;
    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* Цикл обработки нажатий кнопок */
    for (top_ind = 0, key = NOKEY; key != SEL; ){
        /* Выводим текст и ждем нажатия кнопки */
        for (i = 0; i < LongMasLDM[nam]; i++)
        {
          switch (nam)
          {
            case 0:
              LCD_PUTS(0, (CurrentFont->Height) * i, BookLDM[top_ind + i]);
            break;
            case 1:
              LCD_PUTS(0, (CurrentFont->Height) * i, BookMILAND[top_ind + i]);
            break;
            case 2:
              LCD_PUTS(0, (CurrentFont->Height) * i, BookMELT[top_ind + i]);
            break;
            case 3:
              LCD_PUTS(0, (CurrentFont->Height) * i, BookPHYTON[top_ind + i]);
            break;
          }
        }
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

