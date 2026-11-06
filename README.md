# AtlasV 招聘页（EVP）

原 MiniMax 托管页面 + 一次视觉升级。**结构、文案不动**，只换皮。

## 内容层改了什么

1. **去掉 MiniMax 水印**：页脚换成 `Copyrights 2026 AtlasV Global Pte. Ltd. All Rights Reserved.`，平台注入的备案号 / 模型备案 / 用户协议 / 6 份 iframe 高亮脚本全部清除（175KB → 42KB，全文无 minimax）。
2. **产品矩阵换真实产品**（9 款，真 App Store 截图）：
   - AI + Video：ShotCut AI、Vidma、Vidma Record
   - AI + Photo：Collart AI、Muselab AI、Pic Fix（删掉查不到的 AI Eraser / Pixelance / BG Remover）
   - Business：ScannerLens、TextNum（原文误写 TalkNum）、Call Me
3. **发展历程按时间排序**：2023.03 移到 2023.12 之前。
4. **使命 / 愿景 / 工作方式**：使命「予力他人，成就不凡」；愿景「连接人与人，激发创造，传递热爱」；工作方式与文化改为「我们如何工作」六条（MK 原文）。去掉「年底双薪」卡片，激励与回报剩 3 张。

## 视觉层（第二版设计）

沿用第一版设计语言：真 logo 图片、封面右侧三张产品截图、系统字 + 收紧字距、白底细边圆角卡片、去渐变、小标签统一 eyebrow、数字改墨黑、收尾页深色。

## 本地预览

```bash
python3 -m http.server 8899   # http://127.0.0.1:8899
```

## 维护注意

- 15 屏结构 + 右侧圆点翻页（`.page-dot` / `#current-page`）由页面自带 JS 驱动，改屏数要同步 `.pagination` 里的 dot 数量
- 产品截图在 `assets/screens/`，来源 atlasv.com 根目录 `*-store.jpg`

## 部署（线上以 AWS 为准）

**线上地址：https://hr.etm.tech/careers/**

- 文件同步到公司 AWS 的 `/home/ubuntu/work/careers`，由 PRIS 那台机器的 Caddy 用 `file_server` 直出。
- 路由（一次性，已上线）：`pulse-dance` 仓库 #359 —— `caddy/Caddyfile` 的 `handle_path /careers/*` + caddy 容器只读挂载 `./careers:/srv/careers`。
- 改内容后只要跑 `./deploy.sh`（= tar | ssh 覆盖文件 + sha256 核对），**不用重建容器、不用发 PRIS 版本**。
- GitHub Pages（https://atlasv-hr.github.io/atlasv-careers/）保留为预览镜像，每次 push 自动更新；对外用 AWS 那个。
