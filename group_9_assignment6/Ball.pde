class Ball{
  float r, x, y, fx, fy, ax, ay, vx, vy, vmag, D, theta, m, g, dt, e;
  color c;
  Ball( float rad, float rest, float mass ){
    r = rad;
    e = rest;
    m = mass;
    
    dt = 0.08;
    g = 9.81;
    
    D = 0.01*0.5*0.5*PI*(r/1000)*(r/1000);
    x = random(100,width-100);
    y = random(50,height-400);
    vmag = random(50,75);
    theta = random(PI/4,3*PI/4);
    vx = vmag*cos(theta);
    vy = vmag*sin(theta);
  }
  
  void update( PImage img ){
    
    x = x + vx*dt;
    y = y + vy*dt;
    vx = vx + ax*dt;
    vy = vy + ay*dt;
    vmag = sqrt( sq(vx) + sq(vy) );
    ax = -(D/m)*vmag*vx;
    ay = -g-(D/m)*vmag*vy;
    
    if( x >= width - 2*r ){
      x = width - 2*r - 1;
      vx *= -e;
      ax *= -1;
    }
    else if( x <= 0 ){
      x =  1;
      vx *= -e;
      ax *= -1;
    }
    if( y >= height - 2*r ){
      y = height - 2*r ;
      vy *= -e;
      ay *= -1;
    }
    else if( y <= 2*r ){
      y = 2*r + 1;
      vy *= -e;
      ay *= -1;
    }
    
    image(img,x,height-y-150,2*r,2*r);
  }
  
}
