import Foundation
import Combine

final class WebSocketService: NSObject, ObservableObject, URLSessionWebSocketDelegate {
    private var webSocketTask: URLSessionWebSocketTask?

    @Published private(set) var messages: [IncomingMessage] = []
    @Published private(set) var isConnected: Bool = false

    // MARK: - Connection

    func connect() {
        let url = URL(string: "https://socket.vtb-hack.ru/")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.delegate = self
        webSocketTask?.receive(completionHandler: onReceive)
        webSocketTask?.resume()
    }

    func disconnect() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
        isConnected = false
    }

    // MARK: - Receiving

    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        webSocketTask?.receive(completionHandler: onReceive)
        if case .success(let message) = incoming {
            onMessage(message: message)
        }
        else if case .failure(let error) = incoming {
            print("Error", error)
        }
    }

    private func onMessage(message: URLSessionWebSocketTask.Message) {
        if case .string(let text) = message {
            guard let data = text.data(using: .utf8),
                    let message = try? JSONDecoder().decode(IncomingMessage.self, from: data)
            else {
                return
            }

            DispatchQueue.main.async {
                self.messages.append(message)
            }
        }
    }

    // MARK: - Sending

    func send(message: OutgoingMessage) {
        guard let json = try? JSONEncoder().encode(message),
            let jsonString = String(data: json, encoding: .utf8)
        else {
            return
        }

        webSocketTask?.send(.string(jsonString)) { error in
            if let error = error {
                print("Error sending message", error)
            }
        }
    }

    deinit {
        disconnect()
    }

    // MARK: - URLSessionTaskDelegate -

    func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didOpenWithProtocol protocol: String?
    ) {
        print("Did connect")
        isConnected = true
    }

    func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
        reason: Data?
    ) {
        print("Did disconnect")
        isConnected = false
    }
}
