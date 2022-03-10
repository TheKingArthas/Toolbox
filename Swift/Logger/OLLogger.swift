public class OLLogger {
  
  // MARK: Properties
  
  public static let sharedInstance: OLLogger = {
    let instance = OLLogger()
    return instance
  }()
  private var log: String
  
  // MARK: Initialization
  
  private init() {
    self.log = ""
  }
  
  // MARK: Public methods
  
  public func add(text: String) {
    if isLogEmpty() {
      self.log = self.log + currentTimeTag() + " " + text
    } else {
      self.log = self.log + "\n" + currentTimeTag() + " " + text
    }
  }
  
  public func showAsAlertOn(viewController: UIViewController) {
    let dialogMassage = UIAlertController(title: "<<<OL LOG>>>", message: self.log, preferredStyle: .alert)
    viewController.present(dialogMassage, animated: true, completion: nil)
  }
  
  // MARK: Private methods
  
  private func currentTimeTag() -> String {
    let date = Date()
    let calender = Calendar.current
    let components = calender.dateComponents([.hour,.minute,.second,.nanosecond], from: date)
    
    let hour = components.hour
    let minute = components.minute
    let second = components.second
    let nanosecond = components.nanosecond
    let currentTime = String(hour!)  + ":" + String(minute!) + ":" +  String(second!) + ":" + String(nanosecond!)

    return "[" + currentTime + "]"
  }
  
  private func isLogEmpty() -> Bool {
    return self.log.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}