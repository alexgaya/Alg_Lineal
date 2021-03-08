function [A,b] = GaussColumnPivoting(A,b)
  n = rows(b)
  for k = 1 : n-1
    max = k
    for i = k+1 : n
      if abs(A(i,k)) > abs(A(max,k))
        max = i
      endif
    endfor
    if A(max,k) == 0
      m(k+1,k) = 1
    else
      tmp = A(k,1:n)
      A(k,1:n) = A(max,1:n)
      A(max,1:n) = tmp
      for i = k+1 : n
        m = A(i,k)/A(k,k)
        A(i,k) = 0
        for j = k+1:n
          A(i,j) = A(i,j) - m*A(k,j) 
        endfor
        b(i) = b(i) - m*b(k)
      endfor
    endif
  endfor
endfunction  
    