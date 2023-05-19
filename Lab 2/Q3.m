fs=44100;
t=linspace(0,0.022,0.022*fs);
x1=cos(2*1000*pi*t);
x2=cos(2*3000*pi*t);
x3=cos(2*43500*pi*t);
figure;plot(x1+x2+x3)

n=length(x1);
f=(-n/2:n/2-1)*(fs/n);
f_domain=fftshift(fft(x1+x2+x3));
figure;plot(f,f_domain)