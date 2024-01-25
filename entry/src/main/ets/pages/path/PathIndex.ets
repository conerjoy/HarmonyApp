import Prompt from '@system.prompt'

@Entry
@Component
@Preview
struct PathIndex {
  build() {
    Column() {
      Text("轨迹控件")
        .onClick(() => {
          let a = 0
          let b = 0
          console.log("点击了")
        })
      Path().width(100).height(100)
        .commands('M200 200 L800 200 L800 800 L200 800 Z')
        .stroke(Color.Red).strokeWidth(2)
        .fill(Color.Green)
    }
  }
}