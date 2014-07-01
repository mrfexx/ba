function [ output_args ] = indizieren( datei )
Bild1=imread(datei);
[Bild_Ausgabe,map] = rgb2ind(Bild1,2);
%Bild_Ausgabe=rgb2gray(Bild_Ausgabe);
imagesc(Bild_Ausgabe);
colormap(map);
contour(Bild_Ausgabe);
axis image;

end

