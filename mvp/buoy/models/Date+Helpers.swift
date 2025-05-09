import Foundation

extension Date {
  /// Today at a fixed hour/minute
  static func todayAt(hour: Int, minute: Int = 0) -> Date {
    var comps = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    comps.hour = hour
    comps.minute = minute
    return Calendar.current.date(from: comps)!
  }

  /// Today + n days at a fixed hour/minute
  static func daysFromNow(_ days: Int, hour: Int, minute: Int = 0) -> Date {
    let target = Calendar.current.date(byAdding: .day, value: days, to: Date())!
    var comps = Calendar.current.dateComponents([.year, .month, .day], from: target)
    comps.hour = hour
    comps.minute = minute
    return Calendar.current.date(from: comps)!
  }
}

