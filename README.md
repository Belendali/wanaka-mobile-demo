# Wanaka Mobile · 可点击 Demo

**在线 demo**：https://belendali.github.io/wanaka-mobile-demo/ （电脑上显示手机框预览，手机上全屏）
**Figma**：[Wanaka Studio · 1015 分区](https://www.figma.com/design/PWtgAaGdl6znpuQykrnIbb/Wanaka-Studio?node-id=48522-18034)

这是用来演示交互和流程的原型，不是生产代码。视觉以 Figma 为准，两者不一致时请找设计确认。

## 流程

| Tab | 能点的 |
|---|---|
| **Home** | 上下滑刷视频（滑动时顶栏变小变淡）；点卡片出现 Play / Remix，`···` 里是 Download / Report；点 Play 或长按卡片，伴随震动和“进入世界”动效，全屏进入游戏；游戏内 `···`：Remix / 分享 / 重玩 / 下载 / Play as me |
| **Discover** | 推荐卡直接 Play；运营位进入 3D Snap；往下滑时搜索栏和 chips 吸顶；点网格里的游戏进入带返回按钮的 Feed |
| **Create（中间小猫）** | 默认 Create with AI：Inspiration 里的 prompt 点一下填入输入框、换一个、语音（模拟）；“+” → 相机 / 相册多选 / 我的资产；发送 → 生成进度 → 对话式结果，继续修改生成 v2、旧版本收起，Publish |
| **3D Snap** | 在 Create 里左右滑或点切换器进入；拍照 → 选风格（默认风格 + 社区风格）→ 生成 3D → 结果：拖动旋转、换风格、对话修改、Save 到 Assets、删除 |
| **Friends** | 好友在玩什么、动态（简版） |
| **Me** | 会员卡（免费次数）、Games / Assets / Saved / Downloads；下载、发布、保存的内容会同步出现在这里 |

## 说明

- 生成过程都是模拟的；相机画面是一张静态照片。
- 游戏视频是参考素材（各截 10 秒），自带字幕和平台水印，之后换成干净的录屏即可。
- 震动只在支持的安卓浏览器上生效。

## 文件

```
app.html     页面本体（样式 + 脚本都在里面）
build.sh     把 app.html 包成完整的 index.html
index.html   GitHub Pages 用的页面（由 build.sh 生成，不要直接改）
media/       视频、封面、3D 模型图、头像、吉祥物
```

改完 `app.html` 后运行 `./build.sh`，再提交。
