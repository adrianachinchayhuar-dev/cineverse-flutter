// Datos locales: selección editorial, sin API ni estadísticas de audiencia.
final List<Map<String, dynamic>> peliculas = [
  {
    "id": 1,
    "imagen": "assets/images/cinema/charge-poster.webp",
    "fuente": "https://studio.blender.org/projects/charge/",
    "tipo": "Película",
    "portada": "assets/images/cinema/charge-cover.jpg",
    "duracion": "≈ 4 min",
    "anio": 2022,
    "reparto": "Sin diálogos. Personajes: Einar y el robot de seguridad.",
    "titulo": "Charge",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Acción",
    "banner": "assets/images/cinema/charge-banner.webp",
    "descripcion":
        "En una ciudad que se queda sin energía, un hombre irrumpe en una fábrica de baterías. Un robot de seguridad convierte su búsqueda en una lucha por sobrevivir.",
    "generos": ["Acción", "Ciencia ficción", "Animación"],
    "respaldo": "assets/images/cinema/charge-poster.webp",
  },
  {
    "id": 2,
    "imagen": "assets/images/cinema/sprite-fright-poster.webp",
    "fuente": "https://studio.blender.org/projects/sprite-fright/",
    "tipo": "Película",
    "portada": "assets/images/cinema/sprite-fright-cover.jpg",
    "duracion": "≈ 10 min",
    "anio": 2021,
    "reparto":
        "Personajes: Ellie, sus compañeros de excursión y los sprites del bosque.",
    "titulo": "Sprite Fright",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Terror",
    "banner": "assets/images/cinema/sprite-fright-banner.webp",
    "descripcion":
        "Una excursión adolescente se adentra en un bosque lleno de pequeñas criaturas. Lo que parecía un encuentro inocente se convierte en una inesperada pesadilla.",
    "generos": ["Terror", "Comedia", "Animación"],
    "respaldo": "assets/images/cinema/sprite-fright-poster.webp",
  },
  {
    "id": 3,
    "imagen": "assets/images/cinema/wing-it-poster.webp",
    "fuente": "https://studio.blender.org/projects/wing-it/",
    "tipo": "Película",
    "portada": "assets/images/cinema/wing-it-cover.jpg",
    "duracion": "≈ 4 min",
    "anio": 2023,
    "reparto":
        "Sin diálogos. Personajes: el ingeniero y su inesperado copiloto.",
    "titulo": "Wing It!",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/wing-it-banner.webp",
    "descripcion":
        "Un meticuloso ingeniero recibe la visita de un aspirante a piloto demasiado entusiasta. Juntos terminan a bordo de una nave espacial completamente fuera de control.",
    "generos": ["Comedia", "Ciencia ficción", "Animación"],
    "respaldo": "assets/images/cinema/wing-it-poster.webp",
  },
  {
    "id": 4,
    "imagen": "assets/images/cinema/spring-poster.webp",
    "fuente": "https://studio.blender.org/projects/spring/",
    "tipo": "Película",
    "portada": "assets/images/cinema/spring-cover.jpg",
    "duracion": "≈ 8 min",
    "anio": 2019,
    "reparto": "Sin diálogos. Personajes: Spring y su perro Autumn.",
    "titulo": "Spring",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Drama",
    "banner": "assets/images/cinema/spring-banner.webp",
    "descripcion":
        "Una joven pastora y su perro deben despertar a los antiguos espíritus del valle. Una pequeña aventura sobre el valor, la naturaleza y el cambio de las estaciones.",
    "generos": ["Drama", "Aventura", "Animación"],
    "respaldo": "assets/images/cinema/spring-poster.webp",
  },
  {
    "id": 5,
    "imagen": "assets/images/cinema/agent-327-poster.webp",
    "fuente": "https://studio.blender.org/projects/agent-327/",
    "tipo": "Película",
    "portada": "assets/images/cinema/agent-327-cover.jpg",
    "duracion": "≈ 4 min",
    "anio": 2017,
    "reparto": "Personajes: el agente Hendrik IJzerbroot y Boris Kloris.",
    "titulo": "Agent 327",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Acción",
    "banner": "assets/images/cinema/agent-327-banner.webp",
    "descripcion":
        "Una pista lleva al agente 327 hasta una barbería aparentemente corriente. Allí le espera una misión en la que hasta el corte de pelo puede resultar peligroso.",
    "generos": ["Acción", "Comedia", "Animación"],
    "respaldo": "assets/images/cinema/agent-327-poster.webp",
  },
  {
    "id": 6,
    "imagen": "assets/images/cinema/tears-of-steel-poster.webp",
    "fuente": "https://studio.blender.org/projects/tears-of-steel/",
    "tipo": "Película",
    "portada": "assets/images/cinema/tears-of-steel-cover.jpg",
    "duracion": "≈ 12 min",
    "anio": 2012,
    "reparto": "Derek de Lint, Sergio Hasselbaink y Vanja Rukavina.",
    "titulo": "Tears of Steel",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Acción",
    "banner": "assets/images/cinema/tears-of-steel-banner.webp",
    "descripcion":
        "En un Ámsterdam del futuro, un equipo intenta recrear un recuerdo del pasado. El destino de la humanidad depende de una conversación y de una segunda oportunidad.",
    "generos": ["Acción", "Ciencia ficción", "Drama"],
    "respaldo": "assets/images/cinema/tears-of-steel-poster.webp",
  },
  {
    "id": 7,
    "imagen": "assets/images/cinema/sintel-poster.webp",
    "fuente": "https://studio.blender.org/projects/sintel/",
    "tipo": "Película",
    "portada": "assets/images/cinema/sintel-cover.jpg",
    "duracion": "≈ 15 min",
    "anio": 2010,
    "reparto":
        "Voces: Halina Reijn y Thom Hoffman. Personajes: Sintel y Scales.",
    "titulo": "Sintel",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Drama",
    "banner": "assets/images/cinema/sintel-banner.webp",
    "descripcion":
        "Una viajera solitaria encuentra a un pequeño dragón herido. Cuando desaparece, emprende una búsqueda que la llevará más lejos de lo que jamás imaginó.",
    "generos": ["Drama", "Aventura", "Animación"],
    "respaldo": "assets/images/cinema/sintel-poster.webp",
  },
  {
    "id": 8,
    "imagen": "assets/images/cinema/big-buck-bunny-poster.webp",
    "fuente": "https://studio.blender.org/projects/big-buck-bunny/",
    "tipo": "Película",
    "portada": "assets/images/cinema/big-buck-bunny-cover.jpg",
    "duracion": "≈ 10 min",
    "anio": 2008,
    "reparto": "Sin diálogos. Personajes: Bunny, Frank, Rinky y Gamera.",
    "titulo": "Big Buck Bunny",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/big-buck-bunny-banner.webp",
    "descripcion":
        "Un conejo de gran corazón solo quiere disfrutar de un día tranquilo. Tres pequeños alborotadores pondrán a prueba su paciencia y despertarán su ingenio.",
    "generos": ["Comedia", "Animación"],
    "respaldo": "assets/images/cinema/big-buck-bunny-poster.webp",
  },
  {
    "id": 9,
    "imagen": "assets/images/cinema/singularity-poster.webp",
    "fuente": "https://studio.blender.org/projects/singularity/",
    "tipo": "Película",
    "portada": "assets/images/cinema/singularity-cover.webp",
    "duracion": "Cortometraje",
    "anio": 2026,
    "reparto":
        "Personajes: una pequeña criatura espacial, seres luminosos y un misterioso guardián.",
    "titulo": "Singularity",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Ciencia ficción",
    "banner": "assets/images/cinema/singularity-banner.webp",
    "descripcion":
        "Un acontecimiento cósmico devora el hogar helado de una pequeña criatura. Su huida la conduce hasta un grupo de seres luminosos bajo la mirada de un enigmático guardián.",
    "generos": ["Ciencia ficción", "Aventura", "Animación"],
    "respaldo": "assets/images/cinema/singularity-poster.webp",
  },
  {
    "id": 10,
    "imagen": "assets/images/cinema/elephants-dream-poster.webp",
    "fuente": "https://studio.blender.org/projects/elephants-dream/",
    "tipo": "Película",
    "portada": "assets/images/cinema/elephants-dream-cover.jpg",
    "duracion": "≈ 11 min",
    "anio": 2006,
    "reparto": "Voces: Tygo Gernandt y Cas Jansen. Personajes: Proog y Emo.",
    "titulo": "Elephants Dream",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Ciencia ficción",
    "banner": "assets/images/cinema/elephants-dream-banner.webp",
    "descripcion":
        "Dos compañeros recorren una máquina imposible. Mientras uno conoce cada rincón, el otro empieza a cuestionar las reglas del extraño mundo que los rodea.",
    "generos": ["Ciencia ficción", "Drama", "Animación"],
    "respaldo": "assets/images/cinema/elephants-dream-poster.webp",
  },
  {
    "id": 11,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/94/55/94559f6e2562bfc8498072adcfa56dfa_s.webp",
    "fuente": "https://studio.blender.org/projects/cosmos-laundromat/",
    "tipo": "Película",
    "portada": "assets/images/cinema/cosmos-laundromat-cover.jpg",
    "duracion": "≈ 12 min",
    "anio": 2015,
    "reparto":
        "Voces: Pierre Bokma y Reinout Scholten van Aschat. Personajes: Franck y Victor.",
    "titulo": "Cosmos Laundromat",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Drama",
    "banner": "assets/images/cinema/cosmos-laundromat-banner.webp",
    "descripcion":
        "En una isla azotada por el viento, Franck recibe una oferta imposible de rechazar: vivir otras vidas. El primer ciclo de un viaje fantástico hacia lo desconocido.",
    "generos": ["Drama", "Comedia", "Animación"],
    "respaldo": "assets/images/cinema/cosmos-laundromat-poster.webp",
  },
  {
    "id": 12,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/1d/4e/1d4ee689dd4c0d08ea7357041f040d6b_s.webp",
    "fuente": "https://studio.blender.org/projects/glass-half/",
    "tipo": "Película",
    "portada": "assets/images/cinema/glass-half-cover.jpg",
    "duracion": "≈ 3 min",
    "anio": 2015,
    "reparto":
        "Personajes: dos visitantes de museo con opiniones completamente opuestas.",
    "titulo": "Glass Half",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/glass-half-banner.webp",
    "descripcion":
        "Dos aficionados al arte discuten sobre las obras de un museo. Entre desacuerdos y sorpresas, descubren que mirar lo mismo no significa ver lo mismo.",
    "generos": ["Comedia", "Animación"],
    "respaldo": "assets/images/cinema/glass-half-poster.webp",
  },
  {
    "id": 13,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/47/87/4787fcf7db77c2c751fb052d8313f9df_s.webp",
    "fuente": "https://studio.blender.org/projects/hero/",
    "tipo": "Película",
    "portada": "assets/images/cinema/hero-cover.jpg",
    "duracion": "≈ 4 min",
    "anio": 2018,
    "reparto":
        "Sin diálogos. Un héroe animado y un mundo que cambia a cada paso.",
    "titulo": "Hero",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Acción",
    "banner": "assets/images/cinema/hero-banner.webp",
    "descripcion":
        "Un protagonista se lanza a una aventura dibujada a mano. La acción y el humor transforman continuamente las reglas de este universo de animación 2D.",
    "generos": ["Acción", "Comedia", "Animación"],
    "respaldo": "assets/images/cinema/hero-poster.webp",
  },
  {
    "id": 14,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/e1/61/e16126cd776e07cb2df9984884302271_s.webp",
    "fuente": "https://studio.blender.org/projects/coffee-run/",
    "tipo": "Película",
    "portada": "assets/images/cinema/coffee-run-cover.jpg",
    "duracion": "≈ 3 min",
    "anio": 2020,
    "reparto": "Sin diálogos. Una mujer y los recuerdos de su relación.",
    "titulo": "Coffee Run",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Drama",
    "banner": "assets/images/cinema/coffee-run-banner.webp",
    "descripcion":
        "Una taza de café abre paso a un recorrido vertiginoso por los recuerdos de una relación. Una historia visual sobre los momentos que nos acompañan.",
    "generos": ["Drama", "Animación"],
    "respaldo": "assets/images/cinema/coffee-run-poster.webp",
  },
  {
    "id": 15,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/44/3c/443cbbca1b63fd9091deb826ef4fd0f1_s.webp",
    "fuente": "https://studio.blender.org/projects/dailydweebs/",
    "tipo": "Serie",
    "portada": "assets/images/cinema/dailydweebs-cover.jpg",
    "duracion": "≈ 1 min / episodio",
    "anio": 2017,
    "reparto":
        "Sin diálogos. Personajes: un perro y sus peculiares compañeros de casa.",
    "titulo": "The Daily Dweebs",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/dailydweebs-banner.webp",
    "descripcion":
        "Las pequeñas complicaciones de la vida cotidiana se convierten en grandes aventuras para estos personajes. Piloto de una propuesta de serie de comedia animada.",
    "generos": ["Comedia", "Animación"],
    "respaldo": "assets/images/cinema/dailydweebs-poster.webp",
  },
  {
    "id": 16,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/fe/e4/fee4b4ac994a3876e7fd952988d9ccb9_s.webp",
    "fuente": "https://studio.blender.org/projects/caminandes-3/",
    "tipo": "Serie",
    "portada": "assets/images/cinema/caminandes-3-cover.jpg",
    "duracion": "≈ 3 min / episodio",
    "anio": 2016,
    "reparto": "Sin diálogos. Personajes: Koro y Oti.",
    "titulo": "Caminandes: Llamigos",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/caminandes-3-banner.webp",
    "descripcion":
        "En el invierno patagónico, Koro compite con un pequeño pingüino por una deliciosa recompensa. Un nuevo episodio de Caminandes sobre la amistad y la generosidad.",
    "generos": ["Comedia", "Aventura", "Animación"],
    "respaldo": "assets/images/cinema/caminandes-3-poster.webp",
  },
  {
    "id": 17,
    "imagen":
        "https://studio.blender.org/files/public/thumbnail/68/96/68965b9b766cc7b45a50479bc622201e_s.webp",
    "fuente": "https://studio.blender.org/projects/caminandes-2/",
    "tipo": "Serie",
    "portada": "assets/images/cinema/caminandes-2-cover.jpg",
    "duracion": "≈ 3 min / episodio",
    "anio": 2013,
    "reparto": "Sin diálogos. Personaje principal: Koro, la llama.",
    "titulo": "Caminandes: Gran Dillama",
    "credito":
        "Imágenes: © Blender Foundation / Blender Studio · CC BY. Adaptación de encuadre para CineVerse.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/caminandes-2-banner.webp",
    "descripcion":
        "Koro encuentra una tentadora comida al otro lado de una cerca. Su empeño por alcanzarla desencadena una aventura llena de tropiezos y soluciones inesperadas.",
    "generos": ["Comedia", "Aventura", "Animación"],
    "respaldo": "assets/images/cinema/caminandes-2-poster.webp",
  },
  {
    "id": 18,
    "imagen":
        "https://upload.wikimedia.org/wikipedia/commons/0/0c/The_General_%281926%29_-_Movie_Poster_2.png",
    "fuente":
        "https://commons.wikimedia.org/wiki/File:The_General_(1926)_-_Movie_Poster_2.png",
    "tipo": "Película",
    "portada": "assets/images/cinema/the-general-banner.jpg",
    "duracion": "≈ 78 min",
    "anio": 1926,
    "reparto": "Buster Keaton, Marion Mack y Glen Cavender.",
    "titulo": "The General",
    "credito":
        "Imágenes: cine clásico / Wikimedia Commons · dominio público según las fichas de origen.",
    "genero": "Acción",
    "banner": "assets/images/cinema/the-general-banner.jpg",
    "descripcion":
        "Cuando roban su locomotora, un maquinista emprende una persecución extraordinaria. Ingenio, acrobacias y humor en uno de los grandes clásicos del cine mudo.",
    "generos": ["Acción", "Comedia", "Aventura"],
    "respaldo": "assets/images/cinema/the-general-poster.png",
  },
  {
    "id": 19,
    "imagen":
        "https://upload.wikimedia.org/wikipedia/commons/c/c1/Sherlock_jr_poster.jpg",
    "fuente": "https://commons.wikimedia.org/wiki/File:Sherlock_jr_poster.jpg",
    "tipo": "Película",
    "portada": "assets/images/cinema/sherlock-jr-banner.jpg",
    "duracion": "≈ 45 min",
    "anio": 1924,
    "reparto": "Buster Keaton, Kathryn McGuire y Joe Keaton.",
    "titulo": "Sherlock Jr.",
    "credito":
        "Imágenes: cine clásico / Wikimedia Commons · dominio público según las fichas de origen.",
    "genero": "Comedia",
    "banner": "assets/images/cinema/sherlock-jr-banner.jpg",
    "descripcion":
        "Un proyeccionista sueña con convertirse en detective. Al entrar en el mundo de la pantalla, encuentra un misterio donde nada permanece en su sitio.",
    "generos": ["Comedia", "Acción"],
    "respaldo": "assets/images/cinema/sherlock-jr-poster.jpg",
  },
  {
    "id": 20,
    "imagen":
        "https://upload.wikimedia.org/wikipedia/commons/b/b5/The_Kid_%281921%29_poster.jpg",
    "fuente":
        "https://commons.wikimedia.org/wiki/File:The_Kid_(1921)_poster.jpg",
    "tipo": "Película",
    "portada": "assets/images/cinema/the-kid-banner.jpg",
    "duracion": "≈ 53 min",
    "anio": 1921,
    "reparto": "Charles Chaplin, Jackie Coogan y Edna Purviance.",
    "titulo": "The Kid",
    "credito":
        "Imágenes: cine clásico / Wikimedia Commons · dominio público según las fichas de origen.",
    "genero": "Drama",
    "banner": "assets/images/cinema/the-kid-banner.jpg",
    "descripcion":
        "Un vagabundo acoge a un niño abandonado y juntos aprenden a sobrevivir. Una historia de complicidad, humor y afecto que atraviesa generaciones.",
    "generos": ["Drama", "Comedia"],
    "respaldo": "assets/images/cinema/the-kid-poster.jpg",
  },
];

const categorias = [
  'Acción',
  'Comedia',
  'Drama',
  'Terror',
  'Ciencia ficción',
  'Animación',
  'Aventura',
];
const tendenciasIds = [1, 2, 3, 9, 6, 7, 15, 18];
const topIds = [1, 7, 2, 6, 3, 8, 4, 9, 18, 10];
const recomendadasIds = [4, 11, 12, 14, 19, 20, 16, 17];

// Respetamos el orden de los identificadores para que el ranking sea estable.
List<Map<String, dynamic>> seleccion(List<int> ids) =>
    ids.map((id) => peliculas.firstWhere((p) => p['id'] == id)).toList();

String normalizar(String texto) {
  var resultado = texto.toLowerCase();
  const originales = 'áéíóúüñ';
  const reemplazos = 'aeiouun';
  for (var i = 0; i < originales.length; i++) {
    resultado = resultado.replaceAll(originales[i], reemplazos[i]);
  }
  return resultado;
}

String cantidadTitulos(int total) =>
    '$total ${total == 1 ? 'título' : 'títulos'}';
