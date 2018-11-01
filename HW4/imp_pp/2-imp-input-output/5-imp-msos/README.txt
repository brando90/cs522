----------------------------------------
--- MSOS: Adding input/output to IMP ---
----------------------------------------

Suggested steps to follow in order to extend the oringinal MSOS of IMP in
Maude to include input/output:

1) Modify imp-msos.maude: Include buffer.maude at the beginning.

2) Modify imp-semantics-msos.maude:
   a) Include module BUFFER in module IMP-CONFIGURATIONS-SMALLSTEP.
   b) Add input buffers to expression configurations.
   c) Add input and output buffers to the set of configuration attibutes.
   d) Add an input buffer to initial configurations.
   e) Modify the rule for programs to initialize the state to one also
      including the input/output.

3) Modify imp-msos.maude: modify the rewrite/search commands to use the
   new configurations, and add rewrite/search commands for the new programs
   as well.

4) Run imp-msos.maude: Everything working before should still work, and
   should include empty input/output buffers in the result configurations;
   the new programs should get stuck when the first input/output construct
   is encountered.

5) Add the actual MSOS of read and print, the first consisting of
   one rule and the second consisting of two rules.

7) Run imp-msos.maude and check that all programs evaluate properly.
   Notice that all behaviors of the nondeterministic program are captured.


------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to include the input/output-specific infrastructure and rules,
   without changing any of the existing rules for statements or expressions.

2) We still had to change the rule for programs, to take the input into account
   and to initiate the empty output buffer.
