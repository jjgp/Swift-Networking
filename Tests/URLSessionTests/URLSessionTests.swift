import XCTVapor

final class URLSessionTests: XCTestCase {
    func testExample() throws {
        let app = Application(.testing)
        defer { app.shutdown() }

        app.get("hello") { _ in
            "Hello, world."
        }

        try app.start()
        guard let localAddress = app.http.server.shared.localAddress, let hostname = localAddress.hostname else {
            XCTFail("couldn't get port from \(app.http.server.shared.localAddress.debugDescription)")
            return
        }

        let expect = expectation(description: "hello")
        let url = URL(string: "http://127.0.0.1:8080/hello")!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { _, _, _ in
            expect.fulfill()
        }
        task.resume()

        wait(for: [expect], timeout: .infinity)
    }
}
