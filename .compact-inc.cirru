
{} $ :changed
  {} $ |combinators.core
    {} $ :added-defs
      {} $ |Y
        quote $ def Y
          Ap S I $ Ap S I I
            Ap B (Ap S I) (Ap S I I)
