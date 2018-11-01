-------------------------------------------
--- MSOS: Adding dynamic threads to IMP ---
-------------------------------------------

Suggested steps to follow in order to extend the oringinal MSOS of IMP in Maude
to include dynamic threads:

1) Modify imp-msos.maude: Add Maude commands for executing the new programs.

2) Run imp-msos.maude: Everything working before should still work;
   the new programs should get stuck on their first attempt to spawn a thread.

3) Modify imp-semantics-msos.maude:
   a) Add the two MSOS rules propagating the reduction permission from S to spawn(S) and
      from S2 to spawn(S1) ; S2;
   b) Add the MSOS rule reducing spawn(skip) to skip;
   c) Add the structural equation enforcing right associativity of sequential composition.

5) Run imp-smallstep.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) The propagation rules and the rule for dissolving threads are normal and modular.

2) However, we also had to add a structural equation for enforcing right associativity of sequential
   composition.  This equation is an artifact of the new dynamic threads feature (to keep the
   definition of the latter simpler and modular) and does not involve the new syntax (spawn).
