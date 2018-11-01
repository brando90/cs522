----------------------------------------------
--- CHAM: Adding abrupt termination to IMP ---
----------------------------------------------

Suggested steps to follow in order to extend the oringinal CHAM of IMP in Maude
to include abrupt termination:

1) Modify imp-cham.maude: Add Maude commands for executing the new programs.

2) Run imp-cham.maude: Everything working before should still work;
   the new programs should get stuck on the first attempt to terminate abruptly.

3) Modify imp-semantics-cham.maude: Add the actual CHAM semantics of abrupt termination.

4) Run imp-cham.maude and check that all programs evaluate properly.

------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the rules for abrupt termination.  Nothing else changed.
