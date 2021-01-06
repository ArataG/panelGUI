
int h;
int w;
int scl;

Panel panel;
Process process;


void setup(){
  size(300,300);
  frameRate(10);
  h = 300;
  w = 300;
  scl = h/3;
  panel = new Panel();
  process = new Process();
}

void draw(){
  background(200);
  panel.show();
}

/*
  Process class
*/


class Process{

  void panelPressd(){
    int com = mouseX/100 + mouseY/100 * 3;
    this.procedure(com);
  }
  
  void commandPressed(int com){
    fill(0,200,0,100);
    rect(0,0,h,w);
    this.procedure(com);
  }
  
  //ここにpanelの番号に応じた処理を記述
  //初期状態では, コンソールに表示されるようにしてある.
  void procedure(int op){
    if(op == 0){}
    if(op == 1){println("UP");}
    if(op == 2){}
    if(op == 3){println("LEFT");}
    if(op == 4){println("CENTER");}
    if(op == 5){println("RIGHT");}
    if(op == 6){}
    if(op == 7){println("DOWN");}
    if(op == 8){}
  }
}


void mousePressed(){
  panel.showClicked();
  process.panelPressd();
}

void keyPressed() {
  if (key == 'h') process.commandPressed(3);
  if (key == 'j') process.commandPressed(7);
  if (key == 'k') process.commandPressed(1);
  if (key == 'l') process.commandPressed(5);
  if (key == ' ') process.commandPressed(4);

}



/*
  panel class
*/

class Panel{

  void showNum(){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        fill(255);
        textSize(50);
        text(i + j*3, i*scl , j*scl + scl);
      }
    }
  }

  void showOnMouse(){
      fill(51);
      if(mouseX != 0 && mouseY != 0)  //初期状態を弾く
        rect(mouseX/100 * scl, mouseY/100 * scl, scl, scl);
  }

  void showBase(){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        fill(0);
        stroke(255);
        rect(i * scl, j * scl, scl, scl);
      }
    }
  }

  void showClicked(){
      fill(200,0,0);
      rect(mouseX/100 * scl, mouseY/100 * scl, scl, scl);
  }

  void show(){
    this.showBase();
    this.showOnMouse();
    this.showNum();
  }
}
