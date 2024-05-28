import Foundation

public protocol GenericMediaPlayer: AnyObject {
	// swiftlint:disable identifier_name
	var shouldVerifyItWasPlayingBeforeInterruption: Bool { get }
	var shouldSwitchStateOnSkipToNext: Bool { get }
	// swiftlint:enable identifier_name

	init(cachePath: URL, featureFlagProvider: FeatureFlagProvider)

	func canPlay(
		productType: ProductType,
		codec: AudioCodec?,
		mediaType: String?,
		isOfflined: Bool
	) -> Bool

	func load(
		_ url: URL,
		cacheKey: String?,
		loudnessNormalizationConfiguration: LoudnessNormalizationConfiguration,
		and licenseLoader: LicenseLoader?
	) async -> Asset

	func loadLive(
		_ url: URL,
		with licenseLoader: LicenseLoader?
	) async -> Asset

	func loadUC(
		_ url: URL,
		loudnessNormalizationConfiguration: LoudnessNormalizationConfiguration,
		headers: [String: String]
	) async -> Asset

	func unload(asset: Asset)

	func play()
	func pause()
	func seek(to time: Double)

	func updateVolume(loudnessNormalizer: LoudnessNormalizer?)

	func addMonitoringDelegate(monitoringDelegate: PlayerMonitoringDelegate)

	func reset()
}
