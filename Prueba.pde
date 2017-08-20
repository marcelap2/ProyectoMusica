import ddf.minim.*;
import processing.sound.*;

Minim minim;
SinOsc osc;
Env env;

int [] escala= {
  60, 62, 64, 65, 67, 69, 71, 72
};

int nota=0;


AudioPlayer SonidoLento;
AudioPlayer SonidoMedio;
AudioPlayer SonidoAlto;
float speed=0;
float notado=261.63;

void setup()
{
  size(512, 200, P3D);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  osc=new SinOsc(this);
env=new Env(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  SonidoLento=minim.loadFile("SonidoLento.wav");
  SonidoMedio=minim.loadFile("GuitaraMedia.wav");
  SonidoAlto=minim.loadFile("SonidoFire.wav");
}

void draw()
{


}

void keyPressed()
{
if(key=='a' || key=='A' &&frameCount % 60 ==0){
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.01,0.2,1,0.1);
}
if(key=='s' || key=='S' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.1,0.2,1,0.1);
}
if(key=='d' || key=='D' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.1,0.2,1,0.1);
}
if(key=='f' || key=='F' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.1,0.2,1,0.1);
}
if(key=='g' || key=='G' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.1,0.2,1,0.1);
}
if(key=='h' || key=='H' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.1,0.2,1,0.1);
}
if(key=='j' || key=='J' &&frameCount % 60 ==0){
  nota=(nota+1)% escala.length;
osc.play(translateMIDI(escala[nota]),1);
env.play(osc,0.01,0.2,1,0.1);
}
}

float translateMIDI(int nota){
  return pow(2, ((nota-69)/12.0))*448;
}

void mouseMoved(){
  float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
  if(speed<=2){
     SonidoMedio.pause();
      SonidoAlto.pause(); 
      SonidoLento.pause();
  }else if(speed>2 && speed<30){
    if(SonidoMedio.isPlaying()||SonidoAlto.isPlaying()){
      SonidoMedio.pause();
      SonidoAlto.pause();          
    }
     SonidoLento.play();
  }else if (speed > 30 & speed < 50){
    if(SonidoLento.isPlaying()||SonidoAlto.isPlaying()){
      SonidoLento.pause();
      SonidoAlto.pause();      
    }
    SonidoMedio.play();
  }else if (speed>50){
    if(SonidoLento.isPlaying() || SonidoMedio.isPlaying()|| speed==0){
      SonidoLento.pause();
      SonidoMedio.pause();   
    }    
  SonidoAlto.play();
  setup();
  }
}