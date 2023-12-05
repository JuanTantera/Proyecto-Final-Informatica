
import processing.serial.*;
Serial myPort;
int estado=0;
void setup(){
  size(1000,600);
  background(36,101,175);
}
void draw(){
  background(36,101,175);
  //Menú principal
  if(estado==0){
    fill(255);
    textSize(40);
    text("Menú principal. Sonar con Arduino", 10,40);
    //Botones submenus
    //Ingreso
    if(mouseX>50 && mouseX<350 && mouseY>300 && mouseY<400){
      fill(0,150,255);
      if (mousePressed) {
        estado = 1; // Cambia al estado del Submenú Ingreso cuando se hace clic
      }
    } else {
      fill(255);
    }
    rect(50,300,300,100);
    textSize(20);
    fill(36,101,175);
    text("Ingreso de Datos", 140,355);
    //Muestreo
    if(mouseX>400 && mouseX<700 && mouseY>300 && mouseY<400){
      fill(0,150,255);
      if (mousePressed) {
        estado = 2; // Cambia al estado del Submenú Muestreo cuando se hace clic
      }
    } else {
      fill(255);
    }
    rect(400,300,300,100);
    textSize(20);
    fill(36,101,175);
    text("Muestreo", 520,355);
    } 
    
    //Menú Ingreso de Datos
    else if(estado==1){
      fill(255);
      textSize(40);
      text("Ingreso de Datos",10,40);
      if(mouseX > 875 && mouseX < 975 && mouseY > 25 && mouseY < 100){
        fill(0,150,255);
        if(mousePressed){
          estado=0;
        } 
      } else {
      fill(255);
      }
      rect(875,25,100,75);
      fill(36,101,175);
      textSize(20);
      text("Volver",900,75);
    }
    
    //Menú Muestro
    else if(estado==2){
      fill(255);
      textSize(40);
      text("Muestreo",10,40);
      if(mouseX > 875 && mouseX < 975 && mouseY > 25 && mouseY < 100){
        fill(0,150,255);
        if(mousePressed){
          estado=0;
        } 
      } else {
      fill(255);
      }
      rect(875,25,100,75);
      fill(36,101,175);
      textSize(20);
      text("Volver",900,75);
    }
      
}
