import ddf.minim.*;

Minim minim;
AudioSample ndo;
AudioSample re;
AudioSample mi;
AudioSample fa;
AudioSample sol;
AudioSample la;
AudioSample si;
AudioPlayer SonidoLento;
AudioPlayer SonidoMedio;
AudioPlayer SonidoAlto;
float speed=0;

void setup()
{
  size(512, 200, P3D);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  ndo = minim.loadSample("DO.wav");
  re=minim.loadSample("RE.wav");
  mi=minim.loadSample("MI.wav");
  fa=minim.loadSample("FA.wav");
  sol=minim.loadSample("SOL.wav");
  la=minim.loadSample("LA.wav");
  si=minim.loadSample("SI.wav");
  SonidoLento=minim.loadFile("SonidoLento.wav");
  SonidoMedio=minim.loadFile("GuitaraMedia.wav");
  SonidoAlto=minim.loadFile("SonidoFire.wav");
}

void draw()
{


}

void keyPressed()
{
  if (key=='a'|| key=='A')
  {
    ndo.trigger();  
  } else if (key=='D'|| key=='d'){
    re.trigger();
  } else if (key=='g' || key=='G'){
    mi.trigger();
  }else if (key=='h' || key=='H'){
    fa.trigger();
  }else if (key=='k' || key=='K'){
    sol.trigger();
  }else if (key=='ñ' ||key=='Ñ'){
    la.trigger();
  }else if (key=='b' || key=='B'){
    si.trigger();
  }  
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
    if(SonidoLento.isPlaying() || SonidoMedio.isPlaying()){
      SonidoLento.pause();
      SonidoMedio.pause();   
    }    
  SonidoAlto.play();
  }
}