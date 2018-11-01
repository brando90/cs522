-------------------------------------------
--- CHAM: Adding local variables to IMP ---
-------------------------------------------

This folder gives an alternative CHAM definition of IMP extended with local
variables which is based on an evironment/store approach.  The idea is to
replace the previous state, which was a map from program variables to values,
by two maps: one called an environment which maps program variables to
locations, and another called a store which maps locations to values.
Since new locations need to be generated and allocated in the store, we
also need to maintain a counter which gives the next new location.
This approach allows to easily change and recover execution envirnoments,
which is particularly appealing when defining local scopes and functions.

Here are the steps we followed in order to change the original IMP definition:

1) Wrote new file environment-store.maude: This includes three modules,
   LOCATION, ENVIRONMENT and STORE.  The first defines symbolic locations
   plus an operation to increment them by any number.  The second defines
   environments as maps from variables to locations, together with the needed
   infrastructure.  The third defines stores as maps from locations to
   integers, together with the needed infrastructure.

2) Modify imp-cham-environment-store.maude: Include environtment-store.maude
   instead of state.maude and imp-semantics-cham-environment-store.maude
   instead of imp-semantics-cham.maude, and modify the previous Maude commands
   for programs to wrap them in solutions including an environment and a store
   that initialize all the purposely undeclared variables.

3) Modify imp-semantics-cham-environment-store.maude: Add molecular
   support for environments, stores and locations, and modify the CHAM
   rules for variable lookup and update to use the environment and store
   instead of the state.

4) Run imp-cham-environment-store.maude: No solution should completely
   reduce, because of the missing rule for let.  The programs will be
   desugared and the rewriting of each program should get stuck on a let
   statement in the syntactic molecule.

5) Modify imp-heating-cooling-cham.maude, if needed: Add the corresponding
   heating/cooling rules stating that let X = A in S can heated/cooled in A;
   this step may have been done already as part of the state-based CHAM
   definition in the parent directory (we import the same heating/cooling
   module).

6) Modify imp-semantics-cham-environment-store.maude: Add the actual CHAM
   semantics of let and support for environment recovery.  Also, remove
   the previous rule initializing the state for programs; since programs
   are now just statements, there is no need for another rule for them.

7) Run imp-cham.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) Regarding evaluation strategies, like for the state-based CHAM we
   only had to modularly and compactly add the heating/cooling rules for let.

2) We had to modify the rules for update and assignment to take into account
   the new split of a state into an environment and a store; this was necessary
   and, unfortunately, non-modular.

3) The rule for let is now quite clear and natural: first allocate a new
   location for the bound variable, then write the value bound to it to that
   location in the store, then evaluate the body statement of the let, and
   finally recover the environment to what was before the let.
