-----------------------------------------------------------------------
--- Type system (using big-step SOS): Adding dynamic threads to IMP ---
-----------------------------------------------------------------------

Suggested steps to follow in order to extend the oringinal type system
(based on big-step SOS) of IMP in Maude to include dynamic threads:

1) Modify imp-type-system-bigstep.maude: Include Maude commands for typing
   the new programs.

2) Run imp-type-system-bigstep.maude: Everything typing before should still
   type, but the new programs making use of spawn stay unchanged because
   there is no typing rule for spawn yet (big-step SOS either reduces a
   program all the way through, or it does not reduce it at all).

3) Modify imp-type-system-semantics-bigstep.maude: Add the actual typing
   rule for spawn.

4) Run imp-type-system-bigstep.maude and check that all programs
   type properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Straightforward, as simple as it can get.
