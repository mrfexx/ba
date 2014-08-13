x = linspace(-50, 50);
y= 0.5.*x.^2;
d = x;
e = 1;


k  = e./((1+d).^1.5);

figure, %plot(y), hold on,
plot(k), hold off;