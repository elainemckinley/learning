import UIKit
import UserNotifications

class RecurringNotificationSettingsController: UITableViewController {
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enabledSwitchDidChange(_ sender: UISwitch) {
        print("Enabled switched to \(sender.isOn)")
        
        setNotification()
    }

    @IBAction func timePickerEditingDidEnd(_ sender: Any) {
        print("Editing on time picker ended at \(timePicker.date)")
        
        setNotification()
    }
    
    func setNotification() {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound];
        
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        
        let triggerDaily = Calendar.current.dateComponents([.hour, .minute, .second], from: timePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

        let content = UNMutableNotificationContent()
        content.title = "Bring an Umbrella"
        content.body = "Weather today is pretty meh"
        content.sound = UNNotificationSound.default()

        let identifier = "UmbrellaDailyRecurringNotificationIdentifier"
        let request = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: trigger
        )

        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print("Something went wrong: \(error)")
            }
        })
    }
}
