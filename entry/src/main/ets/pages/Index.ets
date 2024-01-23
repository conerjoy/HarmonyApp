import router from '@ohos.router'
@Entry
@Component
struct Index {

  @Builder
  StandardButton(name: string, click: Function) {
    Button(name)
      .width('50%')
      .height(44)
      .margin({top: 10})
      .onClick((v) => {
        click(v)
      })
  }

  build() {
    Column() {
      this.StandardButton("上手", (v) => {
        router.pushUrl({url: "pages/demo/Demo"})
      })
      this.StandardButton("列表", (v) => {
        router.pushUrl({url: "pages/cell/TargetList"})
      })
      this.StandardButton("视频", (v) => {
        router.pushUrl({url: "pages/video/VideoIndex"})
      })
      this.StandardButton("弹窗", () => {
        router.pushUrl({url: "pages/dialog/DialogIndex"})
      })
      this.StandardButton("动画", () => {
        router.pushUrl({url: "pages/animation/AnimationIndex"})
      })
      this.StandardButton("webview", () => {
        router.pushUrl({url: "pages/web/WebviewIndex"})
      })
      this.StandardButton("网络请求", () => {
        router.pushUrl({url: "pages/http/HttpIndex"})
      })
      this.StandardButton("缓存", () => {
        router.pushUrl({url: "pages/preferences/PreferencesIndex"})
      })
    }.alignItems(HorizontalAlign.Center)
    .width('100%')
  }
}