# BK3D.DarkArena
Second version of BK3D.Arena game

Whats new?
1. Ligth effects on walls&floors
2. Monsters now in colour
3. Monsters now sorted in depth
4. Engine supports separate thread for game logic

Look at p.4: now it's possible to run faster computers more accuracy. 

A 3D first person shooter on the BK0010? Is it possible? Yes! Despite having only 16K of RAM for the program and a 3MHz processor clock speed, dating back to the early 80s. Imagine that technically this could have existed already in 1985!

System req.:

BK0010, BK0010-01, BK0011M (w/ ANDOS, MKDOS)

To build you can use:

MICRO2+ (very stable, develop tool)
TURBO8 (stable)
TURBO6M (unstable)
TURBO7MK (unstable)

1. Build into *.obj files (CL/SL, SL/SA)
2. Link with linker with LI command

Link order: AR2.OBJ, S2.OBJ, TABS2.OBJ, UTIL2.OBJ, WL2.OBJ, MN2.OBJ, LG2.OBJ, MENU2.OBJ, TIT2.OBJ

AR2.OBJ should be 1st.
