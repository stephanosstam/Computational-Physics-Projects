% Καθαρισμός παραθύρου ελέγχου και μεταβλητών
clear; clc;

% Διαφορικές εξισώσεις
dy1 = '2*y1-5*y2+2*sin(x)';
dy2 = '4*y1-6*y2';

% Διάστημα ολοκλήρωσης
x0 = 0;
xt = 16;

% Αρχικές συνθήκες
y01 = 0;
y02 = 0;

% Ακρίβεια
h1 = 0.2;
h2 = 0.0002;

% Κάλεσμα της συνάρτησης για ακρίβεια 0.2
[xr2,y12,y22] = df_RK4(dy1,dy2,x0,xt,y01,y02,h1)
% Κάλεσμα της συνάρτησης για ακρίβεια 0.0002
[xr0002,y10002,y20002] = df_RK4(dy1,dy2,x0,xt,y01,y02,h2);

% Διαγράμματα
figure (1)
x1 = linspace(x0,xt,length(x0:h1:xt)+1);
plot(x1,y12,x1,y22)
xlabel('x')
ylabel('y')
title('Βήμα 0.2')
legend('y1(R-K)(x)','y2(R-K)(x)')

figure (2)
x2 = linspace(x0,xt,length(x0:h2:xt)+1);
plot(x2,y10002,x2,y20002)
xlabel('x')
ylabel('y')
title('Βήμα 0.0002')
legend('y1(R-K)(x)','y2(R-K)(x)')
