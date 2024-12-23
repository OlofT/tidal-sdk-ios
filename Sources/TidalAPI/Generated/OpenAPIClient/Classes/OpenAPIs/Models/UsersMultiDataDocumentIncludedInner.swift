//
// UsersMultiDataDocumentIncludedInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum UsersMultiDataDocumentIncludedInner: Codable, JSONEncodable, Hashable {
    case typePlaylistsResource(PlaylistsResource)
    case typeUserEntitlementsResource(UserEntitlementsResource)
    case typeUserPublicProfilePicksResource(UserPublicProfilePicksResource)
    case typeUserPublicProfilesResource(UserPublicProfilesResource)
    case typeUserRecommendationsResource(UserRecommendationsResource)
    case typeUsersResource(UsersResource)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typePlaylistsResource(let value):
            try container.encode(value)
        case .typeUserEntitlementsResource(let value):
            try container.encode(value)
        case .typeUserPublicProfilePicksResource(let value):
            try container.encode(value)
        case .typeUserPublicProfilesResource(let value):
            try container.encode(value)
        case .typeUserRecommendationsResource(let value):
            try container.encode(value)
        case .typeUsersResource(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(PlaylistsResource.self) {
            self = .typePlaylistsResource(value)
        } else if let value = try? container.decode(UserEntitlementsResource.self) {
            self = .typeUserEntitlementsResource(value)
        } else if let value = try? container.decode(UserPublicProfilePicksResource.self) {
            self = .typeUserPublicProfilePicksResource(value)
        } else if let value = try? container.decode(UserPublicProfilesResource.self) {
            self = .typeUserPublicProfilesResource(value)
        } else if let value = try? container.decode(UserRecommendationsResource.self) {
            self = .typeUserRecommendationsResource(value)
        } else if let value = try? container.decode(UsersResource.self) {
            self = .typeUsersResource(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of UsersMultiDataDocumentIncludedInner"))
        }
    }
}

