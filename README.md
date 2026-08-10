# chords
chords_of_songs

# start

### build image
 docker build --no-cache --progress=plain -t cancionero-chordpro .
### validate 
 docker images | grep cancionero

### crear pdf , reemplazar el nombre prueba , por la canción que quieres
docker run --rm \
  -v "$PWD/songs:/songs" \
  -v "$PWD/pdf:/pdf" \
  cancionero-chordpro \
  /songs/prueba.cho \
  -o /pdf/prueba.pdf