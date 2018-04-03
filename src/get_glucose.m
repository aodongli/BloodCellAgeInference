function [g] = get_glucose(G, i)
% Return the glucose concentration circulantly.
% G is the vector of glucose concentration. The first entry is the latest 
% measurement.
% i is the index.
    n = length(G);
    if mod(i+1,n) == 0
        g = G(1);
    else
        g = G(mod(i+1,n));
    end
end