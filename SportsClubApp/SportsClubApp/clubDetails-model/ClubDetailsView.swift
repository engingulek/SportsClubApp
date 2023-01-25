//
//  ClubDetailsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI


struct ClubDetailsView: View {
    var gymClub : GymClubAllVM
    @State  var commentViewState  = false
    @State var commentTextField = ""
    
     @State var textFieldCommentLimit = 275
     
     @State var textFieldCommentDecrase = 0
     
     @State var commentStatusCount = 0
  
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                viewDetails
                    .padding(.horizontal)
                    .padding(.top,25)
            }.navigationTitle("Club Details")
                .navigationBarTitleDisplayMode(.inline)
            commentViewState ?
            LinearGradient(gradient:
                            Gradient(colors:
                                        [Color.black.opacity(0.2),
                                         Color.black.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            : nil
            commentViewState ? commentViewDesign : nil
        }
    }
}




