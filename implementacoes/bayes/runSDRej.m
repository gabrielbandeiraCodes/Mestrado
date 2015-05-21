close all; clear all; clc
addpath('..');

%% Pr�-processamento
dataset = carregaDados('column_2C.data', 0);

%% Superf�cie de decis�o
% Configura��es
lin = 1; col = 2;
range = [-1 1 -1 1];
conf.algoritmo = 'bayesRej';
conf.t = 0.15;

subplot(lin, col, 1)
decisionSurface(range, conf, dataset, [2 1])
ylabel('C. S�pala', 'FontSize', 14);
xlabel('L. S�pala', 'FontSize', 14);

subplot(lin, col, 2)
decisionSurface(range, conf, dataset, [3 5])
ylabel('C. S�pala', 'FontSize', 14);
xlabel('C. P�tala', 'FontSize', 14);

% subplot(lin, col, 3)
% decisionSurface(range, conf, dataset, [4 1])
% ylabel('C. S�pala', 'FontSize', 14);
% xlabel('L. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 4)
% decisionSurface(range, conf, dataset, [3 2])
% ylabel('L. S�pala', 'FontSize', 14);
% xlabel('C. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 5)
% decisionSurface(range, conf, dataset, [4 2])
% ylabel('L. S�pala', 'FontSize', 14);
% xlabel('L. P�tala', 'FontSize', 14);
% 
% subplot(lin, col, 6)
% decisionSurface(range, conf, dataset, [4 3])
% ylabel('C. P�tala', 'FontSize', 14);
% xlabel('L. P�tala', 'FontSize', 14);