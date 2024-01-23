import webview from '@ohos.web.webview'
import Prompt from '@system.prompt'

@Entry
@Component
struct WebviewIndex {
  private url: string = "https://developer.harmonyos.com/"
  private rawPath: Resource = $rawfile('test.html')
  private webController: WebviewController = new webview.WebviewController()
  @State dataFromHtml: string = "占位文字"
  testObj = {
    test: (data) => {
      this.dataFromHtml = data
      return '返回值'
    },
    toString: () => {
      Prompt.showToast({message: "原生方法被调用了"})
    }
  }

  onPageShow() {
    this.webController.registerJavaScriptProxy(this.testObj, 'kye', ['test', 'toString'])
  }

  webHistory() {
    this.webController.forward() // 前进
    this.webController.backward() // 后退
    this.webController.refresh() // 刷新
    this.webController.stop() // 停止
    this.webController.clearHistory() // 清除历史
  }

  build() {
    Column() {
      Text(this.dataFromHtml)
      Web({ src: this.rawPath, controller: this.webController })
        .zoomAccess(true)
        .textZoomRatio(100)
        .javaScriptAccess(true)
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
        .onPageEnd(() => {
          this.webController.runJavaScript("h5Fun()").then((res) => {
            Prompt.showToast({ message: res })
          })
        })
        .onConsole((event) => {
          console.log("来自h5的打印:" + event.message.getMessage())
          return false
        })
    }
  }
}