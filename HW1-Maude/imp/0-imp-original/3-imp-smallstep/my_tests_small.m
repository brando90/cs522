in ../../../builtins.maude
in ../imp-syntax.maude
in ../../state.maude

in imp-semantics-smallstep

in ../imp-programs.maude

mod TEST is including IMP-SEMANTICS-SMALLSTEP + IMP-PROGRAMS .  endm

--- set trace on .

--- rew < 1 , .State > .
--- rew < errorBool , .State > .
rew o < 8 + 2 , .State > .
rew o < ( 8 ) / ( 2 / 1 ) , .State > .
rew * < ( 8 ) / ( 2 / 1 ) , .State > .
rew * < ( 8 ) / ( 2 / 1 ) + ( 3 + ( 3 + 3 ) ) , .State > .

--- SmallStep-On-Errors
rew o < errorAr, x |-> 3 > .
rew * < errorAr, x |-> 3 > .
rew o < errorAr, .State > .
rew * < errorAr, .State > .

rew o < errorBool, x |-> 3 > .
rew * < errorBool, x |-> 3 > .
rew o < errorBool, .State > .
rew * < errorBool, .State > .

rew o < errorStmt, x |-> 3 > .
rew * < errorStmt, x |-> 3 > .
rew o < errorStmt, .State > .
rew * < errorStmt, .State > .

--- SmallStep-Lookup
rew o < x, x |-> 3 > .
--- rew o < x, x |-> errorAr > .

--- SmallStep-DIV
rew o < 4 / 2 , .State > .
rew o < 4 / 0 , .State > .
rew o < 4 / 0 , x |-> 2 > .
rew * < 4 / 0 , x |-> 2 > .
rew * < errorAr, x |-> 3 > .
rew o < ( 8 / 2 ) / ( 2 / 1 ) , .State > .
rew * < ( 8 / 2 ) / ( 2 / 1 ) , .State > .
rew o < errorAr / 1 , .State > .
rew * < errorAr / 1 , .State > .
rew o < 1 / errorAr , .State > .
rew * < 1 / errorAr , .State > .
rew o < ( 4 / 0 ) / 1 , .State > .
rew o < ( 4 / 0 ) / 1 , x |-> 3 > .
rew o < 4 / ( 1 / 0 ) , .State > .
rew * < ( 4 / 0 ) / 1 , .State > .
rew o < x / 0 , .State > .
rew o < x / 1 , x |-> 4 > .
rew * < x / 1 , x |-> 4 > .
rew * < ( x / 0 ) / x , .State > .
rew * < x / ( x / 0 ) , .State > .

--- SmallStep-ADD
rew o < 1 + ( 1 + 2 ) , .State > .
rew * < 1 + ( 1 + 2 ) , .State > .
rew o < ( 1 / 0 ) + 1 , .State > .
rew o < 1 + ( 1 / 0 ) , .State > .
rew * < 1 + ( 1 + 2 ) + (2 / (3 / 0 ) + 0 ), .State > .
rew o < x + ( x / 0 ) , .State > .
rew o < x + ( x / 0 ) , x |-> 3 > .
rew * < x + ( x / 0 ) , x |-> 3 > .
rew * < x + ( x / 0 ) , .State > .

q
