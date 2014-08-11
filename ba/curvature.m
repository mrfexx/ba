function [  ] = curvature(  )
%%Einlesen, Resize und Indizieren
close all;
datei = imread('foto1.jpg');
datei = imresize(datei, 0.2);
Bild=rgb2gray(datei);
[Bild_ind,map] = gray2ind(Bild, 255);
Bild_ind = im2double(Bild_ind);
[hoehe, breite] = size(Bild_ind);
%Test ob Bild richtig konvertiert wurde
%figure(1), imshow(Bild_ind);


%% Berechnung Gradient und Isophote Curvature
[Lx,Ly] = gradient(Bild_ind);
[Lxx,Lxy] = gradient(Lx);
[~,Lyy]=gradient(Ly);

for x= round(breite/2): breite
    for y=  1:hoehe       
            Lxx(y,x) = -Lxx(y,x);
            Lxy(y,x) = -Lxy(y,x);
    end
end

curvedness = sqrt(Lxx.^2 + 2*Lxy.^2 + Lyy.^2);
x = -((Ly.^2).*Lxx - 2.*Lx.*Ly.*Lxy + (Lx.^2).*Lyy)./((((Lx.^2) + (Ly.^2)).^3/2)+eps);
k2 = (((Ly.^2.*Lxx+2.*Lx.*Lxy.*Ly+Lx.^2.*Lyy))./(((Lx.^2+Ly.^2).^3/2)));
D2 = k2.^-1;
%Ausgabe zur �berpr�fung
%subplot(2,1,2);
%figure, imshow(D2);
%figure('name', 'kkk'), imshow(k, map);
%figure('name','Funktion contour mit unsortierten Gradienten'), contour(Bild_ind), hold on, quiver(Lx, Ly), hold off




%% Berechnung von D

D = - (((Lx.^2 + Ly.^2))+eps)./((Ly.^2.*Lxx - 2*Lx.*Lxy.*Ly + Lx.^2.*Lyy)+eps);
for x = 1:breite
    for y = 1:hoehe
        if D(y,x) > 1000 
            D(y,x)=1000;
        end
        if D(y,x) < -1000
            D(y,x)=1000;
        end
    end
end

Dx = Lx.*D;
Dy = Ly.*D;


%% Alle Ausgaben
%figure
%subplot(2,1,1);
%imshow(D,map);
%subplot(2,1,2);

%figure('name','Curvedness&Gradient'), imshow(curvedness);%, hold all, quiver(Dx,Dy);
%figure('name','Nur Gradient Dx,Dy'), quiver(Dx,Dy),
%figure('name','D'), imshow(D);
%figure('name','Lxx,Lxy'), quiver(Lxx,Lxy);
%figure('name', 'test'), quiver(Lx,Ly);

%Anzeige der Gr��en
%[wd_Dx,hg_Dx] = size(Dx);
%[wd_Dy,hg_Dy] = size(Dy);
%[m,n] = size(D);
%m,n;
%wd_Dx, hg_Dx, wd_Dy, hg_Dy;
breite  = int32(breite);
hoehe = int32(hoehe);
   


%% Centermap und Centervoting
array(1:hoehe,1:breite)  = 0;
for x= 1:breite
    for y=1:hoehe
        x1 = x + round(Dx(y,x));
        y1 = y + round(Dy(y,x));
        if x1 > 0 && y1 > 0 && x1 < breite && y1 < hoehe
            
            centermap(y1,x1) = curvedness(y,x) + array(y1,x1);
            array(y1,x1) = centermap(y1,x1);
        end
    end
end
K= centermap;
figure,imshow(K);


end

