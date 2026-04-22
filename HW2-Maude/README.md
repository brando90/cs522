# HW2 — CS522 Programming Language Semantics

**Assignment (from `hw2.md` in the course materials):**

HW2 has two parts:

- **Paper/PDF exercises** (Ex. 80, 81, 82) — proofs about the denotational
  semantics of IMP's `while` loop (equivalence with a sequenced composition,
  well-definedness of the iterate functions `w_k`, and characterization of
  all fixed-points of the while-functional `F`). These are **not in this
  Maude folder**; they belong in the accompanying PDF submission.
- **Maude exercise** (Ex. 83, p. 169) — the only file this folder modifies:
  make the denotational semantics of IMP return a *state* (marked as failed)
  rather than `bottom` when a division-by-zero occurs. Programs fail
  **silently** — the state in which the error happened is preserved and
  tagged with a special `err` marker.

## Layout

```
HW2-Maude/
├── builtins.maude                         # (provided)
├── cpo/
│   └── cpo.maude                          # CPO library: funCPO, appCPO, fixCPO, ifCPO (provided)
└── imp/
    ├── state.maude                        # STATE module (provided)
    └── 0-imp-original/
        ├── imp-syntax.maude               # (provided)
        ├── imp-programs.maude             # (provided)
        ├── 1-imp-bigstep/                 # out-of-scope for HW2 (provided only)
        ├── 2-imp-type-system-bigstep/     # out-of-scope for HW2 (provided only)
        ├── 3-imp-smallstep/                # out-of-scope for HW2 (provided only)
        └── 4-imp-denotational/
            ├── imp-semantics-denotational_original.maude   # original Fig. 3.20 (reference)
            ├── imp-semantics-denotational.maude            # ★ Exercise 83 solution
            ├── imp-denotational.maude                       # loader / canned-program tests
            └── my_test.maude                                # Ex. 83 test battery
```

## Approach for Ex. 83 — silent failure

The original denotational semantics in Fig. 3.20 (`imp-semantics-denotational_original.maude`)
returns `undefined` (i.e. bottom) for `1 / 0` and propagates that bottom
upward through every containing construct. That makes the semantics
*undefined* on division-by-zero instead of *graceful*.

The modified version adds two pieces of state:

```maude
op Error : -> State .   --- like HW1 big-step: a pure-error State
op err   : -> Id .      --- a reserved identifier used as a "silent-failure" flag
```

and rewires each semantic equation so that:

1. **Arithmetic expressions** return `Error` on division-by-zero (as in HW1
   big-step). `Error` is checked for and propagated through `+`, `/`, `<=`,
   `!`, `&&`.
2. **Statements that would otherwise diverge on an arithmetic `Error`** instead
   *silently fail* by committing to a state that includes `err |-> 1`. This is
   where the "return a state" requirement is satisfied:
   - `X = A ;` sets `err |-> 1` if `[[A]](σ)` is `Error`.
   - `if (B) S1 else S2` sets `err |-> 1` if `[[B]](σ)` is `Error`.
   - `while (B) S` sets `err |-> 1` if the guard evaluates to `Error`.
3. **Sequencing `S1 S2`** checks whether `S1`'s output state has the err flag
   set; if so, skip `S2` entirely (silent-failure absorbs the rest of the
   program). Otherwise continue with `S2`.
4. **The while-functional** also short-circuits on the err flag in the unrolled
   iteration result.

Net behavioural consequence: *every program terminates with a state* under
this semantics; division-by-zero no longer makes the semantics partial, only
"scarred" with `err |-> 1`.

## How to run

```bash
cd imp/0-imp-original/4-imp-denotational
maude my_test.maude         # Ex. 83 test battery (arithmetic, boolean, stmt, if, while)
maude imp-denotational.maude # canned sum/collatz/multiplication/primality programs
```

**Note on execution in this checkout (2026-04-21):** Maude is not installed
on the current Mac (`brew install maude` has no formula; official
distribution is via SourceForge). The rule set has been reviewed
statically against Fig. 3.20 and `imp-semantics-denotational_original.maude`
— see the top-of-file docstring in `imp-semantics-denotational.maude` for
the full design. Final behavioural verification (running `maude my_test.maude`)
is the outstanding step.

## Paper exercises — out of scope for this Maude folder

Exercises 80, 81, 82 are proofs and do not go in this folder. They belong
in the accompanying PDF submission for CS522 HW2.
