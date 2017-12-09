
import processing.video.*;

//keyboard
import processing.sound.*;

AudioDevice device;
SoundFile[] file;

// Define the number of samples 
int numsounds = 5;

int value[] = {0,0,0};

//end KB


// Size of each cell in the grid
int cellSize = 20;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;

//ico
Icosahedron ico1;
//end ico

void setup() {
  //size(640, 480);
    //ico
    size(640, 480, P3D);
  ico1 = new Icosahedron(75);
  //end ico
  frameRate(30);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start();  
  
  background(0);
  
  //KB
  size(640, 480);
  
  // Create a Sound renderer and an array of empty soundfiles
  device = new AudioDevice(this, 48000, 32);
  file = new SoundFile[numsounds];
  
  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++){
    file[i] = new SoundFile(this, (i+1) + ".mp3");
  }
  //endKB
  

}


void draw() { 
  
  //kb
  background(value[0],value[1],value[2]);
  //endkb
  
  //ico
    lights();
  translate(width/2, height/2);

  pushMatrix();
  translate(-width/3.5, 0);
  rotateX(frameCount*(radians(360)));
  rotateY(frameCount*PI/-200);
  stroke(170, 0, 0);
  noFill();
  ico1.create();
  popMatrix();
  //end ico
  
  if (video.available()) {
    video.read();
    video.loadPixels();
  
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
      
        // Where are we, pixel-wise?
        int x = i*cellSize;
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
      
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        // Make a new color with an alpha component
        color c = color(r, g, b, 75);
      
        // Code for drawing a single rect
        // Using translate in order for rotation to work properly
        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2);
        // Rotation formula based on brightness
        rotate((2 * PI * brightness(c) / 255.0));
        rectMode(CENTER);
        fill(c);
        noStroke();
        // Rects are larger than the cell for some overlap
        rect(0, 0, cellSize+6, cellSize+6);
        popMatrix();
      }
    }
  }
}

//kb
void keyPressed() {
  for (int i=0; i < 3; i++) {  
      value[i]=int(random(255));
  }
 
  switch(key){
  case 'a':
    file[0].play(0.5, 1.0);
    break;

  case 's':
    file[1].play(0.5, 1.0);
    break;
  
  case 'd':
    file[2].play(0.5, 1.0);
    break;
  
  case 'f':
    file[3].play(0.5, 1.0);
    break;
  
  case 'g':
    file[4].play(0.2, 1.0);
    break;
  
   case 'h':
    file[0].play(1.0, 1.0);
    break;
   
   case 'j':
    file[1].play(1.0, 1.0);
    break;

   case 'k':
    file[2].play(1.0, 1.0);
    break;
    
   case 'l':
    file[3].play(1.0, 1.0);
    break;
    
   case '1':
    file[4].play(0.1, 1.0);
    break;
    
   case '2':
    file[0].play(2.0, 1.0);
    break;
    
   case 'q':
    file[1].play(2.0, 1.0);
    break;
   
   case 'w':
    file[2].play(2.0, 1.0);
    break;    
   
   case 'e':
    file[3].play(2.0, 1.0);
   break;
   
   case 'r':
    file[4].play(2.0, 1.0);
   break; 
   
   case 't':
    file[0].play(3.0, 1.0);
    break;
    
   case 'z':
    file[1].play(3.0, 1.0);
    break;
   
   case 'u':
    file[2].play(3.0, 1.0);
    break;    
   
   case 'i':
    file[3].play(3.0, 1.0);
   break;
   
   case 'o':
    file[4].play(3.0, 1.0);
    break;
   
   case 'p':
    file[0].play(4.0, 1.0);
    break;    
   
   case '3':
    file[1].play(4.0, 1.0);
   break;   
   
   case '4':
    file[2].play(2.0, 1.0);
   break; 
   
   case '5':
    file[3].play(1.0, 1.0);
   break; 
   
   case '6':
    file[4].play(3.0, 1.0);
   break; 
   
   case '7':
    file[0].play(0.5, 1.0);
   break; 
   
      case '8':
    file[1].play(4.0, 1.0);
   break; 
   
      case '9':
    file[2].play(3.0, 1.0);
   break; 
   
      case '0':
    file[3].play(2.0, 1.0);
   break; 
  }
}
//end kb