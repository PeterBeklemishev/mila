#ifndef gpio_h
#define gpio_h

#define	A0	0x0100
#define	A1	0x0101
#define	A2	0x0102
#define	A3	0x0103
#define	A4	0x0104
#define	A5	0x0105
#define	A6	0x0106
#define	A7	0x0107

#define	B0	0x0200
#define	B1	0x0201
#define	B2	0x0202
#define	B3	0x0203
#define	B4	0x0204
#define	B5	0x0205
#define	B6	0x0206
#define	B7	0x0207
#define	B8	0x0208
#define	B9	0x0209
#define	B10	0x020A

#define	C0	0x0300
#define	C1	0x0301
#define	C2	0x0302

#define	D0	0x0400
#define	D1	0x0401
#define	D2	0x0402
#define	D3	0x0403
#define	D4	0x0404
#define	D5	0x0405
#define	D6	0x0406
#define	D7	0x0407

#define	E0	0x0500
#define	E1	0x0501
#define	E2	0x0502
#define	E3	0x0503
#define	E6	0x0506
#define	E7	0x0507

#define	F0	0x0600
#define	F1	0x0601
#define	F2	0x0602
#define	F3	0x0603
#define	F4	0x0604
#define	F5	0x0605
#define	F6	0x0606
#define	F7	0x0607

void pinInit(int, int);
void pinWrite(int, int);

#endif