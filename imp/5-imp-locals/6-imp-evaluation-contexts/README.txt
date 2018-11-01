----------------------------------------------------------
--- Evaluation contexts: Adding local variables to IMP ---
----------------------------------------------------------

Suggested steps to follow in order to extend the oringinal reduction semantics
with evaluation contexts of IMP in Maude to include local variables:

1) Modify imp-evaluation-contexts.maude: Modify the previous Maude commands
   for programs to wrap them in configurations including a state that
   initializes all the purposely undeclared variables.

2) Run imp-evaluation-contexts.maude: No program should completely reduce,
   because of the missing semantics for let.  The programs will be desugared
   and the rewriting of each program should get stuck on a let statement.

3) Modify imp-split-plug-evaluation-contexts.maude: Add the corresponding
   splitting/cooling rule and equation stating that let X = A in S can reduce A.
   
4) Modify imp-semantics-evaluation-contexts-x.maude, for each x in {1,2,3}:
   a) Add the reduction semantics rule for let.
   b) Replace the previous rule for programs with an equation stating that programs
      are just statements in the initial state.

5) Run imp-evaluation-contexts.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Modular and compact

2) However, the reduction semantics rule for let is very tricky and unorthodox.
   In particular, when Sigma is undefined in X, then the assignment following S
   in the right hand side of the rule becomes X := undefined, which "undefines"
   the state in X; this is what we wanted indeed, but it pushes the envelope of
   reduction semantics by mixing semantic data (undefined) with syntax.
