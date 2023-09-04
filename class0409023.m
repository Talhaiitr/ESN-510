N = 5;
x = linspace(1,10,N); % check the dimension
y = randi(10,[1,N]);
x = x';
y = y';

% prepare G matrix  - Dimension (N+1) x (N+1)
%    [x0^0  x0^1  x1^2 ..... x1^N]
%    |x1^0  x1^1  x1^2 ..... x1^N|
%    |x2^0  x2^1  x2^2 ..... x2^N|
%G = |x3^0  x3^1  x3^2 ..... x3^N|
%    |:  :   :     :     :    :  |
%    [xN^0  xN^1  xN^2 ..... xN^N]

    G = []
    for i = 0:N-1
        a = x.^i;
        G = [G  a]
end
disp (G)
m = inv(G)*y % m is column vector (N+1 x 1)
% 
xi = linspace(x(1),x(end),1000);

xi = xi';
G1 = [];
for j= 0:(N-1)
    G1= [G1 xi.^j]
end
disp(G1)
K=G1
% yi = [1 xi^1 xi^2 xi^3 ..... xi^n] * m % (1000 x N+1) (N+1 x1) 

yi = K*m
plot(xi,yi)
hold on 
plot(x,y,'o')