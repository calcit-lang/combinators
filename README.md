
Toy scripts to try combinators
----

> SKI 与 BCKW 组合子实验，使用 Calcit 0.30.1-alpha.5 候选。

本轮不改变五项演示输出、符号应用或变参合同，无前端及部署影响。
正式 0.30.1 的跨平台 CLI/npm 配对发布尚未完整，故明确固定已发布候选，不冒称正式版。
全部定义、完整 strict、原五项定律与原质量基线必须通过；不新增改写规则、
验证脚本或依赖，也不放宽类型预算。剩余高阶/符号应用边界仍需审阅，
并不因为工具链升级就视为已完全类型化。
迁移后独立修复 [issue #17](https://github.com/calcit-lang/combinators/issues/17)：
B 现在按 `B f g x = f (g x)` 复合，而不是先把函数 g 本身传给 f；
`Ap B inc inc 1` 返回 3。两层应用都经过原 `Ap`，因此符号输入仍构造嵌套 List，
例如 `Ap B 'f 'g 'x` 得到 `[] 'f ([] 'g 'x)`。依赖旧 B 错误行为的实验会改变结果。
原五项定律和演示输出不变，新增 B 的一项附带定律覆盖数值、复合顺序和符号应用。
这不等于其他组合子（包括引用 B 的 Y）已完成语义验收；原有类型债务及预算不变。

Canonical sources are `calcit.cirru` and `deps.cirru`; CI rejects retired
`compact.cirru` and `package.cirru`. This native-only example has no frontend
assets to deploy to COS. Existing quality debt is tracked by a lowering-only baseline.

`main!`, `reload!`, and `task!` now return `Unit`: they run the demonstration for
its printed output, rather than returning its last combinator expression. The
five logged expressions and the original attached laws are unchanged. Symbolic
application in `Ap` intentionally remains an open boundary; it must not be
retyped as ordinary function application merely to remove `Dynamic` markers.

The existing quality budget is reduced from 21 to 18 schema Dynamic/unresolved
markers and from 6 to 3 incomplete types. This is partial type cleanup, not a
claim that the remaining combinators are fully typed. CI still uses the same
strict checks, all 22 public definitions, five original laws, and native example;
no additional validation scripts or dependencies are introduced.

The 0.29.0 migration replaces the five deprecated `w-log` calls with `dbg`,
preserving the example expressions and their evaluate-once, print-and-return
behavior. The existing type budget is unchanged; the symbolic combinators
remain an explicitly unfinished type boundary, not a fully typed migration.

0.29.3 keeps `Ap` variadic: additional arguments are folded left in their original
order, preserving both function and symbolic application. This removes the open
recursive spread without fixing the public argument count. Full strict checks
pass; the existing 18-marker budget and all five laws remain unchanged.

0.30.0 改用公开首选 List `.fold`，仍按原顺序逐项左折叠，保留变参、函数调用及
符号 List 构造。原类型边界和 18-marker/3-incomplete 预算不放宽；本轮不冒称
全类型化。CI 从 `deps.cirru` 读取工具链，继续使用现有 strict、原定律及演示入口，
不新增改写规则、checker、依赖或测试框架。

### Usages

```cirru
ns demo.main $ :require $ combinators.core :refer (S K I B C W Ap)

defn main! ()
  hint-fn $ {}
    :args $ []
    :return 'Unit
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
