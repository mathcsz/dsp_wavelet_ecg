function printWfilters(Hp, Lp)
  LoDFT = fft(Lp, 64);
  HiDFT = fft(Hp, 64);
  freq = -pi+(2*pi)/64:(2*pi)/64:pi;
  
  figure;
  subplot(221);stem(Lp,'markerfacecolor',[0 0 1]);
  title('Decomposition LPF')
  subplot(222);stem(Hp,'markerfacecolor',[0 0 1]);
  title('Decomposition HPF')
  subplot(223); plot(freq,fftshift(abs(LoDFT)));
  set(gca,'xlim',[-pi,pi]); xlabel('Rad/sample');
  title('DFT - LPF')
  subplot(224); plot(freq,fftshift(abs(HiDFT)));
  set(gca,'xlim',[-pi,pi]); xlabel('Rad/sample');
  title('DFT - HPF')
endfunction
