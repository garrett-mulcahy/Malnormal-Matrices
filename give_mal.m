function malA = give_mal(A,n)
% Returns constant of malnormality of a nxn matrix A by calculating the Hessian of the 
% squared norm of the commutator 
hessfunc = strcat('hess',num2str(n));
hessA = feval(hessfunc, reshape(A, [n*n 1]));
eigA = eig(hessA);
x = min(eigA);
malA = sqrt(x/2);
end

