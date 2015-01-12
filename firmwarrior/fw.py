#!/usr/bin/python
#
#	-p <port>
#	-e #erase before flashing
#	-f <file_to_flash>
#	-v #verify
#	-r #run after flashing
#	-V #verbose output
#
#



# script seq 
# getBootCod (code of bootloader) -> upload to chip -> e|f|r
import sys, getopt,os

from serial import Serial,SerialException
from time import sleep

port = ''
inputfile = ''
verbose = False
debug = False

serial = Serial()
help ="\nUsage: "+ os.path.basename(__file__) + " -p serialport [-V] [-e] [-f inputfile] [-v] [-r]\n\n\
\t-P preload bootloader\n\
\t-p set serial port name\n\
\t-V verbose\n\
\t-e erase\n\
\t-f flash \n\
\t-v verify\n\
\t-r run uploaded"

def sync():
	print ("Synchronization...")
	txdbuf = bytearray()
	txdbuf[len(txdbuf):] = b'\x00';


	timeout=serial.timeout
	serial.timeout = 0 
	rxdbuf = bytearray()
	
	trys = 0;
	while rxdbuf != b'>':
		serial.write(txdbuf)
		rxdbuf = serial.read(1)
		#print(rxdbuf)
		trys = trys+1
		if(trys>1000000):
			break;

	serial.timeout = timeout
	if(trys>1000000):
		print ("Synchronization error")
		return False

	print("Synchronized successfully")
	return True


def setBaudrate(baudrate):
	print ("Setting up baudrate...")
	txdbuf = bytearray([\
		ord('B'),\
		0x00,\
		0xC2,\
		0x01,\
		0x00])

	serial.write(txdbuf)

	print("Sending command") if verbose else None
	
	rxdbuf = serial.read(10)

	print("Got response: ",rxdbuf) if verbose else None

	print("Change port baudrate setup on",baudrate)
	serial.baudrate = baudrate

	print("Resyncronization baudrate...") if debug else None
	txdbuf = bytearray(b'\x0D')
	serial.write(txdbuf)
	sleep(0.1)
	rxdbuf = bytes(serial.read(3))	
	if	(rxdbuf != b'\x0D\x0A\x3E'):
		print ("exchange error")
		serial.close();
		return False;

	print ("Baudrate {} is set successfully".format(baudrate))
	return True


def bootExtLoader(dwadrboot,ilboot,bufram):

	print("Uploading bootloader...")
	txdbuf = bytearray([\
		ord('L'),\
		dwadrboot & 0xff,\
		(dwadrboot>>8) & 0xff,\
		0x00,\
		0x20,\
		ilboot & 0xff,\
		(ilboot>>8) & 0xff,\
		0x00,\
		0x00 ])
	
	serial.write(txdbuf)

	print("Start adress: {}, lenght: {}".format(dwadrboot,ilboot)) if verbose or debug else None

	rxdbuf = bytes(serial.read(1))
	if (rxdbuf != b'L'):
		print( "exchange error, got:", rxdbuf)
		serial.close()
		return
	
	print("Start uploading",bufram[dwadrboot:dwadrboot+ilboot]) if debug else None
	serial.write(bufram[dwadrboot:dwadrboot+ilboot])

	rxdbuf = bytes(serial.read(1))
	if (rxdbuf != b'K'):
		print( "exchange error, got:", rxdbuf)
		serial.close()
		return

	print("Uploading done") if verbose or debug else None

	print("Start code verifying") if verbose or debug else None
	
	for i in range(0,ilboot>>3):
		txdbuf = bytearray([\
			ord('Y'),\
			(dwadrboot+8*i) & 0xff,\
			((dwadrboot+8*i)>>8) & 0xff,\
			0x00,\
			0x20,\
			0x08,\
			0x00,\
			0x00,\
			0x00])
		
		serial.write(txdbuf)
		
		f = True;
		rxdbuf = serial.read(10)

		#print(chr(rxdbuf[0]), b'Y',b'K')
		
		#print(i,rxdbuf[0],rxdbuf[9], ord(b'Y'),ord(b'K'))
		#print("{} line: {}".format(i,rxdbuf)) if verbose else None
		if( (rxdbuf[0]==ord(b'Y')) and (rxdbuf[9]==ord(b'K')) ):
			#print("ok1----------------------------")
			for j in range(0,8):
				#print(j, rxdbuf[j+1],bufram[dwadrboot+8*i+j]) if debug else None
				if(rxdbuf[j+1] != bufram[dwadrboot+8*i+j]):
					f = False;
		else:
			f= False;

		if( not f):
			print("exchange error")
			serial.close()
			return False

		print("Bootloader uploaded successfully")
		return True
	

def runExtLoader(dwadrboot,ilboot,bufcod):
	
	print("Starting bootloader...")
	id_str = bytearray(b'1986BOOTUART')
	
	txdbuf = bytearray([\
		ord('R'),\
		dwadrboot & 0xff,\
		(dwadrboot>>8) & 0xff,\
		0x00,\
		0x20])

	serial.write(txdbuf)
	rxdbuf = serial.read(1)
	if (rxdbuf != b'R'):
		print("exchange error")
		serial.close()
		return
	
	txdbuf = bytearray()
	txdbuf[len(txdbuf):] = b'I';
	serial.write(txdbuf)
	
	f = True;
	rxdbuf = serial.read(12)
	print("bootloader id:",rxdbuf) if verbose else None
	
	if(rxdbuf != id_str):
	
		print("bootloader identification error")
		serial.close();
		return False
	
	print("Bootloader started successfully")
	return True
	
def erase():
	verbose = True

	print ("Erasing...")
	adr = b''
	data = b''	
	txdbuf = bytearray(b'E')
	
	serial.write(txdbuf)

	#print("preparing to sleep") if verbose else None
	#sleep(4);
	#print("waking up") if verbose else None

	rxdbuf = serial.read(9)
	#print("readed {} bytes".format(len(txdbuf))) if verbose else None
	#print(txdbuf) if verbose else None
	if rxdbuf[0]!=ord(b'E'):
		print("exchange error")
		serial.close();
		return 0;

	adr = rxdbuf[1] + ((rxdbuf[2])<<8) + ((rxdbuf[3])<<16) + ((rxdbuf[4])<<24);
	data = rxdbuf[5] + ((rxdbuf[6])<<8) + ((rxdbuf[7])<<16) + ((rxdbuf[8])<<24);
	
	if((adr == 0x08020000) and (data == 0xffffffff)):
		print("Erasing done")
		return 1;
	
	print("Full chip erase failed adr=0x{0:8d} data=0x{0:8d}".format(adr,data));
	serial.close();
	return 0;

def program(ilcod, bufcodhex):
	#print (bufcodhex[0:ilcod])
	print ("Program {} byte...".format(ilcod));
	txdbuf = bytearray([\
		ord('A'),\
		0x00,\
		0x00,\
		0x00,\
		0x08])
	
	serial.write(txdbuf)
	rxdbuf = serial.read(1)
	if(rxdbuf != b'\x08'):
		str = "exchange error";
		serial.close();
		return 0

	print("ready to upload")
	txdbuf = bytearray(b'P');
	#print("command", txdbuf)
	for i in range(0,ilcod>>8):
		
		serial.write(txdbuf)

		#print("info",i<<8,(i<<8)+256,"|",bufcodhex[i:256])	
		#print("sending",bufcodhex[(i<<8):((i<<8)+256)])
		serial.write(bufcodhex[(i<<8):((i<<8)+256)]);
		ks = 0;
		for j in range(0,256):
			ks = (ks + bufcodhex[j+(i<<8)])%256;
		
		rxdbuf = serial.read(1)
		
		if(rxdbuf[0] != ks):
			print("exchange error");
			serial.close();
			return 0
		#print("done:",i)	
	print("Program {} byte done!".format(ilcod));
	return 1;

def verify(ilcod, bufcodhex):
	print("Verify...")
	'''
	txdbuf[0] = 'A';
	txdbuf[1] = 0x00;
	txdbuf[2] = 0x00;
	txdbuf[3] = 0x00;
	txdbuf[4] = 0x08;
	com.WriteBlock(txdbuf,5);
	if((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!=0x08))
	{
		str = "exchange error";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return 0;
	}
	txdbuf[0] = 'V';
	for(i=0;i<(ilcod>>8);i++)
	{
		for(j=0;j<32;j++)
		{
			com.WriteBlock(txdbuf,1);
			if(!com.ReadBlock(rxdbuf,8))
			{
				str = "exchange error";
				m_list.InsertString(m_list.GetCount(),str);		
				com.Close();
				return 0;
			}
			for(k=0;k<8;k++)
			{
				if((BYTE)rxdbuf[k] != bufcod[k+(j<<3)+(i<<8)])
				{
					
					m_list.DeleteString(m_list.GetCount()-1);
					str.Format("Verify failed adr=0x%08x dataw=0x%02x datar=0x%02x",
						0x08000000+k+(j<<3)+(i<<8),bufcod[k+(j<<3)+(i<<8)],(BYTE)rxdbuf[k]);
					m_list.InsertString(m_list.GetCount(),str);
					com.Close();
					return 0;
				}
			}
		}
		m_progress.SetPos(i+1);
	}
	'''
	print("Verify done! Total: {}",format(ilcod));
	return 1;	
	
def run():
	print("Run at 0x08000000...")
	
	txdbuf = bytearray(b'R');
	serial.write(txdbuf)
	rxdbuf = serial.read(1)
	if	(rxdbuf != b'R'):
		print("exchange error:",rxdbuf)
		serial.close();
		return False
	else:
		print("Run at 0x08000000 OK!")
	
	return True;
	
	
def main(argv):
	acts = []
	try:
		opts, args = getopt.getopt(argv,"p:Vef:vrP")
	except getopt.GetoptError:
		print(help)
		sys.exit(2)

	if opts == []:
		print(help)
		sys.exit()

	for opt, arg in opts:
		if opt == "-p":
			global port 
			port = arg
		elif opt == "-V":
			global verbose 
			verbose = True

		elif opt == "-P":
			acts.append("preload")
		elif opt == "-e":
			acts.append("erase")

		elif opt == "-f":
			global inputfile 
			inputfile = arg
			acts.append("flash")
		
		elif opt == "-v":
			acts.append("verify")
		
		elif opt == "-r":
			acts.append("run")

	return acts


def getDataHex(line, dwadr_seg_hex, dwadr_lineoffs_hex):
	'''
	int i;
	BYTE ks;
	'''
	#print(line[0], line[1],line[2],line[3],0x3A)

	buf_hexstr = line
	
	if(buf_hexstr[0] != 0x3a):
		return	0;
	

	checksumm = '\x00';
	bl_hex = int(buf_hexstr[1:3], 16)


	wadr_offs_hex = (int(buf_hexstr[3:5], 16)<<8)+int(buf_hexstr[5:7], 16)

	#print ("===>",hex(int(buf_hexstr[3:5], 16)),hex(int(buf_hexstr[3:5], 16)<<8), hex(int(buf_hexstr[5:7], 16)),hex(wadr_offs_hex))
	
	btype_hex = int(buf_hexstr[7:9], 16);
	checksumm = ( bl_hex + btype_hex + (wadr_offs_hex>>8) + wadr_offs_hex )%256;
	
	#print(bl_hex,buf_hexstr, end=" ")

	buf_data_hex = bytearray()
	for i in range(0,bl_hex+1):
		buf_data_hex.append( int(buf_hexstr[(2*i+9):(2*i+11)], 16) )
		checksumm = (checksumm + buf_data_hex[i])%256;

	if(checksumm!=0):
		return 0;
	elif(btype_hex == 2):
		dwadr_seg_hex =	int(buf_hexstr[9:11],16) << 8 + int(buf_hexstr[11:13],16) << 4
	elif(btype_hex == 4):
		dwadr_lineoffs_hex = int(buf_hexstr[9:13],16) << 16
	return bl_hex,btype_hex,wadr_offs_hex,dwadr_seg_hex,dwadr_lineoffs_hex,buf_data_hex;


def getBootCode(type = 'b', filename = "1986_BOOT_UART.HEX"):
	'''
	dwadr_seg_hex = 0;
	dwadr_lineoffs_hex = 0;
	'''

	'''
	BYTE bufcod[0x20000];
	BYTE bufram[0x8000];
	'''

	if type=='b':
		#hex is a bootloader
		buffersize = 0x8000
		lowcheck = 0x20000000
		highcheck = 0x20008000
	elif type=='h':
		#hex is a firmware
		buffersize = 0x20000
		lowcheck = 0x08000000 #set up lowwer limit
		highcheck = 0x08020000	#set up upper limit
	else:
		return 0

	bufcod = bytearray(0xff for x in range(0, buffersize))
	buf_hexstr = bytearray()

	strfn = filename;
	
	nb = 1;
	i=0;
	while(nb == 1): #????????????????????????
		with open(strfn,'rb') as file:
			dwadr_seg_hex = 0
			dwadr_lineoffs_hex = 0
			for line in file:
				# for each line in hex file
				buf_hexstr = line
				i =  i + len(buf_hexstr)
				#parse line into number of bytes, adresses, offsets etc

				bl_hex,btype_hex,wadr_offs_hex,dwadr_seg_hex,dwadr_lineoffs_hex,buf_data_hex = getDataHex(buf_hexstr,dwadr_seg_hex ,dwadr_lineoffs_hex)
				
				#if it's data line move data to output buffer
				if(btype_hex == 0):
					dwadr = dwadr_lineoffs_hex + dwadr_seg_hex + wadr_offs_hex;
					
					#range check for bootloader
					if((dwadr<lowcheck) or ((dwadr+bl_hex)>highcheck)):
						print("we've get some address error in hex???")
						file.close();
						return 0

					dwadr =dwadr-lowcheck; #substract start point

					for i in range(0,bl_hex):
						bufcod[dwadr+i] = buf_data_hex[i];

			#end of file
			#let's find lenght of code for bootloader
			if type == 'b':
				dwadrboot=0;
				for i in range(0,buffersize):
					if(bufcod[i] != 0xff):
						dwadrboot = i
						break
				ilboot=0
				#find tail
				for i in reversed(range(0,buffersize-1)):
					if(bufcod[i] != 0xff):
						ilboot = (i+16 - dwadrboot) & 0xfffffff7
						break;
				return dwadrboot,ilboot,bufcod;

			else:
				for i in reversed(range(0,buffersize-1)):
					if(bufcod[i] != 0xff):
						if(i & 0xff):
							i = ((i + 0x100) & 0xffffff00);
						ilcod = i;
						break;
				return ilcod,bufcod;				

def prepareBootCode():
	filename = "1986_BOOT_UART.HEX"
	result=getBootCode('b', filename)
	dwadrboot,ilboot,bufcod=result
	#print(dwadrboot,ilboot)
	#print( ''.join('{:02x} '.format(bufcod[x]) for x in range(dwadrboot,dwadrboot+ilboot)))
	print("Preparing bootstrap done") 

	return result

def prepareHexCode():
	filename = inputfile
	result=getBootCode('h', filename)
	ilcod,bufcod=result
	#print( ilcod,''.join('{:02x} '.format(bufcod[x]) for x in range(0,ilcod)))
	print("Preparing hex file done") 

	return result

def test():
	dwadrboot,ilboot,bufcod=prepareBootCode()
	txdbuf =bytearray([ ord('A'),\
		0x00,\
		dwadrboot & 0xff,\
		(dwadrboot>>8) & 0xff,\
		ord(b'\x00'),\
		ord(b'\x20'),\
		ilboot & 0xff,\
		(ilboot>>8) & 0xff ])

	txdbuf = bytearray([\
		ord('B'),\
		0x00,\
		0xC2,\
		0x01,\
		0x00])
	print(txdbuf)
	
	print( ''.join('{:02x} '.format(txdbuf[x]) for x in range(0,5)))

	sys.exit()

if __name__ == "__main__":
	
	#test()

	acts = main(sys.argv[1:])
	
	if port:
		try:
			serial = Serial(port=port,timeout=1)
		except SerialException:
			print(" Unable to open", port, " Check if already opened or available")
			sys.exit()
		
		print("Opened at",serial.getBaudrate()) if verbose else None
	else:
		print("com port should be defined")
		sys.exit()
	#do the thing!s


	#work with factory bootloader (flash)

	dwadrboot,ilboot,bufcod=prepareBootCode()
	ilcod,bufcodhex = prepareHexCode()
	
	#sys.exit()
	

	#sys.exit()
	#work with extended bootloader (ram)
	
	if "preload" in acts:
		if(not sync() or \
		not setBaudrate(115200) or \
		not bootExtLoader(dwadrboot,ilboot,bufcod) or \
		not runExtLoader(dwadrboot,ilboot,bufcod)):
			sys.exit()
	else:
		if(not sync() or \
		not setBaudrate(115200) or \
		not runExtLoader(dwadrboot,ilboot,bufcod)):
			sys.exit()

	if "erase" in acts:
		erase()
	if "flash" in acts:
		program(ilcod,bufcodhex)
	if "verify" in acts:
		verify(ilcod, bufcodhex)
	if "run" in acts:
		run()

	serial.close()
