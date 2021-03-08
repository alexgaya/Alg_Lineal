function[A,b] = GaussMaximalPivoting(A,b)
  n = rows(b)
  for i = 1 : n
    v(i) = i
  endfor
  maxRow = 0
  maxCol = 0
  for k = 1 : n-1
    
    #Get the row and the column where the max is located
    for i = k : n
      for j = k : n
        if abs(A(i,j)) > abs(max)
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
      
      if k != maxRow
        tmp = A(maxRow, 1:n)
        A(maxRow, 1:n) = A(k, 1:n)
        A(k, 1:n) tmp
      endif
      
    endif
       
  endfor
endfunction