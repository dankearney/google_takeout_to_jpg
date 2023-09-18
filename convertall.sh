#!/bin/bash

exiftool -r -d %s -tagsfromfile "%d/%F.json" "-GPSAltitude<GeoDataAltitude" "-GPSLatitude<GeoDataLatitude" "-GPSLatitudeRef<GeoDataLatitude" "-GPSLongitude<GeoDataLongitude" "-GPSLongitudeRef<GeoDataLongitude" "-Keywords<Tags" "-Subject<Tags" "-Caption-Abstract<Description" "-ImageDescription<Description" "-DateTimeOriginal<PhotoTakenTimeTimestamp" -ext "*" -overwrite_original -progress --ext json .

mogrify -format jpg *.PNG
mogrify -format jpg *.HEIC

rm *.json
rm *.HEIC
rm *.PNG

find . -type f  ! -name "*.*"  -delete

rename "s/jpeg/jpg/" *.jpeg

exiv2 -r'%Y_%m_%d__%H_%M_%S' -F *.jpg
