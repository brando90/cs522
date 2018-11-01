----------------------------------------------
--- MSOS: Adding variable increment to IMP ---
----------------------------------------------

Suggested steps to follow in order to extend the oringinal MSOS of IMP in Maude
to include abrupt termination:

1) Modify imp-msos.maude: Add Maude commands for executing the new programs.

2) Run imp-msos.maude: Everything working before should still work;
   the new programs should get stuck on their first attempt to abruptly terminate.

3) Modify imp-semantics-msos.maude:
   a) Add a new attribute, halting, to hold the halting status (true or false)
   b) Add the actual two MSOS rules for abrupt termination, each setting the
      status of halting to true.
   c) Add the new top statement construct to "catch" the halting signal,
      and redefine the MSOS rule for programs to make use of this top construct.

4) Modify imp-msos.maude: Add the halting attribute, holding false, to any
   configuration holding an explicit state that appears in any of the concrete
   rewrite or search commands.

5) Run imp-smallstep.maude and check that all programs evaluate properly,
   resulting in configurations that look the same way no matter whether the
   program was terminated normally or abruptly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) The addition of the top statement construct is artificial but unavoidable.
   SOS in general and MSOS in particular cannot distinguish between reductions
   taking place at the top of the original configuration and intermediate
   reductions taking place in rule premisses.

2) Other than the extensions above that would have not been needed otherwise,
   adding abrupt termination did not require changes of existing semantic rules.
   The halting label allowed to elegantly carry over the halting signal
   "all the way to the top", without having to explicitly propagate it through
   each language construct as in small-step SOS.
