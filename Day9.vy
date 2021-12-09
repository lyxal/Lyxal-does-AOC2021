# Only part 1 because idk how to part 2

ƛƛ⌊;; D →grid
hL →column_count
L →row_count

←row_count (row|
  ←column_count (col|
     ←grid ←row i ←col i →item
     ←row [ # If the row isn't row 0 - has a top neighbour
       # Use the global array to store neighbours
       ←grid ←row ‹ i ←col i ⅛
     ]
     
     ←row ←row_count ‹ ≠ [ # If it isn't the last row - has a bottom neighbour
       ←grid ←row › i ←col i ⅛
     ]
     
     
     ←col [ # Ir the column isn't column 0 - has a left neighbour
       ←grid ←row i ←col ‹ i ⅛
     ]
     
     ←col ←column_count ‹≠ [ # If it isn't the last column - has a right neighbour
       ←grid ←row i ←col › i ⅛
     ]
     
     ←item ¾ < A [¥ ←item › + £]
     ¾(¼_)
  )
)

¥,
