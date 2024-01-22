@Entry
@Component
struct VideoIndex {
  private videoPath: string = "https://1257092428.vod2.myqcloud.com/58f40927vodgzp1257092428/44b8804d5576678020895520580/Lv7iCU0ovR0A.mp4"
  private videoController: VideoController

  build() {
    Column() {
      Video({src: this.videoPath, currentProgressRate: 1.0, controller: this.videoController})
        .height(200)
        .margin(10)
        .borderRadius(6)
        .backgroundColor(Color.White)

    }.backgroundColor('#EBEBEB')
    .width('100%')
    .height('100%')
  }
}