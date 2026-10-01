#GDAL Mosaic

gdalinfo --version

cd /d "E:\Tile_S2_2026_JulSep24_TW3"

dir /b

gdalinfo "Sul_MosTile_118_-2.tif"

if exist "tile_list.txt" del /q "tile_list.txt"

dir /b /a-d *.tif > tile_list.txt

gdalbuildvrt -overwrite -input_file_list tile_list.txt "Sul_Mosaic_2026_TW3.vrt"

gdalinfo "Sul_Mosaic_2026_TW3_3.vrt" | findstr /C:"Size is" /C:"Pixel Size" /C:"Band "

gdal_translate "Sul_Mosaic_2026_TW3.vrt" "Sul_Mosaic_2026_TW3.tif" -co TILED=YES -co COMPRESS=LZW -co PREDICTOR=2 -co BIGTIFF=YES -co NUM_THREADS=ALL_CPUS

gdalinfo "Sul_Mosaic_2026_TW3.tif"

#Kalau dia file xml maka harus dibersihkan file tif. 
#dengan script

del tile_list.txt