//
//  MessageSuggestionChipsList.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct MessageSuggestionChipsList: View {
    var body: some View {
        HStack {
            MessageSuggestionChip(text: "Готов приступить к обучению")
        }
    }
}

struct MessageSuggestionChipsList_Previews: PreviewProvider {
    static var previews: some View {
        MessageSuggestionChipsList()
    }
}
