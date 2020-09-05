function [maldata,exitflags,timelap] = generate_gin_data_opt(num,dim)
% Generates constants of malnormality from num dimxdim matrices from the real-valued Ginibre
% ensemble using optimization
timelap = tic;
maldata = 1:num;
exitflags = 1:num;
parfor ii = 1:num
    [mal,exitflag] = give_mal_opt(make_a_ginib(dim),dim);
    maldata(ii) = mal;
    exitflags(ii) = exitflag;
end
timelap = toc(timelap);
end

