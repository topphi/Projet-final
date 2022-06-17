//Projet Final: Pong
//@authors Phildakill et devinisdevin
//@version 17 juin 2022

int GrectY = 350;  //Variable pour le rectangle a la gauche
int DrectY = 350;  //Variable pour le recangle a la droite

float ellX = width / 2; // Float veut dire double, ell veut dire l'ellipse pour les mouvements sur l'axe des X et des Y
float ellY = height / 2;

boolean moveD = true; //Boolean pour le mouvement  vers la droite
boolean moveB = true; //Boolean pour le mouvement vers le bas
boolean wPressed = false; //Boolean pour la touche "w"
boolean sPressed = false; //Boolean pour la touche "s"
boolean oPressed = false; //Boolean pour la touche "o"
boolean lPressed = false; //Boolean pour la touche "l"

float éclair = 3; //mouvement pour la balle
float éclairH = 4; //vers le haut

int countR = 0; //Variable pour garder le pointage du joueur a la droite
int countG = 0; //Variable pour garder le pointage du joueur a la gauche

PFont font; //Pour être capable d'importer la police pour l'écriture

void setup () {
  
  size (700, 700); //La grandeur de l'écran
  background (0); //Couleur de l'arrièreplan
  font = loadFont("Bauhaus93-48.vlw"); // La police pour l'écriture dans le jeux
  }

  
void draw () {
  
  background (0); // Pour ne pas laisser des traces des rectangles
  
  textFont (font); //Appliquer la police
  
  fill(250, 0, 500); //Couleur, text et coordonée
  ellipse (ellX, ellY, 40, 40); //Grandeur et placement de l'ellipse
  text ("Pong", 300, 40); //Coordonées pour le mot pong
  
  fill (0, 255, 0);
  rect (30, GrectY, 15, 100); //Rectangle à la gauche couleur etc..
  text (countG, 200, 50); //Coordonées pour le pointage pour le joueur a la gauche
  
  fill (0, 0, 255);
  rect (650, DrectY, 15, 100); //Rectangle à la droite couleur etc.
  text (countR, 500, 50);; //Coordonées pour le pointage pour le joueur a la gauche
  
  // Mouvement du rectangle à la gauche
    if ( wPressed ) 
    {
      GrectY = GrectY - 10; //laisse le rectangle bouger vers le haut
    }
    
    if ( sPressed ) 
    {
      GrectY = GrectY + 10; // laisse le rectangle bouger vers le bas
    }
    
    // Mouvement du rectangle a la droite
    if ( oPressed )
    {
      DrectY = DrectY - 10; //vers le haut
    }
    
    if ( lPressed )
    {
      DrectY = DrectY + 10; //vers le bas
    } 
  
  
  if (moveD == true) //mouvements constant de la balle
  {
    ellX = ellX + éclair;  //établis que la balle bouge vers la droite, vitesse se fait modifier
  }
  else {
    ellX = ellX - éclair; //établis que la balle bouge vers la gauche, vitesse se fait modifier
  }
  
  if (moveB == true) //établis que la balle bouge vers le bas, vitesse se fait modifier
  {
    ellY = ellY + éclairH;
  }
  else {
    ellY = ellY - éclairH; //établis que la balle bouge vers le haut, vitesse se fait modifier
  }
  if (GrectY <= 10) { 
    moveB = true;
  }
  if (DrectY >= 690) { 
    moveB = false;
  }
  if (ellY <= 10) { //créer la bordure en haut pour que la balle puisse bouger vers le bas quand elle frappe le haut
    moveB = true;
    éclair = random(4, 9); //numéro au hasard pour la vitesse de la balle a l'horizontal
    éclairH = random(5, 8); //numéro au hasard pour la vitesse de la balle a la verticale
  }
  
  if (ellY >= 690) { //créer la bordure du bas pour que la balle puisse bouger vers le haut quand elle frappe le bas
    moveB = false;
    éclair = random(4, 9); //numéro au hasard pour la vitesse de la balle a l'horizon
    éclairH = random(5, 8); //numéro au hasard pour la vitesse de la balle a l'horizon
  }
  
  if (ellX >= 690) { //créer la bordure à la droite pour marquer un point
    countG ++; //ajouter au pointage de la gauche
    ellX = width / 2; //Ceci est le reset de la balle (les lignes en dessous aussi)
    ellY = height / 2;
    éclair = random(4, 5); //vitesse pour le reset
    éclairH = random(4, 5); 
  }
  
  if (ellX <= 10) { //Même chose que les lignes d'en haut mais pour la bordure a la gauche
    countR++;
    ellX = width / 2;
    ellY = height / 2;
    éclair = random(4, 5);
    éclairH = random(5, 6);
    
  }
  
  
  if (ellX >= 615 && ellY > DrectY && ellY < (DrectY + 100)) { //Code pour quand la balle frappe la raquette elle revient de l'autre bord
    moveD = false; //Boolean pour le mouvement vers le bas
    éclair = random(4, 9); //Une fois que la balle frappe elle accelere a 4 ou 9
    éclairH = random(5, 8); //Même chose mais verticale et 5 et 8
  }
  if (ellX <= 75 && ellY > GrectY && ellY < (GrectY + 100)) { //^ Même chose que le code d'en haut mais pour l'autre raquette
    moveD = true; //Boolean pour le mouvement vers le b
    éclair = random(4, 9); //Une fois que la balle frappe elle accelere a 4 
    éclairH = random(5, 8); //Même chose mais verticale et 5 et 8
  }
  
}

void keyPressed( ){ //Les codes key pressed et key released sont pour que deucx joueurs puissent jouer en même temps
      if ( key == 'w') 
    {
      wPressed = true; //Pour la clé W
    }
    
    if (key == 's') 
    {
     sPressed = true; //Pour la clé S
    }
    
    // Mouvement du rectangle a la droite
    if (key == 'o')
    {
     oPressed = true; //Pour la clé O
    }
    
    if (key == 'l') //Pour la clé L
    {
      lPressed = true;
    } 
}

void keyReleased( ){
      if ( key == 'w') 
    {
      wPressed = false; //Pour la clé W
    }
    
    if (key == 's') 
    {
      sPressed = false; //Pour la clé S
    }
    
    // Mouvement du rectangle a la droite
    if (key == 'o') 
    {
      oPressed = false; //Pour la clé O
    }
    
    if (key == 'l')
    {
      lPressed = false; //Pour la clé L
    } 
}
