-------------------------------------
--- Adding dynamic threads to IMP ---
-------------------------------------

This directory shows how to add dynamic threads to IMP,
following each of the semantical approaches discussed in Chapter 3.
By dynamic threads we mean threads which can be created, run
concurrently with the main program and the other threads, and terminated.

Each subdirectory is dedicated to one corresponding semantic approach
and shows what changes are necessary to the existing definition of IMP
in order to define dynamic threads.  Not all semantics can capture all
the non-deterministic behaviors due to threads.

The files builtins.maude and state.maude, which are shared by all semantics,
stay unchanged.  The files imp-syntax.maude and imp-programs.maude, also
shared by all semantics, change as follows:
- imp-syntax.maude: Adds syntax for spawning threads.
- imp-programs.maude: Adds two new programs, namely sumSpawnPgm that spawns
  a new thread for each addition to the sum, and spawnPgm that is intended
  to generate many non-deterministic behaviors due to threads.