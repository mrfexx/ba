%% Prewitt Operator
Gx = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
Gy = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
Z1 = conv2(Bild_ind,Gx,'same'); 
Z2 = conv2(Bild_ind,Gy,'same'); 
Bild_ind = sqrt(Z1.^2 + Z2.^2); 


%% Sobel Operator
Gx = [1, 0, -1; 2, 0, -2; 1, 0, -2];
Gy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
Z1 = conv2(Bild_ind,Gx,'same'); 
Z2 = conv2(Bild_ind,Gy,'same'); 
Bild_ind = sqrt(Z1.^2 + Z2.^2); 

%% Butterworthfilter
[b a] = butter(5,0.5/(0.5*2),'low'); % Koeffizienten der Übertragungsfunktion, f_tp ist die Grenzfrequenz, fs die Abtastfrequ., Butterworthfilter
Lxx = filter(b,a,Lxx); 
Lxy = filter(b,a,Lxy);
Lyy = filter(b,a,Lyy);




%% Laplacefilter
%fg = fspecial('laplacian', 1);
%Lxx = imfilter(Lxx,fg,'same');
%Lxy = imfilter(Lxy,fg, 'same');



%% Gaussfilter
%fg = fspecial('gaussian',[3 3],1);
%G = imfilter(D,fg,'same');
%figure, imshow(G);
%Gx = Lx.*G;
%Gy = Ly.*G;


%% Gaussfilter mit conv2
%fg = [1, 2, 1; 2, 4, 2; 1, 2, 1];
%Z1 = conv2(Bild_ind,fg,'same'); 