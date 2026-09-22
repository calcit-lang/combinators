
import * as $clt from "./calcit.core.mjs";
import { Ap } from "./combinators.core.mjs";
import { I } from "./combinators.core.mjs";
import { K } from "./combinators.core.mjs";
import { S } from "./combinators.core.mjs";
import { W } from "./combinators.core.mjs";
const _t_ = $clt.init_tags([]);

export function c_and(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-and', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return Ap(x, y, f)
  }

}

export function c_false(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-false', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return y
  }

}

export function c_true(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-true', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return x
  }

}

export function c_left(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-left', 1, arguments.length);
  return Ap(x, c_true)
}

export function c_not(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-not', 1, arguments.length);
  return Ap(x, c_false, c_true)
}

export function c_or(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-or', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return Ap(x, t, y)
  }

}

export function c_pair(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-pair', 1, arguments.length);
  return function f_PCT_(y) {
    if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
    return function f_PCT_(z) {
      if (arguments.length !== 1) throw $clt._args_throw('f%', 1, arguments.length);
      return Ap(z, x, y)
    }

  }

}

export function c_right(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-right', 1, arguments.length);
  return Ap(x, f)
}

export function c_succ(x) {
  if (arguments.length !== 1) throw $clt._args_throw('c-succ', 1, arguments.length);
  return Ap(c_pair, c_false)
}

export function task_$x_() {
  if (arguments.length !== 0) throw $clt._args_throw('task!', 0, arguments.length);
  {
    let _log_tmp = Ap(I, new $clt.CalcitSymbol("x"));
    console.log($clt.printable($clt.format_to_lisp(new $clt.CalcitSliceList([new $clt.CalcitSymbol("Ap"), new $clt.CalcitSymbol("I"), new $clt.CalcitSliceList([new $clt.CalcitSymbol('quote'), new $clt.CalcitSymbol("x")])])), "=>", _log_tmp));
    _log_tmp;
  }
  {
    let _log_tmp = Ap(S, K, K, new $clt.CalcitSymbol("x"));
    console.log($clt.printable($clt.format_to_lisp(new $clt.CalcitSliceList([new $clt.CalcitSymbol("Ap"), new $clt.CalcitSymbol("S"), new $clt.CalcitSymbol("K"), new $clt.CalcitSymbol("K"), new $clt.CalcitSliceList([new $clt.CalcitSymbol('quote'), new $clt.CalcitSymbol("x")])])), "=>", _log_tmp));
    _log_tmp;
  }
  {
    let _log_tmp = Ap(W, new $clt.CalcitSymbol("x"), new $clt.CalcitSymbol("y"));
    console.log($clt.printable($clt.format_to_lisp(new $clt.CalcitSliceList([new $clt.CalcitSymbol("Ap"), new $clt.CalcitSymbol("W"), new $clt.CalcitSliceList([new $clt.CalcitSymbol('quote'), new $clt.CalcitSymbol("x")]), new $clt.CalcitSliceList([new $clt.CalcitSymbol('quote'), new $clt.CalcitSymbol("y")])])), "=>", _log_tmp));
    _log_tmp;
  }
  {
    let _log_tmp = Ap(S, K, W, K);
    console.log($clt.printable($clt.format_to_lisp(new $clt.CalcitSliceList([new $clt.CalcitSymbol("Ap"), new $clt.CalcitSymbol("S"), new $clt.CalcitSymbol("K"), new $clt.CalcitSymbol("W"), new $clt.CalcitSymbol("K")])), "=>", _log_tmp));
    _log_tmp;
  }
  let _log_tmp = Ap(S, K, K, W, K);
  console.log($clt.printable($clt.format_to_lisp(new $clt.CalcitSliceList([new $clt.CalcitSymbol("Ap"), new $clt.CalcitSymbol("S"), new $clt.CalcitSymbol("K"), new $clt.CalcitSymbol("K"), new $clt.CalcitSymbol("W"), new $clt.CalcitSymbol("K")])), "=>", _log_tmp));
  return _log_tmp

}

export function main_$x_() {
  if (arguments.length !== 0) throw $clt._args_throw('main!', 0, arguments.length);
  return task_$x_()
}

export function reload_$x_() {
  if (arguments.length !== 0) throw $clt._args_throw('reload!', 0, arguments.length);
  return task_$x_()
}



export var c_0 = I;

