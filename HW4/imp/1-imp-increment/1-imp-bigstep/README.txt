------------------------------------------------------
--- Big-step SOS: Adding variable increment to IMP ---
------------------------------------------------------

Suggested steps to follow in order to extend the original big-step SOS
of IMP in Maude to include variable increment:

1) Modify imp-bigstep.maude: Add Maude commands for executing the new programs.

2) Run imp-bigstep.maude: Everything working before should still work;
   the new programs should stay unchanged (big-step SOS either reduces a program
   all the way through, or it does not reduce it at all).

3) Modify imp-semantics-bigstep.maude:
   a) Comment out configurations holding only one value.
      The remaining configurations include all what we need.
   b) Modify the existing semantic rules to work with the new configurations,
      making sure that side effects are properly propagated.
   c) Eliminate rules < I,Sigma > => < I,Sigma > and < T,Sigma > => < T,Sigma >
      (they are unnecessary and lead to non-termination).
   d) Add two new rules for the non-deterministic choice strategy of + and /;
      recall that fully non-deterministic evaluation cannot be done in big-step.

4) Run imp-bigstep.maude: Everything working before should still work the same way;
   the new programs should still stay unchanged, that is, unevaluated.

6) Add the actual big-step SOS of increment, which consists of one rule.

7) Run imp-bigstep.maude and check that all programs evaluate properly;
   notice the three different ways (x is 1, 2, or 3) in which nondetPgm evaluates.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Result expression configurations had to change in order to capture the side effects.

2) Consequently, every rule involving the evaluation of any expression had to change
   in order to accommodate the new configurations and propagate side effects.

3) Since the left-hand and the righ-hand configurations are the same now,
   to avoid non-termination we had to eliminate some rules of the form R => R.

4) New rules had to be added to capture the non-deterministic evaluation
   strategy, but still only non-deterministic choice could be defined.
