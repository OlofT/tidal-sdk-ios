//
// MultiDataRelationshipDoc.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Playlist owners relationship */
public struct MultiDataRelationshipDoc: Codable, Hashable {

    /** array of relationship resource linkages */
    public var data: [ResourceIdentifier]?
    public var links: Links?

    public init(data: [ResourceIdentifier]? = nil, links: Links? = nil) {
        self.data = data
        self.links = links
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case links
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(data, forKey: .data)
        try container.encodeIfPresent(links, forKey: .links)
    }
}

