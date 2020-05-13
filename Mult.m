function [H] = Mult(T,A,mod)
[m, n, l]=size(T);
[r, s]=size(A);
if (mod==1)
H=zeros(r,n,l);
Y=zeros(m,l);
for j=1:n
    for p=1:m
        for q=1:l
            Y(p,q)=T(p,j,q);
        end
    end
    H(:,j,:)= A* Y;
end
end 
if (mod==2)
H=zeros(m,r,l);
Y=zeros(m,n);
for k=1:l
  for p=1:m
      for q=1:n
          Y(p,q)=T(p,q,k);
      end
  end
  H(:,:,k)=Y*transpose(A);
end
end
if (mod==3)
    H=zeros(m,n,r);
    Y=zeros(n,l);
for i=1:m
    for p=1:n
        for q=1:l
            Y(p,q)=T(i,p,q);
        end
    end
    H(i,:,:)= Y*transpose(A);
end
end
end



