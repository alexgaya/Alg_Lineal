function s = GaussMaximalPivoting(A,b)
  n = rows(b)
  for i = 1 : n
    v(i) = i
  endfor
  
  for k = 1 : n-1
    maxRow = k
    maxCol = k  
    #Get the row and the column where the max is located
    for i = k : n
      for j = k : n
        if abs(A(i,j)) > abs(A(maxRow,maxCol))
          maxRow = i
          maxCol = j
        endif
      endfor
    endfor
    
    if A(maxRow,maxCol) == 0
      m = 1
    else
      
      #Swap columns
      if k != maxCol
        v(k) = maxCol
        v(maxCol) = k
        
        tmp = A(1:n, maxCol)
        A(1:n, maxCol) = A(1:n, k)
        A(1:n, k) = tmp
      endif  
      
      #Swap rows
      if k != maxRow
        tmp = A(maxRow, 1:n)
        A(maxRow, 1:n) = A(k, 1:n)
        A(k, 1:n) = tmp
        tmp = b(maxRow)
        b(maxRow) = b(k)
        b(k) = tmp
      endif
      
      #Solve once the data is optimally ordered
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
  
  #BackSubs
  s(n,1) = b(n)/A(n,n)
  for i = n-1:-1:1
    s(i,1) = (b(i,1)-A(i,i+1:n)*s(i+1:n,1))/A(i,i)
  endfor
  
  #Reorder data
  for i = 1 : n
    if v(i) != i
      tmp = v(i)
      v(i) = i
      v(tmp) = tmp
      aux = s(i)
      s(i) = s(tmp)
      s(tmp) = aux
    endif
  endfor
  
endfunction