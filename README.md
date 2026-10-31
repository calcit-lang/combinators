# Toy Combinators

SKI 与 BCKW 组合子实验，使用正式 Calcit **0.32.1** 原生运行。

## 对使用者的影响

本轮升级原生 CLI，保留组合子运行逻辑、符号应用、变参合同、原演示和定律。
项目没有 npm runtime、JS 构建或前端，不为配对工具链引入 `package.json`、COS 或部署步骤。
不发布模块 tag，不将现有高阶/符号边界当作已完全类型化。

0.32 类型标注迁移已在前轮完成；本次 Snapshot、schema、原测试和质量基线保持不变。
`Ap` 同时处理函数与符号，额外参数仍按原顺序左折叠；符号输入构造嵌套 List，不改写为普通函数调用。
`display-name` 对非已知组合子保留原值，因此仍是开放返回边界，不伪造 String 返回类型。

## 运行与门禁

项目使用 `calcit.cirru` 和 `deps.cirru`，不恢复 `compact.cirru` 或 `package.cirru`。

```sh
caps --ci --strict
calcit calcit.cirru --check-only --all-defs
calcit calcit.cirru fix --workflow strict --verify
calcit calcit.cirru analyze quality --baseline config/calcit-quality.cirru
calcit calcit.cirru test --require-match
calcit calcit.cirru
```

保留原完整 strict、22 个公开定义、动态方法零发现检查、六项定律及五项演示，不增加 checker、依赖或防御测试。
质量预算保持 schemaDynamic/unresolved 18、typeNotFull 3、typeNone 1，其余原零上限保持，不放宽基线。
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
