function[root,res,f]=rf_bisection(fs,a,b,s) 
f=inline(fs); 
f=vectorize(f); 

fa=f(a); 
fb=f(b); 

if (fa*fb>0) 
    res='Το θεώρημα του Bolzano δεν ικανοποιείται!'; 
    root=NaN; 
else 
    m=(a+b)/2; 
    fm=f(m); 
    k=log2((b-a)/(2*s));
    step=1; 
    while (fm~=0) && (b-a>s) && (step<k) 
        if (fa*fm>0) 
            a=m; 
        else 
            b=m; 
        end 
        m=(a+b)/2;
        fm=f(m); 
        step=step+1; 
    end

    res='Όλα καλά';
    root=m; 
end
