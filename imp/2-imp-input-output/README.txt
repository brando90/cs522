----------------------------------
--- Adding input/output to IMP ---
----------------------------------

This directory shows how to add input (by means of a read() arithmetic
expression construct) and output (by means of a print(AExp) statement
construct) to IMP, following each of the semantical approaches discussed
in Chapter 3.

Each subdirectory is dedicated to one corresponding semantic approach
and shows what changes are necessary to the existing definition of IMP
in order to add the new constructs.  In all cases, read() only reads
integer values, which are consumed from the input buffer, and print
only prints integer values, which are collected in the output buffer.
These buffers need to be appropriately incorporated in each semantics.

The files builtins.maude and state.maude, which are shared by all semantics,
stay unchanged.  The files imp-syntax.maude and imp-programs.maude, also
shared by all semantics, change as follows:
- imp-syntax.maude: Adds syntax for read and print.
- imp-programs.maude: Adds three new programs that make use of read and print.

One additional file is added, buffer.maude, which defines the new buffer
data-structure that is needed by all semantics.
