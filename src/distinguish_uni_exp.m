% uniform distribution
F_u = [1; 0.8; 0.6; 0.4; 0.2];
% exponential distribution
F_e = [1; 0.3636; 0.1295; 0.0433; 0.0117];
% initial G
v = 20/(250*120);
G = [100; 100; 100; 100; 100]*v;
% simulation
res_u = zeros(6,1);
res_u(1) = G'*F_u;
res_e = zeros(6,1);
res_e(1) = G'*F_e;
for i = 1:5
    G(i) = 150*v; % increase by 50
    % % delete if for step-like signal
    %{
    if i > 1
        G(i-1) = 100*v;
    end
    %}
    % %
    res_u(i+1) = G'*F_u;
    res_e(i+1) = G'*F_e;
end
res_u;
plot(diff(res_u), ':') % for step-like signal
%plot(res_u, ':')
hold on;
res_e;
plot(diff(res_e), '--')
%plot(res_e, '--')
legend('uniform', 'exponential');
xlabel('days');
ylabel('increment difference (%)');


return;
x = linspace(0,5,100);
f = exp(-x)./(1-exp(-5));
F = (1-exp(-x))/(1-exp(-5));
plot(x,1-F)
x = [0,1,2,3,4];
F = @(x) 1-(1-exp(-x))/(1-exp(-5));
F(x)