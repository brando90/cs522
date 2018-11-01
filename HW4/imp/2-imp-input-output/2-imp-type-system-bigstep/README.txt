--------------------------------------------------------------------
--- Type system (using big-step SOS): Adding input/output to IMP ---
--------------------------------------------------------------------

Suggested steps to follow in order to extend the oringinal type system
(based on big-step SOS) of IMP in Maude to include input/output constructs:

1) Modify imp-type-system-bigstep.maude: Include Maude commands
   for typing the new programs.

2) Run imp-type-system-bigstep.maude: Everything typing before should still type;
   the new programs should stay unchanged (big-step SOS either reduces a program
   all the way through, or it does not reduce it at all).

3) Modify imp-type-system-semantics-bigstep.maude: Add the actual typing rules
   of read and of print.

4) Run imp-type-system-bigstep.maude and check that all programs type properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Straightforward, as simple and modular as it can get.
