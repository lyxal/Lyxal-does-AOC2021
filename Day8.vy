# Part 1:
# ` | `/vtð/f'L⟨2|3|4|7⟩$c;L 

# THIS IS ALL PART 2

ƛ` | `/fṫ →final_expression # Keep only the digit combos
ð/f # Split on spaces

# Get all the obvious items based on length
:'L2=;:h →_one ⊍
:'L3=;:h →_seven ⊍
:'L4=;:h →_four ⊍
:'L7=;:h →_eight ⊍

# The top of the stack now contains 0, 2, 3, 5, 6, 9
# but first, get segment A, which is just <1> ⊍ <7>

←_one ←_seven ⊍h →seg_A

# now, get 3, which is the only LEN 5 where len(n ⊍ 7) == 2

: 'L5=; '←_seven ⊍L2=; h:  →_three o

# next, get 0, which is the only LEN 6 where len(n - (4 ⊍ 1)) == 5

: 'L6=; '←_four ←_one ⊍∑(no)L5=;h: →_zero o

# From there, we can obtain segment D from 0 ⊍ 8

←_zero ←_eight ⊍h →_seg_D

# And then, we can get segment B from (1 ⊍ 4) ⊍ D

←_one ←_four ⊍ ←_seg_D ⊍h →_seg_B

# Now for the two parts of the funny number
# 6 is the only LEN 6 where len(n ⊍ 1) == 5

: 'L6=; '←_one (no) L5=; h: →_six o

# The only LEN 6 left is 9

: 'L6=;h: →_nine o

# Finally, we can now get 5 and 2
# 2 is the only LEN 5 where len(n ⊍ B) == 5

# No need to filter by length because there's only LEN 5s

: '←_seg_B o L5=;h: →_two o
h →_five # last item lol

# Now for the actual decoding part

←final_expression ð/ ƛ
  ⟨←_zero|←_one|←_two|←_three|←_four|←_five|←_six|←_seven|←_eight|←_nine⟩ vs ns ḟ
;ṅ;⌊∑
