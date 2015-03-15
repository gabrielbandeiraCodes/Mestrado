close all; clear all; clc
addpath('K-NN'); addpath('DMC');


%% Carregando os dados
data = load('iris.data');
dataset.x = data(:, 1:4);
dataset.y = data(:, 5:7);
clear data;


%% Configura��es gerais
ptrn = 0.8;
numRepet = 500;
resultKNN = [];
resultDMC = [];


% K-NN
for K = 1 : 1 : 15,
    resultKNN = [resultKNN; KNN(dataset, K, ptrn, numRepet)];
end


%DMC - K-NN melhor
[~, pos] = max(resultKNN(:,2)); % seleciona o K-NN com maior acur�cia
resultDMC_KNN =  knn_dmc(dataset, resultKNN(pos,1), ptrn, numRepet );


%% Plotando o Gr�fico

fprintf('%d %f %f \n', resultKNN(pos,1), resultKNN(pos,2), resultDMC_KNN.accuracyDMC);
plot(resultKNN(:,1), resultKNN(:,2), '-x');
xlabel('K vizinhos', 'FontSize', 12);
ylabel('Acur�cia', 'FontSize', 12);




%% Superf�cie de decis�o

lin = 2;
col = 3;

alg = 'KNN';
subplot(lin, col, 1)
decisionSurface([0 6 3 9], alg, dataset, K, [2 1])
ylabel('T. S�pala', 'FontSize', 14);
xlabel('L. S�pala', 'FontSize', 14);

subplot(lin, col, 2)
decisionSurface([0 8 3 9], alg, dataset, K, [3 1])
ylabel('T. S�pala', 'FontSize', 14);
xlabel('T. P�tala', 'FontSize', 14);

subplot(lin, col, 3)
decisionSurface([-1 5 -1 9], alg, dataset, K, [4 1])
ylabel('T. S�pala', 'FontSize', 14);
xlabel('L. P�tala', 'FontSize', 14);

subplot(lin, col, 4)
decisionSurface([-2 8 -1 9], alg, dataset, K, [3 2])
ylabel('L. S�pala', 'FontSize', 14);
xlabel('T. P�tala', 'FontSize', 14);

subplot(lin, col, 5)
decisionSurface([-2 8 1 5], alg, dataset, K, [4 2])
ylabel('L. S�pala', 'FontSize', 14);
xlabel('L. P�tala', 'FontSize', 14);

subplot(lin, col, 6)
decisionSurface([-2 8 -1 9], alg, dataset, K, [4 3])
ylabel('T. P�tala', 'FontSize', 14);
xlabel('L. P�tala', 'FontSize', 14);