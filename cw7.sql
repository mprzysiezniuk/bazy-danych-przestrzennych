CREATE DATABASE rasters;

CREATE EXTENSION postgis_raster;

sudo -u postgres pg_restore --dbname=rasters --verbose postgis_raster.backup

raster2pgsql -s 3763 -N -32767 -t 100x100 -I -C -M -d srtm_1arc_v3.tif rasters.dem

raster2pgsql -s 3763 -N -32767 -t 100x100 -I -C -M -d srtm_1arc_v3.tif rasters.dem

raster2pgsql -s 3763 -N -32767 -t 128x128 -I -C -M -d Landsat8_L1TP_RGBN.tif rasters.landsat8

alter schema_name rename to przysiezniuk;
