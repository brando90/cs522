------------------------------------------------
--- Denotational: Adding input/output to IMP ---
------------------------------------------------

Suggested steps to follow in order to extend the oringinal denotational
semantics of IMP in Maude to include input/output:

1) Modify imp-denotational.maude: Include buffer.maude at the begining, modify
   all the existing commands to take the empty input buffer as additional
   argument (essentially that means replacing "rewrite [[program]]" by "rewrite
   appCPO([[program]], epsilon)" and "rewrite appCPO([[statement]],state)"
   by "rewrite appCPO([[statement]],pairCPO(state,input))"), and add Maude
   commands for executing the new programs at the end of the file.

2) Run imp-denotational.maude: Nothing should work anymore, all programs
   should get stuck into some meaningless mathematical object which
   cannot be evaluated anymore.  This is because the denotational semantics
   needs to be changed significantly so that the denotations of fragments
   of code take into account the input/output; right now they all expect
   states, but we passed them another kind of data, so they got stuck.

3) Modify imp-semantics-denotational.maude:
   a) Include module BUFFER in module IMP-SEMANTICS-DENOTATIONAL and
      subsort Buffer to CPO, so now Buffer becomes a mathematical object.
   b) Make sure that the denotation of each expression is now a (partial)
      function from pairs (state,input) to pairs (value,input), where the
      source pair contains the input given to the expression before its
      evaluation and the target pair contains the input remaining after the
      evaluation of the expression.  This is necessary because read() is
      an expression construct and it has a "side effect" on the input buffer.
      Similarly, make sure that the denotation of each statement is now a
      (partial) function from pairs (state,input) to pairs
      (state,input,output).  An output is necessary for statements because
      of the print statement.  Note the non-uniformity between input/output
      and expression/statements: expressions take an input buffer and
      generate another input buffer, while statements do the same only for
      the input, but not for the output.  An alternative semantics could be
      given, where the denotation of statements would take an output buffer as
	  well as argument and it would only modify it by adding to it if needed;
      we prefer to keep the mathematical domains minimal, however, which is
      the reason why we did not follow this alternative approach.

4) Run imp-denotational.maude: Everything working before should work now,
   and should include empty input and output buffers in the result (triples);
   the new programs should still get stuck with missing denotations for
   read and print.

5) Add the actual denotational semantics of read and print (one equation each).

6) Run imp-denotational.maude and check that all programs evaluate properly.
   Note that the results are completely deterministic now and, moreover, that
   program nondetIOStmt evaluates to undefined.  Unlike SOS, denotational
   semantics performs no search for derivations.  If one wants to see
   non-deterministic behaviors then one needs to use power-domains, which we
   do not discuss here.


------------------------------
--- Observations, thoughts ---
------------------------------

1) The addition of the input/output buffers in the denotations of expressions
   and statements changed the types of these functions and where each piece
   of semantics information was located, so one has to make sure that
   projection and tupling functions are used to extract and combine the state
   and the input/output buffers.  This is quite tedious.

2) All equations corresponding to the denotations of all expressions and
   statements had to change.

3) No non-determinism at all, only one execution path is chosen.
