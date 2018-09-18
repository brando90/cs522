in ../../../builtins.maude
in ../imp-syntax.maude
in ../../state.maude

in imp-semantics-bigstep

in ../imp-programs.maude

mod TEST is including IMP-SEMANTICS-BIGSTEP + IMP-PROGRAMS .  endm

---var Sigma : State .

---rewrite < 1 / 0 , .State > .
---rewrite < 1 / 1 , .State > .

--- Test , # tests 4
rew < Error > .
rew < {}, Error > .
rew < { x = 5 ; } , Error > .
rew < x = 5 ; , Error > .

--- AExps tests, # tests 5
rew < 3, .State > .
rew < 3, Error > .
rew < 3 / 0 , .State > .
rew < 3 + 3 / 0 , .State > .
rew < 3 / 0 + 3 , .State > .

--- BExps tests # test 3
rew < 3 / 0 <= 3 , .State > .
rew < 3 <= 3 / 0 , .State > .
rew < true, Error > .
rew < 1 ==Bool 1, Error > .

---
--- rew < x =  3 / 1 ; ,  x |-> 0 > .
---rew < x =  3 / 0 ; ,  x |-> 0 > .

---rew if( 1 <= 0 ) { x = 1 / 0 ; } else 1 . --- this should go to < 1 > .

q
