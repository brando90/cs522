----------------------------------------------------------
--- Evaluation contexts: Adding dynamic threads to IMP ---
----------------------------------------------------------

Suggested steps to follow in order to extend the oringinal reduction semantics
with evaluation contexts of IMP in Maude to include dynamic threads:

1) Modify imp-evaluation-contexts.maude: Add Maude commands for executing the new programs.

2) Run imp-evaluation-contexts.maude: Everything working before should still work;
   the new programs should get stuck on the first attempt to spawn a thread.

3) Modify imp-split-plug-evaluation-contexts.maude: Add the corresponding splitting/cooling
   equations and rules stating that spawn(S) can reduce S and that spawn S1 S2 can reduce S2.

4) Modify imp-semantics-evaluation-contexts-x.maude, for each x in {1,2,3}:
   a) Add the actual reduction semantics with evaluation contexts rule of dynamic
      threads that dissolves an empty thread (i.e., that reduces spawn {} to {});
   b) Add the structural equation enforcing right associativity of sequential composition;
   c) Add the syntactic extension of spawn to statements (from blocks).

5) Run imp-evaluation-contexts.maude and check that all programs evaluate properly.

------------------------------
--- Observations, thoughts ---
------------------------------

1) The splitting/pugging rules/equations and the rule for dissolving threads
   are normal and modular.

2) However, we also had to add a structural equation for enforcing right
   associativity of sequential composition.  This equation is an artifact
   of the new dynamic threads feature (to keep the definition of the latter
   simpler and modular) and does not involve the new syntax (spawn).

3) Similarly to small-step SOS and MSOS, we also had to add the static
   extension of spawn to statements.