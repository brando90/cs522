-------------------------------------------------------
--- Evaluation contexts: Adding input/output to IMP ---
-------------------------------------------------------

Suggested steps to follow in order to extend the oringinal reduction semantics
with evaluation contexts of IMP in Maude to include a print statement:

1) Modify imp-evaluation-contexts.maude: Include buffer.maude at the begining.

2) Modify imp-split-plug-evaluation-contexts.maude:
   a) Include module BUFFER in module IMP-CONFIGURATION-EVALUATION-CONTEXTS.
   b) Add input and output buffers to statement configurations.
   c) Add an input buffer to initial configurations.
   d) Change the context construct, plug equation and split rule for
      configurations to account for the input/output as well.

3) Modify imp-semantics-evaluation-contexts-x.maude, for each x in {1,2,3}:
   a) Change the syntax/context configurations appearing in the rules for
      lookup and assignment into ones also containing the input/output (kept unchanged).
   b) Change the rule for variable declarations to include the input and
      the empty output in the initial configuration.

4) Modify imp-evaluation-contexts.maude: Add the input/output buffers to
   configurations in the same way we did it for the small-step SOS.

5) Run imp-evaluation-contexts.maude: Everything working before should still work,
   and should include empty input/output buffers in the result configurations;
   the new programs should get stuck when the first input/output construct is encountered.

6) Add the actual reduction semantics with evaluation contexts of read and print:
   a) First, add the splitting rule and the plugging equation corresponding
      to print's evaluation strategy (strict) into
      imp-split-plug-evaluation-contexts.maude.  No splitting/plugging necessary for read.
   b) Second, add the actual reduction rules of read and print in each of the files
      imp-semantics-evaluation-contexts-x.maude.

8) Run imp-evaluation-contexts.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) We had to change several existing constructs and rules in order to accommodate
   the input/outpur buffers in the configuration.  These changes had nothing to do with
   the new input/output, they were necessary in order to prepare for the input/output.

2) We also had to change the rule for programs, to properly initialize the configuration.
