function [varargout] = getWcoef(c, i)
  l = 1;
 
  for k = 1:nargout
    varargout{k} = c(l:l+i(k)-1);
    l += i(k);
  endfor
  
endfunction
