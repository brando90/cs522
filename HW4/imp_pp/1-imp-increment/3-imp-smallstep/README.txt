--------------------------------------------------------
--- Small-step SOS: Adding variable increment to IMP ---
--------------------------------------------------------

Suggested steps to follow in order to extend the oringinal small-step SOS
of IMP in Maude to include variable increment:

1) Modify imp-smallstep.maude: Add Maude commands for executing the new programs.

2) Run imp-smallstep.maude: Everything working before should still work;
   the new programs should get stuck on the first statement involving increment.

3) Modify imp-semantics-smallstep.maude: Change the existing semantic rules to
   always propagate the side effects; almost all rules need to change.
	  
5) Run imp-smallstep.maude: Everything working before should still work, and the
   new programs should still get stuck on their firsts increment.

6) Add the actual small-step SOS of increment, which consists of one rule.

7) Run imp-smallstep.maude and check that all programs evaluate properly;
   notice the five ways (x is 0, 1, 2, 3, or stuck) that nondetPgm evaluates.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Every rule involving the evaluation of any non-atomic expression had to change
   in order to propagate the side effects.
