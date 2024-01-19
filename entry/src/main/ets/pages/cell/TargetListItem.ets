import systemDateTime from '@ohos.systemDateTime'
@Component
export struct TargetLisItem {
  private mTitle: string = ""
  @State private progress: number = 0
  private mIndex: number = 0
  @Link selectIndex: number
  @State time: string = "暂无"
  @State private stashProgress: number = 0
  @Prop isEditMode: boolean
  @Prop allChecked: boolean

  constructor(index: number, title: string) {
    super()
    this.mTitle = title
    this.mIndex = index
  }

  build() {
    Column() {
      Flex({direction: FlexDirection.Row}) {
        Text(this.mTitle)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)

        Column() {
          Text(this.progress + '%')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
            .textAlign(TextAlign.End)
            .alignSelf(ItemAlign.End)

          Text('更新时间：' + this.time)
            .fontSize(14)
            .fontColor(Color.Gray)
            .textAlign(TextAlign.End)
            .textOverflow({overflow: TextOverflow.Ellipsis})
            .alignSelf(ItemAlign.End)
            .maxLines(1)
        }.margin({left: 8})
        .layoutWeight(1)

        Checkbox()
          .height(20)
          .width(20)
          .visibility(this.isEditMode ? Visibility.Visible: Visibility.None)
          .margin({left: 10})
          .select(this.allChecked ? true : false)
      }.width('100%')
      .padding(10)
      .onClick(() => {
        this.toggle()
      })

      Column() {
        Row() {
          Slider({
            value: this.stashProgress,
            min: 0,
            max: 100,
            style: SliderStyle.InSet,
            step: 1
          }).height(20)
            .onChange((p, mode) => {
              this.stashProgress = Math.floor(p)
            })
          Text(this.stashProgress + '%').margin(10)
        }.alignSelf(ItemAlign.Center)
        .width('80%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          CustomButton({name: "取消"})
            .onClick(() => {
              this.toggle()
            })
          CustomButton({name: "确定"})
            .onClick(() => {
              this.progress = this.stashProgress
              systemDateTime.getDate().then((d) => {
                this.time = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()
              })
              this.toggle()
            })
        }.margin(10)
      }.margin(10)
            .visibility(this.selectIndex == this.mIndex ? Visibility.Visible : Visibility.None)
    }.padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
  }

  toggle() {
    this.selectIndex = this.selectIndex == this.mIndex ? -1 : this.mIndex
  }
}

@Component
export struct CustomButton {
  private name: string = ""
  @State private press: boolean = false

  constructor(name: string) {
    super()
    this.name = name
  }

  build() {
    Text(this.name)
      .fontColor(Color.Blue)
      .width('50%')
      .height(48)
      .textAlign(TextAlign.Center)
      .hoverEffect(HoverEffect.Highlight)
      .borderRadius(6)
      .backgroundColor(this.press ? '#EBEBEB' : Color.Transparent)
      .onTouch((event) => {
        if (event != null && event.type == TouchType.Down) {
          this.press = true
        } else if (event != null && (event.type == TouchType.Up || event.type == TouchType.Cancel)) {
          this.press = false
        }
      })
  }
}