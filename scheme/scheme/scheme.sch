EESchema Schematic File Version 4
LIBS:scheme-cache
EELAYER 26 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "Temperature-Gate"
Date "2020-04-19"
Rev "1"
Comp ""
Comment1 ""
Comment2 "Sergej Koreshkov"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+3.3V #PWR?
U 1 1 5E9C9952
P 8075 1050
F 0 "#PWR?" H 8075 900 50  0001 C CNN
F 1 "+3.3V" H 8025 1225 50  0000 C CNN
F 2 "" H 8075 1050 50  0001 C CNN
F 3 "" H 8075 1050 50  0001 C CNN
	1    8075 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E9C998A
P 8175 1050
F 0 "#PWR?" H 8175 900 50  0001 C CNN
F 1 "+5V" H 8225 1225 50  0000 C CNN
F 2 "" H 8175 1050 50  0001 C CNN
F 3 "" H 8175 1050 50  0001 C CNN
	1    8175 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9C99F5
P 8075 3050
F 0 "#PWR?" H 8075 2800 50  0001 C CNN
F 1 "GND" H 8100 2875 50  0000 C CNN
F 2 "" H 8075 3050 50  0001 C CNN
F 3 "" H 8075 3050 50  0001 C CNN
	1    8075 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9C9AA2
P 7975 3050
F 0 "#PWR?" H 7975 2800 50  0001 C CNN
F 1 "GND" H 7950 2875 50  0000 C CNN
F 2 "" H 7975 3050 50  0001 C CNN
F 3 "" H 7975 3050 50  0001 C CNN
	1    7975 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 MLX90614
U 1 1 5E9C9C47
P 5050 3250
F 0 "MLX90614" H 5130 3242 50  0000 L CNN
F 1 "Conn_01x04" H 5130 3151 50  0000 L CNN
F 2 "" H 5050 3250 50  0001 C CNN
F 3 "~" H 5050 3250 50  0001 C CNN
	1    5050 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E9C9CCD
P 4850 3150
F 0 "#PWR?" H 4850 3000 50  0001 C CNN
F 1 "+5V" V 4865 3278 50  0000 L CNN
F 2 "" H 4850 3150 50  0001 C CNN
F 3 "" H 4850 3150 50  0001 C CNN
	1    4850 3150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9C9D1D
P 4850 3250
F 0 "#PWR?" H 4850 3000 50  0001 C CNN
F 1 "GND" V 4855 3122 50  0000 R CNN
F 2 "" H 4850 3250 50  0001 C CNN
F 3 "" H 4850 3250 50  0001 C CNN
	1    4850 3250
	0    1    1    0   
$EndComp
$Comp
L Relay:DIPxx-1Cxx-51x K?
U 1 1 5E9CA638
P 3800 1875
F 0 "K?" V 4367 1875 50  0000 C CNN
F 1 "DIPxx-1Cxx-51x" V 4276 1875 50  0000 C CNN
F 2 "Relay_THT:Relay_StandexMeder_DIP_LowProfile" H 4250 1825 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 3800 1875 50  0001 C CNN
	1    3800 1875
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9CA9FD
P 4000 1575
F 0 "#PWR?" H 4000 1325 50  0001 C CNN
F 1 "GND" V 4005 1447 50  0000 R CNN
F 2 "" H 4000 1575 50  0001 C CNN
F 3 "" H 4000 1575 50  0001 C CNN
	1    4000 1575
	-1   0    0    1   
$EndComp
$Comp
L Device:L COIL_MAIN_READER
U 1 1 5E9CACEE
P 2175 1175
F 0 "COIL_MAIN_READER" H 2228 1221 50  0000 L CNN
F 1 "L" H 2228 1130 50  0000 L CNN
F 2 "" H 2175 1175 50  0001 C CNN
F 3 "~" H 2175 1175 50  0001 C CNN
	1    2175 1175
	1    0    0    -1  
$EndComp
$Comp
L Device:L COIL_GATE_READER
U 1 1 5E9CADAD
P 1075 1200
F 0 "COIL_GATE_READER" H 1150 1275 50  0000 L CNN
F 1 "L" H 1128 1155 50  0000 L CNN
F 2 "" H 1075 1200 50  0001 C CNN
F 3 "~" H 1075 1200 50  0001 C CNN
	1    1075 1200
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:MAX485E U?
U 1 1 5E9CB71B
P 1825 3725
F 0 "U?" V 1779 4266 50  0000 L CNN
F 1 "MAX485E" V 1870 4266 50  0000 L CNN
F 2 "" H 1825 3025 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX1487E-MAX491E.pdf" H 1825 3775 50  0001 C CNN
	1    1825 3725
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E9CDE1E
P 2325 3725
F 0 "#PWR?" H 2325 3575 50  0001 C CNN
F 1 "+5V" H 2340 3898 50  0000 C CNN
F 2 "" H 2325 3725 50  0001 C CNN
F 3 "" H 2325 3725 50  0001 C CNN
	1    2325 3725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9CDE67
P 1225 3725
F 0 "#PWR?" H 1225 3475 50  0001 C CNN
F 1 "GND" H 1230 3552 50  0000 C CNN
F 2 "" H 1225 3725 50  0001 C CNN
F 3 "" H 1225 3725 50  0001 C CNN
	1    1225 3725
	1    0    0    -1  
$EndComp
Wire Bus Line
	20725 2550 16800 2550
Wire Bus Line
	15600 1400 15600 2550
Connection ~ 15600 2550
Wire Bus Line
	15600 2550 14275 2550
Text Label 14925 2300 0    50   ~ 0
A
Text Label 14925 2550 0    50   ~ 0
B
$Comp
L Device:R R?
U 1 1 5E9D109C
P 20775 2425
F 0 "R?" H 20845 2471 50  0000 L CNN
F 1 "R" H 20845 2380 50  0000 L CNN
F 2 "" V 20705 2425 50  0001 C CNN
F 3 "~" H 20775 2425 50  0001 C CNN
	1    20775 2425
	1    0    0    -1  
$EndComp
Wire Wire Line
	20775 2275 20725 2275
Wire Wire Line
	20725 2275 20725 2300
Wire Wire Line
	20775 2575 20725 2575
Wire Wire Line
	20725 2575 20725 2550
$Comp
L Device:R R?
U 1 1 5E9D2143
P 10900 2425
F 0 "R?" H 10970 2471 50  0000 L CNN
F 1 "R" H 10970 2380 50  0000 L CNN
F 2 "" V 10830 2425 50  0001 C CNN
F 3 "~" H 10900 2425 50  0001 C CNN
	1    10900 2425
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 2275 10975 2275
Wire Wire Line
	10975 2275 10975 2300
Wire Wire Line
	10900 2575 10975 2575
Wire Wire Line
	10975 2575 10975 2550
Text Notes 4875 2975 0    50   ~ 0
MLX90614
Text Notes 3325 3050 0    50   ~ 0
RDM3600
Text Notes 7650 1000 0    50   ~ 0
Arduino
Text Notes 2025 3325 0    50   ~ 0
TTL UART - RS-485
$Comp
L Connector_Generic:Conn_01x04 RDM3600
U 1 1 5EA0DC26
P 3425 3525
F 0 "RDM3600" H 3345 3100 50  0000 C CNN
F 1 "Conn_01x04" H 3345 3191 50  0000 C CNN
F 2 "" H 3425 3525 50  0001 C CNN
F 3 "~" H 3425 3525 50  0001 C CNN
	1    3425 3525
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EA0DCB2
P 3625 3325
F 0 "#PWR?" H 3625 3175 50  0001 C CNN
F 1 "+5V" V 3640 3453 50  0000 L CNN
F 2 "" H 3625 3325 50  0001 C CNN
F 3 "" H 3625 3325 50  0001 C CNN
	1    3625 3325
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA0DD0D
P 3625 3425
F 0 "#PWR?" H 3625 3175 50  0001 C CNN
F 1 "GND" V 3630 3297 50  0000 R CNN
F 2 "" H 3625 3425 50  0001 C CNN
F 3 "" H 3625 3425 50  0001 C CNN
	1    3625 3425
	0    -1   -1   0   
$EndComp
Text Notes 4550 2900 0    50   ~ 10
MLX90614 ГОТОВО
Wire Notes Line
	16650 3050 16650 4950
Wire Notes Line
	16650 4950 17500 4950
Wire Notes Line
	17500 4950 17500 3050
Wire Notes Line
	17500 3050 16650 3050
Text Notes 16925 3175 0    50   ~ 0
Сервер
Wire Bus Line
	16800 3050 16800 2550
Connection ~ 16800 2550
Wire Bus Line
	16800 2550 15600 2550
Wire Bus Line
	16900 3050 16900 2300
Connection ~ 16900 2300
Wire Bus Line
	16900 2300 20725 2300
Text Label 16900 2925 0    50   ~ 0
A
Text Label 16800 2925 0    50   ~ 0
B
Wire Notes Line
	800  2950 3050 2950
Wire Notes Line
	3050 2950 3050 4375
Wire Notes Line
	3050 4375 800  4375
Wire Notes Line
	800  4375 800  2950
Wire Notes Line
	3200 2925 3200 3750
Text Notes 800  2950 0    50   ~ 10
RS-485 ГОТОВО
Text Notes 3200 2925 0    50   ~ 10
RDM6300 ГОТОВО
Text Notes 825  725  0    50   ~ 10
АНТЕННА RDM6300 ГОТОВО
Wire Notes Line
	21000 2175 21000 2675
Wire Notes Line
	21000 2675 19900 2675
Wire Notes Line
	19900 2675 19900 2175
Wire Notes Line
	19900 2175 21000 2175
Text Notes 19925 2125 0    50   ~ 0
В зависимости от провода
$Comp
L Device:LED LED_GREEN
U 1 1 5EB176EF
P 1775 4975
F 0 "LED_GREEN" H 1775 4775 50  0000 C CNN
F 1 "LED" H 1775 4850 50  0000 C CNN
F 2 "" H 1775 4975 50  0001 C CNN
F 3 "~" H 1775 4975 50  0001 C CNN
	1    1775 4975
	-1   0    0    1   
$EndComp
$Comp
L Device:LED LED_RED
U 1 1 5EB17903
P 1775 5350
F 0 "LED_RED" H 1775 5150 50  0000 C CNN
F 1 "LED" H 1775 5225 50  0000 C CNN
F 2 "" H 1775 5350 50  0001 C CNN
F 3 "~" H 1775 5350 50  0001 C CNN
	1    1775 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB17A06
P 1475 4975
F 0 "R?" V 1268 4975 50  0000 C CNN
F 1 "R" V 1359 4975 50  0000 C CNN
F 2 "" V 1405 4975 50  0001 C CNN
F 3 "~" H 1475 4975 50  0001 C CNN
	1    1475 4975
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB17AB2
P 1475 5350
F 0 "R?" V 1268 5350 50  0000 C CNN
F 1 "R" V 1359 5350 50  0000 C CNN
F 2 "" V 1405 5350 50  0001 C CNN
F 3 "~" H 1475 5350 50  0001 C CNN
	1    1475 5350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB1A6F5
P 1925 4975
F 0 "#PWR?" H 1925 4725 50  0001 C CNN
F 1 "GND" V 1930 4847 50  0000 R CNN
F 2 "" H 1925 4975 50  0001 C CNN
F 3 "" H 1925 4975 50  0001 C CNN
	1    1925 4975
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB1A77C
P 1925 5350
F 0 "#PWR?" H 1925 5100 50  0001 C CNN
F 1 "GND" V 1930 5222 50  0000 R CNN
F 2 "" H 1925 5350 50  0001 C CNN
F 3 "" H 1925 5350 50  0001 C CNN
	1    1925 5350
	0    -1   -1   0   
$EndComp
Wire Notes Line
	850  4600 2350 4600
Text Notes 850  4600 0    50   ~ 10
ИНДИКАЦИЯ ГОТОВО
Text Notes 900  4700 0    50   ~ 0
Резисторы можно не ставить
$Comp
L Device:LED LED_BLUE
U 1 1 5EB4202A
P 1775 5725
F 0 "LED_BLUE" H 1775 5525 50  0000 C CNN
F 1 "LED" H 1775 5600 50  0000 C CNN
F 2 "" H 1775 5725 50  0001 C CNN
F 3 "~" H 1775 5725 50  0001 C CNN
	1    1775 5725
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB42031
P 1475 5725
F 0 "R?" V 1268 5725 50  0000 C CNN
F 1 "R" V 1359 5725 50  0000 C CNN
F 2 "" V 1405 5725 50  0001 C CNN
F 3 "~" H 1475 5725 50  0001 C CNN
	1    1475 5725
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB42038
P 1925 5725
F 0 "#PWR?" H 1925 5475 50  0001 C CNN
F 1 "GND" V 1930 5597 50  0000 R CNN
F 2 "" H 1925 5725 50  0001 C CNN
F 3 "" H 1925 5725 50  0001 C CNN
	1    1925 5725
	0    -1   -1   0   
$EndComp
Wire Notes Line
	2350 4600 2350 5825
Wire Notes Line
	850  4600 850  5825
Wire Notes Line
	850  5825 2350 5825
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5EB498AF
P 2625 2625
F 0 "J?" V 2472 2673 50  0000 L CNN
F 1 "Conn_01x02_Female" V 2563 2673 50  0000 L CNN
F 2 "" H 2625 2625 50  0001 C CNN
F 3 "~" H 2625 2625 50  0001 C CNN
	1    2625 2625
	0    1    1    0   
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5E9C8A35
P 7975 2050
F 0 "A?" H 7850 2100 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 7975 750 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 8125 1100 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 7975 1050 50  0001 C CNN
	1    7975 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2525 2425 2175 2425
Wire Wire Line
	2175 950  2175 1025
Wire Wire Line
	2175 1325 2175 2425
Wire Wire Line
	4725 2175 4000 2175
Wire Wire Line
	2625 2425 2625 2375
Wire Wire Line
	2625 2375 3500 2375
Wire Wire Line
	3500 2375 3500 2175
Wire Wire Line
	2175 950  3600 950 
Wire Wire Line
	3600 950  3600 1575
Wire Wire Line
	1075 950  2075 950 
Wire Wire Line
	2075 950  2075 2425
Wire Wire Line
	2075 2425 2175 2425
Wire Wire Line
	1075 950  1075 1050
Connection ~ 2175 2425
Wire Wire Line
	1075 1350 1075 2725
Wire Wire Line
	1075 2725 3700 2725
Wire Wire Line
	3700 2725 3700 2175
Wire Notes Line
	1925 750  1925 1375
Wire Notes Line
	1925 1375 850  1375
Wire Notes Line
	850  1375 850  750 
Wire Notes Line
	850  750  1925 750 
Wire Notes Line
	2100 875  3075 875 
Wire Notes Line
	3075 875  3075 1375
Wire Notes Line
	3075 1375 2100 1375
Wire Notes Line
	2100 1375 2100 875 
Wire Notes Line
	3450 2250 3450 2625
Wire Notes Line
	3450 2625 2300 2625
Wire Notes Line
	2300 2625 2300 2250
Wire Notes Line
	2300 2250 3450 2250
Wire Notes Line
	4275 1150 4275 2225
Wire Notes Line
	4275 2225 3150 2225
Wire Notes Line
	3150 2225 3150 1150
Wire Notes Line
	3150 1150 4275 1150
Text Notes 975  850  0    50   ~ 0
На турникет
Text Notes 2200 1350 0    50   ~ 0
Место чтения карты
Text Notes 4325 1475 0    50   ~ 0
Тут вниматленьно с подключением.\n7 - это центральный на модуле реле\n1 - нормально замкнутый \n14 - нормально разомкнутый
Text Notes 2300 2350 0    50   ~ 0
Коннекторы антенны на РДМ
Text GLabel 4725 2175 2    50   Input ~ 0
RELAY_1
Text GLabel 7475 1850 0    50   Input ~ 0
RELAY_1
Text GLabel 4850 3350 0    50   Input ~ 0
SDA
Text GLabel 4850 3450 0    50   Input ~ 0
SCL
Text GLabel 8475 2550 2    50   Input ~ 0
SCL
Text GLabel 8475 2450 2    50   Input ~ 0
SDA
Text GLabel 7475 2150 0    50   Input ~ 0
LED_GREEN
Text GLabel 7475 2050 0    50   Input ~ 0
LED_RED
Text GLabel 7475 2250 0    50   Input ~ 0
LED_BLUE
Text GLabel 1325 5725 0    50   Input ~ 0
LED_BLUE
Text GLabel 1325 5350 0    50   Input ~ 0
LED_RED
Text GLabel 1325 4975 0    50   Input ~ 0
LED_BLUE
Text GLabel 3625 3525 2    50   Input ~ 0
RDM_TX
Text GLabel 7475 1650 0    50   Input ~ 0
RDM_TX
Text GLabel 1625 3325 1    50   Input ~ 0
RS_DI
Text GLabel 7475 1450 0    50   Input ~ 0
RS_DI
Text GLabel 7475 1550 0    50   Input ~ 0
RS_RO
Text GLabel 1925 3325 1    50   Input ~ 0
RS_RO
Text GLabel 7475 1950 0    50   Input ~ 0
RS_RSE
Text GLabel 1725 3325 1    50   Input ~ 0
RS_RSE
Text GLabel 1825 3325 1    50   Input ~ 0
RS_RSE
Text GLabel 7475 1750 0    50   Input ~ 0
RDM_RX(NotUsed)
Text GLabel 3625 3625 2    50   Input ~ 0
RDM_RX(NotUsed)
Text GLabel 1625 4125 3    50   Input ~ 0
A
Text GLabel 1925 4125 3    50   Input ~ 0
B
Wire Notes Line
	825  725  5850 725 
Wire Notes Line
	5850 725  5850 2775
Wire Notes Line
	5850 2775 825  2775
Wire Notes Line
	825  2775 825  725 
Wire Notes Line
	4375 3750 4375 2925
Wire Notes Line
	3200 3750 4375 3750
Wire Notes Line
	3200 2925 4375 2925
Wire Notes Line
	4550 3575 4550 2900
Wire Notes Line
	4550 2900 5600 2900
Wire Notes Line
	5600 2900 5600 3575
Wire Notes Line
	5600 3575 4550 3575
Wire Notes Line
	7500 1600 7500 1800
Text Notes 6375 1800 0    50   Italic 10
RDM6300
Text GLabel 7475 2450 0    50   Input ~ 0
MFRC_SDA
Text GLabel 7475 2750 0    50   Input ~ 0
MFRC_SCK
Text GLabel 7475 2550 0    50   Input ~ 0
MFRC_MOSI
Text GLabel 7475 2650 0    50   Input ~ 0
MFRC_MISO
Text GLabel 7475 2350 0    50   Input ~ 0
MFRC_RST
Wire Notes Line
	7500 2800 7500 2300
Text Notes 6650 2800 0    50   Italic 10
MFRC522
Wire Notes Line
	6650 2300 6650 2800
Wire Notes Line
	6650 2300 7500 2300
Wire Notes Line
	6650 2800 7500 2800
Wire Notes Line
	6375 1800 6375 1600
Wire Notes Line
	6375 1600 7500 1600
Wire Notes Line
	6375 1800 7500 1800
Text GLabel 8475 2050 2    50   Input ~ 0
MFRC_RELAY
Text Notes 9000 2100 0    50   Italic 10
MFRC522
Wire Notes Line
	8450 2000 8450 2100
Wire Bus Line
	15300 2300 16900 2300
Wire Bus Line
	10975 2300 11450 2300
Connection ~ 15300 2300
Wire Bus Line
	15300 1400 15300 2300
Wire Notes Line
	14975 1650 15925 1650
Wire Notes Line
	15925 1325 14975 1325
Text Notes 14975 1325 0    50   Italic 10
Готовое устройство
Wire Notes Line
	15925 1650 15925 1325
Wire Notes Line
	14975 1325 14975 1650
Wire Bus Line
	14275 1400 14275 2550
Wire Bus Line
	13975 1400 13975 2300
Wire Notes Line
	13650 1650 14600 1650
Wire Notes Line
	14600 1325 13650 1325
Text Notes 13650 1325 0    50   Italic 10
Готовое устройство
Wire Notes Line
	14600 1650 14600 1325
Wire Notes Line
	13650 1325 13650 1650
Wire Bus Line
	12950 1400 12950 2550
Wire Bus Line
	12650 1400 12650 2300
Wire Notes Line
	12325 1650 13275 1650
Wire Notes Line
	13275 1325 12325 1325
Text Notes 12325 1325 0    50   Italic 10
Готовое устройство
Wire Notes Line
	13275 1650 13275 1325
Wire Notes Line
	12325 1325 12325 1650
Wire Bus Line
	11750 1400 11750 2550
Wire Bus Line
	11450 1400 11450 2300
Wire Notes Line
	11125 1650 12075 1650
Wire Notes Line
	12075 1325 11125 1325
Text Notes 11125 1325 0    50   Italic 10
Готовое устройство
Wire Notes Line
	12075 1650 12075 1325
Wire Notes Line
	11125 1325 11125 1650
Wire Bus Line
	13975 2275 13975 2300
Connection ~ 13975 2300
Wire Bus Line
	13975 2300 15300 2300
Wire Bus Line
	14275 2525 14275 2550
Connection ~ 14275 2550
Wire Bus Line
	14275 2550 12950 2550
Wire Bus Line
	12950 2525 12950 2550
Connection ~ 12950 2550
Wire Bus Line
	12950 2550 11750 2550
Wire Bus Line
	12650 2275 12650 2300
Connection ~ 12650 2300
Wire Bus Line
	12650 2300 13975 2300
Wire Bus Line
	11750 2525 11750 2550
Connection ~ 11750 2550
Wire Bus Line
	11750 2550 10975 2550
Wire Bus Line
	11450 2275 11450 2300
Connection ~ 11450 2300
Wire Bus Line
	11450 2300 12650 2300
$Comp
L Connector_Generic:Conn_01x08 MFRC522
U 1 1 5EC264A0
P 3375 4900
F 0 "MFRC522" H 3295 4275 50  0000 C CNN
F 1 "Conn_01x08" H 3295 4366 50  0000 C CNN
F 2 "" H 3375 4900 50  0001 C CNN
F 3 "~" H 3375 4900 50  0001 C CNN
	1    3375 4900
	-1   0    0    1   
$EndComp
Text GLabel 3575 4500 2    50   Input ~ 0
MFRC_SDA
Text GLabel 3575 4600 2    50   Input ~ 0
MFRC_SCK
Text GLabel 3575 4700 2    50   Input ~ 0
MFRC_MOSI
Text GLabel 3575 4800 2    50   Input ~ 0
MFRC_MISO
Text GLabel 3575 4900 2    50   Input ~ 0
MFRC_IRQ
Text GLabel 3575 5100 2    50   Input ~ 0
MFRC_RST
Text GLabel 3575 5200 2    50   Input ~ 0
MFRC_RELAY_OUT
$Comp
L power:GND #PWR?
U 1 1 5EC26CAF
P 3575 5000
F 0 "#PWR?" H 3575 4750 50  0001 C CNN
F 1 "GND" V 3580 4872 50  0000 R CNN
F 2 "" H 3575 5000 50  0001 C CNN
F 3 "" H 3575 5000 50  0001 C CNN
	1    3575 5000
	0    -1   -1   0   
$EndComp
Wire Notes Line
	3200 4225 3200 5275
Wire Notes Line
	3200 5275 4300 5275
Wire Notes Line
	4300 5275 4300 4225
Wire Notes Line
	4300 4225 3200 4225
Text Notes 3200 4225 0    50   ~ 10
MFRC522 В ПРОЦЕССЕ
Wire Notes Line
	9375 2100 9375 2000
Wire Notes Line
	8450 2100 9375 2100
Wire Notes Line
	8450 2000 9375 2000
$Comp
L Relay:DIPxx-1Cxx-51x K?
U 1 1 5EC2D5DD
P 5350 4850
F 0 "K?" V 5917 4850 50  0000 C CNN
F 1 "DIPxx-1Cxx-51x" V 5826 4850 50  0000 C CNN
F 2 "Relay_THT:Relay_StandexMeder_DIP_LowProfile" H 5800 4800 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 5350 4850 50  0001 C CNN
	1    5350 4850
	0    -1   -1   0   
$EndComp
Text GLabel 5050 5050 0    50   Input ~ 0
MFRC_RELAY
$Comp
L power:GND #PWR?
U 1 1 5EC2F6CD
P 5650 5050
F 0 "#PWR?" H 5650 4800 50  0001 C CNN
F 1 "GND" V 5655 4922 50  0000 R CNN
F 2 "" H 5650 5050 50  0001 C CNN
F 3 "" H 5650 5050 50  0001 C CNN
	1    5650 5050
	0    -1   -1   0   
$EndComp
Text GLabel 5050 4550 0    50   Input ~ 0
MFRC_RALAY_OUT
Wire Notes Line
	6000 4225 6000 5275
Wire Notes Line
	6000 5275 4350 5275
Wire Notes Line
	4350 5275 4350 4225
Wire Notes Line
	4350 4225 6000 4225
Text Notes 4350 4225 0    50   Italic 10
MFRC522 POWER В ПРОЦЕССЕ
Text Notes 4375 4925 0    50   ~ 0
Можно заменить на\nтранзистор
$Comp
L Device:L COIL_GATE_READER?
U 1 1 5EC36C5B
P 3350 5700
F 0 "COIL_GATE_READER?" H 3425 5775 50  0000 L CNN
F 1 "L" H 3403 5655 50  0000 L CNN
F 2 "" H 3350 5700 50  0001 C CNN
F 3 "~" H 3350 5700 50  0001 C CNN
	1    3350 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:L COIL_MAIN_READER?
U 1 1 5EC36F51
P 5200 5700
F 0 "COIL_MAIN_READER?" H 5253 5746 50  0000 L CNN
F 1 "L" H 5253 5655 50  0000 L CNN
F 2 "" H 5200 5700 50  0001 C CNN
F 3 "~" H 5200 5700 50  0001 C CNN
	1    5200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 5550 3350 5450
Wire Wire Line
	3350 5450 5200 5450
Wire Wire Line
	5200 5450 5200 5550
$Comp
L Relay:DIPxx-1Cxx-51x K?
U 1 1 5EC394CD
P 4250 6450
F 0 "K?" V 4817 6450 50  0000 C CNN
F 1 "DIPxx-1Cxx-51x" V 4726 6450 50  0000 C CNN
F 2 "Relay_THT:Relay_StandexMeder_DIP_LowProfile" H 4700 6400 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 4250 6450 50  0001 C CNN
	1    4250 6450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 6250 4550 6250
Wire Wire Line
	5200 5850 5200 6250
Wire Wire Line
	3950 6150 3350 6150
Wire Wire Line
	3350 6150 3350 5850
Text GLabel 3950 6650 0    50   Input ~ 0
RELAY_1
$Comp
L power:GND #PWR?
U 1 1 5EC3FBA9
P 4550 6650
F 0 "#PWR?" H 4550 6400 50  0001 C CNN
F 1 "GND" V 4555 6522 50  0000 R CNN
F 2 "" H 4550 6650 50  0001 C CNN
F 3 "" H 4550 6650 50  0001 C CNN
	1    4550 6650
	0    -1   -1   0   
$EndComp
Wire Notes Line
	4325 5425 4325 5850
Wire Notes Line
	4325 5850 3225 5850
Wire Notes Line
	3225 5850 3225 5425
Wire Notes Line
	3225 5425 4325 5425
Text Notes 3425 5550 0    50   ~ 0
На турникет
Wire Notes Line
	5150 5850 6025 5850
Wire Notes Line
	6025 5850 6025 5425
Wire Notes Line
	6025 5425 5150 5425
Wire Notes Line
	5150 5425 5150 5850
Text Notes 5225 5550 0    50   ~ 0
Место чтения карты
Wire Notes Line
	3200 5400 6075 5400
Wire Notes Line
	6075 5400 6075 6875
Wire Notes Line
	6075 6875 3200 6875
Wire Notes Line
	3200 6875 3200 5400
Text Notes 3200 5400 0    50   ~ 10
MFRC522 АНТЕННА В ПРОЦЕССЕ
Wire Notes Line
	800  2800 3150 2800
Wire Notes Line
	3150 2800 3150 3775
Wire Notes Line
	3150 3775 4425 3775
Wire Notes Line
	4425 3775 4425 2800
Wire Notes Line
	4425 2800 5875 2800
Wire Notes Line
	5875 2800 5875 575 
Wire Notes Line
	5875 575  800  575 
Wire Notes Line
	800  575  800  2800
Wire Notes Line
	3150 4125 3150 6925
Wire Notes Line
	3150 6925 6125 6925
Wire Notes Line
	6125 6925 6125 4125
Wire Notes Line
	6125 4125 3150 4125
Text Notes 3150 4125 0    50   Italic 10
MFRC522
Text Notes 800  575  0    50   Italic 10
RDM6300
$Comp
L power:+3.3V #PWR?
U 1 1 5EBBF658
P 5650 4650
F 0 "#PWR?" H 5650 4500 50  0001 C CNN
F 1 "+3.3V" V 5665 4778 50  0000 L CNN
F 2 "" H 5650 4650 50  0001 C CNN
F 3 "" H 5650 4650 50  0001 C CNN
	1    5650 4650
	0    1    1    0   
$EndComp
$EndSCHEMATC
