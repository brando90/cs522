in ../../../builtins.maude
in ../imp-syntax.maude
in ../../state.maude

in imp-semantics-smallstep

in ../imp-programs.maude

mod TEST is including IMP-SEMANTICS-SMALLSTEP + IMP-PROGRAMS .  endm

--- set trace on .

--- rew < 1 , .State > .
--- rew < errorBool , .State > .

--- SmallStep-Lookup
rew o < x, x |-> 3 > .
---rew o < x, x |-> errorAr > .

--- SmallStep-ADD

--- SmallStep-DIV
rew o < 4 / 2 , .State > .
rew o < 4 / 0 , .State > .
rew o < errorAr / 1 , .State > .
rew o < ( 4 / 0 ) / 1 , .State > .
---rew o < 4 / (1 / 0 ) , .State > .

q
