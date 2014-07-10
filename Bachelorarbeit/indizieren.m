function [ Bild1, Bild_Ausgabe ] = indizieren( datei )
if datei
Bild1=imread(datei);
Bild_Ausgabe=rgb2gray(Bild1);
[Bild_Ausgabe,map] = gray2ind(Bild_Ausgabe,256);
colormap(map);

%Bild_Ausgabe=imresize(Bild_Ausgabe, 0.2);
%Bildgröße Anpassen

figure(1);
subplot(2,2,1);
imagesc(Bild_Ausgabe);



subplot(2,2,3)
Bild_Ausgabe=flipdim(Bild_Ausgabe, 1);
contour(Bild_Ausgabe, 4);

%disp(Bild_Ausgabe(3,2));
%disp(Bild_Ausgabe);
%Werte der indizierten Datei
axis image;


end

