const int ECHO_PIN = 2;      // Pin del sensor de ultrasonido ECHO
const int TRIG_PIN = 3;      // Pin del sensor de ultrasonido TRIG
const int LED_PROGRESIVO_PIN = 6;  // Pin del LED progresivo
const int LED_CORTO_PIN = 7;       // Pin del LED para distancias cortas
const int MAX_DISTANCIA_CM = 200;   // Distancia máxima en cm para la medición del LED progresivo
const int MIN_DISTANCIA_LED_CORTO = 10;  // Distancia en cm para encender el LED corto

void setup() {
  Serial.begin(9600);
  pinMode(ECHO_PIN, INPUT);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(LED_PROGRESIVO_PIN, OUTPUT);
  pinMode(LED_CORTO_PIN, OUTPUT);
}

void loop() {
  long duration, distance;

  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  duration = pulseIn(ECHO_PIN, HIGH);
  distance = (duration / 2) / 29.1;  // Calcula la distancia en centímetros

  // Enciende el LED progresivo en función de la distancia medida
  if (distance <= MAX_DISTANCIA_CM) {
    analogWrite(LED_PROGRESIVO_PIN, map(distance, 0, MAX_DISTANCIA_CM, 255, 0));
  } else {
    analogWrite(LED_PROGRESIVO_PIN, 0);
  }

  // Enciende el LED corto si la distancia es menor a 10 cm
  if (distance < MIN_DISTANCIA_LED_CORTO) {
    digitalWrite(LED_CORTO_PIN, HIGH);
  } else {
    digitalWrite(LED_CORTO_PIN, LOW);
  }

  // Imprime la distancia medida en el puerto serial
  Serial.print("Distancia: ");
  Serial.print(distance);
  Serial.println(" cm");

  delay(500);
}
