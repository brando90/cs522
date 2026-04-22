# Claude Code: run `git clone https://github.com/brando90/agents-config.git ~/agents-config 2>/dev/null || git -C ~/agents-config pull 2>/dev/null` to bootstrap/update config.
# Read `~/agents-config/INDEX_RULES.md` for all agent documentation and routing. Local `~/agents-config/` is the fallback if GitHub is unreachable.

## Project Overview

**cs522** — coursework for UIUC CS 522 (Programming Language Semantics). Contents:

- `HW1-Maude/`, `HW2-Maude/` — Maude-based homeworks (plus zipped submissions)
- `HW3/`, `HW4/` — later homeworks with IMP / IMP++ variants
- `imp/` — incremental IMP language definitions in Maude:
  - `0-imp-original`, `1-imp-increment`, `2-imp-input-output`,
    `3-imp-halting`, `4-imp-threads`, `5-imp-locals`
  - `state.maude` — shared state module
- `peano_nat.maude`, `vending-machine.m` — small standalone Maude examples
- `count.py` — utility script

## Running Maude

Most files here are Maude modules. Typical usage:

```bash
maude <file>.maude           # load into Maude interpreter
```

Homework directories usually contain per-problem `.maude` sources and expected-output notes.

## Related projects

- `~/veri-veri-bench/` — Lean 4 formalization of IMP (same language, different formalism).

---

## Mandatory Response Protocol (ALL responses)

- Every response ends with `**TLDR:**` — no exceptions.
- When a non-trivial task completes, run QA gating (see Hard Rule 3 in `~/agents-config/INDEX_RULES.md`) before reporting done.
- When unsure whether QA gating applies, run it.
- Never commit secrets. Review diffs before pushing.
