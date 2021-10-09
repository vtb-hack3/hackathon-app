//
//  Message.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import Foundation

// State for usual bubble message with text
enum MessageBubbleViewState {
    case incoming // will be positioned on leading edge
    case outcoming // will be positioned on trailing edge
}

enum MessageType {
    case text // usual message with text in bubble
    case task // task message with question, variants of answers
    case answer // custom representation of text message with answer after task message 
}
