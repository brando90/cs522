--------------------------------------------------------------------------
--- Type system (using big-step SOS): Adding abrupt termination to IMP ---
--------------------------------------------------------------------------

Suggested steps to follow in order to extend the oringinal type system
(based on big-step SOS) of IMP in Maude to include abrupt termination:

1) Modify imp-type-system-bigstep.maude: Include Maude commands for typing
   the new programs.

2) Run imp-type-system-bigstep.maude: Everything typing before should still
   type; sumDivByZeroPgm also types, because type systems typically do not
   prove that division-by-zero cannot take place (this is an undecidable
   problem).  However, sumHaltPgm stays unchanged because there is no
   typing rule for halt yet (big-step SOS either reduces a program all the
   way through, or it does not reduce it at all).

3) Modify imp-type-system-semantics-bigstep.maude: Add the actual typing
   rule for halt.

4) Run imp-type-system-semantics.maude and check that all programs type
   properly.  Note that in both cases of abrupt termination, the entire
   code base is type checked, not only the reachable code.  This is also
   common for type checkers, because detecting unreachable code, like
   detecting division by zero, is also an undecidable problem.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Straightforward, as simple as it can get.
