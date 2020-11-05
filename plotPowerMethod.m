close all;
clear
clc;

% initialize the matrix
C = [4 1; 1 3];

% first eigenvectors
rng(0); % set a fixed seed for reproducibility
v0 = rand(2, 1);


Itr = 100;
% initialize for storing the result
vs1 = [];
vs2 = [];
lambdas = [];

v = v0(:);
for k = 1 : Itr
    v = C * v;
    v = v / sqrt(v' * v);
    lambda = mean((C * v)./ v);
    vs1(k) = v(1);
    vs2(k) = v(2);
    lambdas(k) = lambda;
end

% print vs1(20), vs2(20)
vs1(20)
vs2(20)
lambdas(20)


figure(1)
% plot entries in first eigenvector
plot(vs1(1:20), vs2(1:20), 'r-*')
xlabel("First Entry in First Eigenvector")
ylabel("Second Entry in First Eigenvector")
title("Eigenvector for Lambda1 = 4.6180")
% clf

figure(2)
% plot first 20 entries in first eigenvalue
plot(1:20, lambdas(1:20), 'r-*')
xlabel("Iteration")
ylabel("Eigenvalue")
title("Leading Eigenvalue")


% After knowing the first eigenvector, calculate for the second

v = [vs1(end); vs2(end)]; % first eigenvector
Cx = C - lambdas(end) * (v * v'); % re-caculate the matrix

v = v0(:); % re-generate the random vector
% initialize for storing the result
vs1 = [];
vs2 = [];
lambdas = [];
for k = 1 : Itr
    v = Cx * v;
    v = v / sqrt(v' * v);
    lambda = mean((Cx * v)./ v);
    vs1(k) = v(1);
    vs2(k) = v(2);
    lambdas(k) = lambda;
end

% figure(3)
% plot entries in first eigenvector
% plot(vs1(1:20), vs2(1:20), 'r-*')
% xlabel("First Entry in Second Eigenvector")
% ylabel("Second Entry in Second Eigenvector")
% title("Eigenvector for Lambda2 = 2.3820")
% clf

% figure(4)
% plot(1:20, lambdas(1:20), 'r-*')
% xlabel("Iteration")
% ylabel("Eigenvalue")
% title("Second Eigenvalue")


% plot(v(0), v(1))
% hold on
% hold off



% C = Cx - lambda1 * (v1 * v1');
% v2 = EigenAnalysisPowerMethod(C, v0, Itr);
% scale2 = (Cx*v2)./v2;
% lambda2 = mean(scale2)