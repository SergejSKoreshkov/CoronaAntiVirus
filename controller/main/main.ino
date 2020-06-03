#define ARRAY_LENGTH 16

#define SWITCH_PIN 4
#define RS485_ENABLE_PIN 5
#define LED_RED 6
#define LED_GREEN 7
#define LED_BLUE 8

#define SWITCH_GATE_TIME 4000
#define BLINK_INTERVAL 300
#define MAXIMAL_TEMP 37.0
#define MINIMAL_TEMP 35.0
#define IGNORE_TEMP 31.5
#define TEMP_MEASUREMENT_COUNT 300

#define SERVER_TIMEOUT 100
#define SERVER_SPEED 9600

#define USE_FAKE_TEMP
//#define USE_FAKE_CARD_READER
#define DEBUG_MODE

#define USE_MFRC
//#define USE_RDM

//#define USE_90614
#define USE_90615

void debugLog (String msg) {
  digitalWrite(RS485_ENABLE_PIN, HIGH);
  delay(50);
  Serial.println(msg);
  delay(100);
  digitalWrite(RS485_ENABLE_PIN, LOW);
}

// MFRC522 ======================
#ifdef USE_MFRC
  #include <SPI.h>
  #include <MFRC522.h>
  #define MFRC_RST 9
  #define MFRC_SS 10
  #define MFRC_RELAY A0

  MFRC522 mfrc522(MFRC_SS, MFRC_RST);
  MFRC522::MIFARE_Key key; 

  String getUID () {
    if (!mfrc522.PICC_IsNewCardPresent()) {
      return "";
    }
    if (!mfrc522.PICC_ReadCardSerial()) {
      return "";
    }
    #ifdef USE_FAKE_CARD_READER
      return "Fake card id";
    #else
      String uid = "";
      for (int i = 0; i < mfrc522.uid.size; i++) {
        uid += String(mfrc522.uid.uidByte[i]) + " ";
      }
      uid.trim();
      return uid;
    #endif
  }
#endif



// RDM6300 ======================
#ifdef USE_RDM
  #define CARD_TIMEOUT 100
  #define CARD_SPEED 9600
  
  #include <SoftwareSerial.h>
  SoftwareSerial rfid(2, 3);
  
  #define BUFFER_SIZE 14
    
  uint8_t buffer[BUFFER_SIZE];
  int buffer_index = 0;
  
  String getUID () {
    #ifdef USE_FAKE_CARD_READER
    if (rfid.available()) {
      while(rfid.available()) { rfid.read(); }
      return "Fake card id";
    } else {
      return "";
    }
    #else
    if (rfid.available() > 0) {
      bool flag = false;
      
      int value = rfid.read();
      if (value == -1) { 
        return "";
      }
      if (value == 2) {
        buffer_index = 0;
      } else if (value == 3) {
        flag = true;
      }
      if (buffer_index >= BUFFER_SIZE) {
        return "";
      }
      
      buffer[buffer_index++] = value;
      if (flag) {
        if (buffer_index == BUFFER_SIZE) {
          String tag = "";
          for (int i = 0; i < BUFFER_SIZE; i++) {
            tag += String(buffer[i]) + " ";
          }
          tag.trim();
          return tag;
        } else {
          buffer_index = 0;
          return "";
        }
      }    
      else {
        return "";
      }
    }    
    else  {
      return "";
    }
    #endif
  }
  
  // ==============================
#endif

// EEPROM =======================
#include <EEPROM.h>

void setDeviceID (byte id) {
  EEPROM.write(1, id);
}

String getDeviceID () {
  String id = String(EEPROM.read(1), DEC);
  id.trim();
  return id;
}
// ==============================

// DATA =========================

struct Data {
  String u_id;
  double temp;
};

int DATA_COUNT = 0;

Data DATA_ARRAY[ARRAY_LENGTH];

void clearDataArray() {
  for (int i = 0; i < ARRAY_LENGTH; i++) {
    DATA_ARRAY[i].u_id = "EMPTY";
    DATA_ARRAY[i].temp = 0.0;
  }

  DATA_COUNT = 0;
}

void addToDataArray(String u_id, double temp) {
  DATA_ARRAY[DATA_COUNT].u_id = u_id;
  DATA_ARRAY[DATA_COUNT].temp = temp;

  DATA_COUNT++;

  if (DATA_COUNT >= ARRAY_LENGTH) {
    DATA_COUNT = ARRAY_LENGTH - 1;
  }
}

void sendDataArray() {
  digitalWrite(RS485_ENABLE_PIN, HIGH);
  delay(50);
  // data,data,data.data,data,data.data,data,data.\n
  if (DATA_COUNT > 0) 
  {
    for (int i = 0; i < DATA_COUNT; i++) {
      Serial.print(DATA_ARRAY[i].u_id);
      Serial.print(',');
      Serial.print(getDeviceID());
      Serial.print(',');
      Serial.print(DATA_ARRAY[i].temp, 2);
      if (i != DATA_COUNT - 1) {
        Serial.print("|");
      }
    }
    Serial.println();
  } 
  else
  {
    #ifdef DEBUG_MODE
    Serial.println("EMPTY DATA");
    #endif
  }
  delay(100);
  digitalWrite(RS485_ENABLE_PIN, LOW);
}

// ==============================

// MLX906104/MLX90615 =====================
#include <Wire.h>
#ifdef USE_90614
  #include <Adafruit_MLX90614.h>
  Adafruit_MLX90614 mlx = Adafruit_MLX90614();

  double getAmbientTemp () {
    return mlx.readAmbientTempC();
  }
  
  double getObjectTemp () {
    digitalWrite(LED_BLUE, HIGH);
    #ifdef USE_FAKE_TEMP
      delay(300);
      return millis() % 2 ? 36.6 : 38.2;
    #else
    double temp = 0;
    int count = 0;
    
    for (int i = 0; i < TEMP_MEASUREMENT_COUNT; i++) {
      double tempLocal = mlx.readObjectTempC();
      
      if (tempLocal > IGNORE_TEMP)
      {
        temp += tempLocal;
        count++;
      }
    }
    digitalWrite(LED_BLUE, LOW);
    return count > 0 ? temp / count : 0.0;
    #endif
  }
#endif
#ifdef USE_90615
  #include "MLX90615.h"
  #include <I2cMaster.h>
  #define SDA_PIN A4
  #define SCL_PIN A5

  SoftI2cMaster i2c(SDA_PIN, SCL_PIN);
  MLX90615 mlx90615(DEVICE_ADDR, &i2c);
  
  double getAmbientTemp () {
    return mlx90615.getTemperature(MLX90615_AMBIENT_TEMPERATURE);
  }
  
  double getObjectTemp () {
    digitalWrite(LED_BLUE, HIGH);
    #ifdef USE_FAKE_TEMP
      delay(300);
      return millis() % 2 ? 36.6 : 38.2;
    #else
    double temp = 0;
    int count = 0;
    
    for (int i = 0; i < TEMP_MEASUREMENT_COUNT; i++) {
      double tempLocal = mlx90615.getTemperature(MLX90615_OBJECT_TEMPERATURE);
      
      if (tempLocal > IGNORE_TEMP)
      {
        temp += tempLocal;
        count++;
      }
    }
    digitalWrite(LED_BLUE, LOW);
    return count > 0 ? temp / count : 0.0;
    #endif
  }
#endif
// ==============================

void setup() {

  Serial.begin(SERVER_SPEED);
  Serial.setTimeout(SERVER_TIMEOUT);

  #ifdef DEBUG_MODE
  debugLog("UART Client started with baudrate: " + String(SERVER_SPEED));
  #endif
  
  #ifdef DEBUG_MODE
  debugLog("Setup...");
  debugLog("Using fake temp enabled: " + String(
    #ifdef USE_FAKE_TEMP 
      "true"
    #else
      "false"
    #endif
  ));
  debugLog("Using fake card reader enabled: " + String(
    #ifdef USE_FAKE_CARD_READER 
      "true" 
    #else 
      "false" 
    #endif
  ));
  debugLog("Using RDM enabled: " + String(
    #ifdef USE_RDM 
      "true"
    #else
      "false"
    #endif
  ));
  debugLog("Using MFRC enabled: " + String(
    #ifdef USE_MFRC 
      "true"
    #else
      "false"
    #endif
  ));
  debugLog("Using MLX90614 enabled: " + String(
    #ifdef USE_90614 
      "true"
    #else
      "false"
    #endif
  ));
  debugLog("Using MLX90615 enabled: " + String(
    #ifdef USE_90615 
      "true"
    #else
      "false"
    #endif
  ));
  #endif
  
  pinMode(SWITCH_PIN, OUTPUT);
  digitalWrite(SWITCH_PIN, HIGH);

  pinMode(RS485_ENABLE_PIN, OUTPUT);
  digitalWrite(RS485_ENABLE_PIN, LOW);

  pinMode(LED_RED, OUTPUT);
  pinMode(LED_GREEN, OUTPUT);
  pinMode(LED_BLUE, OUTPUT);
  #ifdef USE_MFRC
    pinMode(MFRC_RELAY, OUTPUT);
    digitalWrite(MFRC_RELAY, LOW);
  #endif

  for (int i = 0; i < 3; i++) {
     digitalWrite(LED_RED, HIGH);
     digitalWrite(LED_GREEN, HIGH);
     digitalWrite(LED_BLUE, HIGH);
     delay(500);
     digitalWrite(LED_RED, LOW);
     digitalWrite(LED_GREEN, LOW);
     digitalWrite(LED_BLUE, LOW);
     delay(500);
  }

  #ifdef DEBUG_MODE
  debugLog("All pins configured");
  debugLog("SWITCH_PIN: D" + String(SWITCH_PIN));
  debugLog("RS485_ENABLE_PIN: D" + String(RS485_ENABLE_PIN));
  debugLog("LED_RED: D" + String(LED_RED));
  debugLog("LED_GREEN: D" + String(LED_GREEN));
  debugLog("LED_BLUE: D" + String(LED_BLUE));
    #ifdef USE_MFRC
    debugLog("MFRC_RELAY: D" + String(MFRC_RELAY));
    #endif
    #ifdef USE_RDM
    debugLog("RDM TX: D2");
    debugLog("RDM RX: D3");
    #endif
  #endif

  clearDataArray();

  #ifdef USE_RDM 
    rfid.begin(CARD_SPEED);
    #ifdef DEBUG_MODE
    debugLog("UART Card Reader setup on baudrate: " + String(CARD_SPEED));
    #endif
  #endif

  #ifdef USE_MFRC
    SPI.begin();
    mfrc522.PCD_Init();
    #ifdef DEBUG_MODE
    debugLog("MFRC522 Initialized");
    #endif
  #endif

  #ifdef USE_90614
    mlx.begin();
  #endif
  
  #ifdef DEBUG_MODE
  debugLog("MLX90614 Communication started");
  #endif
}

long gateOpenTime = 0;
long errorTime = 0;
long blinkTime = 0;
bool enableBlink = false;
bool allowProcess = false;
long readTime = 0;
long allowProcessTime = -1;
bool blinkState = LOW;
String uid = "";

void loop() {
  // Server message =============================================
  if (Serial.available()) {
    String line = Serial.readStringUntil('\n');
    line.trim();
    
    #ifdef DEBUG_MODE
    debugLog("Message from server: " + line);
    #endif
    
    if (line == getDeviceID())
    {
      sendDataArray();
      clearDataArray();
    }
    else if (line.indexOf("SET_ID ") >= 0)
    {
      String newID = line.substring(line.indexOf(' ') + 1);
      int newID_int = newID.toInt();
      if (newID_int <= 255 && newID_int >= 0)
      {
        setDeviceID((byte)newID_int);
        
        #ifdef DEBUG_MODE
        debugLog("New ID set: " + newID_int);
        #endif
      }
    }
    else if (line.indexOf("GET_ID") >= 0) {
      debugLog(getDeviceID());
    }
  }

  if (gateOpenTime > millis()) {
    digitalWrite(SWITCH_PIN, LOW);
    digitalWrite(LED_GREEN, HIGH);
    #ifdef USE_MFRC
      digitalWrite(MFRC_RELAY, HIGH);
    #endif
    #ifdef USE_RDM
      while(rfid.available() > 0) {rfid.read();}
    #endif
  } else {
    digitalWrite(SWITCH_PIN, HIGH);
    digitalWrite(LED_GREEN, LOW);
    #ifdef USE_MFRC
      digitalWrite(MFRC_RELAY, LOW);
      delay(10);
      mfrc522.PCD_Init();
    #endif
  }

  if (errorTime > millis()) {
    digitalWrite(LED_RED, HIGH);
    #ifdef USE_RDM
      while(rfid.available() > 0) {rfid.read();}
    #endif
  } else {
    digitalWrite(LED_RED, LOW);
  }

  if (enableBlink && blinkTime < millis()) {
    blinkState = !blinkState;
    digitalWrite(LED_BLUE, blinkState);
    blinkTime = millis() + BLINK_INTERVAL;
    #ifdef USE_RDM
      while(rfid.available() > 0) {rfid.read();}
    #endif
  } 
  
  if (!enableBlink) {
    digitalWrite(LED_BLUE, LOW);
  }

  // Card =======================================================
  if (millis() > readTime) {
    uid = getUID();
    if (uid.length() > 0) {
      #ifdef DEBUG_MODE
      debugLog("Data from card: " + uid);
      #endif
      enableBlink = true;
      allowProcessTime = millis() + BLINK_INTERVAL * 10;
      readTime = millis() + SWITCH_GATE_TIME;
    }
  }

  if (millis() > allowProcessTime && allowProcessTime != -1) {
    allowProcess = true;
    allowProcessTime = -1;
  }
  
  if (allowProcess) {
      allowProcess = false;
      enableBlink = false;
      double temp = getObjectTemp();
      
      #ifdef DEBUG_MODE
      debugLog("Temp readed: " + String(temp));
      #endif
      
      addToDataArray(uid, temp);
    
      if (temp > MAXIMAL_TEMP || temp < MINIMAL_TEMP) {
        #ifdef DEBUG_MODE
        debugLog("Critical temp");
        #endif
        gateOpenTime = 0;
        errorTime = millis() + SWITCH_GATE_TIME;
        readTime = errorTime;
      } else {
        #ifdef DEBUG_MODE
        debugLog("Card antenna switched to gate");
        #endif
        gateOpenTime = millis() + SWITCH_GATE_TIME;
        errorTime = 0;
        readTime = gateOpenTime;
      }
      #ifdef USE_RDM
        while(rfid.available() > 0) {rfid.read();}
      #endif
    }
}
