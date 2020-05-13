function [S, U, V, W] = Hosvd(T)
[U, D1, P]=svd(MyUnfold(T,1),'econ');
[V, D2, Q]=svd(MyUnfold(T,2),'econ');
[W, D3, R]=svd(MyUnfold(T,3),'econ');
S=Mult(Mult(Mult(T,transpose(U),1),transpose(V),2),transpose(W),3);
end