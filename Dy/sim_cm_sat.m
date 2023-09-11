% sim_cm_sat.m
% This file simulates a single coil magnetic circuit with core saturation.
%
% Copyright Alberto Sanchez 2021
%  ver 1.0 28/01/2021
%
% Modify by Alex Andrade 2022
%  ver 2.0 20/01/2022
%
%******************************************************************
% Model Description:
% 
% State Variables: Psi
% Parameters: wb r1 rp2 xl1 xlp2 xm
%
%******************************************************************
% This Simulations is for a 120/240 V, 1.5 KVA, 60-Hz transformer
% with the following parameters:
%
% r1 = 0.62 Ohms   
% rp2 = 0.62 Ohms      
% xl1 = 0.056 Ohms    
% xlp2 = 0.056 Ohms
% xm = 315.92 Ohms
%
%******************************************************************
% This Simulations is for a 120/240 V, 1.5 KVA, 60-Hz transformer.
%
%*****************************************************************
% Any change to be performed at this point of the code
%*****************************************************************
%
% Voltaje devanado primario
%

VA = sqrt(2)*120;       % Voltaje pico
VAf = 0;                % Desfasamiento de voltaje VA. Altere este valor segun lo requerido 0 o pi/2
VB = VA;
VBf = (2*pi)/3;         % Desfasamiento de voltaje VB.
VC = VB;
VCf = (4*pi)/3;         % Desfasamiento de voltaje VC.
Rn = 10;                

%
%*****************************************************************
% DO NOT MAKE ANY CHANGES BELOW THIS POINT
%*****************************************************************
%
cm_init;
%
%
% Simulacion
%
disp('');
disp('Espere unos instantes.....simulacion en progreso')
tic;
sim('cm_sat_model',0.5);
toc
disp('');
disp('Simulacion finalizada')

%
%*****************************************************************
% Salida A
%*****************************************************************
%
vAB = salida_A(:,1);
vab = salida_A(:,2);
iA = salida_A(:,3);
ia = salida_A(:,4);

%
%*****************************************************************
% Salida B
%*****************************************************************
%
vBC = salida_B(:,1);
vbc = salida_B(:,2);
iB = salida_B(:,3);
ib = salida_B(:,4);

%
%*****************************************************************
% Salida C
%*****************************************************************
%
vCA = salida_C(:,1);
vca = salida_C(:,2);
iC = salida_C(:,3);
ic = salida_C(:,4);

%
%*****************************************************************
% Salida ABC
%*****************************************************************
%
io_1 = salida_ABC(:,1);
io_2 = salida_ABC(:,2);
vnG = salida_ABC(:,3);

%
% Resultados fase A
%
figure;
subplot(2,1,1);
plot(T,vAB);
title('Voltage de linea primaria y secundaria');
hold on
plot(T,vab);
ylabel('volts');
legend('vAB','vab');
grid on;
subplot(2,1,2);
plot(T,iA);
title('Corriente de linea primaria y secundaria');
ylabel("amperios");
hold on
plot(T,ia);
xlabel('Tiempo [s]');
legend('iA','ia');
grid on;

%
% Resultados fase B
%
figure;
subplot(2,1,1);
plot(T,vBC);
title('Voltage de linea primaria y secundaria');
hold on
plot(T,vbc);
ylabel('volts');
legend('vBC','vbc');
grid on;
subplot(2,1,2);
plot(T,iB);
title('Corriente de linea primaria y secundaria');
ylabel("amperios");
hold on
plot(T,ib);
xlabel('Tiempo [s]');
legend('iB','ib');
grid on;

%
% Resultados fase C
%
figure;
subplot(2,1,1);
plot(T,vCA);
title('Voltage de linea primario y secundario');
hold on
plot(T,vca);
ylabel('volts');
legend('vCA','vca');
grid on;
subplot(2,1,2);
plot(T,iC);
title('Corriente de linea primario y secundario');
ylabel("amperios");
hold on
plot(T,ic);
xlabel('Tiempo [s]');
legend('iC','ic');
grid on;

%
% Resultados ABC
%
figure;
subplot(3,1,1);
plot(T,io_1);
title('Corriente de secuencia cero del primario');
ylabel('amperios');
grid on;
subplot(3,1,2);
plot(T,io_2);
title('Corriente de secuencia cero del secundario');
ylabel('amperios');
grid on;
subplot(3,1,3);
plot(T,vnG);
title('Voltaje secundario neutro a tierra');
ylabel("volts");
xlabel('Tiempo [s]');
grid on;


figure;
title('Circuito Magnético con Saturacion - Concatenación de Flujo');
plot(psisat,Dpsi);
xlabel('\Psi_{m}^{sat} [Wb/s]');
ylabel('\Delta \Psi [Wb/s]');
grid on;
