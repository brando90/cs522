# HW3 — CS522 IMP++

**Assignment (from `hw3.md` in the course materials):**

Combine all the individual extensions of IMP into the **IMP++** language. The
`6-imp++/` subfolder must contain:

1. Type system (big-step)
2. Small-step SOS
3. Exactly one of: Big-step SOS or Denotational semantics

plus **three IMP++ programs**.

Brando's solution here goes above the spec and includes **both** big-step
and denotational semantics. The five language extensions being combined are:

| # | Extension (subfolder)        | What it adds                                |
|---|------------------------------|---------------------------------------------|
| 1 | `1-imp-increment`            | Pre/post increment/decrement on variables   |
| 2 | `2-imp-input-output`         | `read()` expression + `print(x);` statement |
| 3 | `3-imp-halting`              | `halt;` abrupt-termination statement        |
| 4 | `4-imp-threads`              | `spawn { … }` dynamic thread creation       |
| 5 | `5-imp-locals`               | `int xl;` as a *statement* + `{…}`-local scoping |

## Layout

```
HW3/
├── imp/                     # per-extension incremental versions (provided baseline)
│   ├── 0-imp-original/      # starting point
│   ├── 1-imp-increment/
│   ├── 2-imp-input-output/
│   ├── 3-imp-halting/
│   ├── 4-imp-threads/
│   └── 5-imp-locals/
└── 6-imp++/                 # ★ combined IMP++ solution (Brando's answer)
    ├── imp-syntax.maude                  # combined IMP++ syntax + desugaring
    ├── imp-programs.maude                # canned test programs
    ├── buffer.maude                      # input/output buffer module
    ├── state.maude                       # shared State module
    ├── big_step/
    │   ├── imp-semantics-bigstep.maude   # ★ combined big-step SOS for IMP++
    │   └── imp-bigstep_{buffer2,increment2}.maude  # auxiliary variants
    ├── small_step/
    │   ├── imp-semantics-smallstep.maude # ★ combined small-step SOS
    │   └── imp-smallstep.maude           # loader
    └── denotational/
        ├── imp-semantics-denotational.maude  # ★ combined denotational (above spec)
        └── imp-denotational.maude             # loader
```

## Syntax additions (see `6-imp++/imp-syntax.maude`)

* `op halt; : -> Stmt .`                      (halt-extension)
* `op spawn_ : Block -> Stmt [prec 57] .`     (threads-extension)
* `op int_; : List{Id} -> Stmt .`             (locals-extension; local variable declaration now at Stmt level)
* `op read() : -> AExp .`                     (input-extension)
* `op print(_); : AExp -> Stmt [prec 57] .`   (output-extension)
* `subsort Stmt < Pgm .`                      (Pgm becomes just a top-level Stmt instead of `int xl ; S`)
* `op let_=_in_ : Id AExp Stmt -> Stmt .`     (desugaring for locals at parse-time equations)

## Configuration additions (big-step, see `6-imp++/big_step/imp-semantics-bigstep.maude`)

Configurations now carry **two buffers** (input and output) alongside the
state, and there are new result shapes for abrupt termination:

```maude
op <_,_,_> : AExp State Buffer -> Configuration .    --- normal AExp config
op <_,_,_> : BExp State Buffer -> Configuration .    --- normal BExp config
op <_,_,_> : Stmt State Buffer -> Configuration .    --- normal Stmt config

op <`error`,_,_>   : State Buffer -> Configuration .              --- error result
op <`halting`,_,_,_> : State Buffer Buffer -> Configuration .     --- halt result (carries in+out buffer)
op <_,_,_> : State Buffer Buffer -> Configuration .               --- normal result
```

## Lean port status

The parallel Lean 4 port in `veri-veri-bench` is landing as **several
sequential PRs**, not one:

| Part   | Scope                                               | PR           |
|--------|-----------------------------------------------------|--------------|
| HW3a   | IMP++ Syntax + big-step SOS                          | see vvb main |
| HW3b   | IMP++ small-step SOS                                 | follow-up    |
| HW3c   | IMP++ denotational (above-spec bonus)                | follow-up    |
| HW3d   | IMP++ type-system (big-step)                         | follow-up    |

Splitting this way keeps each PR independently reviewable (per mega-QA
protocol in `~/agents-config/INDEX_RULES.md` Rule 10). See
`veri-veri-bench/experiments/02_do_all_cs522_in_Lean/prompt.md`.

## Execution status

Maude is not installed on this machine (`brew install maude` has no
formula). Documentation + Lean port are static-reviewed only; running
`maude imp-bigstep.maude` / etc. is deferred. See `HW1-Maude/README.md`
for the same disclosure in the HW1 context.
