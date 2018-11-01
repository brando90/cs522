-------------------------------------------
--- MSOS: Adding local variables to IMP ---
-------------------------------------------

Suggested steps to follow in order to extend the oringinal MSOS
of IMP in Maude to include local variables:

1) Modify imp-msos.maude: Modify the previous Maude commands for programs
   to wrap them in configurations including a state that initializes all
   the purposely undeclared variables.

2) Run imp-msos.maude: No program should be completely reduced, because
   of the missing semantics for let.  The programs will be desugared and the
   rewriting of each program should get stuck on a let statement.

3) Modify imp-semantics-msos.maude:
   a) Add three rules for the MSOS of let.
   b) Replace the previous rule for programs with an equation stating that programs
      are just statements in the initial state.

4) Run imp-msos.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

Same like for SOS:

1) Modular, though one would expect only two rules, not three, for let.

2) The second MSOS rule for let is rather tricky.
