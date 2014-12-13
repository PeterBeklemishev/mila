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
 *  Файл Menu_gl.с: Функции-обработчики меню - графика
 *
 *============================================================================================*/
#include <Menu.h>
#include <Menu_items.h>
#include <gl.h>
#include <lcd.h>
#include <joystick.h>
#include <systick.h>
#include <text.h>

/* Служебные функции - рисование графических примитивов */

/* Отрисовка незалитого прямоугольного треугольника */
static void DisplayTriangle (u32 x, u32 y, u32 side) {
    LCD_Line(x, y, x + side, y);
    LCD_Line(x + side, y, x + side, y + side);
    LCD_Line(x, y, x + side, y + side);
}


/* Отрисовка залитого прямоугольного треугольника */
static void DisplayFillingTriangle (u32 x, u32 y, u32 side) {
    u32 i;
    for (i = 0; i < side + 1; i++)
        LCD_Line(x + i, y + i, x + side, y + i);
}


/* Отрисовка круга */
void DisplayFillingCircle (u32 x, u32 y, u32 radius) {
    u32 i;
    for (i = 0; i < radius + 1; i++)
        LCD_Circle(x, y, i);
}


/* Отрисовка незалитого прямоугольника */
void DisplayRectangle (u32 x, u32 y, u32 side_x, u32 side_y) {
    LCD_Line(x, y, x + side_x, y);
    LCD_Line(x, y, x, y + side_y);
    LCD_Line(x + side_x, y, x + side_x, y + side_y);
    LCD_Line(x, y + side_y, x + side_x, y + side_y);
}


/* Отрисовка блока (залитого прямоугольника) */
void DisplayFillingRectangle (u32 x, u32 y, u32 side_x, u32 side_y) {
    u32 i;
    for (i = 0; i < side_y; i++)
        LCD_Line(x, y + i, x + side_x, y + i);
}


/* Функции-обработчики меню */

void ElementsFunc(void) {
#define base_x 25
#define base_y 14
#define side   16

#define offs_x 8
#define offs_y 5

#define circle_radius side / 2
#define circle_x base_x + side + offs_x + circle_radius
#define circle_y base_y + circle_radius
#define circle_filling_y circle_y + circle_radius * 2 + offs_y

#define rectangle_x base_x + side * 2 + offs_x * 2
#define block_y  base_y + side + offs_y

    /* Выводим заголовок */
    LCD_CLS();
    CurrentMethod = MET_OR;
    DisplayMenuTitle("Примитивы");

    /* Строим примитивы и ждем key up */
    DisplayTriangle (base_x, base_y, side);
    DisplayFillingTriangle (base_x, base_y + side + offs_y, side);

    LCD_Circle(circle_x, circle_y, circle_radius);
    DisplayFillingCircle (circle_x, circle_filling_y, circle_radius);

    DisplayRectangle (rectangle_x, base_y, side * 2, side);
    DisplayFillingRectangle (rectangle_x, block_y, side * 2, side);

    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* Ждем нажатия SEL и возвращаемся в главное меню */
    BackToMenuOnSel();
}


void IndicatorsFunc(void) {
#define side_x 4

    s32 i, sign;

    /* Выводим заголовок и ждем key up */
    LCD_CLS();
    CurrentMethod = MET_OR;
    DisplayMenuTitle("Индикаторы");
    WAIT_UNTIL_KEY_RELEASED(SEL);

    /* Выводим progress bar */
    LCD_PUTS(24,18,"0");
    DisplayRectangle (32, 14, 64, 14);
    LCD_PUTS(97,18,"100");
    /* Выводим шкалу */
    LCD_Circle(63, 63, 30);
    LCD_Line(63, 34, 63, 41);
    LCD_Line(35, 53, 42, 56);
    LCD_Line(91, 53, 84, 56);
    LCD_Line(45, 39, 51, 45);
    LCD_Line(81, 39, 75, 45);

    /* Эмулируем прогресс - от 0 до 100% и обратно */
    /* Эмулируем дрожание стрелки шкалы            */
    CurrentMethod = MET_XOR;
    for (i = 0, sign = 1; !KEY_PRESSED(SEL); ) {
        s32 ni = i + side_x * sign;
        DisplayFillingRectangle (i + 34, 16, side_x - 1, 11);
        if (ni > 60 || ni < 0)
            sign = -sign;
        else
            i = ni;
        SysTickDelay(300);

        /* Рисуем стрелку */
        LCD_Line(86, 46, 63, 63);
        SysTickDelay(150);
        LCD_Line(86, 46, 63, 63);
        SysTickDelay(150);
        LCD_Line(84, 44, 63, 63);
        SysTickDelay(150);
        LCD_Line(84, 44, 63, 63);
        SysTickDelay(150);
    }

    /* Нажата SEL - возвращаемся в главное меню */
    DisplayMenu();
}

/*============================================================================================
 * Конец файла Menu_gl.с
 *============================================================================================*/

