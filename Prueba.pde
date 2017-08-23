import ddf.minim.*;
import processing.sound.*;
import ddf.minim.analysis.*;

Minim minim;
SinOsc osc;
Env env;
BeatDetect beat;

int [] escala= {
  60, 62, 64, 65, 67, 69, 71, 72, 74, 76, 78, 80
};

int nota=0;


AudioPlayer SonidoLento;
AudioPlayer SonidoMedio;
AudioPlayer SonidoAlto;
float speed=0;
float notado=261.63;

void setup()
{
  size(712, 500, P3D);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  osc=new SinOsc(this);
  env=new Env(this);
  beat = new BeatDetect();
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  SonidoLento=minim.loadFile("SonidoLento.wav");
  SonidoMedio=minim.loadFile("GuitaraMedia.wav");
  SonidoAlto=minim.loadFile("SonidoFire.wav");
  
}

void draw()
{
background(0);
stroke(255);

  
}



void keyPressed()
{
if(key=='a' || key=='A' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[0]),1);
env.play(osc,0.01,0.02,0.3,0.2);
}
if(key=='s' || key=='S' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[1]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}
if(key=='d' || key=='D' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[2]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}
if(key=='f' || key=='F' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[3]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}
if(key=='g' || key=='G' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[4]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}
if(key=='h' || key=='H' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[5]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}
if(key=='j' || key=='J' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[6]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}
if(key=='k' || key=='K' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[7]),1);
env.play(osc,0.01,0.004,0.3,0.2);
} if(key=='l' || key=='L' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[8]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}if(key=='q' || key=='Q' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[9]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}if(key=='w' || key=='W' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[10]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}if(key=='e' || key=='E' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[11]),1);
env.play(osc,0.01,0.004,0.3,0.2);
}

}

float translateMIDI(int nota){
  return pow(2, ((nota-69)/12.0))*448;
}

void mouseMoved(){
  float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
  if(speed==0){
     SonidoLento.pause();
      SonidoMedio.pause();
      SonidoAlto.pause();
  }else if(speed>2 && speed<30){
    if(SonidoMedio.isPlaying()||SonidoAlto.isPlaying()){
      SonidoMedio.pause();
      SonidoAlto.pause();          
    }
     SonidoLento.play();
  }else if (speed > 30 & speed < 80){
    if(SonidoLento.isPlaying()||SonidoAlto.isPlaying()){
      SonidoLento.pause();
      SonidoAlto.pause();      
    }
    SonidoMedio.play();
  }else if (speed>80){
    if(SonidoLento.isPlaying() || SonidoMedio.isPlaying()){
      SonidoLento.pause();
      SonidoMedio.pause();   
    }    
  SonidoAlto.play();
   }
   
}