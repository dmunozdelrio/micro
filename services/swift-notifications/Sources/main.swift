import Foundation
import Network

let port: NWEndpoint.Port = 3017
let listener = try NWListener(using: .tcp, on: port)

listener.newConnectionHandler = { connection in
    connection.start(queue: .main)
    connection.receive(minimumIncompleteLength: 1, maximumLength: 1024) { _, _, _, _ in
        let body = "Swift Notifications Service"
        let response = "HTTP/1.1 200 OK\r\nContent-Length: \(body.utf8.count)\r\n\r\n\(body)"
        connection.send(content: response.data(using: .utf8)) { _ in
            connection.cancel()
        }
    }
}

print("Swift Notifications Service running on port \(port)")
listener.start(queue: .main)
dispatchMain()
