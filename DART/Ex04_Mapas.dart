void main() {
  
 final pokemon = {
   "Name": "Pikachu",
   "HP" : 100,
   "isAlive":true,
   "abilities":["impact trueno","cola de hierro", "Rapido"],
   "sprites":
   {
     1: "pikachu/front.png",
     2: "pikachu/back.png"
   }
 };
  
final Map<String, dynamic>trainer={
    'Name':'Ash Ketchup',
    'Gender':'Male',
    'Age':12,
    'isGymnasiumLeader':false
};

final pokemons={
  1: "Pikachu",
  2:"Charmander",
  3: "Squiret",
  4: "Pidgeot"
};
  
  //imprimir los datos de un mapa
  print("""
  Los datos actuales del mapa son:
  pokemon = $pokemon
  Trainer = $trainer
  Pokemons = $pokemons
  """);


  print("*****************************************************************************");
  print("""
  Accediento a las propiedades del pokemon usando los braquets/corchetes[]
  :
  ----------------------------------------------
  Nombre = ${pokemon['Name']}
  HP = ${pokemon['HP']}
  Vivo = ${pokemon['isAlive']}
  Sprites = ${pokemon['sprites']}
  -------------------------------
  }
  """);

//reto 01: obtener el valor independiente de las imagenes de front y back del pokemon

//front: ${pokemon['sprites'][1]}
//back: ${pokemon['sprites'][2]}

//dado que la solucion ya esta obsolete lo que queda es crear una nueva
//variable con el objeto y destructurar las imagenes para acceder a ellas

final tmp_sprites = pokemon['sprites'] as Map<int, String>;

print("""
Accediento a las propiedades del pokemon usando los braquets/corchetes[]
 :
  ----------------------------------------------
  Nombre = ${pokemon['Name']}
  HP = ${pokemon['HP']}
  Vivo = ${pokemon['isAlive']}
  Sprites = ${pokemon['sprites']}
  ---------------------------------------------
  Back: ${tmp_sprites[2]}
  Front: ${tmp_sprites[1]}

""");
}
