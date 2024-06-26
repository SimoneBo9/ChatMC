//
//  ChatsViewModel.swift
//  ChatMC
//
//  Created by Simone Boni on 28/05/24.
//

import SwiftUI

class ChatsViewModel: ObservableObject {
    @Published var chats = Chat.sampleChat
    
    
    func getSortedFilteredChats(query: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let datel = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return datel > date2
        }
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    
    func getSectionMessages (for chat: Chat) -> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.messages {
            if let firstMessage = tmp.first {
                let daysBetween = firstMessage.date.daysBetween(date: message.date)
                if daysBetween >= 1 {
                    res.append (tmp) 
                    tmp.removeAll()
                    tmp.append (message)
                }
                else {
                    tmp.append (message)
                } 
            } else {
                tmp.append (message)
            }
        }
            res.append (tmp)
            return res
    }
    
    
    
    func markAsUnread(_ newValue: Bool, chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
    
    
    func sendMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: {$0.id == chat.id}) {
            let message = Message (text, type: .Sent)
            chats[index].messages.append (message)
            return message
        }
        return nil
    }
}
