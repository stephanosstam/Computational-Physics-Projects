function p=sp_Lagrange(xp,yp)
    N=length(xp);
    M=length(yp);
	% Έλεγχος διάστασης
    if N~=M 
        error('myApp:argChk', 'Οι πίνακες x και y δεν έχουν ίδια διάσταση')
    end
    syms x
    % Συντελεστές Lagrange
    for i=1:N
        L(i)=1+0*x;
        for j=1:N
            if i~=j
                L(i)=L(i)*(x-xp(j))/(xp(i)-xp(j));
            end
        end
    end
    % Δημιουργία πολυωνύμου παρεμβολής
    p=0*x;
    for i=1:N
        p=p+L(i)*yp(i);
    end
    p=expand(p);
end