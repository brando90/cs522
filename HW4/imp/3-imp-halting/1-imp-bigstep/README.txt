------------------------------------------------------
--- Big-step SOS: Adding abrupt termination to IMP ---
------------------------------------------------------

Suggested steps to follow in order to extend the oringinal big-step SOS
of IMP in Maude to include abrupt termination:

1) Modify imp-bigstep.maude: Add Maude commands for executing the new programs.

2) Run imp-bigstep.maude: Everything working before should still work;
   the new programs should stay unchanged (big-step SOS either reduces a program
   all the way through, or it does not reduce it at all).

3) Modify imp-semantics-bigstep.maude:
   a) Add two new result configurations to mark the two halting situations.
   b) For each existing big-step SOS rule having n premises, add n additional
      big-step SOS rules, one for each premise potentially halting, each propgating
	  the halting situation of that premise through the corresponding construct.

4) Run imp-bigstep.maude: Everything working before should still work the same way;
   the new programs should still stay unchanged, that is, unevaluated.
   ATTENTION: the new big-step SOS is very slow, so you may need to replace 100 by 2.

6) Add the actual big-step SOS of division by zero and halt, each consisting of one rule.

7) Run imp-bigstep.maude and check that all programs evaluate properly,
   resulting in configurations that look the same way no matter whether the
   program was terminated normally or abruptly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Result expression configurations had to change in order to capture the side effects.

2) Every existing conditional rule generated new rules, one for each premise.

3) The resulting big-step SOS is VERY slow in search mode and can be very slow in rewrite
   mode, too, if the search in conditions happen to not find the desired path immediately.
   This is NOT a problem of our Maude implementation, it is a problem of big-step SOS.
   Many think of big-step SOS almost as if it is defining an interpreter.  That is wrong
   in general.  It happens to be an interpreter when one's rules are deterministic,
   syntax-driven.  Otherwise, a complex search may be needed.  Indeed, big-step SOS is not
   telling how to execute the program; it only tells you what is possible.  Maude helps to
   some extent to implement the "how", but one should not expect magic in general.
 