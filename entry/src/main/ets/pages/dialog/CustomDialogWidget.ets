import HobbyBean from './HobbyBean';

@CustomDialog
export default struct CustomDialogWidget {
  @State hobbyBeans: HobbyBean[] = []
  @Link hobbies: string
  private controller: CustomDialogController
  title: string = ""

  constructor(title: string) {
    super()
    this.title = title
  }

  build() {
    Column() {
      Text(this.title)
        .height(50)
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 22 })

      List() {
        ForEach(this.hobbyBeans, (item: HobbyBean) => {
          ListItem(item.label) {
            Row() {
              Text(item.label)
              Toggle({ type: ToggleType.Checkbox, isOn: item.isChecked })
                .onChange((c) => {
                  item.isChecked = c
                })
            }.width('100%')
            .height(40)
            .justifyContent(FlexAlign.SpaceBetween)
          }
        })
      }.margin({ left: 22, right: 22, bottom: 10 })
      .divider({ strokeWidth: 0.2, color: Color.Grey })

      Row() {
        Text("取消")
          .width('50%')
          .height(44)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.controller.close()
          })

        Text("确定")
          .width('50%')
          .height(44)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Blue)
          .onClick(() => {
            this.controller.close()
          })
      }
    }
  }

  aboutToAppear() {
    let context = getContext(this)
    let manager = context.resourceManager
    manager.getStringArrayValue($r('app.strarray.hobbies_data'), (err, res) => {
      res.forEach((item) => {
        let bean = new HobbyBean()
        bean.label = item
        bean.isChecked = false
        this.hobbyBeans.push(bean)
      })
    })
  }

  setHobbiesValue(hobbyBeans: HobbyBean[]) {
    let hobbiesText = ""
    hobbiesText = hobbyBeans.filter((item) => item.isChecked).map((item) => {
      return item.label
    }).join(",")
    this.hobbies = hobbiesText
  }
}