//
// AlbumsItemResourceIdentifierMeta.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AlbumsItemResourceIdentifierMeta: Codable, Hashable {

    /** volume number */
    public var volumeNumber: Int
    /** track number */
    public var trackNumber: Int

    public init(volumeNumber: Int, trackNumber: Int) {
        self.volumeNumber = volumeNumber
        self.trackNumber = trackNumber
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case volumeNumber
        case trackNumber
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(volumeNumber, forKey: .volumeNumber)
        try container.encode(trackNumber, forKey: .trackNumber)
    }
}

