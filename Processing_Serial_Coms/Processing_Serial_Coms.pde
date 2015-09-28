import processing.serial.*;

Serial myPort;
PrintWriter output;

void setup(){
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  output = createWriter("data.csv");
}

void draw(){

  if(myPort.available()>0){
   String value = myPort.readString();
   if(value != null){
     output.print(value);
   }
  }
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file 
  exit(); // Stops the program
}