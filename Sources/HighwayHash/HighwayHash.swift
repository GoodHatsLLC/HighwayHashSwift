import Bridge
import Foundation

public struct HighwayHash: ~Copyable {

  public init(seed: Seed) {
    self.seed = seed
  }

  private let seed: Seed

  public consuming func hash(data: Data) -> UInt64 {
    let bytes = data.map { CChar($0) }
    let owned = consume self
    let seed = owned.seed
    return bytes.withUnsafeBufferPointer { pointer in
      let raw = seed.raw()
      return HighwayHash64(raw.pointer[0], pointer.baseAddress, raw.count)
    }
  }
}
