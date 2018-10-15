-----------------------------------------------------
--- Small-step SOS: Adding local variables to IMP ---
-----------------------------------------------------

Suggested steps to follow in order to extend the oringinal small-step SOS
of IMP in Maude to include local variables:

1) Modify imp-smallstep.maude: Modify the previous Maude commands for programs
   to wrap them in configurations including a state that initializes all
   the purposely undeclared variables.

2) Run imp-smallstep.maude: No program should be completely reduced, because
   of the missing semantics for let.  The programs will be desugared and the
   rewriting of each program should get stuck on a let statement.

3) Modify imp-semantics-smallstep.maude:
   a) Add three rules for the small-step SOS of let.
   b) Replace the previous rule for programs so that they are regarded
      as just statements in the initial empty state.

4) Run imp-smallstep.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Modular, though one would expect only two rules, not three, for let.

2) The second small-step SOS rule for let is rather tricky.
