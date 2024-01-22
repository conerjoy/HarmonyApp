@Component
export struct StandardButton {
  private name: string = ""
  private click: Function

  constructor(name: string, click: Function) {
    super()
    this.name = name
    this.click = click
  }

  build() {
    Button(this.name)
      .width('50%')
      .height(44)
      .margin({top: 10})
      .onClick((v) => {
        this.click(v)
      })
  }
}