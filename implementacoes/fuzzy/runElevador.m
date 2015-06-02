close all; clear all; clc; addpath('..');
%{
A) Disponibilidade de carga: � o numero atual de vagas dispon�veis no 
elevador no instante em que a chamada ocorreu.

B) Dist�ncia a ser percorrida pelo elevador: � o numero de andares que 
o elevador deve percorrer desde a posi��o atual at� o andar onde a nova
chamada ocorreu.

C) Tempo de espera: � o tempo desde de a chamada realizada no pavimento at�
a chegada da cabine. Esta medida depende diretamente dos par�metros de 
configura��o do sistema de elevadores tais como, velocidade do elevador, 
rela��o de acelera��o, altura dos andares, tempo de abrir e fechar as 
portas. O tempo de espera depende tamb�m do n�mero de paradas que devem 
ser realizadas pelo elevador antes de chegar ao pavimento solicitado. Este 
valor � normalizado pelo tempo m�ximo de espera, que corresponde � viagem 
de maior percurso no pr�dio (por exemplo do andar t�rreo ao �ltimo andar) 
considerando que o elevador para em todos os andares intermedi�rios.

%}

load('elevador1.mat');
fuzzy(elevador1);

load('elevador2.mat');
fuzzy(elevador2);
