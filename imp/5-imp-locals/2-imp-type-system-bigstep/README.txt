-----------------------------------------------------------------------
--- Type system (using big-step SOS): Adding local variables to IMP ---
-----------------------------------------------------------------------

Suggested steps to follow in order to extend the oringinal type system
(based on big-step SOS) of IMP in Maude to include local variables:

1) Modify imp-type-system-bigstep.maude: Modify the previous Maude commands
   for programs to wrap them in configurations containing a type environment
   that includes all the purposely undeclared variables.

2) Run imp-type-system-bigstep.maude: No program should be typed, because of
   the missing typing rule for let.  The programs will be desugared though,
   so one should see let statements in each of the unreduced programs.  Recall
   that big-step SOS either reduces the entire program or reduces nothing.

3) Modify imp-type-system-semantics-bigstep.maude:
   a) Add a rule for the typing of let.
   b) Replace the previous rule for programs so that they are regarded
      as just statements in the initial empty type environment.

4) Run imp-type-system-bigstep.maude and check that all programs type properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Straightforward, as simple as it can get.
