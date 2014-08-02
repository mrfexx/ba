function [  ] = curvature(  )
datei = imread('foto4.jpg');
datei = imresize(datei, 0.1);
Bild=rgb2gray(datei);
[Bild_ind,map] = gray2ind(Bild, 255);
Bild_ind = im2double(Bild_ind);

%figure(1);
%subplot(2,1,1);
%imshow(Bild2);

[height, width] = size(Bild_ind);
[Lx,Ly] = gradient(Bild_ind);
[Lxx,Lxy] = gradient(Lx);
[~,Lyy]=gradient(Ly);
%figure(2), contour(Bild1), hold on, quiver(Lx, Ly), hold off
k= (-(Ly.^2).*Lxx + 2.*Lx.*Ly.*Lxy - (Lx.^2).*Lyy)./((((Lx.^2) + (Ly.^2)).^3/2)+eps);

%figure(1);
%subplot(2,1,2);
%imshow(k, map); 


curvedness = sqrt(Lxx.^2 + 2*Lxy.^2 + Lyy.^2);
D = - (((Lx.^2 + Ly.^2)))./((Ly.^2.*Lxx - 2*Lx.*Lxy.*Ly + Lx.^2.*Lyy));
D(isnan(D))=0; 
D(~isfinite(D))=0;
Dx = Ly.*D;
Dy = Lx.*D;
%figure
%subplot(2,1,1);
%imshow(D,map);
%subplot(2,1,2);
figure(1), imshow(curvedness), figure(2), quiver(Dx,Dy),
figure(3), quiver(Lx,Ly);
figure(4), imshow(D);
%Anzeige der Größen

    [wd_Dx,hg_Dx] = size(Dx);
    [wd_Dy,hg_Dy] = size(Dy);
    [m,n] = size(D);
    m,n
    wd_Dx, hg_Dx, wd_Dy, hg_Dy
    width
    height


%for i= 1:width
%    for j=1:height
%        x = i + round(Dx(i,j));
%        y = j + round(Dy(i,j));
%        if D(i,j) > 0 then
%            centermap(x,y) = curvedness(i,j);
%        end
%    end
%end
%K= centermap

%I = curvedness;
%G = fspecial('gaussian',[5 5],2);
%# Filter it
%Ig = imfilter(I,G,'same');
%# Display
%figure(2), imshow(Ig)
end

