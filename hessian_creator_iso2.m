% hessian_creator_io2.m
% Procedure for generating Hessian of sqaured commutator norm when dim = n, n= 3,...,17

% Setting of dimension matrix to work with
n = 17;
% Calculating dimension of self-adjoint trace zero matrices of dim n
k = ((1/2)*(n)*(n+1))-1;

% Generating matrices
A = sym('a', [n n]);
X = sym('x', [1 k]);
Y = sym('y', [n n]);

% Setting diagonal of Y equal to zero
for ii = 1:n
    Y = subs(Y,Y(ii,ii),0);
end
set_tempvec = cell(n-1,1); %to check orthogonality

count = 1;
% Building diagonal
kk = 2; % starting length
for ii = 1:(n-1)
    tempvec = zeros(n,1); %vector of diagonal entries
    for jj = 1:n
        if jj < kk
            tempvec(jj) = 1;
        elseif jj == kk
            tempvec(jj) = -1*(kk-1);
        end
    end
    
    normvec = tempvec'*tempvec;
    
    for jj = 1:n
        Y(jj,jj) = Y(jj,jj) + (1/sqrt(normvec))*tempvec(jj)*X(count);
    end
    
    kk = kk+1;
    count = count + 1;
    set_tempvec{ii} = tempvec;
end


%Building upper triangle of matrix (excluding diagonal)
%At this point,should have count = n;
for ii = 1:(n-1)
    for jj = (ii+1):n
        Y = subs(Y,Y(ii,jj),(1/sqrt(2))*X(count));
        count = count + 1;
    end
end

%Building lower triangle (excluding main diagonal)
for ii = 2:n
    for jj = 1:(ii-1)
        Y = subs(Y,Y(ii,jj),Y(jj,ii));
    end
end

% Now obtaining Hessian of desired function
% Creating commutator
C = A*Y-Y*A;
% Squared Two-norm of commutator
assume(X,'real'); assume(A,'real');
f = trace(C'*C);
% Creating Hessian of commutator
hessf = hessian(f,X);

% Saving Hessian to a Matlab function
matlabFunction(hessf,'File',strcat('hess',num2str(n)),'vars',{A},'Optimize',false);
