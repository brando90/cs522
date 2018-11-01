------------------------------------------------------
--- Denotational: Adding abrupt termination to IMP ---
------------------------------------------------------

Suggested steps to follow in order to extend the original denotational
semantics of IMP in Maude to include abrupt termination:

1) Modify imp-denotational.maude: Add Maude commands for executing the new
   programs.

2) Run imp-denotational.maude: Everything working before should still work;
   the new programs will either get stuck or make Maude not terminate while
   searching for a fixed-point.

3) Modify imp-semantics-denotational.maude:
   a) Add new CPO constants error, halting and ok, to be used as halting signals.
   b) Modify the existing equations giving the denotation of IMP constructs
      using expressions to take into account the fact that expressions can now
	  evaluate to an error (when division-by-zero is performed).
   c) Same for the denotation of IMP constructs using statements, to take into
      account the fact that statements can now evaluate to a halting state; to
	  distinguish halting states from normal states, the denotation of statements
	  is a function returning pairs (state,halting status), where "halting status"
	  is either "halting" or "ok".
   d) Modify the denotation of programs to silently ignore the halting status.

4) Run imp-denotation.maude: Everything working before should still work the same way;
   the new programs should still either get stuck with missing denotations for abrupt
   termination or do not terminate searching indefinetely for a fixed-point.

5) Add the actual denotational semantics of the implicit division by zero and
   of the explicit halt statement; the former is an additional case in the existing
   denotation of division, while the latter requires a new equation.

6) Run imp-denotational.maude and check that all programs evaluate properly;
   notice that programs terminate normally, no matter whether their execution was
   normally or abruptly terminated.


------------------------------
--- Observations, thoughts ---
------------------------------

1) New CPO constants had to be added and the denotations of expressions and
   of statements had to change to generate and propagate halting signals.

2) Unfortunately, alomst every equation had to change; the only two equations
   which stayed unchaged were those for integer and for Boolean constants.
