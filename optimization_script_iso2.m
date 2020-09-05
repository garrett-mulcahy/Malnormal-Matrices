% Optimization script iso2

% set rank to be working in 
n = 20;

% dimension of H_n0
k = ((1/2)*n*(n+1))-1;

% create matrix 
A = make_a_jig_real(n);

% create function
fun = @(x) trace((A*phi_iso2(x,n)-phi_iso2(x,n)*A)'*(A*phi_iso2(x,n)-phi_iso2(x,n)*A));
t1 = tic;
% initial point
x0 = rand(k,1);
x0 = x0/norm(x0);

% customizing optimization problem
options = optimoptions('fmincon','MaxFunEvals',Inf,'MaxIter',1000,'SpecifyConstraintGradient',true);
% optimization problem
% using interior point algorithm
[x,feval,exitflag,output,lambda,grad,hessian] = fmincon(@(x)fun(x),x0,[],[],[],[],[],[],@(x)optimization_constraint_iso(x),options);
t1 = toc(t1);
% % obtaining hessian by using unconstratined optimization
% x0 = zeros(k,1)+0.001*ones(k,1);
% [x1,feval1,exitflag1,output1,grad1,hessian1] = fminunc(@(x)fun(x),x0);

t2 = tic;
% now specifying constraint gradient 
x0 = rand(k,1);
x0 = x0/norm(x0);
options = optimoptions('fmincon','MaxFunEvals',Inf,'MaxIter',1000,'SpecifyConstraintGradient',true,'HessianApproximation','lbfgs');
[x2,feval2,exitflag2,output2,lambda2,grad2,hessian2] = fmincon(@(x)fun(x),x0,[],[],[],[],[],[],@(x)optimization_constraint_iso(x),options);
t2 = toc(t2);

%feval_numhess = min(eig(hessian1))/2;
malJ_opt1 = sqrt(feval);
%malJ = give_mal(A,n);
malJ_opt2 = sqrt(feval2);
diff = malJ_opt1 - malJ_opt2;
timediff = t1-t2;