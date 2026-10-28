
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |combinators
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'combinators.main/main!) (:mode :native) (:reload-fn 'combinators.main/reload!) (:target :native)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'combinators.core $ %{} 'FileEntry
      :defs $ {}
        'Ap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn Ap (x y & xs)
            if (empty? xs)
              if (fn? x) (x y) ([] x y)
              .fold xs (Ap x y) Ap
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic & Dynamic (-> Dynamic)
          :tests $ []
            %{} 'TestEntry (:name |identity)
              :code $ quote $ assert= 'x (Ap I 'x)
            %{} 'TestEntry (:name |s-k-k)
              :code $ quote $ assert= 'x (Ap S K K 'x)
        'B $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def B
            fn (x)
              fn (y)
                fn (z)
                  Ap x $ Ap y z
          :examples $ []
          :schema $ quote Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |composition)
            :code $ quote $ do
              assert= 3 $ Ap B inc inc 1
              assert= 7 $ Ap B inc
                fn (n) (* n 2)
                , 3
              assert=
                [] 'f $ [] 'g 'x
                Ap B 'f 'g 'x
        'C $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def C
            fn (x)
              fn (y)
                fn (z) (Ap x z y)
          :examples $ []
          :schema $ quote Dynamic
        'I $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def I
            fn (x) x
          :examples $ []
          :schema $ quote $ Fn T (-> T) (:generics T)
        'K $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def K
            fn (x)
              fn (y) x
          :examples $ []
          :schema $ quote $ Fn T
            -> $ Fn U $ -> T
            :generics T U
        'S $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def S
            fn (f)
              fn (g)
                fn (x)
                  Ap f x $ g x
          :examples $ []
          :schema $ quote Dynamic
        'W $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def W
            fn (x)
              fn (y) (Ap x y y)
          :examples $ []
          :schema $ quote Dynamic
        'Y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def Y
            Ap S I $ Ap S I I $ Ap B (Ap S I) (Ap S I I)
          :examples $ []
          :schema $ quote Dynamic
        'display-name $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn display-name (x)
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
          :schema $ quote $ Fn Dynamic (-> Dynamic)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns combinators.core
    'combinators.main $ %{} 'FileEntry
      :defs $ {}
        'c-0 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-0 I
          :examples $ []
          :schema $ quote $ Fn T (-> T) (:generics T)
        'c-and $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-and
            fn (x)
              fn (y) (Ap x y c-false)
          :examples $ []
          :schema $ quote Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |truth-table)
            :code $ quote $ do
              assert= :yes $ Ap c-and c-true c-true :yes :no
              assert= :no $ Ap c-and c-true c-false :yes :no
              assert= :no $ Ap c-and c-false c-true :yes :no
              assert= :no $ Ap c-and c-false c-false :yes :no
        'c-false $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-false
            fn (x)
              fn (y) y
          :examples $ []
          :schema $ quote $ Fn T
            -> $ Fn U $ -> U
            :generics T U
        'c-left $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-left
            fn (x) (Ap x c-true)
          :examples $ []
          :schema $ quote Dynamic
        'c-not $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-not
            fn (x) (Ap x c-false c-true)
          :examples $ []
          :schema $ quote Dynamic
        'c-or $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-or
            fn (x)
              fn (y) (Ap x c-true y)
          :examples $ []
          :schema $ quote Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |truth-table)
            :code $ quote $ do
              assert= :yes $ Ap c-or c-true c-true :yes :no
              assert= :yes $ Ap c-or c-true c-false :yes :no
              assert= :yes $ Ap c-or c-false c-true :yes :no
              assert= :no $ Ap c-or c-false c-false :yes :no
        'c-pair $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-pair
            fn (x)
              fn (y)
                fn (z) (Ap z x y)
          :examples $ []
          :schema $ quote Dynamic
        'c-right $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-right
            fn (x) (Ap x c-false)
          :examples $ []
          :schema $ quote Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |pair-selection)
            :code $ quote $ assert= :right
              Ap c-right $ Ap c-pair :left :right
        'c-succ $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-succ
            fn (x) (Ap c-pair c-false)
          :examples $ []
          :schema $ quote Dynamic
        'c-true $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def c-true
            fn (x)
              fn (y) x
          :examples $ []
          :schema $ quote $ Fn T
            -> $ Fn U $ -> T
            :generics T U
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (task!)
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (task!)
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'task! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task! ()
            dbg $ Ap I 'x
            dbg $ Ap S K K 'x
            dbg $ Ap W 'x 'y
            dbg $ Ap S K W K
            dbg $ Ap S K K W K
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns combinators.main
          :require $ combinators.core :refer $ S K I B C W Ap display-name
