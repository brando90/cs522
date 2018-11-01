---------------------------------------------------
--- Big-step SOS: Adding dynamic threads to IMP ---
---------------------------------------------------

Suggested steps to follow in order to extend the original big-step SOS
of IMP in Maude to include dynamic threads:

1) Modify imp-bigstep.maude: Add Maude commands for executing the new programs.

2) Run imp-bigstep.maude: Everything working before should still work;
   the new programs should stay unchanged (big-step SOS either reduces a program
   all the way through, or it does not reduce it at all).

3) Modify imp-semantics-bigstep.maude:
   a) Add a rule evaluating the spawned statement.
   b) Add a rule allowing to first evaluate S2 and then S1 in a context of the form
      spawn S1 S2.

4) Run imp-bigstep.maude and check that all programs evaluate properly.


------------------------------
--- Observations, thoughts ---
------------------------------

1) The above was a desperate attempt to define concurrency in big-step SOS;
   the reality is that big-step SOS is simply unsuitable for concurrency because,
   unless it is turned into a collection semantics, which would involve radical
   changes and would be very inefficient (or better say, infeasible) when executed,
   it cannot caputure all the interleaving behaviors of concurrent threads.

2) The first rule for spawn, in combination with sequential composition, says more or
   less that spawn can be ignored, in the sense that the spawning thread can do all
   the work: first execute the child thread code, then the main thread code;
   this is, indeed, a possible behavior;

3) While the second rule for spawn also captures the behaviors where the main
   thread code is executed first and then the child thread code, it still
   does not capture all the desired interleaved behaviors.  This is, unfortunatetly,
   the best we can do with big-step SOS (without turning to a collection semantics).
