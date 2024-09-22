# BK3D.DarkArena
Second version of BK3D.Arena game

A 3D first person shooter on the BK0010? Is it possible? Yes! Despite having only 16K of RAM for the program and a 3MHz processor clock speed, dating back to the early 80s. Imagine that technically this could have existed already in 1985!

System req.:

BK0010, BK0010-01, BK0011M (w/ ANDOS, MKDOS)

To build you can use:

TURBO8 (stable)
MICRO2+ (very stable)
TURBO6M (unstable)
TURBO7MK (unstable)

1. Build into *.obj files (CL/SL, SL/SA)
2. Lbnk with linker with LI command

Link order: AR2.OBJ, S2.OBJ, TABS2.OBJ, UTIL2.OBJ, WL2.OBJ, MN2.OBJ, LG2.OBJ, MENU2.OBJ, TIT2.OBJ

AR2.OBJ should be 1st.
