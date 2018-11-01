--------------------------------------------------
--- Small-step SOS: Adding input/output to IMP ---
--------------------------------------------------

Suggested steps to follow in order to extend the oringinal small-step SOS
of IMP in Maude to include input/output constructs:

1) Modify imp-smallstep.maude: Include buffer.maude at the begining.

2) Modify imp-semantics-smallstep.maude:
   a) Include module BUFFER in module IMP-CONFIGURATIONS-SMALLSTEP.
   b) Add input buffers to expression configurations.
   c) Add input and output buffers to statement configurations.
   d) Add an input buffer to initial configurations.
   e) Modify the existing smallstep SOS rules to use the new configurations,
      making sure that the rule for variable declarations includes the empty
	  output in the initial statement configuration that it generates.

3) Modify imp-smallstep.maude: modify the rewrite/search commands to use the
   new configurations, and add rewrite/search commands for the new programs
   as well.

4) Run imp-smallstep.maude: Everything working before should still work, and
   should include empty input/output buffers in the result configurations;
   the new programs should get stuck when the first input/output construct
   is encountered.

5) Add the actual small-step SOS of read and print, the first consisting of
   one rule and the second consisting of two rules.

7) Run imp-smallstep.maude and check that all programs evaluate properly.
   Notice that all behaviors of the nondeterministic program are captured.


------------------------------
--- Observations, thoughts ---
------------------------------

1) All configuration had to change in order to hold the input and/or output.

2) Consequently, all rules had to change, too.

3) Unlike big-step SOS, small-step SOS captures all nondeterministic behaviors.
