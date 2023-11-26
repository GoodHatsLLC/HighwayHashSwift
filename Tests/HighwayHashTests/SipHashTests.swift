import XCTest
@testable import HighwayHash

final class SipHashTests: XCTestCase {

  func testDefaultSeed() throws {
    XCTAssertEqual(Seed.default, .init(a: 1, b: 0, c: 6, d: 6))
  }

  func testDefaultHash() throws {
    let input = "battle of hastings"
    let output = SipHash.default.of(input)
    XCTAssertEqual(output, UInt64(2_818_055_358_653_608_097))
  }
}
