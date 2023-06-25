List<String> alphabetPatterns = [
  // Letter A
  '''
       A       
      A A      
     A   A     
    AAAAAAA    
   A       A   
  A         A  
 A           A 
''',

  // Letter B
  '''
BBBBBBB  
B      B 
B      B 
BBBBBBB  
B      B 
B      B 
BBBBBBB  
''',

  // Letter C
  '''
 CCCCCC  
C       
C       
C       
C       
C       
 CCCCCC  
''',

  // Letter D
  '''
DDDDDDD  
D      D 
D      D 
D      D 
D      D 
D      D 
DDDDDDD  
''',

  // Letter E
  '''
EEEEEEE  
E       
E       
EEEEEEE  
E       
E       
EEEEEEE  
''',

  // Letter F
  '''
FFFFFFF  
F       
F       
FFFFFFF  
F       
F       
F       
''',

  // Letter G
  '''
 GGGGGG  
G       
G       
G    GGG 
G      G 
G      G 
 GGGGGG  
''',

  // Letter H
  '''
H      H 
H      H 
H      H 
HHHHHHHH
H      H 
H      H 
H      H 
''',

  // Letter I
  '''
IIIIIII  
   I    
   I    
   I    
   I    
   I    
IIIIIII  
''',

  // Letter J
  '''
JJJJJJJ  
   J    
   J    
   J    
   J    
J  J    
 J      
''',

  // Letter K
  '''
K      K 
K     K  
K   K    
K K      
K   K    
K     K  
K      K 
''',

  // Letter L
  '''
L       
L       
L       
L       
L       
L       
LLLLLLL  
''',

  // Letter M
  '''
M       M
MM     MM
M M   M M
M  M M  M
M   M   M
M       M
M       M
''',

  // Letter N
  '''
N       N
NN      N
N N     N
N  N    N
N   N   N
N    N  N
N     N N
N      NN
''',

  // Letter O
  '''
 OOOOOO  
O      O 
O      O 
O      O 
O      O 
O      O 
 OOOOOO  
''',

  // Letter P
  '''
PPPPPPP  
P      P 
P      P 
PPPPPPP  
P       
P       
P       
''',

  // Letter Q
  '''
 QQQQQQ  
Q      Q 
Q      Q 
Q      Q 
Q   Q  Q 
Q    Q Q 
 QQQQ QQ 
''',

  // Letter R
  '''
RRRRRRR  
R      R 
R      R 
RRRRRRR  
R  R    
R   R   
R    R  
''',

  // Letter S
  '''
 SSSSSS  
S       
S       
 SSSSSS  
       S 
       S 
SSSSSSS  
''',

  // Letter T
  '''
TTTTTTT  
   T    
   T    
   T    
   T    
   T    
   T    
''',

  // Letter U
  '''
UUUUUUU  
U      U 
U      U 
U      U 
U      U 
U      U 
 UUUUUU  
''',

  // Letter V
  '''
V       V
V       V
V       V
V       V
 V     V 
  V   V  
   V V   
    V    
''',

  // Letter W
  '''
W       W
W       W
W       W
W   W   W
W  W W  W
W W   W W
WW     WW
''',

  // Letter X
  '''
X       X
 X     X 
  X   X  
   X X   
    X    
   X X   
  X   X  
 X     X 
''',

  // Letter Y
  '''
Y       Y
 Y     Y 
  Y   Y  
   Y Y   
    Y    
    Y    
    Y    
    Y    
''',

  // Letter Z
  '''
ZZZZZZZ  
      Z  
     Z   
    Z    
   Z     
  Z      
 Z       
ZZZZZZZ  
''',
];
List<String> design1 = [
  '''
░█████╗░
██╔══██╗
███████║
██╔══██║
██║░░██║
╚═╝░░╚═╝''',
  '''
██████╗░
██╔══██╗
██████╦╝
██╔══██╗
██████╦╝
╚═════╝░
  ''',
  '''
░█████╗░
██╔══██╗
██║░░╚═╝
██║░░██╗
╚█████╔╝
░╚════╝░
  ''',
  '''
██████╗░
██╔══██╗
██║░░██║
██║░░██║
██████╔╝
╚═════╝░
  ''',
  '''
███████╗
██╔════╝
█████╗░░
██╔══╝░░
███████╗
╚══════╝
  ''',
  '''
███████╗
██╔════╝
█████╗░░
██╔══╝░░
██║░░░░░
╚═╝░░░░░
  ''',
  '''
░██████╗░
██╔════╝░
██║░░██╗░
██║░░╚██╗
╚██████╔╝
░╚═════╝░
  ''',
  '''
██╗░░██╗
██║░░██║
███████║
██╔══██║
██║░░██║
╚═╝░░╚═╝
  ''',
  '''
██╗
██║
██║
██║
██║
╚═╝
  ''',
  '''
░░░░░██╗
░░░░░██║
░░░░░██║
██╗░░██║
╚█████╔╝
░╚════╝░
  ''',
  '''
██╗░░██╗
██║░██╔╝
█████═╝░
██╔═██╗░
██║░╚██╗
╚═╝░░╚═╝
  ''',
  '''
██╗░░░░░
██║░░░░░
██║░░░░░
██║░░░░░
███████╗
╚══════╝
  ''',
  '''
███╗░░░███╗
████╗░████║
██╔████╔██║
██║╚██╔╝██║
██║░╚═╝░██║
╚═╝░░░░░╚═╝
  ''',
  '''
███╗░░██╗
████╗░██║
██╔██╗██║
██║╚████║
██║░╚███║
╚═╝░░╚══╝
  ''',
  '''
░█████╗░
██╔══██╗
██║░░██║
██║░░██║
╚█████╔╝
░╚════╝░
  ''',
  '''
██████╗░
██╔══██╗
██████╔╝
██╔═══╝░
██║░░░░░
╚═╝░░░░░
  ''',
  '''
░██████╗░
██╔═══██╗
██║██╗██║
╚██████╔╝
░╚═██╔═╝░
░░░╚═╝░░░
  ''',
  '''
██████╗░
██╔══██╗
██████╔╝
██╔══██╗
██║░░██║
╚═╝░░╚═╝
  ''',
  '''
░██████╗
██╔════╝
╚█████╗░
░╚═══██╗
██████╔╝
╚═════╝░
  ''',
  '''
████████╗
╚══██╔══╝
░░░██║░░░
░░░██║░░░
░░░██║░░░
░░░╚═╝░░░
  ''',
  '''
██╗░░░██╗
██║░░░██║
██║░░░██║
██║░░░██║
╚██████╔╝
░╚═════╝░
  ''',
  '''
██╗░░░██╗
██║░░░██║
╚██╗░██╔╝
░╚████╔╝░
░░╚██╔╝░░
░░░╚═╝░░░
  ''',
  '''
░██╗░░░░░░░██╗
░██║░░██╗░░██║
░╚██╗████╗██╔╝
░░████╔═████║░
░░╚██╔╝░╚██╔╝░
░░░╚═╝░░░╚═╝░░
  ''',
  '''
██╗░░██╗
╚██╗██╔╝
░╚███╔╝░
░██╔██╗░
██╔╝╚██╗
╚═╝░░╚═╝
  ''',
  '''
██╗░░░██╗
╚██╗░██╔╝
░╚████╔╝░
░░╚██╔╝░░
░░░██║░░░
░░░╚═╝░░░
  ''',
  '''
███████╗
╚════██║
░░███╔═╝
██╔══╝░░
███████╗
╚══════╝
  '''
];
