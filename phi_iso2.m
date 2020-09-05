function matrix_out = phi_iso2(X,n)
% Isometry that maps an (n(n+1)/2 - 1)-dimensional vector to a trace-zero symmetric matrix

matrix_out = zeros(n,n);

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
        matrix_out(jj,jj) = matrix_out(jj,jj) + (1/sqrt(normvec))*tempvec(jj)*X(count);
    end
    
    kk = kk+1;
    count = count + 1;
end


% Building upper triangle of matrix (excluding diagonal)
% At this point,should have count = n;
for ii = 1:(n-1)
    for jj = (ii+1):n
        matrix_out(ii,jj) = (1/sqrt(2))*X(count);
        count = count + 1;
    end
end

% Building lower triangle (excluding main diagonal)
for ii = 2:n
    for jj = 1:(ii-1)
        matrix_out(ii,jj) = matrix_out(jj,ii);
    end
end

end
