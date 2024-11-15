//
// PlaylistsRelationships.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** relationships object describing relationships between the resource and other resources */
public struct PlaylistsRelationships: Codable, Hashable {

    public var items: MultiDataRelationshipDoc
    public var owners: MultiDataRelationshipDoc

    public init(items: MultiDataRelationshipDoc, owners: MultiDataRelationshipDoc) {
        self.items = items
        self.owners = owners
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case items
        case owners
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
        try container.encode(owners, forKey: .owners)
    }
}

