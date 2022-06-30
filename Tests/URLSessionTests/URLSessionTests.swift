import XCTVaporTestCase

final class URLSessionTests: XCTVaporTestCase {
    func testExample() async throws {
        let url = appURL.appendingPathComponent("hello")
        let request = URLRequest(url: url)
        let result = try await URLSession.shared.data(for: request)
        print(result)
    }
}
