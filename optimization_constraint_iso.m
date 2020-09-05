function [c,ceq,GC,GCeq] = optimization_constraint_iso(x)
%Constraints for the optimization problem 
%We manually supply the gradient for the constraint since it is easily computable 

c = [];
ceq(1) = x'*x - 1;
GC = [];
GCeq = 2*x;
end

