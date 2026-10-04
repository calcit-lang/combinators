
Toy scripts to try combinators
----

> SKI 与 BCKW 组合子实验，使用正式 Calcit 0.28.0。

Canonical sources are `calcit.cirru` and `deps.cirru`; CI rejects retired
`compact.cirru` and `package.cirru`. This native-only example has no frontend
assets to deploy to COS. Existing quality debt is tracked by a lowering-only baseline.

`main!`, `reload!`, and `task!` now return `Unit`: they run the demonstration for
its printed output, rather than returning its last combinator expression. The
five logged expressions and the original attached laws are unchanged. Symbolic
application in `Ap` intentionally remains an open boundary; it must not be
retyped as ordinary function application merely to remove `Dynamic` markers.

The existing quality budget is reduced from 21 to 18 schema Dynamic/unresolved
markers and from 6 to 3 incomplete types. This is partial type cleanup, not a
claim that the remaining combinators are fully typed. CI still uses the same
strict checks, all 22 public definitions, five original laws, and native example;
no additional validation scripts or dependencies are introduced.

### Usages

```cirru
ns demo.main $ :require $ combinators.core :refer (S K I B C W Ap)

defn main! ()
  hint-fn $ {}
    :args $ []
    :return 'Unit
  echo $ I :a
```

Run the checked example program and its definition-attached laws:

```bash
caps --ci --strict
calcit calcit.cirru
calcit calcit.cirru test --require-match
```

### License

MIT
