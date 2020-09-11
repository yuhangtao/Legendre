function [ P ] = ComputePnm( n,m,x )
%COMPUTEPNM Summary of this function goes here
% figure out the Pnm 
%   x for theta with the unit of rad
P=zeros(n+1,m+1);
t=cos(x);
u=sin(x);
P(1,1)=1;
P(2,1)=sqrt(3)*t;
P(2,2)=sqrt(3)*u;
for i=2:n
    for j=0:1
        anm=sqrt((2*i-1)*(2*i+1)/((i-j)*(i+j)));
        bnm=sqrt((2*i+1)*(i+j-1)*(i-j-1)/((2*i-3)*(i+j)*(i-j)));
        P(i+1,j+1)=anm*t*P(i,j+1)-bnm*P(i-1,j+1);
    end;
end;
for i=2:n
    for j=2:i
        if(i-j==0)
            anm=0;
        else
            anm=sqrt((2*i+1)*(i-j)*(i-j-1)/((2*i-3)*(i+j)*(i+j-1)));
        end;
        if(j==2)
            bnm=sqrt(2*(2*i+1)*(i+j-2)*(i+j-3)/((2*i-3)*(i+j)*(i+j-1)));
            cnm=sqrt(2*(i-j+1)*(i-j+2)/((i+j)*(i+j-1)));
        else
            bnm=sqrt((2*i+1)*(i+j-2)*(i+j-3)/((2*i-3)*(i+j)*(i+j-1)));
            cnm=sqrt((i-j+1)*(i-j+2)/((i+j)*(i+j-1)));
        end;
        P(i+1,j+1)=anm*P(i-1,j+1)+bnm*P(i-1,j-1)-cnm*P(i+1,j-1);
    end;
end;

end

