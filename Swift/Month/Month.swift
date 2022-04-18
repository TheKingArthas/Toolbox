import Foundation

// MARK: Enums

enum Month {
    case january, february, march, april, may, june, july, august, september, october, november, december

    var description: String {
        switch self {
        case .january: return NSLocalizedString("January", comment: "January")
        case .february: return NSLocalizedString("February", comment: "February")
        case .march: return NSLocalizedString("March", comment: "March")
        case .april: return NSLocalizedString("April", comment: "April")
        case .may: return NSLocalizedString("May", comment: "May")
        case .june: return NSLocalizedString("June", comment: "June")
        case .july: return NSLocalizedString("July", comment: "July")
        case .august: return NSLocalizedString("August", comment: "August")
        case .september: return NSLocalizedString("September", comment: "September")
        case .october: return NSLocalizedString("October", comment: "October")
        case .november: return NSLocalizedString("November", comment: "November")
        case .december: return NSLocalizedString("December", comment: "December")
        }
    }

	// MARK: Class methods

	//swiftlint:disable cyclomatic_complexity
	func next() -> Month {
		switch self {
		case .january:
			return .february
		case .february:
			return .march
		case .march:
			return .april
		case .april:
			return .may
		case .may:
			return .june
		case .june:
			return .july
		case .july:
			return .august
		case .august:
			return .september
		case .september:
			return .october
		case .october:
			return .november
		case .november:
			return .december
		case .december:
			return .january
		}
	}
}
