import Alamofire
import XCTVaporTestCase

final class AlamofireTests: XCTVaporTestCase {
    func testGETHello() async throws {
        let expect = expectation(description: "should GET /hello")
        let url = appURL.appendingPathComponent("hello")

        AF.request(url).response { response in
            let decoded = response.data.map { String(data: $0, encoding: .utf8) }
            XCTAssertEqual(response.response?.statusCode, 200)
            XCTAssertEqual(decoded, "Hello, world!")
            expect.fulfill()
        }

        wait(for: [expect], timeout: 1)
    }
}
