@Entry
@Component
struct Demo {
  @State message: string = 'Hello World'
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("登录").stateEffect(true)

        Row() {
          List() {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text(`${item}`)
                  .backgroundColor(item <= 2 ? Color.Blue : Color.Transparent)
                  .fontColor(item <= 2 ? Color.White : Color.Black)
                  .align(Alignment.Center)
                  .alignSelf(ItemAlign.Center)
                  .borderRadius(15)
                  .width(30)
                  .height(30)
                  .textAlign(TextAlign.Center)
              }.width('50%').margin(10)
            })
          }.width('50%').divider({strokeWidth: 1, color: Color.Brown, startMargin: 16, endMargin: 16})
            .listDirection(Axis.Vertical)

          Grid() {
            ForEach(this.arr, (item: number) => {
              GridItem() {
                Text(`${item}`)
                  .backgroundColor(item <= 2 ? Color.Blue : Color.Transparent)
                  .fontColor(item <= 2 ? Color.White : Color.Black)
                  .align(Alignment.Center)
                  .alignSelf(ItemAlign.Center)
                  .borderRadius(15)
                  .width(30)
                  .height(30)
                  .textAlign(TextAlign.Center)
              }
            }, item => item)
          }.width('50%')
          // .rowsTemplate('1fr 1fr')
          .columnsTemplate('1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .height(300)
        }.alignSelf(ItemAlign.Center)
      }
      .width('100%')
    }
    .height('100%')
  }
}