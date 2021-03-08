function f = BackwardSubs(a,b)
  n = rows(b)
  f(n,1) = b(n)/a(n,n)
  for i = n-1:-1:1
    f(i,1) = (b(i,1)-a(i,i+1:n)*f(i+1:n,1))/a(i,i)
  endfor
endfunction  

