import processing.video.*;

float counter = 0;
int reduction;
int max = 5;
Capture video;

void setup() {
  fullScreen(2);
  //size(640, 480);
  
  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start();
  image(video, 0,0,width,height);
}

float reduce(){
  float reduction = 1 / counter * 255;
  counter++;
  if(reduction < max){
    reduction = max;
  }
  println("FrameCount: " + counter);
  println("Reduction: " + reduction);
  return reduction;
}

void draw() {
  if (video.available()) {
    video.read();
    tint(255, reduce());
    image(video, 0,0,width,height);
  }
}