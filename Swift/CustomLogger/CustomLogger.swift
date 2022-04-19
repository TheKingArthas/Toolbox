import UIKit

public class CustomLogger {

    // MARK: Enums

    public enum LineIdentifier {
        case counter, timeStamp
    }

    // MARK: Class properties

    public static let sharedInstance: CustomLogger = {
        let instance = CustomLogger()
        return instance
    }()

    // MARK: Public properties

    public var lineIdentifier: LineIdentifier

    // MARK: Private properties

    private var log: String
    private var lineNumber: Int

    // MARK: Initialization

    private init() {
        /*
        lineIdentifier must be changed in the initializer if you desire to use another type of identifier.
        */
        log = ""
        lineIdentifier = .counter
        lineNumber = 0
    }

    // MARK: Public methods

    public func add(text: String) {
        var reviewedText: String
        if text.isEmptyAndWithoutWhiteSpaces() {
            reviewedText = "<Empty line>"
        } else {
            reviewedText = text
        }
        if !isFirstLineInLog() {
            log += "\n"
        }
        log += currentLineIdentifier() + " " + reviewedText
    }

    public func presentAsAlertOn(_ viewController: UIViewController) {
        let dialogMassage = UIAlertController(title: "<<<CUSTOM LOG>>>", message: log, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Accept", style: .default)
        dialogMassage.addAction(okAction)
        viewController.present(dialogMassage, animated: true, completion: nil)
    }

    // MARK: Private methods

    private func currentLineIdentifier() -> String {
        var currentIdentifier: String

        switch lineIdentifier {
        case .counter:
            currentIdentifier = String(lineNumber)
            lineNumber += 1
        case .timeStamp:
            currentIdentifier = currentTimeTag()
        }
        return "[\(currentIdentifier)]"
    }

    private func currentTimeTag() -> String {
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.hour, .minute, .second, .nanosecond], from: date)

        let hour = components.hour
        let minute = components.minute
        let second = components.second
        let nanosecond = components.nanosecond
        let currentTime = String(hour!) + ":" + String(minute!) + ":" +  String(second!) + ":" + String(nanosecond!)

        return currentTime
    }

    private func isFirstLineInLog() -> Bool {
        return log.isEmptyAndWithoutWhiteSpaces()
    }
}

fileprivate extension String {
    func isEmptyAndWithoutWhiteSpaces() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
