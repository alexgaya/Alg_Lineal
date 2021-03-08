function [A,b] = Gauss(A,b)
  n = rows(b)
  for i = 1: n-1
    for j = i+1: n
      m = A(j,i)/A(i,i)
      A(j,i) = 0
      for k = i+1: n
        A(j,k) = A(j,k) - m * A(i,k)
      endfor
      b(j,1) = b(j,1) - m * b(i,1)
    endfor
  endfor
endfunction  
    