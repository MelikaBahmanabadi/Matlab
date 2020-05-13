function [S,U,V,W] = TruncatedHosvd(T,r,s,t)
[S1,U1,V1,W1]=Hosvd(T);
U=U1(:,1:r);
V=V1(:,1:s);
W=W1(:,1:t);
S=S1(1:r,1:s,1:t);
end