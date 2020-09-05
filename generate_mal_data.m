function mal_data = generate_mal_data(num,dim)
% Generates distribution of constant of malnormality of num dimxdim
% jigsaw matrices using the appropriate already-calculated Hessian file

mal_data = 1:num;
for ii = 1:num
    mal_data(ii) = give_mal(make_a_jig_real(dim),dim);
end

end

