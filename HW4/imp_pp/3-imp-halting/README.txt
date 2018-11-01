----------------------------------------
--- Adding abrupt termination to IMP ---
----------------------------------------

This directory shows how to add abrupt termination to IMP,
following each of the semantical approaches discussed in Chapter 3.

Each subdirectory is dedicated to one corresponding semantic approach
and shows what changes are necessary to the existing definition of IMP
in order to add abrupt termination.  In all cases, there are two kinds
of abrupt termination: explicit termination using a new statement, halt,
and implicit termination when performing an illegal division by zero.

The files builtins.maude and state.maude, which are shared by all semantics,
stay unchanged.  The files imp-syntax.maude and imp-programs.maude, also
shared by all semantics, change as follows:
- imp-syntax.maude: Adds syntax for the halt statement.
- imp-programs.maude: Adds two new programs, namely sumHaltPgm that makes
  use of halt and sumDivByZeroPgm that performs a division by 0.
