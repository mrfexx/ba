function [  ] = einlesen_jpg( datei )
Bild1=imread(datei);
Bild_Ausgabe=rgb2gray(Bild1);
%Konvertiert BILD1 von Farb zu Graustufen
%image(Bild_Ausgabe);
imshow(Bild_Ausgabe);
end

