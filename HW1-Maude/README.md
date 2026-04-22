# HW1 — CS522 Programming Language Semantics

**Assignment (from `hw1.md` in the course materials):**

- **Exercise 56 (p. 137):** Add an `error` state and modify the big-step semantics (Fig. 3.7) so `⟨s, σ⟩ ⇓ ⟨error⟩` or `⟨p⟩ ⇓ ⟨error⟩` whenever evaluation performs division by zero.
- **Exercise 70 (p. 155):** Do the same for the small-step SOS (Fig. 3.14 / 3.15), producing configurations whose syntactic component is `error`.

This folder is the Maude implementation of those two exercises. The original (pre-modification) course files are kept alongside as `*_original.maude` for reference.

## Layout

```
HW1-Maude/
├── builtins.maude                         # PL-INT, PL-BOOL, PL-ID, UNDEFINED (provided)
├── imp/
│   ├── state.maude                        # STATE module: lookup / update / undefined (provided)
│   └── 0-imp-original/
│       ├── imp-syntax.maude               # IMP-SYNTAX: AExp / BExp / Stmt / Pgm (provided)
│       ├── imp-programs.maude             # example programs (sumPgm, collatzPgm, ...) (provided)
│       ├── 1-imp-bigstep/
│       │   ├── imp-semantics-bigstep_original.maude   # original Fig. 3.7 (reference)
│       │   ├── imp-semantics-bigstep.maude            # ★ Exercise 56 solution
│       │   ├── imp-bigstep.maude                      # runs canned programs
│       │   └── my_tests.m                             # div-by-zero test battery
│       ├── 3-imp-smallstep/
│       │   ├── imp-semantics-smallstep-original.maude # original Fig. 3.14/3.15 (reference)
│       │   ├── imp-semantics-smallstep.maude          # ★ Exercise 70 solution
│       │   ├── imp-smallstep.maude                    # runs canned programs
│       │   └── my_tests_small.m                       # div-by-zero test battery
│       └── 2-imp-type-system-bigstep/     # (type-system track — not part of HW1 scope)
```

## Approach

### Ex. 56 — big-step (`imp-semantics-bigstep.maude`)

Error is represented as a **single distinguished state** `Error : -> State`, introduced inside `IMP-CONFIGURATIONS-BIGSTEP`. The idea is: as soon as any sub-derivation reaches `Error`, every enclosing rule propagates it upward, so the final configuration is `⟨Error⟩` (a pure error configuration without a state). Three "sink" rules short-circuit evaluation of any `AExp`, `BExp`, or `Stmt` in an already-error state:

```maude
 rl < A, Error > => < Error > .
 rl < B, Error > => < Error > .
 rl < S, Error > => < Error > .
```

From there every structural rule has an additional conditional rule (`crl ... if ... => < Error >`) that fires when a sub-expression reduces to `< Error >`. For division, the key rule is:

```maude
 crl < A1 / A2 , Sigma > => < Error > if < A2,Sigma > => < 0 > .
```

which directly encodes "dividing anything by zero yields `Error`."

### Ex. 70 — small-step (`imp-semantics-smallstep.maude`)

Small-step needs error *values*, not an error state, because each step must produce a well-formed configuration. So we introduce **three error constants**, one per sort:

```maude
 op errorAr   : -> AExp .
 op errorBool : -> BExp .
 op errorStmt : -> Stmt .
```

The trick for transitive-closure rewriting `*` is tricky because we don't want the one-step `o` relation to keep rewriting error configurations into themselves forever. The solution here: the `* Cfg => * Cfg'` structural rule is guarded by side conditions that require the inner expression is **not** an error constant (see the `IMP-CONFIGURATIONS-SMALLSTEP` preamble). Three fix-point "sink" rules for `o` at each error sort make the rewrite relation stop at error:

```maude
 crl o < errorAr,   Sigma > => < errorAr,   .State > if ... .
 crl o < errorBool, Sigma > => < errorBool, .State > if ... .
 crl o < errorStmt, Sigma > => < errorStmt, .State > if ... .
```

Each structural rule (ADD, DIV, LEQ, NOT, AND, ASGN, SEQ, IF, ...) gets an extra case that propagates the error constant of the appropriate sort when any sub-reduction hits an error. The division rule is the one the exercise actually asks for:

```maude
 crl o < I1 / I2, Sigma > => < I1 /Int I2, Sigma > if I2 =/=Bool 0 .
 crl o < I1 / I2, Sigma > => < errorAr,    Sigma > if I2 ==Bool 0 .
```

## How to run

```bash
# Big-step (Ex. 56) test battery
cd imp/0-imp-original/1-imp-bigstep
maude my_tests.m

# Small-step (Ex. 70) test battery
cd imp/0-imp-original/3-imp-smallstep
maude my_tests_small.m

# Also: canned programs on top of both semantics
maude imp-bigstep.maude
maude imp-smallstep.maude
```

**Note on execution in this checkout (2026-04-21):** Maude is not installed on the current Mac (`brew install maude` has no formula; official distribution is from SourceForge). The canned test batteries were designed to hit every new error-propagation rule — see the `my_tests*.m` files — and the rule set has been reviewed statically against the textbook figures. Running the tests with an actual Maude interpreter is the final verification step; see the top-level `prompt.md` in the related `veri-veri-bench` project for the Docker-based workflow.
