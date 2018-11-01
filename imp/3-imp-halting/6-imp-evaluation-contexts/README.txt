-------------------------------------------------------------
--- Evaluation contexts: Adding abrupt termination to IMP ---
-------------------------------------------------------------

Suggested steps to follow in order to extend the oringinal reduction semantics
with evaluation contexts of IMP in Maude to include abrupt termination:

1) Modify imp-evaluation-contexts.maude: Add Maude commands for executing the new programs.

2) Run imp-evaluation-contexts.maude: Everything working before should still work;
   the new programs should get stuck when reaching an abrupt termination situation.

3) Modify imp-semantics-evaluation-contexts-x.maude, for each x in {1,2,3}:
   Add the actual reduction semantics with evaluation contexts of abrupt termination.

4) Run imp-evaluation-contexts.maude and check that all programs evaluate properly.

------------------------------
--- Observations, thoughts ---
------------------------------

1) We only had to add the two rules for abrupt termination.  Nothing else changed.
