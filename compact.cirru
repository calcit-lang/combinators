
{} (:package |combinators)
  :configs $ {} (:init-fn |combinators.main/main!) (:reload-fn |combinators.main/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |combinators.core $ {}
      :ns $ quote (ns combinators.core)
      :defs $ {}
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
        |Ap $ quote
          defn Ap (x y & xs)
            if (empty? xs)
              if (fn? x) (x y) ([] x y)
              Ap (Ap x y) & xs
        |B $ quote
          def B $ \. x.y.z
            Ap x y $ y z
        |C $ quote
          def C $ \. x.y.z (Ap x z y)
        |I $ quote
          def I $ \. x x
        |K $ quote
          def K $ \. x.y x
        |S $ quote
          def S $ \. f.g.x
            Ap f x $ g x
        |W $ quote
          def W $ \. x.y (Ap x y y)
        |Y $ quote
          def Y $ Ap S I
            Ap S I I $ Ap B (Ap S I) (Ap S I I)
    |combinators.main $ {}
      :ns $ quote
        ns combinators.main $ :require
          [] combinators.core :refer $ [] S K I B C M W Ap display-name
      :defs $ {}
        |c-0 $ quote (def c-0 I)
        |c-or $ quote
          def c-or $ \. x.y (Ap x t y)
        |c-and $ quote
          def c-and $ \. x.y (Ap x y f)
        |c-not $ quote
          def c-not $ \. x (Ap x c-false c-true)
        |main! $ quote
          defn main! () $ task!
        |task! $ quote
          defn task! ()
            w-log $ Ap I 'x
            w-log $ Ap S K K 'x
            w-log $ Ap W 'x 'y
            w-log $ Ap S K W K
            w-log $ Ap S K K W K
        |c-false $ quote
          def c-false $ \. x.y y
        |c-right $ quote
          def c-right $ \. x (Ap x f)
        |c-left $ quote
          def c-left $ \. x (Ap x c-true)
        |c-pair $ quote
          def c-pair $ \. x.y.z (Ap z x y)
        |c-succ $ quote
          def c-succ $ \. x (Ap c-pair c-false)
        |c-true $ quote
          def c-true $ \. x.y x
        |reload! $ quote
          defn reload! () $ task!
