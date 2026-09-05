# chords
chords_of_songs

# start

### build image
 docker build --no-cache --progress=plain -t cancionero-chordpro .
### validate image chordpro
 docker images | grep cancionero-chordpro 

### crear pdf , reemplazar el nombre prueba , por la canción que quieres

en el directorio /songs , se encuentran los archivos .cho que contienen el formato para crear tus cancioneros 
docker run --rm \
  -v "$PWD/songs:/songs" \
  -v "$PWD/pdf:/pdf" \
  cancionero-chordpro \
  /songs/prueba.cho \
  -o /pdf/prueba.pdf

### open pdf
open pdf/prueba.pdf

docker run --rm \
  -v "$PWD/songs:/songs" \
  -v "$PWD/pdf:/pdf" \
  cancionero-chordpro \
  /songs/nada_nuevo_bajo_sol.cho \
  -o /pdf/nada_nuevo_bajo_sol.pdf


### usar cel config json
