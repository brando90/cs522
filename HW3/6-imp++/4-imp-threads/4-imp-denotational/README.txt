---------------------------------------------------
--- Denotational: Adding dynamic threads to IMP ---
---------------------------------------------------

Suggested steps to follow in order to extend the original denotational
semantics of IMP in Maude to include dynamic threads:

1) Modify imp-denotational.maude: Add Maude commands for executing the new programs.

2) Run imp-denotational.maude: Everything working before should still work;
   the new programs should be partially reduced to some functional representations;
   these functional representations cannot be reduced all the way through because
   of the missing denotation of threads (note the subterms of the form [[spawn s]]).

3) Add the actual denotational semantics of increment, which consists of one equation
   essentially discarding the spawn and keeping the statement in place.  This means
   that there will be no threads, spawn s being the same as s.  Unfortunately,
   non-determinism cannot be supported with our current mathematical domains,
   and changing the domains to support non-determinism is non-trivial because
   power domains are required and leads to rather inefficient interpreters.

4) Run imp-denotational.maude and check that all programs evaluate properly;
   notice the all programs are determinstic, including spawnPgm.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Trivial but useless.

2) One may consider defining and using power domains to define a denotational
   semantics that collects all the evaluation results.  However, that would still
   not capture properly all the interleavings, same like big-step SOS.
