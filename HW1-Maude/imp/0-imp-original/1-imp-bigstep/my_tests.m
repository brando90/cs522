in ../../../builtins.maude
in ../imp-syntax.maude
in ../../state.maude

in imp-semantics-bigstep

in ../imp-programs.maude

mod TEST is including IMP-SEMANTICS-BIGSTEP + IMP-PROGRAMS .  endm

--- set trace on .

---rewrite < 1 / 0 , .State > .
---rewrite < 1 / 1 , .State > .

rew < Error > .

--- AExps tests, # tests 5
rew < 3, .State > .
rew < 3, Error > .
rew < 3 / 0 , .State > .
rew < 1 / 0 , .State > .
rew < 3 + 3 / 0 , .State > .
rew < 3 / 0 + 3 , .State > .

--- BExps tests # test
rew < true, Error > .
rew < 1 ==Bool 1, Error > .
rew < false, Error > .
rew < 1 ==Bool 0, Error > .

rew < 3 / 0 <= 3 , .State > .
rew < 3 <= 3 / 0 , .State > .
rew < 3 / 0 <= 3 / 0 , .State > .
rew < 3 <= 3 , Error > .

rew < ! true,.State > .
rew < ! true,Error > .
rew < ! false,.State > .
rew < ! false,Error > .
rew < ! 1 <= 1,Error > .
rew < ! 1 / 0 <= 1,Error > .

rew < true && true, .State > .
rew < true && false, .State > .
rew < true && true, Error > .
rew < true && false, Error > .
rew < false && false, Error > .
rew < true && 3 / 0 <= 2, .State > . --- < Error >
rew < 3 / 0 <= 2 && true, .State > . --- < Error >

rew < 3 / 0 <= 2 && false, .State > . --- false
rew < false && 3 / 0 <= 2, .State > . --- false

--- Test , # tests 4
rew < {}, Error > .

--- set trace on .
rew < { x = 5 ; } , .State > .
rew < { x = 5 ; } , Error > .
---rew < x = 5 ; , Error > .

---
--- rew < x =  3 / 1 ; ,  x |-> 0 > .
---rew < x =  3 / 0 ; ,  x |-> 0 > .

---rew if( 1 <= 0 ) { x = 1 / 0 ; } else 1 . --- this should go to < 1 > .

q
