
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --full` first. Manual edits must follow format and schema conventions, then run `calcit edit format`.") (:package |combinators)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'combinators.main/main!) (:mode :native) (:reload-fn 'combinators.main/reload!)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'combinators.core $ %{} 'FileEntry
      :defs $ {}
        'Ap $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn Ap (x y & xs)
              if (empty? xs)
                if (fn? x) (x y) ([] x y)
                Ap (Ap x y) & xs
          :examples $ []
          :schema $ :: 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |identity)
              :code $ quote
                assert= 'x $ Ap I 'x
            %{} 'TestEntry (:name |s-k-k)
              :code $ quote
                assert= 'x $ Ap S K K 'x
        'B $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def B $ fn (x)
              fn (y)
                fn (z)
                  Ap x y $ y z
          :examples $ []
          :schema $ :: 'Dynamic
        'C $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def C $ fn (x)
              fn (y)
                fn (z) (Ap x z y)
          :examples $ []
          :schema $ :: 'Dynamic
        'I $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def I $ fn (x) x
          :examples $ []
          :schema $ :: 'Dynamic
        'K $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def K $ fn (x)
              fn (y) x
          :examples $ []
          :schema $ :: 'Dynamic
        'S $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def S $ fn (f)
              fn (g)
                fn (x)
                  Ap f x $ g x
          :examples $ []
          :schema $ :: 'Dynamic
        'W $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def W $ fn (x)
              fn (y) (Ap x y y)
          :examples $ []
          :schema $ :: 'Dynamic
        'Y $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def Y $ Ap S I
              Ap S I I $ Ap B (Ap S I) (Ap S I I)
          :examples $ []
          :schema $ :: 'Dynamic
        'display-name $ %{} 'CodeEntry (:doc |)
          :code $ quote
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
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns combinators.core)
    'combinators.main $ %{} 'FileEntry
      :defs $ {}
        'c-0 $ %{} 'CodeEntry (:doc |)
          :code $ quote (def c-0 I)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-and $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-and $ fn (x)
              fn (y) (Ap x y f)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-false $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-false $ fn (x)
              fn (y) y
          :examples $ []
          :schema $ :: 'Dynamic
        'c-left $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-left $ fn (x) (Ap x c-true)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-not $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-not $ fn (x) (Ap x c-false c-true)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-or $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-or $ fn (x)
              fn (y) (Ap x t y)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-pair $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-pair $ fn (x)
              fn (y)
                fn (z) (Ap z x y)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-right $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-right $ fn (x) (Ap x f)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-succ $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-succ $ fn (x) (Ap c-pair c-false)
          :examples $ []
          :schema $ :: 'Dynamic
        'c-true $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def c-true $ fn (x)
              fn (y) x
          :examples $ []
          :schema $ :: 'Dynamic
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () $ task!
          :examples $ []
          :schema $ :: 'Dynamic
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ task!
          :examples $ []
          :schema $ :: 'Dynamic
        'task! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn task! ()
              w-log $ Ap I 'x
              w-log $ Ap S K K 'x
              w-log $ Ap W 'x 'y
              w-log $ Ap S K W K
              w-log $ Ap S K K W K
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns combinators.main $ :require
            [] combinators.core :refer $ [] S K I B C M W Ap display-name
