%Signal variable time  (Fourier series)
%====================================================================
%                       inf 
%                      -----
%                      \
%        f(x) = a0/2 +  \  a(n) * sin(n*pi*x/L) + b(n) * con(n*pi*x/L) 
%                       /
%                      /
%                      -----
%                      n = 1
%====================================================================
% a0=(1/pi)*int(y,x,-pi,pi)
% an=(1/pi)*int(y*cos(n*x),x,-pi,pi) 
% bn=(1/pi)*int(y*sin(n*x),x,-pi,pi)    
% s=a0/2+symsum (an*cos(n*x)+bn*sin(n*x),n,1,z)
%====================================================================
%   Example:
%   f = @(x)x.*cos(x);
%     a0: 0
%     a(n): [-0.5000 1.3333 -0.7500]
%     b(n): [1.4136e-016 0 7.0679e-017]
% Author: Korosh Agha Mohammad Ghasemi
% Copyright 2020
%====================================================================
syms x k L n 
evalin(symengine,'assume(k,Type::Integer)');
a = @(f,x,k,L) int(f*cos(k*pi*x/L)/L,x,-L,L);
b = @(f,x,k,L) int(f*sin(k*pi*x/L)/L,x,-L,L);
fs = @(f,x,n,L) a(f,x,0,L)/2 + ...
    symsum(a(f,x,k,L)*cos(k*pi*x/L) + b(f,x,k,L)*sin(k*pi*x/L),k,1,n);
f =  x*cos(pi*x/2) ;
pretty(fs(f,x,10,1))
% [A,how]=simplemu(a(f,x,k,1));
% [B,how]=simple(b(f,x,k,1)); 
ezplot(fs(f,x,2,1),-1,1)
hold on
ezplot(f,-1,1)
hold off
title('Partial sum with n=2')
ezplot(fs(f,x,5,1),-1,1)
hold on
ezplot(f,-1,1)
hold off
title('Partial sum with n=5')
ezplot(fs(f,x,8,1),-1,1)
hold on
ezplot(f,-1,1)
hold off
title('Partial sum with n=8')
%====================================================================
% Author: Korosh Agha Mohammad Ghasemi
% Copyright 2020
%====================================================================
