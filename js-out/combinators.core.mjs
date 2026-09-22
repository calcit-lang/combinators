
import * as $clt from "./calcit.core.mjs";
const _t_ = $clt.init_tags([]);

export function Ap(x, y, ...xs) {
  if (arguments.length < 2) throw $clt._args_fewer_throw('Ap', 2, arguments.length);
  xs = $clt.arrayToList(xs);

  if ($clt._$n_list_$o_empty_$q_(xs)) { 
  if ($clt.fn_$q_(x)) { return x(y) } else { return $clt._$L_(x, y) } } else { let tmp_AUTO_1 = Ap(x, y);
  return Ap(tmp_AUTO_1, ...$clt.listToArray(xs)) }
}

export function B(x) {
  if (arguments.length !== 1) throw $clt._args_throw('B', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return function f_PCT_(z) {
      if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
      let tmp_AUTO_2 = y(z);
      return Ap(x, y, tmp_AUTO_2)
    }

  }

}

export function C(x) {
  if (arguments.length !== 1) throw $clt._args_throw('C', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return function f_PCT_(z) {
      if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
      return Ap(x, z, y)
    }

  }

}

export function I(x) {
  if (arguments.length !== 1) throw $clt._args_throw('I', 1, arguments.length);
  return x
}

export function K(x) {
  if (arguments.length !== 1) throw $clt._args_throw('K', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return x
  }

}

export function S(f) {
  if (arguments.length !== 1) throw $clt._args_throw('S', 1, arguments.length);
  return function f_PCT_(g) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return function f_PCT_(x) {
      if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
      let tmp_AUTO_3 = g(x);
      return Ap(f, x, tmp_AUTO_3)
    }

  }

}

export function W(x) {
  if (arguments.length !== 1) throw $clt._args_throw('W', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return Ap(x, y, y)
  }

}

export function display_name(x) {
  if (arguments.length !== 1) throw $clt._args_throw('display-name', 1, arguments.length);

  if ($clt._$e_(x, S)) { new $clt.CalcitSymbol("S") }
   else if ($clt._$e_(x, I)) { new $clt.CalcitSymbol("I") }
   else if ($clt._$e_(x, K)) { new $clt.CalcitSymbol("K") }
   else if ($clt._$e_(x, B)) { new $clt.CalcitSymbol("B") }
   else if ($clt._$e_(x, C)) { new $clt.CalcitSymbol("C") }
   else if ($clt._$e_(x, W)) { new $clt.CalcitSymbol("W") } else { return x }
}



export var Y = (function _fn_(){
  let tmp_AUTO_4 = Ap(S, I, I, Ap(B, Ap(S, I), Ap(S, I, I)));
  return Ap(S, I, tmp_AUTO_4);
})();

