function [  ] = indizieren( datei )
Bild=imread(datei);
Bild1=rgb2gray(Bild);
%[IND,map] = rgb2ind(Bild1,2);
[IND,map] = gray2ind(Bild1,256);
figure(1);
imagesc(IND);
colormap(map);
axis image;
end

