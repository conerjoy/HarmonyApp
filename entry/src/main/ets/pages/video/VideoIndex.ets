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
        .autoPlay(true)
        .loop(true)
        .controls(true)
        .onStart(() => {
          console.log("logfilter-开始播放")
        })
        .onPause(() => {
          console.log("logfilter-暂停播放")
        })
        .onFinish(() => {
          console.log("logfilter-结束播放")
        })
        .onError(() => {
          console.log("logfilter-播放发生了错误")
        })
        .onPrepared(() => {
          console.log("logfilter-视频资源准备完成")
        })
        .onSeeking((v) => {
          console.log("logfilter-操作进度条:" + v.time + "秒")
        })
        .onSeeked((v) => {
          console.log("logfilter-操作进度条结束:" + v.time + "秒")
        })
        .onUpdate((v) => {
          console.log("logfilter-播放进度：:" + v.time + "秒")
        })
        .onFullscreenChange((v) => {
          console.log("logfilter-当前" + (v.fullscreen ? "全屏": "非全屏") + "模式")
        })

    }.backgroundColor('#EBEBEB')
    .width('100%')
    .height('100%')
  }
}