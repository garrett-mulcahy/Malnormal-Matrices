function J = make_a_jig_real(dim)
%Returns matrix of form J = (1/2)(Re(U)+Im(V)) of dimension dim 
%Requires the function RandOrthMat.m
u = RandOrthMat(dim);
v = RandOrthMat(dim);
J = (u+u'+v-v')/4;
end
