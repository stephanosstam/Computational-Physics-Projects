function [der,iflag] = derfor(f,x,h0,atol,rtol,itermax);
  h = h0;
% 1η προσέγγιση
  d0 = (f(x+h)-f(x))/h; 
  if itermax == 0 
     iflag = 1;
     der = d0;
     iter = itermax;
  end
  h = h/2;
% 2η προσέγγιση
  d1=(f(x+h)-f(x))/h;
  if itermax == 1 
     iflag = 1;
     der = d1;
     iter = itermax;
  end
  iter = 1;
% Διαφορά μεταξύ δύο
  difnow = abs(d0-d1);
  for i = 1:itermax+1
      iter = iter+1;
      d0 = d1;
      difpre = difnow;
      h = h/2;
      d1 = (f(x+h)-f(x))/h;
      difnow = abs(d0-d1);
% 1η Περίπτωση
      if difnow < difpre 
         if difnow < rtol*abs(d1)+atol
            iflag = 1;
            der = d1;
            break
         end
% 2η Περίπτωση
          if iter >= itermax
             iflag = 2;
             der = d1;
             break
          end
% 3η Περίπτωση
        else
          iflag = 0;
          der = d0;
       end
  end   
end