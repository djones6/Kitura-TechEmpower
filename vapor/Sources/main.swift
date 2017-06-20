import Vapor
import HTTP

let drop = try Droplet()
drop.log.enabled = [.error, .fatal]

// TechEmpower test 6: plaintext
drop.get("plaintext") { request in
    var response = Response(status: .ok, body: "Hello, World!")
    response.headers["Server"] = "Vapor"
    response.headers["Content-Type"] = "text/plain"
    return response
}

// TechEmpower test 1: JSON serialization
drop.get("json") { request in
    let json = try JSON(node: [
            "message":"Hello, World!"
        ])
    var response = try Response(status: .ok, json: json)
    response.headers["Server"] = "Vapor"
    return response
}

try drop.run()
