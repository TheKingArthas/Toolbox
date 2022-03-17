public class OLLogger {

  // MARK: Properties

  public static let sharedInstance: OLLogger = {
    let instance = OLLogger()
    return instance
  }()
  private var log: String
  private var lineNumber: Int

  // MARK: Initialization

  private init() {
    self.log = ""
    self.lineNumber = 0
  }

  // MARK: Public methods

  public func add(text: String) {
    lineNumber += 1
    if !isFirstLine() {
      self.log = self.log + "\n"
    }
    var reviewedText: String
    if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      reviewedText = "<Empty line>"
    } else {
      reviewedText = text
    }
    self.log = self.log + "[" + String(lineNumber) + "] " + reviewedText
  }

  public func showAsAlertOn(viewController: UIViewController) {
    let dialogMassage = UIAlertController(title: "<<<OL LOG>>>", message: self.log, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Accept", style: .default)
    dialogMassage.addAction(okAction)
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
    let currentTime = String(hour!) + ":" + String(minute!) + ":" +  String(second!) + ":" + String(nanosecond!)

    return "[" + currentTime + "]"
  }

  private func isFirstLine() -> Bool {
    return self.log.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}