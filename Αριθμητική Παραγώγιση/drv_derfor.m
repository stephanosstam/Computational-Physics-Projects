 % Καθαρισμός του Παραθύρου Εντολών και των μεταβλητών
 clc; clear;

 % Εισαγωγή συντελεστών του πολυωνύμου, atol absolute tolerance, rtol relative tolerance, 
 % x το σημείο που βρίσκουμε την παράγωγο, h0 την αρχική ακρίβεια, itermax
 % το μέγιστο πλήθος των επαναλήψεων
 disp('a=');
 a = input('');
 disp('b=');
 b = input('');
 disp('c=');
 c = input('');
 disp('d=');
 d = input('');
 disp('x=');
 x=input('');
 disp('h=');
 h0 = input('');
 disp('Absolute tolerance=');
 atol = input('');
 disp('Relative tolerance=');
 rtol = input('');
 disp('Maximum iterations=');
 itermax = input('');

 % Χτίσιμο πολυωνύμου
 f = @(x) a+b*x+c*x^2+d*x^3;

 % Ακριβής τιμή παραγώγου
 exact = b+2*c*x+3*d*x^2;

 % Κάλεσμα συνάρτησης
 derfor(f,x,h0,atol,rtol,itermax);

 % Προβολή αποτελεσμάτων
 disp('Προσεγγιστικά η παράγωγος είναι')
 df = derfor(f,x,h0,atol,rtol,itermax)
 disp('Η ακριβή τιμή της είναι')
 exact
 disp('Η επί τοις εκατό απόκλισή τους είναι')
 sf = 100*abs(df-exact)/exact