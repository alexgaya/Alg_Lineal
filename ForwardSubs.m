function f = ForwardSubs(a,b)
  n = rows(b)
  f(1,1) = b(1,1)/a(1,1)
  for i = 2:n
    f(i,1) = (b(i,1)-a(i,1:i-1)*f(1:i-1,1))/a(i,i)
  endfor
endfunction  
