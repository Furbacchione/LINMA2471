%Image synthese Opti 2
x=linspace(0,10);
y=(x-1).*(x-5).*(x-4).*(x-9); %1 5 4 9

pol=polyfit(x,y,4);
der=pol(1:4).*[4 3 2 1];
nab=der(1:3).*[3 2 1];



plot(x,y,'linewidth',2);hold on;

%on construit autour du point 8
%valeur
X0=6;
Y0=polyval(pol,X0);
%derive
Y0d=Polyval(der,X0);
%tangeante
tangx=[X0-3 X0 X0+3];
tangy=[Y0-3*Y0d Y0 Y0+3*Y0d];
plot(tangx,tangy,':r','linewidth',2);
%QUB
z=polyval(nab,linspace(0, 10, 10^4));
zabs=abs(z);
L=max(zabs);

Xz=linspace(X0-1,X0+1);
Z=Y0+Y0d*(Xz-X0)+L/2*abs(Xz-X0).^2;
plot(Xz,Z,'g','linewidth',2);
scatter(X0,Y0,500,'.k');