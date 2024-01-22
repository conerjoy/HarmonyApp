@Entry
@Component
struct AnimationIndex {
  @State iconWidth: number = 40

  build() {
    Column() {
      Image($r('app.media.icon'))
        .width(this.iconWidth)
        .height(this.iconWidth)
        .animation({
          duration: 2000,
          tempo: 2.0,
          delay: 0,
          curve: Curve.Ease,
          playMode: PlayMode.Alternate,
          iterations: -1
        })
    }.padding(20)
    .width('100%')
    .height('100%')
    .onAppear(() => {
      this.iconWidth = 100
    })
  }
}