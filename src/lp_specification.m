n = 60;
% construct A
A = eye(n) + diag(-1*ones(n-1,1),1);
% construct c
c = zeros(n,1);
c(n) = 1;
% construct G
v = 20/(250*120);
G_seq = (100+20*randn(2*n, 1))*v;
G = diag(G_seq(n)*ones(n,1));
for i = 1:n-1
    G = G + diag(G_seq(i+n)*ones(n-i,1),i);
end
for i = 1:n-1
    G = G + diag(G_seq(n-i)*ones(n-i,1),-i);
end
% construct H
H = 5+0.1*randn(n,1); % great error

% cut G and H into a flat matrix
G = G(1,:);
%{
%Gs = [349, 286, 296, 273, 276, 294, 285, 240, 296, 325, 332, 252, 265, ...
%    201, 224, 215, 169, 140, 135];
%Gs = [208 190 212 95 143 130 149 143 173 197 188 192 151 269 96 290 265 246 178 265 131 133 100 131 78 145 191 230 225 172 177 150 214 116 220 160 142 128]; % 51
Gs = [285 138 107 111 164 119 132 141 152 138 104 110 103 101 94 137 141 133 140 154 170 184 128 108 117 98 97]; % 49
G = zeros(1,n);
for i = 1:n
    G(i) = get_glucose(Gs,i);
end
AG = mean(G);
H = (AG + 46.7)/28.7;
%}
H = H(1)-1.627;

cvx_begin
    variable f(n)
    minimize (c'*f)
    G*f == H
    A*f >= 0
    f(1) == 1
cvx_end