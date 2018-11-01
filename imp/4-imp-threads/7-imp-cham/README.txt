-------------------------------------------
--- CHAM: Adding dynamic threads to IMP ---
-------------------------------------------

Suggested steps to follow in order to extend the oringinal CHAM of IMP
in Maude to include dynamic threads:

1) Modify imp-cham.maude: Add Maude commands for executing the new programs.

2) Run imp-cham.maude: Everything working before should still work;
   the new programs should get stuck on the first attempt to spawn a thread.

3) Modify imp-semantics-cham.maude: Add the actual CHAM semantics of
   thread creation and termination.

4) Run imp-cham.maude and check that all programs evaluate properly.

------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the rules for spawning and collecting threads.
   Nothing else changed.
