close all; clear all; clc; addpath('..');
%{
I) Disponibilidade de carga: quantidade de massa dispon�vel do elevador.

II) Dist�ncia a ser percorrida pelo elevador: � o numero de andares que 
o elevador deve percorrer desde a posi��o atual at� o andar onde a nova
chamada ocorreu. No modelo 'elevador4', positivo indica que o elevador est�
no sentindo da solicita��o.

III) Tempo de espera: � o tempo desde a chamada realizada no pavimento at�
a chegada da cabine. Esta medida depende diretamente dos par�metros de 
configura��o do sistema de elevadores tais como, velocidade do elevador, 
rela��o de acelera��o, altura dos andares, tempo de abrir e fechar as 
portas. O tempo de espera depende tamb�m do N�MERO DE PARADAS que devem 
ser realizadas pelo elevador antes de chegar ao pavimento solicitado. Este 
valor � normalizado pelo tempo m�ximo de espera, que corresponde � viagem 
de maior percurso no pr�dio (por exemplo do andar t�rreo ao �ltimo andar) 
considerando que o elevador para em todos os andares intermedi�rios.

IV) Sentindo do descolacento: para o modelo 'elevador3', positivo indica
que o elevador est� no sentindo da solicita��o. No modelo 'elevador4' diz
se o elevador est� subindo ou descendo.

%}

load('elevador1.mat');
fuzzy(elevador1);

load('elevador3.mat');
fuzzy(elevador3);

load('elevador4.mat');
fuzzy(elevador4);
