function [maldata,exitflags,timelap] = generate_mal_data_opt(num,dim)
% Generates constants of malnormality from num dimxdim matrices of form J = (1/2)(Re(U)+Im(V))
% using optimization
timelap = tic;
maldata = 1:num;
exitflags = 1:num;
parfor ii = 1:num
    [mal,exitflag] = give_mal_opt(make_a_jig_real(dim),dim);
    maldata(ii) = mal;
    exitflags(ii) = exitflag;
end
timelap = toc(timelap);
end

