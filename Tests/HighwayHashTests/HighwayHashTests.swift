import XCTest
@testable import HighwayHash

final class HighwayHashTests: XCTestCase {
  func testHighway() throws {
    let input = "battle of hastings"
    let output = HighwayHash.of(input)
    XCTAssertEqual(output, UInt64(10_502_827_635_072_092_050))
  }

  func testSip() throws {
    let input = "battle of hastings"
    let output = SipHash.of(input)
    XCTAssertEqual(output, UInt64(2_818_055_358_653_608_097))
  }
}
