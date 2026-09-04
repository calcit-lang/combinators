# Upgrade to Calcit 0.13.77 / 升级到 Calcit 0.13.77

## English

- Migrated the last executable legacy Snapshot to canonical `calcit.cirru` with the Calcit 0.13.77 CLI and removed the retired duplicate `compact.cirru`.
- Replaced the removed dotted `\.` lambda alias with equivalent nested single-argument `fn` forms, preserving the original curried SKI/BCKW behavior.
- Added exact project metadata, two definition-attached combinator laws, a reviewed no-growth quality baseline, and least-privilege CI pinned to immutable action commits.
- Verified canonical formatting, check-only, both laws, the native example entry, zero deprecated calls, and zero dynamic method dispatch.

## 中文

- 使用 Calcit 0.13.77 CLI 将最后有效的旧 Snapshot 迁移为规范 `calcit.cirru`，并删除退役的重复 `compact.cirru`。
- 将已移除的点分 `\.` lambda 别名替换为语义等价的嵌套单参数 `fn`，保持原有 SKI/BCKW 柯里化行为。
- 补充精确项目元数据、两条 definition-attached 组合子定律、经审阅的无增长质量 baseline，以及使用不可变 Action commit 与最小权限的 CI。
- 已验证规范格式、check-only、两条定律、原生示例 entry、零废弃 API 调用和零动态方法分派。
