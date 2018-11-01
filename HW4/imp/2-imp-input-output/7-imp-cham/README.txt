----------------------------------------
--- CHAM: Adding input/output to IMP ---
----------------------------------------

Suggested steps to follow in order to extend the oringinal CHAM of IMP in
Maude to include input/output:

1) Modify imp-cham.maude: Include buffer.maude at the begining.

2) Modify imp-semantics-cham.maude:
   a) Include module BUFFER in IMP-SEMANTICS-CHAM and subsort Buffer to
      Molecule.
   b) Add two molecule constants, "input" and "output", which we will use to
      distinguish the solutions containing the input the output buffers.
   b) Modify the CHAM rule of variable declarations to initialize the solution
      to one that also includes the input and the (empty) output moleculs.

3) Modify imp-cham.maude: Wrap all program solutions into a top level solution
   containing also the input in some molecule.  For the solutions containing
   statements instead of programs, add both the input and the output
   molecules, both empty.  Add also commands to execute the new programs.

4) Run imp-cham.maude: Everything working before should still work, and should
   include empty input and output molecules in the result solutions; the new
   programs should get stuck when they first encounter an input/output
   construct.

5) Add the actual CHAM semantics of input/output, which means:
   a) A heating/cooling rule/equation in imp-heating-cooling.maude for print.
   b) A reaction rule for each of read and print in imp-semantics-cham.maude.

6) Run imp-cham.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to include the input/output-specific infrastructure and rules,
   without changing any of the existing rules for statements or expressions.

2) We also had to change the rule for programs, to initiate the working
   solution.

3) Note that we only have non-deterministic choice seamntics for nondetIOStmt,
   same like in big-step SOS (and unlike in small-step SOS or RSEC).
