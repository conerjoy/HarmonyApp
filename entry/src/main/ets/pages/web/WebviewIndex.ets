import webview from '@ohos.web.webview'
@Entry
@Component
struct WebviewIndex {
  private url: string = "https://developer.harmonyos.com/"
  private rawPath: Resource = $rawfile('test.html')
  private webController: WebviewController = new webview.WebviewController()

  build() {
    Column() {
      Web({src: this.rawPath, controller: this.webController})
        .zoomAccess(true)
        .textZoomRatio(100)
        .onConfirm((v) => {
          AlertDialog.show({
            title: "提示",
            message: v.message,
            confirm: {
              value: "onAlert",
              action: () => {
                v.result.handleConfirm()
              }
            },
            cancel: () => {
              v.result.handleCancel()
            }
          })
          return true
        })
        .onAlert((v) => {
          AlertDialog.show({
            title: "提示",
            message: v.message,
            confirm: {
              value: "onAlert",
              action: () => {
                v.result.handleConfirm()
              }
            },
            cancel: () => {
              v.result.handleCancel()
            }
          })
          return true
        })
    }
  }
}