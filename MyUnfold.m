function [X] = MyUnfold(T,mod)
[m, n, l]=size(T);
if (mod==1)
t=l;
X=zeros(m,n*l);
Y=zeros(m,l);
for j=1:n
    for p=1:m
        for q=1:l
            Y(p,q)=T(p,j,q);
        end
    end
    X(:,t-l+1:t)=Y;
    t=t+l;  
end
end
Y=zeros(m,n);
if (mod==2)
t=m;
X=zeros(n,l*m);
for k=1:l
    for p=1:m
        for q=1:n
            Y(p,q)=T(p,q,l);
        end
    end
    X(:,t-m+1:t)=transpose(Y);
    t=t+m;
end
end
Y=zeros(n,l);
if (mod==3)
    t=n;
    X=zeros(l,m*n);
for i=1:m
    for p=1:n
        for q=1:l
            Y(p,q)=T(i,p,q);
        end
    end
    X(:,t-n+1:t)=transpose(Y);
    t=t+n;
end
end    
end




