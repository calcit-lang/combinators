
{} (:package |combinators)
  :configs $ {} (:init-fn |combinators.main/main!) (:reload-fn |combinators.main/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |combinators.core $ {}
      :ns $ quote (ns combinators.core)
      :defs $ {}
        |S $ quote
          def S $ \f \g \x Ap f x (g x)
        |K $ quote
          def K $ \x \y identity x
        |I $ quote
          def I $ \x identity x
        |B $ quote
          def B $ \x \y \z Ap x (y z)
        |C $ quote
          def C $ \x \y \z Ap x z y
        |W $ quote
          def W $ \x \y Ap x y y
        |Ap $ quote
          defn Ap (x y & xs)
            if (empty? xs)
              if (fn? x) (x y) ([] x y)
              Ap (Ap x y) & xs
        |display-name $ quote
          defn display-name (x)
            cond
                = x S
                , 'S
              (= x I) 'I
              (= x K) 'K
              (= x B) 'B
              (= x C) 'C
              (= x W) 'W
              true x
      :proc $ quote ()
      :configs $ {}
    |combinators.main $ {}
      :ns $ quote
        ns combinators.main $ :require
          [] combinators.core :refer $ [] S K I B C M W Ap display-name
      :defs $ {}
        |main! $ quote
          defn main! () $ task!
        |reload! $ quote
          defn reload! () $ task!
        |task! $ quote
          defn task! ()
            with-log $ Ap I 'x
            with-log $ Ap S K K 'x
            with-log $ Ap W 'x 'y
            with-log $ Ap S K W K
            with-log $ Ap S K K W K
      :proc $ quote ()
      :configs $ {}
