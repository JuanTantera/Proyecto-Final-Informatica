import controlP5.*;

ControlP5 cp5;
int frecuenciaSensado = 1000;  // Valor predeterminado para la frecuencia en milisegundos
int tiempoSensado = 5000;      // Valor predeterminado para el tiempo en milisegundos

void setup() {
  size(400, 200);
  cp5 = new ControlP5(this);

  // Campo para la frecuencia de sensado
  cp5.addTextfield("Frecuencia")
     .setPosition(20, 40)
     .setSize(100, 20)
     .setAutoClear(false)
     .setValue(frecuenciaSensado + "");

  // Campo para el tiempo de sensado
  cp5.addTextfield("Tiempo")
     .setPosition(20, 80)
     .setSize(100, 20)
     .setAutoClear(false)
     .setValue(tiempoSensado + "");

  // Botón para enviar datos a Arduino
  cp5.addButton("ENVIAR_DATOS")
     .setPosition(20, 120)
     .setSize(150, 40);
}

void draw() {
  background(200);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup() && theEvent.name().equals("Frecuencia")) {
    frecuenciaSensado = Integer.parseInt(cp5.get(Textfield.class, "Frecuencia").getText());
  } else if (theEvent.isGroup() && theEvent.name().equals("Tiempo")) {
    tiempoSensado = Integer.parseInt(cp5.get(Textfield.class, "Tiempo").getText());
  } else if (theEvent.isController() && theEvent.name().equals("ENVIAR_DATOS")) {
    enviarDatosAArduino();
  }
}

void enviarDatosAArduino() {
  // Aquí puedes enviar los datos (frecuenciaSensado y tiempoSensado) a Arduino
  println("Enviando datos a Arduino:");
  println("Frecuencia de sensado: " + frecuenciaSensado + " ms");
  println("Tiempo de sensado: " + tiempoSensado + " ms");
}
