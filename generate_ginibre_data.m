function gin_data = generate_ginibre_data(num,dim)
% Generates distribution of constant of malnormality of num dimxdim
% real ginibre matrices using the appropriate already-calculated Hessian file 

gin_data = 1:num;
for ii = 1:num
    gin_data(ii) = give_mal(make_a_ginib(dim),dim);
end

end

