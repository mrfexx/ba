function [  ] = einlesen_png( datei )
Bild1=imread(datei,'BackgroundColor','none');
image(Bild1); 
end
