import { StandardButton } from '../view/StandardButton'
import CustomDialogWidget from './CustomDialogWidget'
import promptAction from '@ohos.promptAction';
import Prompt from '@system.prompt';

@Entry
@Component
struct DialogIndex {
  private fruits: string[] = ['苹果', '橘子', '香蕉', '猕猴桃', '西瓜'];
  private select: number = 0
  private selectedDate: Date = new Date('2010-1-1');
  private selectedTime: string = ""
  @State hobbies: string = ""
  customDialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogWidget({
      title: "兴趣爱好",
      hobbies: $hobbies,
    }),
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 }
  })

  build() {
    Column() {
      StandardButton({ name: "警告弹窗", click: () => {
        AlertDialog.show({
          title: '温馨提示',
          message: '是否删除当前对象',
          autoCancel: false,
          alignment: DialogAlignment.Bottom,
          offset: { dx: 0, dy: -20 },
          primaryButton: {
            value: '取消',
            action: () => {
              console.info("点击了取消")
            }
          },
          secondaryButton: {
            value: '删除',
            fontColor: '#D94838',
            action: () => {
              console.info('Callback when the second button is clicked');
            }
          },
          cancel: () => {
            console.info('点击了遮罩关闭弹窗');
          }
        })
      } })
      StandardButton({ name: '确认弹窗', click: () => {
        AlertDialog.show({
          title: '温馨提示',
          message: "是否继续操作？",
          confirm: {
            value: '确认',
            action: () => {
              console.info("继续操作")
            }
          }
        })
      } })
      StandardButton({ name: "选择弹窗", click: () => {
        TextPickerDialog.show({
          range: this.fruits,
          selected: this.select,
          onAccept: (v) => {
            this.select = v.index
            promptAction.showToast({ message: "选择了" + v.value })
          }
        })
      } })
      StandardButton({ name: "日期选择弹窗", click: () => {
        DatePickerDialog.show({
          start: new Date('1900-1-1'), // 设置选择器的起始日期
          end: new Date('2024-2-31'), // 设置选择器的结束日期
          selected: this.selectedDate, // 设置当前选中的日期
          lunar: false,
          onAccept: (v) => {
            this.selectedDate.setFullYear(v.year, v.month, v.day)
            Prompt.showToast({ message: "选择了" + v.year + "/" + (v.month + 1) + "/" + v.day })
          }
        })
      } })
      StandardButton({ name: "时间选择弹窗", click: () => {
        TimePickerDialog.show({
          useMilitaryTime: true,
          onAccept: (v) => {
            this.selectedTime = v.hour + "点" + v.minute + "分"
            promptAction.showToast({ message: this.selectedTime })
          }
        })
      } })
      StandardButton({ name: '自定义弹窗', click: () => {
        this.customDialogController.open()
      } })
    }.width('100%')
  }
}