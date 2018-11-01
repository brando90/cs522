---------------------------------------------------
--- Big-step SOS: Adding local variables to IMP ---
---------------------------------------------------

Suggested steps to follow in order to extend the original big-step SOS
of IMP in Maude to include local variables:

1) Modify imp-bigstep.maude: Modify the previous Maude commands for programs
   to wrap them in configurations including a state that initializes all
   the purposely undeclared variables.

2) Run imp-bigstep.maude: No program should be reduced, because of the missing
   semantics for let.  The programs will be desugared though, so one should
   see let statements in each of the unreduced programs.  Recall that one problem
   with big-step SOS is that it either reduces the entire program or reduces
   nothing, which makes it particularly hard to debug.

3) Modify imp-semantics-bigstep.maude:
   a) Add a rule for the big-step SOS of let.
   b) Replace the previous rule for programs so that they are regarded
      as statements in the initial empty state.

4) Run imp-bigstep.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Simple and modular.
