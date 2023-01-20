//
//  MessageHomePageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 20.01.2023.
//

import SwiftUI

struct MessageHomePageView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<5) { _ in
                    NavigationLink {
                        Text("Message Detail")
                    } label: {
                        incomingMessageHP
                            .foregroundColor(.black)
                    }
                }
            }.navigationTitle("Messages")
        }
    }

}

struct MessageHomePageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageHomePageView()
    }
}
