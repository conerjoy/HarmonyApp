import { TargetLisItem } from './TargetListItem'
@Entry
@Component
struct TargetList {
  private data: string[] = ["目标一", "目标二", "目标三", "目标四",]
  @State private mSelectIndex: number = -1
  @State isEditMode: boolean = false
  @State allChecked: boolean = false

  build() {
    Column() {
      RelativeContainer() {
        Text("子目标")
          .fontWeight(FontWeight.Bold)
          .fontSize(22)
          .id('title')
          .alignRules({
            center: {anchor: '__container__', align: VerticalAlign.Center},
            left: {anchor: '__container__', align: HorizontalAlign.Start}
          }).margin({left: 10})

        Text(this.isEditMode ? "取消" : "编辑")
          .id('editText')
          .alignRules({
            center: {anchor: 'title', align: VerticalAlign.Center},
            right: {anchor: 'allText', align: HorizontalAlign.Start}
          }).onClick(() => {
            this.isEditMode = !this.isEditMode
          }).margin({right: 10})

        Text('全选')
          .id("allText")
          .alignRules({
            center: {anchor: 'title', align: VerticalAlign.Center},
            right: {anchor: 'allCheck', align: HorizontalAlign.Start}
          }).visibility(this.isEditMode ? Visibility.Visible : Visibility.None)
        Checkbox()
          .id('allCheck')
          .alignRules({
            center: {anchor: 'title', align: VerticalAlign.Center},
            right: {anchor: '__container__', align: HorizontalAlign.End}
          })
          .width(20)
          .height(20)
          .margin({right: 10, left: 8})
          .visibility(this.isEditMode ? Visibility.Visible : Visibility.None)
          .onChange((v) => {
            this.allChecked = v
          })
      }.width('100%')
      .height(48)
      .margin(10)

      List() {
        ForEach(this.data, (item, index) => {
          ListItem() {
            TargetLisItem({
              mIndex: index,
              mTitle: item,
              selectIndex: $mSelectIndex,
              isEditMode: this.isEditMode,
              allChecked: this.allChecked
            })
          }
        }, item => item)
      }.divider({ strokeWidth: 10, color: Color.Transparent})
      .margin(10)
    }.width('100%')
    .height('100%')
    .backgroundColor('#EBEBEB')
  }
}