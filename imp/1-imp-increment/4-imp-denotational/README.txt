------------------------------------------------------
--- Denotational: Adding variable increment to IMP ---
------------------------------------------------------

Suggested steps to follow in order to extend the original denotational
semantics of IMP in Maude to include variable increment:

1) Modify imp-denotational.maude: Add Maude commands for executing the new programs.

2) Run imp-denotational.maude: Everything working before should still work;
   the new programs should be partially reduced to some functional representations;
   these functional representations cannot be reduced all the way through because
   of the missing denotation of increment (note the subterms of the form [[++ x]]).

3) Modify imp-semantics-denotational.maude:
   a) Make sure that the denotation of each expression is now a (partial) function
      from states to pairs (value,state).
   b) Modify the existing equations giving the denotation of IMP constructs
      using expressions to take into account the side effect of the expressions.

4) Run imp-denotation.maude: Everything working before should still work the same way;
   the new programs should still get stuck with missing denotations for increment.

5) Add the actual denotational semantics of increment, which consists of one equation.

6) Run imp-denotational.maude and check that all programs evaluate properly;
   notice the all programs are determinstic, including nondetPgm.


------------------------------
--- Observations, thoughts ---
------------------------------

1) The addition of pairs as results of denotation functions changed the implicit
   types of these functions, so one has to think slightly differently; in particular,
   one has to make sure that one does not forget to use the projection functions.

2) Alomst every equation had to change to accomodate the new denotation functions
   for expressions; the only equations which stayed unchaged were those for the
   empty block, for sequential composition, and for programs.

3) The resulting denotational semantic definition is completely deterministic.
   That is because our mathematical domains are domains of functions, and functions
   are deterministic by their very nature.  More complicated domains are needed to
   capture non-determinism (e.g., power domains), but those would lead to very
   inefficient executions, so we do not do it here.
