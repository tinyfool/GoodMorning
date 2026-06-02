# GoodMorning

GoodMorning 是一个早期 iOS「早安信息播报」概念原型。

项目目标是做一个早晨打开后自动播报信息的 App：先问候用户，再播报天气、空气质量、日程、星座运势和新闻等内容。当前代码只实现了欢迎页和天气页的静态展示与中文语音播报，还没有接入真实数据接口。

## 项目结构

```text
GoodMorning/
├── README.md
├── LICENSE
├── .gitmodules
├── GoodMorning/
│   └── GoodMorning/
│       ├── GoodMorning.xcodeproj
│       ├── GoodMorning/
│       │   ├── AppDelegate.swift
│       │   ├── BaseViewController.swift
│       │   ├── ContainerPageViewController.swift
│       │   ├── WelcomeViewController.swift
│       │   ├── WeatherViewController.swift
│       │   ├── Info.plist
│       │   └── Base.lproj/
│       │       ├── Main.storyboard
│       │       └── LaunchScreen.xib
│       └── GoodMorningTests/
└── submodules/
    └── weather-icons/
```

## 当前功能

已经实现：

- 横屏 iOS App。
- `UIPageViewController` 页面容器。
- 欢迎页。
- 天气页。
- 中文语音播报。
- 天气图标字体加载。

当前页面：

- `WelcomeViewController`：显示「主人，您好！」和日期，并播报问候语。
- `WeatherViewController`：显示城市、天气图标、温度和 AQI，并播报天气与空气质量。

## 核心模块

### `AppDelegate.swift`

App 启动入口。

代码中包含一段较长的中文早安播报文案，内容包括：

- 天气
- 空气质量
- 日程提醒
- 星座运势
- 热门新闻

不过实际调用 `speakUtterance` 的代码目前被注释掉了，所以启动时不会自动播报这整段内容。

文件中还保留了一段日文播报文案，说明这个原型曾经考虑过多语言播报。

### `BaseViewController.swift`

所有播报页面的基类。

核心方法：

```swift
func speak(words: String)
```

它会：

1. 创建 `AVSpeechSynthesizer`。
2. 创建 `AVSpeechUtterance`。
3. 设置中文语音：

```swift
AVSpeechSynthesisVoice(language: "zh-CN")
```

4. 设置语速：

```swift
utterance.rate = 0.1
```

5. 开始语音播报。

`BaseViewController` 也实现了 `AVSpeechSynthesizerDelegate`，但目前只留下了空的完成回调。

### `ContainerPageViewController.swift`

页面容器。

它继承自：

```swift
UIPageViewController
```

启动后会：

1. 设置自己为 `dataSource`。
2. 从 `Main.storyboard` 创建 `WelcomeViewController`。
3. 把欢迎页作为初始页面。

`viewControllerAfterViewController` 会返回 `WeatherViewController`，所以用户可以从欢迎页翻到天气页。

当前 `viewControllerBeforeViewController` 返回 `nil`，因此没有向前翻页逻辑。

### `WelcomeViewController.swift`

欢迎页。

主要逻辑：

- 把 `containerView` 设置圆角。
- 播放问候语：

```text
主人，您好。今天是2015年3月16日 星期一。
```

播报完成后，它会通过父级 `UIPageViewController` 自动切换到 `WeatherViewController`。

### `WeatherViewController.swift`

天气页。

主要逻辑：

- 把 `containerView` 设置圆角。
- 播放天气文案：

```text
天津市今日，多云，气温16摄氏度，空气质量指数160，轻度污染，建议戴口罩。
```

页面上的城市、温度、AQI 和天气图标都是 Storyboard 中的静态内容。

## Storyboard 页面

`Main.storyboard` 中有三个主要场景：

- `ContainerPageViewController`
- `WelcomeViewController`
- `WeatherViewController`

`WeatherViewController` 的 UI 包含：

- 城市：天津
- 天气图标：使用 Weather Icons 字体
- AQI：160
- 温度：16°

`WelcomeViewController` 的 UI 包含：

- 问候语：主人，您好！
- 日期：2015年3月16日 星期一

## 字体和资源

项目通过 Git submodule 引入了 `weather-icons`：

```text
submodules/weather-icons
```

`.gitmodules`：

```text
https://github.com/erikflowers/weather-icons.git
```

`Info.plist` 注册了字体：

```text
weathericons-regular-webfont.ttf
```

Storyboard 中的天气图标 label 使用字体：

```text
WeatherIcons-Regular
```

## 运行方式

1. 确认 submodule 已拉取：

```sh
git submodule update --init --recursive
```

2. 打开 Xcode 工程：

```text
GoodMorning/GoodMorning/GoodMorning.xcodeproj
```

3. 选择 `GoodMorning` target。
4. Build & Run。

注意：项目是 Swift 1/2 时代代码，现代 Xcode 下需要迁移语法后才能编译。

## 当前状态

这是概念原型，不是完整产品。

已经实现：

- 基础页面结构。
- 中文 TTS 播报。
- 欢迎页自动跳转到天气页。
- 静态天气展示。
- 天气图标字体配置。

尚未实现：

- 实时天气接口。
- AQI 接口。
- 日历/提醒事项读取。
- 星座运势接口。
- 新闻接口。
- 用户配置。
- 多城市支持。
- 多语言播报配置。
- 后台定时播报。
- 完整页面流程。

## 已知问题

- 代码使用 Swift 早期语法，例如 `as WelcomeViewController`、旧版 delegate 方法签名等，现代 Swift 需要迁移。
- `BaseViewController.speak` 中的 `AVSpeechSynthesizer` 是局部变量，理论上可能在播报过程中被释放；更稳妥的做法是把 synthesizer 做成实例属性。
- `WelcomeViewController` 在语音播报结束后直接切换页面，但没有处理用户手动翻页、重复播报或取消播报。
- `ContainerPageViewController` 每次请求下一页都会重新创建一个 `WeatherViewController`。
- `presentationCountForPageViewController` 返回 2，但没有实现完整的 before/after 页面索引管理。
- 所有播报文案和天气数据都是硬编码。
- 日期硬编码为 `2015年3月16日 星期一`。
- 天气城市硬编码为天津。
- `AppDelegate` 中有大段播报文案但实际未启用。
- 测试文件只有 Xcode 模板测试。

## 建议下一步

1. 先迁移到现代 Swift。
2. 把 `AVSpeechSynthesizer` 提升为页面或全局播报服务的属性。
3. 建立 `MorningBrief` 数据模型，统一管理天气、AQI、日程、新闻等信息。
4. 把硬编码文案改为由数据模型生成。
5. 接入天气和空气质量 API。
6. 接入 EventKit，读取当天日程。
7. 增加播报队列，支持暂停、继续、跳过。
8. 完善 `UIPageViewController` 的页面索引和复用。
9. 增加设置页，允许配置城市、语言、播报模块和播报时间。
10. 为文案生成和页面切换逻辑添加测试。

