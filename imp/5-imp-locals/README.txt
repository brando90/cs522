-------------------------------------
--- Adding local variables to IMP ---
-------------------------------------

This directory shows how to add blocks with local variable declarations
to IMP, following each of the semantical approaches discussed in Chapter 3.
The scope of a variable declaration is now the remainder of the current block.
The previous global variable declarations are not necessary anymore, so
we also eliminate them.  This is not necessary, because one can have both
global and local variables in a language, but we do it anyway because we want
to demonstrate a real-life language design scenario where the introduction of
a new language feature may make existing features useless or undesirable.

Each subdirectory is dedicated to one corresponding semantic approach
and shows what changes are necessary to the existing definition of IMP
in order to define local variables.

The files builtins.maude and state.maude, which are shared by all semantics,
stay unchanged.  The files imp-syntax.maude and imp-programs.maude, also
shared by all semantics, change as follows:
- imp-syntax.maude: Adds syntax for local variable declarations.  Since global
  variables are a special case of local ones (they are locals in the top-level
  block), we eliminate them from the syntax.  This also makes the entire
  syntactic category of programs useless; however, for clarity, we keep it but
  we subsort statements to programs (thus, statements can also be regarded as
  programs and these are the only programs).
- imp-syntax.maude: Adds a new module, IMP-DESUGARED-SYNTAX, which performs
  a series of syntactic transformations that simplify the syntax for all the
  subsequent semantics.  More precisely, both the blocks and the local
  declarations are eliminated and instead a combined "let" statement is
  introduced, which both declares a local variable and delimits its scope.
  Note that the semantics of local variable declarations would be quite
  involved in most of the semantic approaches without these syntactic
  simplifications.
- imp-programs.maude: Modifies the previous IMP programs to make use of blocks
  and local variables.  One problem with local variables alone (without
  extensions with print) is that testing semantics becomes more difficult,
  because there is no state available to check after the top-level block is
  executed.  To circumvent this problem, for semantic testing reasons
  exclusively, the new programs are allowed to use undeclared variables;
  however, one must then include those variables in the initial state in which
  the program is executed.  This trick is not necessary when the print
  statement is introduced, because one could use print to observe the results
  of desired variables.
