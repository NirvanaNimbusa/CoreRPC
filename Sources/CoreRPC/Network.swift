import Foundation
import PromiseKit

public extension CoreRPC {

    func getNetworkInfo() -> Promise<NetworkInfo> {
        return call(method: .getnetworkinfo, params: Empty())
    }
    
    struct Network: Decodable {

        public enum Name: String, Decodable {
            case ipv4
            case ipv6
            case onion
        }

        public let limited: Bool
        public let name: Name
        public let proxy: String
        public let proxy_randomize_credentials: Bool
        public let reachable: Bool
    }
    
    struct NetworkAddress: Decodable {
        public let address: String
        public let port: Int
        public let score: Int
    }
    
    struct NetworkInfo: Decodable {
        public let connections: Int
        public let incrementalfee: Double
        public let localaddresses: [NetworkAddress]
        public let localrelay: Bool
        public let localservices: String
        public let networkactive: Bool
        public let networks: [Network]
        public let protocolversion: Int
        public let relayfee: Double
        public let subversion: String
        public let timeoffset: Int
        public let version: Int
        public let warnings: String
    }

    func getNodeAddresses(count: Int? = 1) -> Promise<[NodeAddress]> {
        return call(method: .getnodeaddresses, params: [count])
    }

    struct NodeAddress: Decodable {
        let address: String
        let port: Int
        let services: Int
        let time: Int
    }
}
