import Common
import Foundation

// MARK: - HTTPService

protocol HTTPService {
	func executeRequest<T: Decodable>(_ request: URLRequest, logServerError: ((Error) -> Void)?) async throws -> T
	func request(url: String, path: String, httpMethod: HTTPMethod, contentType: String, queryItems: [URLQueryItem])
		-> URLRequest?
}

extension HTTPService {
	func request(
		url: String,
		path: String,
		httpMethod: HTTPMethod = .post,
		contentType: String = "application/x-www-form-urlencoded",
		queryItems: [URLQueryItem]
	) -> URLRequest? {
		var urlComponents = URLComponents(string: url)
		urlComponents?.path = path
		urlComponents?.queryItems = queryItems
		guard let url = urlComponents?.url else {
			return nil
		}

		var request = URLRequest(url: url)
		request.httpMethod = httpMethod.rawValue
		request.setValue(contentType, forHTTPHeaderField: "Content-Type")
		request.httpBody = urlComponents?.query?.data(using: .utf8)
		
		return request
	}

	func executeRequest<T: Decodable>(_ request: URLRequest, logServerError: ((Error) -> Void)?) async throws -> T {
		// Send the request asynchronously
		let (data, response) = try await URLSession.shared.data(for: request)

		// Check the response status code
		guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
			let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data)
			let statusCode = errorResponse?.status ?? (response as? HTTPURLResponse)?.statusCode ?? 1
			let errorMessage = "Error response: \(String(describing: errorResponse)), status code: \(statusCode), request: \(request)"
			let error = NetworkError(code: "\(statusCode)", subStatus: errorResponse?.subStatus, message: errorMessage)
			logServerError?(error)
			throw error
		}

		return try JSONDecoder().decode(T.self, from: data)
	}
	
	func executeRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
		try await executeRequest(request, logServerError: nil)
	}
}
