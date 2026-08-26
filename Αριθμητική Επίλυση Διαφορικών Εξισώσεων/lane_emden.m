% 1ο Ερώτημα
initial_conditions=[1 0]; % [φ ζ] 
% Διάστημα
ksiinterval=[0 5];  
Pv=[0.1 0.2 0.3 0.4 0.5 0.6 0.8];
% Προσθήκη στις εξισώσεις, για την αποφυγή ασυνέχειων ή ιδιομορφιών 
ev=1e-9;  
dfdksi='y2'; 
dzdksi='-2/(x+var1)*y2-abs(y1^2-var2^2)^(1.5)'; 
h=0.1; 
N=ceil(abs(ksiinterval(1)-ksiinterval(2))/h)+1; 
% Αδιάστατη Πίεση
f=zeros(7,N);   
% Αδιάστατη Πυκνότητα
z=f;  
for i=1:7 
[xrm,f(i,:),z(i,:)]=rk4(ksiinterval,h,dfdksi,dzdksi,initial_conditions,[ev 
Pv(i)]); 
end 
f=transpose(f); 
z=transpose(z); 
ksi=transpose(linspace(ksiinterval(1),ksiinterval(2),N)); 
distance 
% Δημιουργία πίνακα που περιέχει ξ στην πρώτη στήλη και φ στις υπόλοιπες για διαφορετικές τιμές P
ksi_f=zeros(N,8); 
ksi_f(:,1)=ksi;  
for i=2:8 
ksi_f(:,i)=f(:,i-1); 
end 
save('C:/Users/user/MATLAB Drive/codes/WD_POL.dat','ksi_f','-ASCII'); 

% 2ο Ερώτημα
% Αύξηση του μεγέθους βήματος
h2=0.22; 
N2=ceil(abs(ksiinterval(1)-ksiinterval(2))/h2)+1; 
f2=zeros(7,N2); 
z2=f2; 
for i=1:7 
[xr2,f2(i,:),z2(i,:)]=rk4(ksiinterval,h2,dfdksi,dzdksi,initial_conditions,[
ev Pv(i)]); 
end 
f2=transpose(f2); 
z2=transpose(z2); 
ksi2=transpose(linspace(ksiinterval(1),ksiinterval(2),N2)); 
ksi_f2=zeros(N2,8); 
ksi_f2(:,1)=ksi2; 
for i=2:8 
ksi_f2(:,i)=f2(:,i-1); 
end 
% Πρόβλεψη ακτίνας για διαφορετικές τιμές P 
prediction=[4.0690 3.7271 3.5803 3.5245 3.5330 3.6038 4.0446];  
Ksi=zeros(1,7); % Ακτίνες 
syms x 
assume(x,'real') 
options = optimset('Display','iter', 'TolFun', 1e-1); 
for i=1:7 
% Πολυώνυμο παρεμβολής
f_p(i)=sp_Lagrange(ksi_f2(:,1),ksi_f2(:,i+1)); 
using the Lagrange method 
f_=matlabFunction(f_p(i)); 
% Ρίζες φ(ξ)-Ρ=0 
Ksi(i)=fzero(@(x) f_(x)-Pv(i),prediction(i)); 
(radii) 
end 
% Ποσοστιαίο Σφάλμα
Rerror=abs(Ksi-prediction)./prediction*100;  

% 3ο Ερώτημα
% Μάζα
M=zeros(1,7);
for i=1:7 
f_der=double(subs(diff(f_p,x),x,Ksi(i))); 
M(i)=-Ksi(i)^2*f_der(i); 
end 

% 4ο Ερώτημα
% Γραφική
figure (4) 
tiledlayout(2,4) 
for i=1:7 
nexttile 
hold on 
grid minor 
plot(ksi_f(:,1),ksi_f(:,i+1),'Color',[0.5 0.5 
0.8],'LineWidth',1.5,'DisplayName',['P= ' num2str(Pv(i))]) 
fplot(f_p(i),[0 5],'Color',[0.7 0.5 0.7],'DisplayName','Regression') 
plot([Ksi(i) Ksi(i)],[0 1.1],'k--','DisplayName','Radius') 
legend('Location','best') 
legend('boxoff') 
xlabel('ξ') 
ylabel('φ') 
ylim([0 1.1]) 
end