//
//  ChatView.swift
//  SportsClubApp
//
//  Created by engin gülek on 21.01.2023.
//

import SwiftUI

struct ChatView: View {
    @State var sendTextMessage = ""
    
    var body: some View {
        VStack {
                ScrollView {
                        ForEach(0..<5,id: \.self) { _ in
                            messageDate
                            sendMessageView
                            getMessageView
                            messageDate
                            sendMessageView
                            getMessageView
                        }
            }
            Spacer()
            chatSend
        }.padding([.vertical,.horizontal])
            .navigationTitle("Jack Dali")
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
