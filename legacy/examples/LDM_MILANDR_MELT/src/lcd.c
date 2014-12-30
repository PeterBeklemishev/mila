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
 *  Файл lcd.c: Утилиты нижнего уровня для работы с LCD-экраном МЭЛТ MT-12864J
 *
 *============================================================================================*/

#include <lcd.h>

/* Контекст подсистемы отрисовки */
LCD_Crystal CurrentCrystal = LCD_CRYSTAL1;  /* Текущий выбранный кристал */
LCD_Method CurrentMethod;                   /* Текущий метод отрисовки */

/* Порты LCD-кристаллов */
const LCD_Ports CrystalPorts[NUM_LCD_CRYSTALS] = {
                        /* Кристалл #1 */
                        { 0x18100000,   /* LCD_DATA1 */
                          0x10100000 }, /* LCD_CMD1  */
                        /* Кристалл #2 */
                        { 0x18200000,   /* LCD_DATA2 */
                          0x10200000 }  /* LCD_CMD2  */
    };


/* Служебные прототипы и макросы */

static u32 GetStatus(void);
static void WaitStatus(LCD_Status status);
static void Pause(void);

#define WAIT_BUSY   WaitStatus(BUSY)
#define WAIT_RESET  WaitStatus(RESET)
#define WAIT_ON     WaitStatus(ONOFF)
#define READ_RW()    PORTB->RXTX |= (1<<10)
#define WRITE_RW()  PORTB->RXTX &= ~(1<<10)
#define SET_A0()    PORTC->RXTX |= (1<<0)
#define CLEAR_A0()  PORTC->RXTX &= ~(1<<0)
#define SET_E()     PORTC->RXTX |= (1<<1)
#define CLEAR_E()   PORTC->RXTX &= ~(1<<1)
#define DATA_LINE_READ()    PORTA->OE &= ~0x003F; PORTF->OE &= ~0x000C
#define DATA_LINE_WRITE()   PORTA->OE |= 0x003F; PORTF->OE |= 0x000C


void WRITE_DATA(u32 data)
{
  PORTA->RXTX |= (data & 0x003F);
  PORTA->RXTX &= ~(~data & 0x003F);
  PORTF->RXTX |= ((data>>4) & 0x000C);
  PORTF->RXTX &= ~(~(data>>4) & 0x000C);
}

u32 READ_DATA()
{
  u32 ret;

  ret = (PORTA->RXTX & 0x003F) + ((PORTF->RXTX & 0x000C) << 4);

  return ret;
}



/* Утилиты работы с LCD */

void ResetLCD(void) {
    u32 i;

    /*PORTC->RXTX = 0x00000200;
    PORTC->OE = 0x00000200;
    for (i = 0; i < 255; i++)
      PORTC->RXTX = 0x00000000;
    PORTC->RXTX = 0x00000200;*/

    PORTB->RXTX |= 0x00000200;
    PORTB->OE |= 0x00000200;
    for (i = 0; i < 500; i++)
      PORTB->RXTX &= ~0x00000200;
    PORTB->RXTX |= 0x00000200;
}


void InitPortLCD(void) {
    PORTA->FUNC &= ~(0x00000FFF);   /* Main Function для DATA[5:0] */
    PORTA->ANALOG |= 0x003F;     /* Digital */
    PORTA->PWR |= 0x00000AAA;    /* Fast */
    PORTA->PULL |= 0x0000003F;    /* DOWN */

    PORTB->FUNC &= ~(0x003FC000);   /* Main Function для E1=B7 & E2=B8 & Reset=B9 & RW=B10 */
    PORTB->ANALOG |= 0x0780;     /* Digital */
    PORTB->PWR |= 0x002A8000;    /* Fast */
    PORTB->OE |= 0x0780;

    PORTC->FUNC &= ~(0x0000000F);   /* Main Function для E=1 & A0=0*/
    PORTC->ANALOG |= 0x0003;     /* Digital */
    PORTC->PWR |= 0x0000000A;    /* Fast */
    PORTC->OE |= 0x0003;

    PORTF->FUNC &= ~(0x000000F0);   /* Main Function для DATA[7:6] */
    PORTF->ANALOG |= 0x000C;     /* Digital */
    PORTF->PWR |= 0x000000A0;    /* Fast */
    PORTF->PULL |= 0x0000000C;    /* DOWN */

    READ_RW();
    CLEAR_A0();
    SET_E();

    DATA_LINE_READ();
}


void InitExtBus(void) {
    EXT_BUS_CNTRL->EXT_BUS_CONTROL = 0x0000A001;
}


void SetCrystal(LCD_Crystal num) {
   PORTB->RXTX |= ((num + 1) << 7);
   PORTB->RXTX &= ~(~((num + 1) << 7)&(0b110000000));

   PORTB->OE |= 0b110000000;
   Pause();
   CurrentCrystal = num;
}

void WriteLCD_Cmd(unsigned char val) {
    SET_E();
    Pause();

    DATA_LINE_WRITE();
    WRITE_RW();
    CLEAR_A0();

    WRITE_DATA(val);

    Pause();
    CLEAR_E();

    //LCD_CMD(CurrentCrystal) = val;
    Pause();
}


void WriteLCD_Data(unsigned char val) {
    SET_E();
    Pause();

    DATA_LINE_WRITE();
    WRITE_RW();
    SET_A0();

    WRITE_DATA(val);

    Pause();
    CLEAR_E();

    //LCD_DATA(CurrentCrystal) = val;
    Pause();
}


unsigned char ReadLCD_Cmd(void) {
    u32 ret;
    SET_E();
    Pause();

    DATA_LINE_READ();
    READ_RW();
    CLEAR_A0();

    Pause();
    CLEAR_E();

    ret = READ_DATA();

    //u32 ret = LCD_CMD(CurrentCrystal);
    Pause();
    return ret;
}


unsigned char ReadLCD_Data() {
    unsigned char ret;
    SET_E();
    Pause();


    DATA_LINE_READ();
    READ_RW();
    SET_A0();

    Pause();
    CLEAR_E();

    READ_DATA();  /* Первое чтение - необходимо для получения корректных данных */

    Pause();
    CLEAR_E();
    Pause();
    SET_E();

    ret = READ_DATA();

    Pause();
    return ret;
}


void LCD_INIT(void) {
    u32 crystal;

    InitPortLCD();      /* Инициализация портов внешней шины и выводов для работы с экраном */
    ResetLCD();         /* Программный сброс экрана */

    /* Инициализация всех кристаллов */
    for (crystal = LCD_CRYSTAL1; crystal < NUM_LCD_CRYSTALS; crystal++) {
      SetCrystal((LCD_Crystal)crystal);
      WAIT_BUSY;
      LCD_ON;
      WAIT_ON;
      LCD_START_LINE(0);
    }
}


void LCD_CLS(void) {
    u32 i, j, crystal;

    /* Очистка данных для всех кристаллов */
    for (crystal = LCD_CRYSTAL1; crystal < NUM_LCD_CRYSTALS; crystal++) {
      SetCrystal((LCD_Crystal)crystal);
      WAIT_BUSY;
      LCD_OFF;
      LCD_SET_ADDRESS(0);
      for (i = 0; i < 8; i++) {
        LCD_SET_PAGE(i);
        for (j = 0; j < 64; j++)
            WriteLCD_Data(0x00);
      }
      LCD_ON;
    }
}


/* Служебные функции */

static u32 GetStatus(void) {
    u32 ret;

    Pause();
    ret = ReadLCD_Cmd();
    Pause();
    return ret;
}


static void WaitStatus(LCD_Status status) {
        u32 stat;
    for (stat = GetStatus(); stat == (1 << status); stat = GetStatus());
}


/* Задержка ~ на 15*3 тактов */
static void Pause(void) {
    u32 i;
    for (i = 15; i > 0; i--) __NOP();
}

/*============================================================================================
 * Конец файла lcd.c
 *============================================================================================*/

