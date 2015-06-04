close all; clear all; clc; addpath('..');

%{
Rela��o entre o n�mero de viagens de autom�vel gerados a partir de uma �rea
e a demografia da regi�o. Os dados demogr�ficos e de viagem foram coletados
 a partir de zonas de an�lise de tr�fego em New Castle County, Delaware. 

Cinco fatores demogr�ficos s�o considerados: 
popula��o, n�mero de unidades habitacionais, de propriet�rios de ve�culos, 
renda familiar m�dia e do emprego total.
%}


% Carrega os dados
tripdata
datin = datin(:,[1 4]);


load('trip.mat');
fuzzy(trip);

mean((evalfis(datin', trip) - datout).^2)