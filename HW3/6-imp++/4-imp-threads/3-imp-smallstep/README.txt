                                                   --
    Small-step SOS: Adding dynamic threads to IMP    
                                                   --

Suggested steps to follow in order to extend the oringinal small-step SOS
of IMP in Maude to include dynamic threads:

1) Modify imp-smallstep.maude: Add Maude commands for executing the new
   programs.

2) Run imp-smallstep.maude: Everything working before should still work;
   the new programs should get stuck on their first attempt to spawn a thread.

3) Modify imp-semantics-smallstep.maude:
   a) Add the two small-step SOS rules propagating the reduction permission
      from S to spawn S and from S2 to spawn S1 S2;
   b) Add the small-step SOS rule reducing spawn {} to {};
   c) Add the structural equation enforcing right associativity of sequential
      composition.
   d) Add the syntactic extension of spawn to take a Stmt as argument.
      See below for explanations on why that is needed.

7) Run imp-smallstep.maude and check that all programs evaluate properly.


                              
    Observations, thoughts    
                              

1) The propagation rules and the rule for dissolving threads are normal.

2) However, we also had to add a structural equation for enforcing right associativity of sequential
   composition.  This equation is an artifact of the new dynamic threads feature (to keep the
   definition of the latter simpler and modular) and does not involve the new syntax (spawn).
3) Also, we had to add the extension of spawn to statement argument:
     op spawn_ : Stmt -> Stmt [ditto] .
    Without it, no program with spawn will work.  The reason is actually quite
    indirect.  It is because of the rule for blocks
      rl o < {S},Sigma > => < S,Sigma > .
    which changes the type of code from Block to Stmt.  Once that rule
    applies to the argument block of spawn, that block becomes a statement
    and then spawn does not parse as a statement anymore.  Thus the rule
    for "* Cfg" will not apply.  An alternative to extending the syntax is to
    attempt to change the rule for blocks as follows:
      crl o < {S},Sigma > => < {S'},Sigma' > if o < S,Sigma > => < S',Sigma' > .
       rl o < {{}},Sigma > => < {},Sigma > .
    Besides (significantly) decreasing the performance of the overall
    definition (try it!), this attempt raises other problems, which either
    require more extensive changes to the definition or result in loss of
    behavior.  For example, we would like {spawn S1} S2 to allow S2 to reduce,
    similarly to the second rule for spawn above.  In general, we would need a
    syntactic check that the first statement in a sequential composition can
    allow the second statement to reduce, which is tedious and non-modular.
    An alternative to replacing the rule for blocks is to change the first
    rule of spawn above to only reduce the inside statement of its block
    argument:
     crl o < spawn {S},Sigma > => < spawn {S'},Sigma' > if o < S,Sigma > => < S',Sigma' > .
    In this case, one more spawn elimination rule would be needed:
       rl o < spawn {{}},Sigma > => < {},Sigma > .
    Unfortunately, this solution would make the semantics of a language
    construct, spawn, to non-modularly depend upon and involve another
    construct, {_} (e.g., what if we add more constructs for blocks later on?).
    