//
//  ChatRowView.swift
//  ChatMC
//
//  Created by Simone Boni on 28/05/24.
//

import SwiftUI

struct ChatRowView: View {
    
    let chat: Chat
    
    var body: some View {
        HStack (spacing: 20){
            Image ("img3")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    
                    
                    HStack {
                        Text(chat.person.name)
                            .bold()
                        Spacer ()
                        Text ((chat.messages.last?.date.descriptiveString() ?? ""))
                    }
                    HStack {
                        Text((chat.messages.last?.text
                              ?? ""))
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment:
                                    .top)
                            .frame (maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
                Circle()
                    .foregroundColor (chat.hasUnreadMessage ? .blue : .clear)
                    .frame (width: 18, height: 18)
                    .frame (maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame (height: 80)
    }
}
#Preview {
    ChatRowView(chat: Chat.sampleChat[0])
}
