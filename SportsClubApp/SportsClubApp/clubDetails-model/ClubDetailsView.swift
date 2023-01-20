//
//  ClubDetailsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI


struct ClubDetailsView: View {
    @State  var commentViewState  = false
    @State var commentTextField = ""
    
     @State var textFieldCommentLimit = 275
     
     @State var textFieldCommentDecrase = 0
     
     @State var commentStatusCount = 0
    var gymSportInfo = [
        GYMSportInfo(imageName: "takeoutbag.and.cup.and.straw", name: "Drink"),
        GYMSportInfo(imageName: "figure.yoga", name: "Yoga"),
        GYMSportInfo(imageName: "basket", name: "Spor Shop"),
        
    ]
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



struct ClubDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailsView()
    }
}
