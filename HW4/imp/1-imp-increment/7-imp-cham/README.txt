----------------------------------------------
--- CHAM: Adding variable increment to IMP ---
----------------------------------------------

Suggested steps to follow in order to extend the oringinal CHAM of IMP in Maude
to include variable increment:

1) Modify imp-cham.maude: Add Maude commands for executing the new programs.

2) Run imp-cham.maude: Everything working before should still work;
   the new programs should get stuck on the first statement involving increment.

3) Modify imp-semantics-cham.maude: Add the actual CHAM semantics of increment (one rule).

4) Run imp-cham.maude and check that all programs evaluate properly;
   notice the three different ways (x is 1, 2, or 3) in which nondetPgm evaluates.

------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the rule for increment.  Nothing else changed.
