//alumno:Carla Choquetopa

// El video esta grabado por mi celular por que mi PC no tiene audio ni sonido y tampoco camara,intente con varias aplicaciones y paginas pero no me dejo, una disculpa

//Explicacion de video de youtube:https://youtu.be/d0NO2CqB6Y0?si=HWtjpS3pq9YJiul_

//Video recuperatorio en youtube:https://youtube.com/shorts/DOZtrxhlnl4?si=XJRek9Su30MgPbM6

// el video esta grabado por mi celu esque no encontre manera de hacerlo de otra manera, lo siento y espero pueda aceptarlo igual.


PImage imagen;

// Variables del patrón adicional                                                             
boolean mostrarExtra = false;
float tamExtra = 400.0 / 5;
int gridExtra = 5;

// Colores base
color colorFondo1 = color(0);          // Negro
color colorFondo2 = color(0, 0, 255);  // Azul

// Variable para alternar colores                                                   
boolean invertirColores = false;

// NUEVA variable para controlar la etapa                                              
int etapaActual = 0;

void setup() {
  size(800, 400);                                                                      
  imagen = loadImage("imagen1.jpg");                                                  
  imagen.resize(400, 400);                                                                 
}

void draw() {
  background(255);                                                                   

  // Imagen original de referencia (izquierda)                                     
  image(imagen, 0, 0);

  // Dibuja patrón base a la derecha
  drawPattern(400, 0);                                                                       

  // dibuja patrón extra a la derecha
  if (mostrarExtra) {                                                       
    drawCustomPattern(400, 0, gridExtra, tamExtra);
  }
  fill(0);
  textSize(15);
  text("Distanciabal centro:" + nf(distanciaAlCentro(),1,2),10,height - 10);
}

// --------------------
// Dibuja patrón base a la derecha
// --------------------
void drawPattern(float offsetX, float offsetY) {                                              
  int cols = 3;                                                                          
  int rows = 3;                                                                              
  float tam = 400.0 / 3;                                                                           

  for (int i = 0; i < cols; i++) {                                                            
    for (int j = 0; j < rows; j++) {                                                        
      float x = i * tam + offsetX;                                                    
      float y = j * tam + offsetY;                                                            

      boolean esPar = (i + j) % 2 == 0;                                                  

      if (esPar) {  
        fill(invertirColores ? colorFondo1 : colorFondo2);  
      } else {  
        fill(invertirColores ? colorFondo2 : colorFondo1);  
      }  
      rect(x, y, tam, tam);                                                                    

      if (esPar) {  
        fill(invertirColores ? colorFondo2 : colorFondo1);                               
      } else {  
        fill(invertirColores ? colorFondo1 : colorFondo2);  
      }  
      ellipse(x + tam / 2, y + tam / 2, tam, tam);  
    }
  }
}

// --------------------
// Función que NO retorna
// --------------------
void drawCustomPattern(float offsetX, float offsetY, int grid, float tam) {       
  for (int i = 0; i < grid; i++) {
    for (int j = 0; j < grid; j++) {
      float x = i * tam + offsetX;
      float y = j * tam + offsetY;

      boolean alterno = (i + j) % 2 == 0;                                                                     

      if (alterno) {                                                                                          
        fill(invertirColores ? colorFondo1 : colorFondo2);  
      } else {  
        fill(invertirColores ? colorFondo2 : colorFondo1);  
      }  
      rect(x, y, tam, tam);  

      if (alterno) {                                                                                     
        fill(invertirColores ? colorFondo2 : colorFondo1);  
      } else {  
        fill(invertirColores ? colorFondo1 : colorFondo2);  
      }  
      ellipse(x + tam / 2, y + tam / 2, tam, tam);  
    }
  }
}

// --------------------
// Función que RETORNA un valor
// --------------------
float distanciaAlCentro() {                                                                          
  return dist(mouseX, mouseY, width / 2, height / 2);
}

// --------------------
// Evento: presionar tecla → muestra, cambia color, o reinicia
// --------------------
void keyPressed() {                                                                                 
  if (etapaActual == 0) {
    mostrarExtra = true; // primera tecla: mostrar patrón extra
  } else if (etapaActual == 1) {
    invertirColores = !invertirColores; // segunda tecla: invertir colores
  } else if (etapaActual == 2) {
    mostrarExtra = false;      // tercera tecla: reinicia colores
    invertirColores = false;
    etapaActual = -1;                                                                         
  }

  etapaActual++;
}

// --------------------
//reiniciar todo
// --------------------
void mousePressed() {
  mostrarExtra = false;                                                                   
  invertirColores = false;                                                                     
  etapaActual = 0;                                                                        
}
