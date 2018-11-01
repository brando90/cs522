-------------------------------------------------------------
--- Evaluation contexts: Adding variable increment to IMP ---
-------------------------------------------------------------

Suggested steps to follow in order to extend the oringinal reduction semantics
with evaluation contexts of IMP in Maude to include variable increment:

1) Modify imp-evaluation-contexts.maude: Add Maude commands for executing the new programs.

2) Run imp-evaluation-contexts.maude: Everything working before should still work;
   the new programs should get stuck on the first statement involving increment.

3) Modify imp-semantics-evaluation-contexts-x.maude, for each x in {1,2,3}:
   Add the actual reduction semantics with evaluation contexts of increment (one rule).

4) Run imp-evaluation-contexts.maude and check that all programs evaluate properly;
   notice the five ways (x is 0, 1, 2, 3, or stuck) that nondetPgm evaluates.

------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the rule for increment.  Nothing else changed.

2) RSEC definitions in Maude, particularly those following the first approach to
   represent RSEC in rewriting logic, appear to be slower than the other semantics.
