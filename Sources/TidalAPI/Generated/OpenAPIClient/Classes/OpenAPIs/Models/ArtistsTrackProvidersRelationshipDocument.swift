//
// ArtistsTrackProvidersRelationshipDocument.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ArtistsTrackProvidersRelationshipDocument: Codable, Hashable {

    public var data: [[ArtistsTrackProvidersResourceIdentifier]]?
    public var links: Links?
    public var included: [ProvidersRelationshipDocumentIncludedInner]?

    public init(data: [[ArtistsTrackProvidersResourceIdentifier]]? = nil, links: Links? = nil, included: [ProvidersRelationshipDocumentIncludedInner]? = nil) {
        self.data = data
        self.links = links
        self.included = included
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case links
        case included
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(data, forKey: .data)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encodeIfPresent(included, forKey: .included)
    }
}

