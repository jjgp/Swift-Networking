@_exported import XCTVapor

open class XCTVaporTestCase: XCTVaporTests {
    open var appURL: URL!

    override open class func setUp() {
        super.setUp()
        XCTVapor.app = {
            let app = Application(.testing)

            // TODO: replace with configure call
            app.get("hello") { _ in
                "Hello, world."
            }

            try app.start()

            return app
        }
    }

    override open func setUp() {
        super.setUp()

        guard let localAddress = app.http.server.shared.localAddress,
              let hostname = localAddress.hostname,
              let port = localAddress.port
        else {
            return
        }

        appURL = URL(string: "http://\(hostname):\(port)")
    }
}
