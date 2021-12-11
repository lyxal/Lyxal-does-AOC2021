# Part 1 only

@get_neighbours:x:y|
  # Assumes global variables: MAX_ROW, MAX_COL
  ⟨⟩ →ns
  ←x [ # x != 0 → left neighbour
    ←ns ⟨←x‹|←y⟩ wJ →ns 
  ]
  
  ←y [ # y != 0 → top neighbour
    ←ns ⟨←x|←y‹⟩ wJ →ns
  ]
  
  ←x 1 + ←_MAX_COL < [ # → right neighbour
    ←ns ⟨←x›|←y⟩ wJ →ns
  ]
  
  ←y 1 + ←_MAX_ROW < [ # → down neighbour
    ←ns ⟨←x|←y›⟩ wJ →ns
  ]
  
  ←ns
  ⟨⟨u|u⟩|⟨u|1⟩|⟨1|u⟩|⟨1|1⟩⟩ ←x ←y " v+
  
  '0 nh ≤ nh ←_MAX_COL < ∧
   0 nt ≤ nt ←_MAX_ROW < ∧
   ∧
  ;
  
  J
  
;

?vf⌊D hL →_MAX_COL L →_MAX_ROW →grid

99 (
  ←grid 1+ : →grid # Increment each energy level
  { ←grid f 9 > a |
    ←_MAX_COL ʁ(x|
      ←_MAX_ROW ʁ(y|
        ←grid ←y i ←x i 9 > [
          # First, update the cell
          ←grid : ←y i ←x 0 Ȧ ←y $ Ȧ
          ←y ←x @get_neighbours; # Get all the neighbours to increment
           (cell|
            : ←cell t i : ←cell h i : [1 + ←cell h $ Ȧ
            ←cell t $Ȧ :→grid|__]
          )
          
          # Finally, record the fact that there's been a flash
          ¥ 1+ £
        ]
      )
    )
  }
)

¥
