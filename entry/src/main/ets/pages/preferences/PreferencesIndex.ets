import MyData from './MyData'

@Entry
@Component
struct PreferencesIndex {
  @State private textSize: number = 14
  private maxSize: number = 50
  @State private progress: number = 0

  build() {
    Column() {
      Text("字体大小测试")
        .fontSize(this.textSize)
        .margin({ top: 50 })

      Slider({
        value: this.progress,
        min: 0,
        max: 100,
        style: SliderStyle.InSet,
        step: 1
      }).height(20)
        .margin({ bottom: 200, left: 14, right: 14 })
        .onChange((v) => {
          MyData.setProgress(Math.floor(v))
          let rote = (50 - 14) * (v / 100)
          this.textSize = Math.floor(rote) + 14
          MyData.setFontSize(this.textSize)
        })
    }.justifyContent(FlexAlign.SpaceBetween)
    .height('100%')
  }

  async onPageShow() {
    this.textSize = await MyData.getFontSize()
    this.progress = await MyData.getProgress()
  }
}