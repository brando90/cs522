----------------------------------------
--- Adding variable increment to IMP ---
----------------------------------------

This directory shows how to add variable increment to IMP,
following each of the semantical approaches discussed in Chapter 3.

Each subdirectory is dedicated to one corresponding semantic approach
and shows what changes are necessary to the existing definition of IMP
in order to add the variable increment.  In all cases, the variable
increment adds side effects to expression evaluation, which therefore
needs to be appropriately incorporated in each semantics.

The files builtins.maude and state.maude, which are shared by all semantics,
stay unchanged.  The files imp-syntax.maude and imp-programs.maude, also
shared by all semantics, change as follows:
- imp-syntax.maude: Adds syntax for variable increment.
- imp-programs.maude: Adds two new programs, sum++Pgm and nondetPgm,
  which use variable increment.
