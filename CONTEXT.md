# CONTEXT

本仓库是一份 LaTeX 简历模板（fork 自 billryan/resume）及其中文实例。
本文件只记录**词汇与体裁约定**，不记录实现细节。

## English résumé terminology

**International industry résumé**:
The English résumé for industry applications in markets such as the US and Singapore. It includes work and research experience, publications, honors and fellowships, academic service, and technical skills; it omits China-specific career objectives and teaching experience.
_Avoid_: Treating it as a literal translation of the domestic career-objective section.

**Triage**:
Assessing whether a reported finding is valid, distinct from identifying a vulnerability's root cause.
_Avoid_: Diagnosis as a synonym for triage.

**Occluded bug**:
A vulnerability masked by a more readily triggered crash during fuzzing.
_Avoid_: Hidden bug as a generic substitute.

**Artifact evaluation**:
Peer review of the code, data, and reproducible experiments accompanying a research paper.
_Avoid_: Product evaluation.

## 体裁

- **简历（业界版）** — 面向国内业界投递。入口 `resume-zh_CN.tex`。
- **简历（教职版）** — 面向高校教职/学术岗位。入口 `resume-zh_CN-academic.tex`。
- 两者**内容深度相同**（同一套 bullet、同一份论文列表），差异只在体裁惯例：
  1. 教育经历中的 GPA 按各版本的展示需要保留；ASU 的 GPA 为 4.0/4.0；
  2. 荣誉与奖学金：业界版合并为一节，教职版拆成「荣誉奖项」「奖学金」两节；
  3. LitePoint 本科实习仅业界版显示（对教职评审是噪音）；
  4. 「教学经历」仅教职版显示（国内高校招聘看重，业界不看）。
- 「学术服务」两版都有：对业界而言，TDSC 审稿人与 S&P 制品评审委员是同行认可的信号，
  不是纯学术装饰。
- **不要**把两版理解为"长版/短版"。曾经按详略拆分过，结果是两套需要同步维护的
  重复 bullet 文案；现在只有上述 3 处开关。

## 作者身份标注

论文列表中**只标注第一作者**，未标注者即为参与作者。不写"合作者"字样——
它对每一行增加约 8 个字符，会把右对齐的日期挤到下一行。

## 术语约定

- **首次并列规则** — 技术术语在文档中**首次出现**时写作「中文（English）」，
  其后一律只用英文。理由：重复并列在 1 页版面里是纯冗余，且术语映射一次即建立。
- **例外一：章节标题与技能类别一律用中文**（"专业技能"，不写 "Skills"）。
- **例外二：项目小标题用中英并列**（如「根因驱动的漏洞修复（Root-Cause-Driven Patching）」），
  因为教职版评审需要凭它对应到论文。
- **不译的词** — 国内安全领域无通行中译或英文即通行叫法的，一律保留英文：
  `Use-After-Free`、`fuzzing`、`AFL++`、`QEMU`、`SITL`、`PoV`、`PoC`、`CWE`、
  `rehosting`、`sim-to-real`、`LLM`。

## 关键概念

- **研判（triage）** — 对告警/漏洞做成立性判定与优先级排序，输出"这条成不成立"。
  国内安全运营（SOC）通行说法，全文统一用此词，**不写"分诊"也不写"诊断"**。
  与"诊断"是不同动作：诊断回答"根因是什么"，那是「根因驱动的漏洞修复」在做的事。
  混用会让 Amazon 与 ASU 两段工作看起来重复。

- **论文成果评估（Artifact Evaluation）** — 会议对论文配套制品（代码、数据、可复现实验）
  的同行评审流程。全文统一用此译法，**不写"制品评审"**——"制品"在中文里指向制造业，
  会让非本领域读者误解。首次出现附英文原名。

- **遮蔽缺陷（occluded bug）** — 被更易触发的崩溃所掩盖、因而在常规 fuzzing 中
  无法暴露的漏洞。不是"隐藏漏洞"的泛称。
- **AIxCC** — DARPA AI 网络挑战赛。国内读者认知度低，**凡出现必须附带说明**
  （面向真实开源软件的自动化漏洞发现与修复全球竞赛、第五名、200 万美元团队奖金），
  否则"第五名"脱离语境不构成信息。
- **在投（under submission）** — 已投稿未接收。与 arXiv 预印本是不同状态，两版均需明示。

## 版本开关

`\ifacademic` 是**体裁开关**，不是"详略开关"。
`\academictrue` 选中教职版，`\academicfalse` 选中业界版；开关在入口文件中设置，
内容单一来源于 `texs/sections.tex`。
