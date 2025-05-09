import Foundation

extension Date {
    /// Returns "just now", "X mins ago", "X hrs ago", "yesterday", or weekday name
    func relativeTimestamp() -> String {
        let now = Date()
        let seconds = Int(now.timeIntervalSince(self))
        
        // just now if under 15 minutes
        if seconds < 15 * 60 {
            return "just now"
        }
        // minutes ago if under 1 hour
        if seconds < 60 * 60 {
            let mins = seconds / 60
            return "\(mins) mins ago"
        }
        // hours ago if under 24 hours
        if seconds < 24 * 60 * 60 {
            let hrs = seconds / 3600
            return "\(hrs) hrs ago"
        }
        // yesterday if under 48 hours
        if seconds < 2 * 24 * 60 * 60 {
            return "yesterday"
        }
        // otherwise weekday name (e.g. "Tuesday")
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
}
