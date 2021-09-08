% Fast Wavelet Transform
%
% In:
%   x: Original signal
%   Hh: Decomposition HPF kernel
%   Hl: Decomposition LPF kernel
%   n: Transform level
%
% Out:
%   c: Coeficients in the format [Aj, DJ, Dj-1...]
%   i: Length vector in the format [length(Aj), length(Dj), length(Dj-1)...]
%
function [i, c] = fwtNlevel(x, Hh, Hl, n)
  c = [];
  t = x;
  
  for j = 1:n
    if j > 1
      % Overwrite the last 'a'
      c = c(i(j):end);
    endif
    
    a = conv(t, Hl, "same");
    a = a(2:2:end);         
    
    d = conv(t, Hh, "same"); 
    d = d(2:2:end);
    
    c = [a, d, c]; 
    
    i(j) = length(d); 
    i(j+1) = length(a); 
    
    t = a;
  endfor
  
  i = flip(i);
endfunction
