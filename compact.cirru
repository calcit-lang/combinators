
{} (:package |combinators)
  :configs $ {} (:init-fn |combinators.main/main!) (:reload-fn |combinators.main/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |combinators.core $ {}
      :ns $ quote (ns combinators.core)
      :defs $ {}
        |K $ quote
          def K $ \. x.y x
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
        |S $ quote
          def S $ \. f.g.x
            Ap f x $ g x
        |Y $ quote
          def Y $ Ap S I
            Ap S I I $ Ap B (Ap S I) (Ap S I I)
        |Ap $ quote
          defn Ap (x y & xs)
            if (empty? xs)
              if (fn? x) (x y) ([] x y)
              Ap (Ap x y) & xs
        |C $ quote
          def C $ \. x.y.z (Ap x z y)
        |B $ quote
          def B $ \. x.y.z
            Ap x y $ y z
        |I $ quote
          def I $ \. x x
        |W $ quote
          def W $ \. x.y (Ap x y y)
      :proc $ quote ()
      :configs $ {}
    |combinators.main $ {}
      :ns $ quote
        ns combinators.main $ :require
          [] combinators.core :refer $ [] S K I B C M W Ap display-name
      :defs $ {}
        |c-true $ quote
          def c-true $ \. x.y x
        |c-0 $ quote (def c-0 I)
        |c-or $ quote
          def c-or $ \. x.y (Ap x t y)
        |main! $ quote
          defn main! () $ task!
        |c-succ $ quote
          def c-succ $ \. x (Ap c-pair c-false)
        |c-right $ quote
          def c-right $ \. x (Ap x f)
        |c-left $ quote
          def c-left $ \. x (Ap x c-true)
        |task! $ quote
          defn task! ()
            with-log $ Ap I 'x
            with-log $ Ap S K K 'x
            with-log $ Ap W 'x 'y
            with-log $ Ap S K W K
            with-log $ Ap S K K W K
        |c-not $ quote
          def c-not $ \. x (Ap x c-false c-true)
        |c-and $ quote
          def c-and $ \. x.y (Ap x y f)
        |reload! $ quote
          defn reload! () $ task!
        |c-pair $ quote
          def c-pair $ \. x.y.z (Ap z x y)
        |c-false $ quote
          def c-false $ \. x.y y
      :proc $ quote ()
      :configs $ {}
