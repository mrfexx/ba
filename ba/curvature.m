function [  ] = curvature(  )
datei = imread('foto3.jpg');
datei = imresize(datei, 1);
Bild=rgb2gray(datei);
[Bild_ind,map] = gray2ind(Bild, 255);
Bild_ind = im2double(Bild_ind);

%Ausgabe ob Bild richtig konvertiert wurde
%figure(1);
%subplot(2,1,1);
%imshow(Bild_ind);

[height, width] = size(Bild_ind);


[Lx,Ly] = gradient(Bild_ind);
[Lxx,Lxy] = gradient(Lx);
[~,Lyy]=gradient(Ly);
figure('name','Funktion contour mit unsortierten Gradienten'), contour(Bild_ind), hold on, quiver(Lx, Ly), hold off

k = (-(Ly.^2).*Lxx + 2.*Lx.*Ly.*Lxy - (Lx.^2).*Lyy)./((((Lx.^2) + (Ly.^2)).^3/2)+eps);

figure('name', 'kkk');
%subplot(2,1,2);
imshow(k, map); 


curvedness = sqrt(Lxx.^2 + 2*Lxy.^2 + Lyy.^2);
D = - (((Lx.^2 + Ly.^2)))./((Ly.^2.*Lxx - 2*Lx.*Lxy.*Ly + Lx.^2.*Lyy));
Dx = Lx.*D;
Dy = Ly.*D;

%figure
%subplot(2,1,1);
%imshow(D,map);
%subplot(2,1,2);
figure('name','Curvedness&Gradient'), imshow(curvedness), hold all, quiver(Dx,Dy);
figure('name','Nur Gradient Dx,Dy'), quiver(Dx,Dy),
figure('name','D'), imshow(D);

%Anzeige der GrÖßen
    [wd_Dx,hg_Dx] = size(Dx);
    [wd_Dy,hg_Dy] = size(Dy);
    [m,n] = size(D);
    m,n
    wd_Dx, hg_Dx, wd_Dy, hg_Dy
    width
    height


    
for i= 1:height
    for j=1:width
        x = i + round(Dx(i,j));
        y = j + round(Dy(i,j));
        if D(i,j) > 0
            centermap(x,y) = curvedness(i,j);
        end
    end
end
K= centermap
figure(5),imshow(K);
end

