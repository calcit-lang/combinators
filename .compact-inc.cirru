
{} $ :changed
  {} $ |combinators.core
    {} $ :changed-defs
      {} $ |Ap
        quote $ defn Ap (x y & xs)
          if (empty? xs)
            if (fn? x) (x y) ([] x y)
            Ap (Ap x y) & xs
