-------------------------------------------
--- CHAM: Adding local variables to IMP ---
-------------------------------------------

Suggested steps to follow in order to extend the oringinal CHAM of IMP
in Maude to include local variables:

1) Modify imp-cham.maude: Modify the previous Maude commands
   for programs to wrap them in solutions including a state that
   initializes all the purposely undeclared variables.

2) Run imp-cham.maude: No solution should completely reduce,
   because of the missing rule for let.  The programs will be desugared
   and the rewriting of each program should get stuck on a let statement
   in the syntactic molecule.

3) Modify imp-heating-cooling-cham.maude: Add the corresponding
   heating/cooling rules stating that let X = A in S can heated/cooled in A.

4) Modify imp-semantics-cham.maude: Add the actual CHAM semantics of let.
   Also, remove the previous rule initializing the state for programs; since
   programs are now just statements, there is no need for another rule for them.

5) Run imp-cham.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the heating/cooling rules and the reaction rule for let.
   This was very modular and compact.
   
2) However, like for reduction semantics with evaluation contexts,
   the CHAM rule for let is very tricky.  On the other hand, the CHAM
   never aimed at being a purely syntactic semantic framework
   (on the contrary, actually), so the rule is not that unorthodox in CHAM.
