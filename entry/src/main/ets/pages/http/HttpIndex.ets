import http from '@ohos.net.http'
import { StandardButton } from '../view/StandardButton';
@Entry
@Component
struct HttpIndex {
  @State httpData: string = "暂无数据"

  /**
   * 订阅头部
   */
  listenerHeader() {
    http.createHttp().on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    })
  }

  /**
   * GET请求
   */
  getData() {
    this.httpData = "正在网络请求"
    let url= "https://EXAMPLE_URL?param1=v1&param2=v2"
    http.createHttp().request(url, {
      method: http.RequestMethod.GET,
      connectTimeout: 60000,
      readTimeout: 60000,
      header: {
        'Content-Type': 'application/json'
      }
    }).then((res) => {
      if (res.responseCode == http.ResponseCode.OK) {
        this.httpData = res.result.toString()
      } else {
        this.httpData = "请求失败了" + res.result.toString()
      }
    }).catch((e) => {
      this.httpData = "请求错误了" + e.message
    })
  }

  /**
   * POST请求
   */
  postData() {
    this.httpData = "正在网络请求"
    let url = "https://EXAMPLE_URL"
    http.createHttp().request(url, {
      method: http.RequestMethod.POST,
      extraData: {
        'das': 1,
        'moka': 'fsadf'
      },
      connectTimeout: 60000,
      readTimeout: 60000,
      header: {
        'Content-Type': 'application/json'
      }
    }).then((res) => {
      if (res.responseCode == http.ResponseCode.OK) {
        this.httpData = res.result.toString()
      } else {
        this.httpData = "请求失败了" + res.result.toString()
      }
    }).catch((e) => {
      this.httpData = "请求错误了" + e.message
    })
  }

  build() {
    Column() {
      Text(this.httpData)
        .width('100%')
        .height('50%')

      StandardButton({name: "get请求", click: () => {
        this.getData()
      }})
      StandardButton({name: "post请求", click: () => {
        this.postData()
      }})
    }.width('100%')
    .height('100%')
  }
}