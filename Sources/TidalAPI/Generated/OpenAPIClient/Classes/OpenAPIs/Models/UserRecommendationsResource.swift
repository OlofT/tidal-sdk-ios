//
// UserRecommendationsResource.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserRecommendationsResource: Codable, Hashable {

    /** attributes object representing some of the resource's data */
    public var attributes: AnyCodable?
    public var relationships: UserRecommendationsRelationships?
    public var links: Links?
    /** resource unique identifier */
    public var id: String
    /** resource unique type */
    public var type: String

    public init(attributes: AnyCodable? = nil, relationships: UserRecommendationsRelationships? = nil, links: Links? = nil, id: String, type: String) {
        self.attributes = attributes
        self.relationships = relationships
        self.links = links
        self.id = id
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case attributes
        case relationships
        case links
        case id
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
    }
}
