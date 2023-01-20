//
//  File.swift
//  SportsClubApp
//
//  Created by engin gülek on 21.01.2023.
//

import SwiftUI

extension ChatView {
    var chatSend : some View {
        HStack {
            TextField("Message", text: $sendTextMessage)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Image(systemName: "paperplane.fill")
                .padding()
                .rotationEffect(Angle(degrees: 45))
                .background(Color.blue)
                .font(.system(size: 18))
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
    
    
    var sendMessageView : some View {
        HStack {
            Spacer()
            Text("The message I sent")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                
        }.padding(.horizontal)
            .padding(.vertical,2)
    }
    
    var getMessageView : some View {
        HStack(spacing: 5) {
            Image("profilImage")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: UIScreen.screenWidth/15,height:
                        UIScreen.screenHeight/15)
                .padding(.trailing)
            Text("message sent to me")
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(20)
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical,2)
    }
    
    
    var messageDate : some View {
        Text("12 May 18:22")
            .font(.system(size: 15))
            .foregroundColor(.gray)
    }
    

}
/**

 */
