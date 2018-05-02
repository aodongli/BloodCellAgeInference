% glucose concentration sequence
% diabetes
G = [349, 286, 296, 273, 276, 294, 285, 240, 296, 325, 332, 252, 265, ...
    201, 224, 215, 169, 140, 135];
% normal non-diabetes
G = 100+10*randn(20, 1);
% rate
v = 20/(250*120);
res_set = zeros(100,1);
for M = 1:100
    res = 0;
    for i = 0:2*M-1
        res = res + v*get_glucose(G,i)*(1-i/(2*M));
    end
    res_set(M) = res;
end