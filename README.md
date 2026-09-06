
Toy scripts to try combinators
----

> Experimental SKI and BCKW combinators running on Calcit 0.13.78.

### Usages

```cirru
ns demo.main
  :require $ combinators.core :refer $ S K I B C W Ap

defn main! ()
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
