----------------------------------------------
--- MSOS: Adding variable increment to IMP ---
----------------------------------------------

Suggested steps to follow in order to extend the oringinal MSOS of IMP in Maude
to include variable increment:

1) Modify imp-msos.maude: Add Maude commands for executing the new programs.

2) Run imp-msos.maude: Everything working before should still work;
   the new programs should get stuck on the first statement involving increment.

3) Modify imp-semantics-msos.maude: Add the actual MSOS of increment (two rules).

4) Run imp-smallstep.maude and check that all programs evaluate properly;
   notice the five ways (x is 0, 1, 2, 3, or stuck) that nondetPgm evaluates.


------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the rule for increment.  Nothing else changed.
