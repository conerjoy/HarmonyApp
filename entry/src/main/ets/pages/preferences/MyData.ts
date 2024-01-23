import preferences from '@ohos.data.preferences'
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
      preferences.has(this.KEY).then(async (isHas) => {
        await preferences.put(this.KEY, size)
        preferences.flush()
      })
    })
  }

  setProgress(progress: number) {
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    getFontPreferences().then(async (preferences: dataPreferences.Preferences) => {
      await preferences.put("progress", progress)
      preferences.flush()
    })
  }

  async getFontSize() {
    let fontSize: number = 0;
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    fontSize = await (await getFontPreferences()).get(this.KEY, fontSize);
    return fontSize;
  }

  async getProgress() {
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function
    let progress: number = await (await getFontPreferences()).get("progress", 0)
    return progress
  }
}

export default new MyData()