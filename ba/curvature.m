function [  ] = curvature(  )
%%Einlesen, Resize und Indizieren
close all;
datei = imread('foto7.jpg');
datei = imresize(datei, 1);
Bild=rgb2gray(datei);
[Bild_ind,map] = gray2ind(Bild, 255);
Bild_ind = im2double(Bild_ind);
[hoehe, breite] = size(Bild_ind);
%Test ob Bild richtig konvertiert wurde
%figure(1), imshow(Bild_ind);
Bild_double = im2double(Bild);
%figure(2), imshow(Bild_double);

%% Prewitt Operator
% Gx = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
% Gy = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
% Z1 = conv2(Bild_ind,Gx,'same'); 
% Z2 = conv2(Bild_ind,Gy,'same'); 
% Bild_ind = sqrt(Z1.^2 + Z2.^2); 
% figure, imshow(Bild_ind);

%% Berechnung Gradient und Isophote Curvature
[Lx,Ly] = gradient(Bild_double);
[Lxx,Lxy] = gradient(Lx);
[~,Lyy]=gradient(Ly);

%for x= round(breite/2): breite
%   for y=  1:hoehe       
%            Lxx(y,x) = -Lxx(y,x);
%            Lxy(y,x) = -Lxy(y,x);
%    end
%end
%
%for x= 1:breite
%    for y= round(hoehe/2):hoehe
%        Lyy(y,x) = -Lyy(y,x);
%        Lyx(y,x) = -Lyx(y,x);
%    end
%end
%figure, quiver(Lyx,Lyy);

%for x = 1: breite
%    for y = 1: hoehe
%        if Lx(y,x) < 0 && Lxx(y,x) >0
%            Lxx(y,x) = -Lxx(y,x);
%        end
%        if Lx(y,x) >0 && Lxx(y,x) < 0 
%            Lxx(y,x) = -Lxx(y,x);
%        end
%        if Ly(y,x) < 0 && Lxy(y,x) >0
%            Lxy(y,x) = -Lxy(y,x);
%        end
%        if Ly(y,x) >0 && Lxy(y,x) < 0 
%            Lxy(y,x) = -Lxy(y,x);
%        end
%    end
%end
%% Butterworthfilter
% [b a] = butter(5,0.5/(0.5*2),'low'); % Koeffizienten der Übertragungsfunktion, f_tp ist die Grenzfrequenz, fs die Abtastfrequ., Butterworthfilter
% Lxx = filter(b,a,Lxx); 
% Lxy = filter(b,a,Lxy);
% Lyy = filter(b,a,Lyy);

%% Laplacefilter
% fg = fspecial('laplacian', 1);
% Lxx = imfilter(Lxx,fg,'same');
% Lxy = imfilter(Lxy,fg, 'same');



%figure, quiver(Lxx,Lxy);
curvedness = sqrt((Lxx.^2) + 2*(Lxy.^2) + (Lyy.^2));
%k  = -(((Ly.^2).*Lxx - 2.*Lx.*Ly.*Lxy + (Lx.^2).*Lyy)     ./((((Lx.^2) + (Ly.^2)).^3/2)+eps));
%k2 = -(((Ly.^2).*Lxx - 2.*Lx.*Lxy.*Ly + (Lx.^2).*Lyy)+eps)./((((Lx.^2) + (Ly.^2)).^3/2));
%D2 = (k2).^-1;


%Ausgabe zur Überprüfung
% subplot(2,1,2);
% figure, imshow(D2);
% figure, imshow(k);
% figure(3), surf(D2);
% figure('name','Funktion contour mit unsortierten Gradienten'), contour(Bild_ind), hold on, quiver(Lx, Ly), hold off




%% Berechnung von D

D = - ((((Lx.^2) + (Ly.^2)).^(3/2))./((((Ly.^2).*Lxx) - (2.*Lx.*Lxy.*Ly) + ((Lx.^2).*Lyy))));

% D = abs(D);
% figure, surf(D);
% for x = 1:hoehe
%    for y = 1:breite
%        if D(x,y) > 0 
%            D(x,y)=0;
%        end
%    end
% end

Dx = Lx.*D;
Dy = Ly.*D;
%figure, imshow(D);

%% Gaussfilter
% fg = fspecial('gaussian',[3 3],2);
% G = imfilter(D,fg,'same');
% figure, imshow(G);
% Gx = Lx.*G;
% Gy = Ly.*G;


%% Alle Ausgaben
% figure
% subplot(2,1,1);
% imshow(D,map);
% subplot(2,1,2);

%figure('name','Curvedness&Gradient'), imshow(curvedness);%, hold all, quiver(Dx,Dy);
%figure('name','Nur Gradient Dx,Dy'), quiver(Dx,Dy),
% figure('name','D'), imshow(D);
% figure('name','Lxx,Lxy'), quiver(Lxx,Lxy);
% figure('name', 'test'), quiver(Lx,Ly);

% Anzeige der GrÖßen
% [wd_Dx,hg_Dx] = size(Dx);
% [wd_Dy,hg_Dy] = size(Dy);
% [m,n] = size(D);
% m,n;
% wd_Dx, hg_Dx, wd_Dy, hg_Dy;
breite  = int32(breite);
hoehe = int32(hoehe);
   


%% Centermap und Centervoting
%array=zeros(hoehe, breite);
centermap=zeros(hoehe, breite);
for x= 1:hoehe
    for y=1:breite
        x1 = x + round(Dx(x,y));
        y1 = y + round(Dy(x,y));
         if D(x,y)>0
            if x1 > 0 && y1 > 0 && x1 < hoehe+1 && y1 < breite+1
                centermap(x1,y1) = curvedness(x,y) + centermap(x1,y1);
                %array(x1,y1) = centermap(x1,y1);
            end
         end
    end
end



K= centermap;
%figure(7),surf(K);
%figure, imshow(K);
figure, imshow(K);

fg = 4/16.*[1, 2, 1; 2, 4, 2; 1, 2, 1];
erg1 = conv2(K-curvedness,fg,'same');


fg = fspecial('gaussian',[3 3],0.5);
erg2 = imfilter(K-curvedness,fg,'same');

figure, imshow(erg1);
figure, imshow(erg2);


end

