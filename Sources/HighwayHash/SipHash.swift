import Bridge
import Foundation

public enum SipHash {
  private static let key: [UInt64] = [1, 0, 6, 6]
  private static let keyCount: UInt64 = .init(key.count)
  private static let keyData: UnsafePointer<[UInt64]> = {
    let pointer = UnsafeMutablePointer<[UInt64]>.allocate(capacity: key.count)
    pointer.initialize(to: key)
    return .init(pointer)
  }()

  public static func of(data: Data) -> UInt64 {
    let bytes = data.map { CChar($0) }
    return bytes.withUnsafeBufferPointer { pointer in
      SipHashC(keyData[0], pointer.baseAddress, keyCount)
    }
  }

  public static func of(_ string: String) -> UInt64 {
    of(data: Data(string.utf8.map { $0 }))
  }
}
