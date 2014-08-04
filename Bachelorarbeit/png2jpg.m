function [  ] = png2jpg( datei )
image=imread(datei,'BackgroundColor','none');
k = gray2ind(image);
[image_ind,map] = gray2ind(image, 255);
image_ind = im2double(image_ind);
%image(Bild_ind); 
filename = dir(datei);
names = {filename.name};
names = regexprep(names,'.png','') ; %Endung entfernen
filenamenew = [names{:},'.jpg']; 
imwrite(image_ind, filenamenew);
end
