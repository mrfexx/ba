function scalespace(datei)
%% Wenn .jpg
%bild = imread(datei);
%bild_gray = rgb2gray(bild);
%[bild_ind,map] = gray2ind(bild_gray, 255);
%G0 = im2double(bild_ind);


%% Aufruf aus Curvature
G = datei;
fg = fspecial('gaussian',[3 3],2);
% Filtern
x= 1;
while x<100
    G = imfilter(G,fg,'same');
    x = x+1;
    figure(1),subplot(1,2,1), imshow(G);
    figure(1),subplot(1,2,2), imshow(datei-G);
   
    
end;

    






%figure(1),
%subplot(2,2,1), imshow(bild);
%figure(1),
%subplot(2,2,2), imshow(G0);
%figure(1),
%subplot(2,2,3), imshow(G1);
%figure(1), subplot(2,2,4), imshow(G2);

end

