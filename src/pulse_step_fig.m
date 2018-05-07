x1 = [0 1 2 2 3 3 4 5];
P = [0 0 0 1 1 0 0 0];
x2 = [0 1 2 2 3 4 5];
S = [0 0 0 1 1 1 1];
subplot(1,2,1);plot(x1, P);axis([0 5 -0.5 1.5]);title('Pulse signal');
subplot(1,2,2);plot(x2, S);axis([0 5 -0.5 1.5]);title('Step signal')