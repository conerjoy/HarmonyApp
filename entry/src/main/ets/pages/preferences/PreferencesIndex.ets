import preferences from '@ohos.data.preferences'
@Entry
@Component
struct PreferencesIndex {
  private textSize: number = preferences.getPreferences()

  build() {
    Text()
  }
}