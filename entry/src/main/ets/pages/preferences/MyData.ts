import dataPreferences from '@ohos.data.preferences'
import { GlobalContext } from './GlobalContext'

export class MyData {
  private name: string = "kye_data"
  private KEY: string = "textSize"

  init(context) {
    let fontPreferences: Function = (() => {
      let preferences: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context, this.name)
      return preferences
    })
    GlobalContext.getContext().setObject('getFontPreferences', fontPreferences)
  }

  setFontSize(size: number) {
    let getFontPreferences: Function = GlobalContext.getContext().getObject("getFontPreferences") as Function
    getFontPreferences().then((preferences: dataPreferences.Preferences) => {
      preferences.has(this.KEY).then(async  (isHas) => {
        if (!isHas) {
          await preferences.put(this.KEY, size)
          preferences.flush()
        }
      })
    })
  }

  async getFontSize() {
    let fontSize: number = 0;
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    fontSize = await (await getFontPreferences()).get(this.KEY, fontSize);
    return fontSize;
  }
}

export default new MyData()