//
//  ExtensionClubViewDetail.swift
//  SportsClubApp
//
//  Created by engin gülek on 20.01.2023.
//

import SwiftUI

extension ClubDetailsView {
   var viewDetails : some View {
       
       VStack {
           GymImageAndNameInfo(gymClub: gymClub, locatinLength: locationLenght)
      
           Divider().frame(minHeight: 1)
               .background(.black)
           HStack(spacing:30) {
               ForEach(gymClub.gymSportInfo.map(GymClubInfoVM.init)) { info in
                   VStack(spacing:5) {
                       Image(systemName: info.imageName)
                           .font(.system(size: 25))
                       Text(info.name)
                           .font(.system(size: 15))
                   }
               }
           }.padding(.vertical,5)
           Divider().frame(minHeight: 1)
               .background(.black)
           
   
         
           Text(gymClub.destination)
                   .font(.system(size: 15,weight: .light))
   
               NavigationLink {
                   Text("Message Page")
               } label: {
                   VStack{
                       Text("$\(String(format: "%.0f", gymClub.payPeriod.pay!))/ \(gymClub.payPeriod.period!)")
                       Text("Click for send message")
                   }
               }
               .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
               .padding()
           
          
           
           
       }
           
   }
    
    var commentViewDesign : some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "multiply.circle.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.red)
                    
                    .onTapGesture {
                        commentViewState = false
                    }
            }.padding(.horizontal)
                .padding(.top)
            Text("Comment")
                .font(.system(size: 20,weight: .semibold))
            commentTextFieldView
            Button("Send") {
                print("Send comment")
                commentViewState = false
            }.buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                .padding(.bottom)
            
        }
        .frame(width: UIScreen.screenWidth / 1.2 , height: UIScreen.screenHeight / 2.5)
        .background(Color.white)
        .cornerRadius(15)
        
    }
    
    var commentTextFieldView : some View {
        
        VStack {
            
            TextField("Comment", text: $commentTextField,axis: .vertical)
                .font(.system(size: 15))
                .padding()
                .lineLimit(6, reservesSpace: true)
                .textFieldStyle(.plain)
                .border(.black)
                .padding()
             .onChange(of: commentTextField) { newValue in
                limitCommentTextField(limit: textFieldCommentLimit, value: newValue)
                
            }
            HStack {
                Spacer()
                Text("\(textFieldCommentDecrase)/275")
            }.padding(.horizontal)
            
        }
    }
}

// MARK: -Function
extension ClubDetailsView {
    func limitCommentTextField(limit: Int, value :String){
        if commentStatusCount < value.count {
            commentStatusCount = value.count
            textFieldCommentDecrase += 1
        }else if value.count == 275 {
            commentStatusCount = value.count
        }else {
            commentStatusCount = value.count
            textFieldCommentDecrase -= 1
        }
        if value.count > limit {
            commentTextField = String(value.prefix(limit))
            textFieldCommentDecrase = 275
        }
    }
}








