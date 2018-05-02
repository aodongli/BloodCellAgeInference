% FAILURE!
n = 100;
% construct A
A = eye(n) + diag(-1*ones(n-1,1),1);
% construct c
c = zeros(n,1);
c(n) = 1;
% construct G
v = 20/(250*120);
G_seq = (100+50*randn(2*n, 1))*v;
G = diag(G_seq(n)*ones(n,1));
for i = 1:n-1
    G = G + diag(G_seq(i+n)*ones(n-i,1),i);
end
for i = 1:n-1
    G = G + diag(G_seq(n-i)*ones(n-i,1),-i);
end
% construct H
H = 5+3*randn(n,1); % great error

cvx_begin
    variable f(n)
    minimize (c'*f)
    G*f == H
    A*f >= 0
    f >= 0
    f(1) == 1
cvx_end