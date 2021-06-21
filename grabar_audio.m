%Grabar Audio Matlab
close all;
clear; %borra las variables del archivo%
clc;

%t = input ('Cuantos segundos quieres grabar '); %variable de tiempo en segundos%
%Fs= input ('Con que Frecuencia quieres grabarlo ');%variable de la frecuencia de la se–al%
t = 2;
Fs = 44100;
v = audiorecorder(Fs, 24, 1);
v.StartFcn = 'disp(''   iniciando grabación'')';
v.StopFcn = 'disp(''   terminando grabación'')';

input ('Presione enter para grabar la primera muestra de sonido'); %impresion de pantalla
recordblocking(v, t)
y = v.getaudiodata();
audiowrite ('grabacion1.wav', y,Fs); %guarda el sonido en formato wav%
which 'grabacion1.wav'
input ('Señal capturada');

input ('Presione enter para grabar la segunda muestra de sonido');%impresion de pantalla%
recordblocking(v, t);
x = v.getaudiodata();
audiowrite ('grabacion2.wav', x,Fs);%guarda el sonido en formato wav%
which 'grabacion2.wav'
input ('Señal capturada');

input ('Presione enter para escuchar la primera grabacion');%impresion de pantalla%
sound(y,Fs);%reproduce sonido%

input('Presione enter para escuchar la segunda grabacion'); %impresion de pantalla%
sound(x,Fs);%reproduce sonido%

close all;
clear;%borra las variables del archivo%

s = audioread('grabacion1.wav');
g = audioread('grabacion2.wav');

s = normalizar(s);
voz1 = abs(fft (s)); % se obtiene la transformada de fourier de la primera grabacion %
voz1 = voz1.*conj (voz1); % se obtiene el conjugado% 
voz1f = voz1 (1:100); % Solo acepta las Frecuencias arriba de 100 HZ %
voz1fn = voz1f/sqrt(sum (abs (voz1f).^2)); % se normaliza el vector %

g = normalizar(g);
voz2 = abs(fft (g)); % se obtiene la transformada de fourier de la segunda grabacion %
voz2 = voz2.*conj (voz2); % se obtiene el conjugado% 
voz2f = voz2 (1:100); % Solo acepta las Frecuencias arriba de 100 HZ %
voz2fn = voz2f/sqrt(sum (abs (voz2f).^2)); % se normaliza el vector %


c = audioread('am.wav');
p = audioread('em.wav');
l = audioread('im.wav');
a = audioread('om.wav');
n = audioread('um.wav');
w = audioread('af.wav');
t = audioread('ef.wav');
y = audioread('if.wav');
k = audioread('of.wav');
f = audioread('uf.wav');

c = normalizar(c);
vozc = abs(fft (c)); % se obtiene la transformada de fourier de la primera grabacion %
vozc = vozc.*conj (vozc); % se obtiene el conjugado% 
vozcf = vozc (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozcfn = vozcf/sqrt(sum (abs (vozcf).^2)); % se normaliza el vector %

p = normalizar(p);
vozp = abs(fft (p)); % se obtiene la transformada de fourier de la primera grabacion %
vozp = vozp.*conj (vozp); % se obtiene el conjugado% 
vozpf = vozp (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozpfn = vozpf/sqrt(sum (abs (vozpf).^2)); % se normaliza el vector %

l = normalizar(l);
vozl = abs(fft (l)); % se obtiene la transformada de fourier de la primera grabacion %
vozl = vozl.*conj (vozl); % se obtiene el conjugado% 
vozlf = vozl (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozlfn = vozlf/sqrt(sum (abs (vozlf).^2)); % se normaliza el vector %

a = normalizar(a);
voza = abs(fft (a)); % se obtiene la transformada de fourier de la primera grabacion %
voza = voza.*conj (voza); % se obtiene el conjugado% 
vozaf = voza (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozafn = vozaf/sqrt(sum (abs (vozaf).^2)); % se normaliza el vector %

n = normalizar(n);
vozn = abs(fft (n)); % se obtiene la transformada de fourier de la primera grabacion %
vozn = vozn.*conj (vozn); % se obtiene el conjugado% 
voznf = vozn (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
voznfn = voznf/sqrt(sum (abs (voznf).^2)); % se normaliza el vector %

w = normalizar(w);
vozw = abs(fft (w)); % se obtiene la transformada de fourier de la primera grabacion %
vozw = vozw.*conj (vozw); % se obtiene el conjugado% 
vozwf = vozw (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozwfn = vozwf/sqrt(sum (abs (vozwf).^2)); % se normaliza el vector %

t = normalizar(t);
vozt = abs(fft (t)); % se obtiene la transformada de fourier de la primera grabacion %
vozt = vozt.*conj (vozt); % se obtiene el conjugado% 
voztf = vozt (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
voztfn = voztf/sqrt(sum (abs (voztf).^2)); % se normaliza el vector %

y = normalizar(y);
vozy = abs(fft (y)); % se obtiene la transformada de fourier de la primera grabacion %
vozy = vozy.*conj (vozy); % se obtiene el conjugado% 
vozyf = vozy (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozyfn = vozyf/sqrt(sum (abs (vozyf).^2)); % se normaliza el vector %

k = normalizar(k);
vozk = abs(fft (k)); % se obtiene la transformada de fourier de la primera grabacion %
vozk = vozk.*conj (vozk); % se obtiene el conjugado% 
vozkf = vozk (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozkfn = vozkf/sqrt(sum (abs (vozkf).^2)); % se normaliza el vector %

f = normalizar(f);
vozf = abs(fft (f)); % se obtiene la transformada de fourier de la primera grabacion %
vozf = vozf.*conj (vozf); % se obtiene el conjugado% 
vozff = vozf (1:100); % Solo acepta las Frecuencias arriba de 600 HZ %
vozffn = vozff/sqrt(sum (abs (vozff).^2)); % se normaliza el vector %


disp('Diferencias fft')
disp(mean(abs(voz1-voz2)))
disp('Correlacion de Pearson')
disp(corr(voz1,voz2))
disp('Coeficiente de Error  A Masculina:')
error(1) = mean(abs(voz2-vozc));
disp(error(1))
disp('Correlacion de Error  E Masculina:')
error(2) = mean(abs(voz2-vozp));
disp(error(2))
disp('Correlacion de Error  I Masculina:')
error(3) = mean(abs(voz2-vozl));
disp(error(3))
disp('Correlacion de Error  O Masculina:')
error(4) = mean(abs(voz2-voza));
disp(error(4))
disp('Correlacion de Error  U Masculina:')
error(5) = mean(abs(voz2-vozn));
disp(error(5))
disp('Correlacion de Error  A Femenina:')
error(6) = mean(abs(voz2-vozw));
disp(error(6))
disp('Correlacion de Error  E Femenina:')
error(7) = mean(abs(voz2-vozt));
disp(error(7))
disp('Correlacion de Error  I Femenina:')
error(8) = mean(abs(voz2-vozy));
disp(error(8))
disp('Correlacion de Error  O Femenina:')
error(9) = mean(abs(voz2-vozk));
disp(error(9))
disp('Correlacion de Error  U Femenina:')
error(10) = mean(abs(voz2-vozf));
disp(error(10))

min_error = min(error);

switch min_error
    case error(1) 
        disp('Letra A Masculina')
    case error(2)
        disp('Letra E Masculina')
    case error(3)
        disp('Letra I Masculina')
    case error(4)
        disp('Letra O Masculina')
    case error(5)
        disp('Letra U Masculina')
    case error(6)
        disp('Letra A Femenina')
    case error(7)
        disp('Letra E Femenina')
    case error(8)
        disp('Letra I Femenina')
    case error(9)
        disp('Letra O Femenina')
    case error(10)
        disp('Letra U Femenina')     
end

subplot(2,5,1),plot(s); %relacion de posicion de la grafica%
title ('Grabacion 1')
subplot(2,5,2),plot(voz1fn); % Espectro de la grabacion 1 
title ('Espectro de la grabacion 1')

subplot(2,5,3),plot(g); %relacion de posicion de la grafica%
title ('Grabacion 2')
subplot(2,5,4),plot(voz2fn); % espectro de la grabacion 2 
title ('Espectro de la grabacion 2')

 subplot(2,5,6),plot(vozcfn); % espectro de la grabacion c 
 title ('Grabacion A Masculina')
 subplot(2,5,7),plot(vozpfn); % espectro de la grabacion p 
 title ('Grabacion E Masculina')
 subplot(2,5,8),plot(vozlfn); % espectro de la grabacion l 
 title ('Grabacion I Masculina')
 subplot(2,5,9),plot(vozafn); % espectro de la grabacion a 
 title ('Grabacion O Masculina')
 subplot(2,5,11),plot(voznfn); % espectro de la grabacion n 
 title ('Grabacion U Masculina')
 subplot(2,5,12),plot(vozwfn); % espectro de la grabacion w 
 title ('Grabacion A Femenina')
 subplot(2,5,13),plot(voztfn); % espectro de la grabacion t 
 title ('Grabacion E Femenina')
 subplot(2,5,14),plot(vozyfn); % espectro de la grabacion y 
 title ('Grabacion I Femenina')
 subplot(2,5,16),plot(vozkfn); % espectro de la grabacion k 
 title ('Grabacion O Femenina')
 subplot(2,5,17),plot(vozffn); % espectro de la grabacion f 
 title ('Grabacion U Femenina')
