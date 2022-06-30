import XCTVaporTestCase

final class URLSessionTests: XCTVaporTestCase {
    func testExample() async throws {
        let url = appURL.appendingPathComponent("hello")
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        let decoded = String(data: data, encoding: .utf8)
        let httpURLResponse = response as? HTTPURLResponse
        XCTAssertEqual(decoded, "Hello, world!")
        XCTAssertEqual(httpURLResponse?.statusCode, 200)
    }
}
