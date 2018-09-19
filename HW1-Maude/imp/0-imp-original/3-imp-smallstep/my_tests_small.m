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

q
