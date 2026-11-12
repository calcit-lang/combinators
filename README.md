# Toy Combinators

SKI 与 BCKW 组合子实验，使用正式 Calcit **0.42.0** 原生运行。

## 对使用者的影响

本轮升级原生 CLI，保留组合子运行逻辑、符号应用、变参合同、原演示和定律。
项目没有 npm runtime、JS 构建或前端，不为配对工具链引入 `package.json`、COS 或部署步骤。
不发布模块 tag，不将现有高阶/符号边界当作已完全类型化。

升级后使用 Calcit 0.42.0 运行下方命令。官方 `edit format` 检查 Snapshot 的规范写法。
CI 使用 `analyze weak-types` 和 `config/weak-types-budget.json` 检查逐定义覆盖率及动态类型上限。
`Ap` 同时处理函数与符号，额外参数仍按原顺序左折叠；符号输入构造嵌套 List，不改写为普通函数调用。
`display-name` 对非已知组合子保留原值，因此仍是开放返回边界，不伪造 String 返回类型。已审查剩余高阶/符号边界：`Ap` 的任意函数结果与符号 List 可继续互相应用，无法在保持公开行为的同时穷举为有限 union；既有 I/K 泛型合同保持，不为计数添加最终仍含 Dynamic 的空壳 union。

## 运行与门禁

项目使用 `calcit.cirru` 和 `deps.cirru`，不恢复 `compact.cirru` 或 `package.cirru`。

运行下面的类型预算检查前，请先安装 `jq`。

```sh
caps --ci --strict
calcit calcit.cirru --check-only --all-defs
calcit calcit.cirru fix --workflow strict --verify
bash scripts/check-weak-types.sh
calcit calcit.cirru test --require-match
calcit calcit.cirru
```

保留原完整 strict、两个命名空间的 22 个定义、动态方法零发现检查、七项定律与回归及五项演示。
本地和 CI 运行同一个逐定义预算检查，`data-dynamic` 的预算为零。现有 schemaDynamic/unresolved 18、typeNotFull 3、typeNone 1 的预算继续生效。
这些指标描述既有边界，不替代严格检查或证明所有高阶组合子完整类型化。

示例：

```cirru
ns demo.main $ :require $ combinators.core :refer (S K I B C W Ap)

defn main! ()
  hint-fn $ Fn $ -> Unit
  echo $ I :a
```

## 已有语义边界

此前 [issue #17](https://github.com/calcit-lang/combinators/issues/17) 修正了 B 的函数复合：`B f g x = f (g x)`。
`Ap B inc inc 1` 返回 3，符号形式 `Ap B 'f 'g 'x` 保留为 `[] 'f ([] 'g 'x)`；原附带定律保留。
依赖旧 B 错误行为的实验会改变结果，但这不是本次 CLI patch 的新行为，也不代表 Y 等其他组合子已完成语义验收。

`main!`、`reload!`、`task!` 为打印演示返回 Unit；原五项表达式不变。
`identical?` 的容器身份比较与结构 `=` 不混用，不通过放宽比较或类型合同绕过定律。
CI 仅运行原检查和演示，无部署步骤。

## License

MIT
