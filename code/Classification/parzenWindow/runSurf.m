close all; clear all; clc; addpath('..');

dados = carregaDados('iris.data', 0);

lin = 1; col = 2;
range = [-1 1 -1 1];
conf.algoritmo = 'janelaParzen';
conf.h = 0.05;

subplot(lin, col, 1)
graficoSuperficie(range, conf, dados, [2 1])
ylabel('C. S�pala', 'FontSize', 14);
xlabel('L. S�pala', 'FontSize', 14);

subplot(lin, col, 2)
graficoSuperficie(range, conf, dados, [3 1])
ylabel('C. S�pala', 'FontSize', 14);
xlabel('C. P�tala', 'FontSize', 14);

figure
subplot(lin, col, 1)
graficoSuperficie(range, conf, dados, [4 1])
ylabel('C. S�pala', 'FontSize', 14);
xlabel('L. P�tala', 'FontSize', 14);

subplot(lin, col, 2)
graficoSuperficie(range, conf, dados, [3 2])
ylabel('L. S�pala', 'FontSize', 14);
xlabel('C. P�tala', 'FontSize', 14);

figure
subplot(lin, col, 1)
graficoSuperficie(range, conf, dados, [4 2])
ylabel('L. S�pala', 'FontSize', 14);
xlabel('L. P�tala', 'FontSize', 14);

subplot(lin, col, 2)
graficoSuperficie(range, conf, dados, [4 3])
ylabel('C. P�tala', 'FontSize', 14);
xlabel('L. P�tala', 'FontSize', 14);

