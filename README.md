# AtlasV 招聘页（EVP）

原 MiniMax 托管版页面的本地版本。**只在原页面基础上改了三处**，其余结构、文案、样式一字未动。

## 改了什么

1. **去掉 MiniMax 水印**：删除页面底部 `© 2026 MiniMax`、上海稀宇科技、沪公网安备 / 沪ICP备、模型名称与备案号、用户协议 / 隐私政策链接，换成一行政权：`Copyrights 2026 AtlasV Global Pte. Ltd. All Rights Reserved.`
2. **更新产品矩阵**（AI-Powered / Mobile Apps，9 款）：
   - AI + Video：ShotCut AI、Vidma、Vidma Record
   - AI + Photo：Collart AI、Muselab AI、Pic Fix（删掉官网上查不到的 AI Eraser / Pixelance / BG Remover）
   - Business：ScannerLens、TextNum（原页面误写 TalkNum）、Call Me
   - 图片全部换成真实 App Store 截图，放在 `assets/screens/`，不再外链 atlasv.com（原链接全部 404）
3. **发展历程按时间排序**：2023.03「建立AI+图像产品矩阵」移到 2023.12 之前，原有 9 条内容不动。

## 本地预览

```bash
python3 -m http.server 8899   # 打开 http://127.0.0.1:8899
```

## 备注

- 页面数字仍沿用原文（200+/数亿/7亿+/6 个城市），未做统一；按需另改
- 产品截图源自 atlasv.com 根目录 `*-store.jpg`；ScannerLens 官网无机型截图，用其 App 图标
