%% Wavelet-Zerlegung mit Haar-Wavelet
% entspricht Aufgabe "Multiraten-Filterbank" aus MSV-Übungsskript
%
% (c) Julian Baumann, IIIT 09/2003

% Signal x(t);
x = sin(0:pi/7:pi);  % ergibt einen Vektor der Länge 8
%x = [zeros(1,10) 1 zeros(1,10)]; 

% manuelles Filtern von x für erste Zerlegungsstufe:
ca1manual = filter([1/sqrt(2) 1/sqrt(2)],1,x);
cd1manual = filter([-1/sqrt(2) 1/sqrt(2)],1,x);
% downsamplen, nur gerade Indizes behalten:
ca1man = downsample(ca1manual,2,1);
cd1man = downsample(cd1manual,2,1);
