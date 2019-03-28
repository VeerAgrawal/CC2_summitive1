//gameover
PImage gameover;
//Player 1 image
PImage player1;
//player x y
PVector Player= new PVector (0, 0);
//score and Lives
int score = 0;
int lives = 3;
//ball
PShape ball; 
PVector ballPos= new PVector(300, 300, -50);
//speeds
float Speed = 12;
float Speedx = 0;
float Speedy = 0;
//screens 
int screen = 1;
void setup()
{
  //size
  size(600, 600, P3D);
  //loading player
  player1 = loadImage("P1.png");
  //hinding mouse
  noCursor();
  // ball 
  ball = createShape(SPHERE, 50);
  //increase render distance
  perspective(PI/3, float(width)/float(height), 10, 8000);
  // gameover
  gameover = loadImage("Gameover.png");
  
}

void draw()     
{
  if (screen == 1)
  {
    //background
    background(0);
    //background lines
    for (int d = 0; d > -800; d = d - 100)
    {
      pushMatrix();
      translate (0, 0, d);
      //top line
      stroke(255, 0, 0);
      line(40, 68, 557, 68);
      //left line
      line(40, 68, 40, 532);
      //right line
      line(557, 68, 557, 532);
      //bottome line
      line(40, 532, 557, 532);
      popMatrix();
    }
    //ball 
    pushMatrix();
    translate (ballPos.x, ballPos.y, ballPos.z);
    ballPos.z = ballPos.z - Speed;
    ballPos.x = ballPos.x - Speedx;
    ballPos.y = ballPos.y - Speedy;
    if (  ballPos.z < -700)
    {
      Speed = Speed*-1;
    }
    if (ballPos.z > 20)
    {
      lives = lives - 1;
      ballPos.z = -50;
      Speed = 12;
    }
    //balls collision zone 1  - top left
    //the zones perimeter is 100 x and 70 y 
   if (ballPos.z + 50 > - 10)
   {
    if (ballPos.x < Player.x + 100 )
    {
      if(ballPos.x > Player.x)
      {
        if (ballPos.y> Player.y)
        {
          if (ballPos.y < Player.y + 70)
          {
            Speed = 12;
            Speedx = 8;
            Speedy = 6 ;
            score = score +1;
            println("hit1");
          }
        }
      }
    }
   }
   //ball collision zone 2 - top right 
    if (ballPos.z + 50 > - 10)
   {
    if (ballPos.x < Player.x + 200 )
    {
      if(ballPos.x > Player.x + 100)
      {
        if (ballPos.y > Player.y)
        {
          if (ballPos.y < Player.y + 70)
          {
             Speed = 12;
            Speedx = -8;
            Speedy = 6;
            score = score +1;
            println("hit2");
          }
        }
      }
    }
   }
   //ball zone 3 - bottom right
   if (ballPos.z + 50 > - 10)
   {
    if (ballPos.x < Player.x + 200 )
    {
      if(ballPos.x > Player.x + 100)
      {
        if (ballPos.y > Player.y + 70)
        {
          if (ballPos.y < Player.y + 140)
          {
            Speed = 12;
            Speedx = -8;
            Speedy = -6;
            score = score +1;
            println("hit3");
          }
        }
      }
    }
   }
   //ball zone 4 - bottom left
    if (ballPos.z + 50 > - 10)
   {
    if (ballPos.x < Player.x + 100 )
    {
      if(ballPos.x > Player.x)
      {
        if (ballPos.y> Player.y + 70)
        {
          if (ballPos.y < Player.y + 140)
          {
            Speed = 12;
            Speedx = 8;
            Speedy = -6;
            score = score +1;
            println("hit4");
          }
        }
      }
    }
   }
    if (lives == 0)
    {
      screen = 2;
    }
    //ball 
    shape (ball);
    popMatrix();
    //player 
    player1.resize(200, 150);
    image (player1, Player.x, Player.y);
    //score text 
    textSize(40);
    text ("Score:", 10, 50);
    text (score, 130, 52);
    //lifes left 
    text("lives:", 440, 50);
    text (lives, 540, 52);
                            //text(Player.x, 440, 50);
                            //text(Player.y, 440, 150);
                            //text(ballPos.z, 50, 500);
    //player x pos and player y pos
    Player.x = mouseX - 10;
    Player.y = mouseY - 10;
    // ball boundries 
    //190x 200y
    if (ballPos.x < 190)
    {
      Speedx = Speedx *-1;
      Speedy = Speedy *-1;
      
    }
    if (ballPos.x > 410)
    {
      Speedx = Speedx *-1;
      Speedy = Speedy *-1;
    }
    if (ballPos.y < 200)
    {
      Speedx = Speedx *-1;
      Speedy = Speedy *-1;      
    }
   if (ballPos.y > 390)
   {
     Speedx = Speedx *-1;
     Speedy = Speedy *-1;
   }
    
    //player boudries
    if (Player.x > 357)
    {
      Player.x = 357;
    }
    if (Player.x < 40)
    {
      Player.x = 40;
    }
    if (Player.y > 382)
    {
      Player.y = 382;
    }
    if (Player.y < 68)
    {
      Player.y = 68;
    }
  }
  //gameover screen
  if (screen == 2)
  {
    //background
    gameover.resize(600,600);
    image(gameover, 0, 0);
    textSize(30);
    text("Score:" + score, 250, 540);
  }
}
