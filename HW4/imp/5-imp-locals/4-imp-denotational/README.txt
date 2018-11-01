---------------------------------------------------
--- Denotational: Adding local variables to IMP ---
---------------------------------------------------

Suggested steps to follow in order to extend the original denotational
semantics of IMP in Maude to include local variables:

1) Modify imp-denotational.maude: Modify the previous Maude commands for
   programs to instead apply their denotation as statements on states
   that initialize all the purposely undeclared variables.

2) Run imp-denotational.maude: None of the existing programs can be evaluated,
   because of the missing denotational semantics for let
   (note the subterms of the form [[let x = a in s]]).

3) Modify imp-semantics-denotational.maude:
   a) Add an equation for the denotational semantics of let.
   b) Remove the previous equation for programs,
      because programs are just statements now.

4) Run imp-denotational.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Simple and modular.

2) The rule for let is a bit tricky, in that the state after the block is
   made to be undefined in X if so it was before the block.  This works because
   of how the state update operation was defined (see state.maude).
