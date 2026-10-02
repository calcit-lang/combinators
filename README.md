
Toy scripts to try combinators
----

> SKI 与 BCKW 组合子实验，使用正式 Calcit 0.28.0。

Canonical sources are `calcit.cirru` and `deps.cirru`; CI rejects retired
`compact.cirru` and `package.cirru`. This native-only example has no frontend
assets to deploy to COS. Existing quality debt is tracked by the unchanged baseline.

### Usages

```cirru
ns demo.main $ :require $ combinators.core :refer (S K I B C W Ap)

defn main! ()
  hint-fn $ {}
    :args $ []
    :return 'Tag
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
