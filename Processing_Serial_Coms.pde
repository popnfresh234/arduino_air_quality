import processing.serial.*;

Serial myPort;
short portIndex = 4;
String value;
PrintWriter output;

void setup(){
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  output = createWriter("data.txt");
}

void draw(){

  while(myPort.available()>0){
   value = myPort.readStringUntil('\n');

  }
  if(value!= null){
  println(value);
  output.println(value);
  value = null;
  }
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file 
  exit(); // Stops the program
}