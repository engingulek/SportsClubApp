//
//  ExtensionCoachDetail.swift
//  SportsClubApp
//
//  Created by engin gülek on 20.01.2023.
//

import SwiftUI

extension CoachDetailView {
    var viewDetail : some View {
        VStack(spacing:5) {
            ZStack(alignment : .bottomTrailing) {
                
                Image("coach")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.screenHeight / 4)
                    .clipShape(Circle())
                
                Image(systemName: "heart")
                    .foregroundColor(.red)
                    .clipShape(Circle())
                    .onTapGesture {
                        print("Remove Like Lisr")
                    }
            }
            
            Text("Amy Amanda")
            Text("Yoga")
            HStack {
                Image(systemName: "mappin")
                Text("NYC,USA")
            }.font(.system(size: 18,weight: .semibold))
            
            Divider()
                .frame(minHeight: 1)
                .background(.black)
                .padding(.horizontal)
                .padding(.vertical)
            HStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("3.5/5")
                }.frame(width: 80,height: 30)
                    .font(.system(size: 14))
               
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.orange)
                    Text("$50 per hours")
                }.frame(height: 30)
                    .font(.system(size: 14))
            }
            Divider()
                .frame(minHeight: 1)
                .background(.black)
                .padding(.horizontal)
                .padding(.vertical)
         
            
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five .")
                      .font(.system(size: 15,weight: .light))
                      .padding(.horizontal)
      
                  NavigationLink {
                      Text("Message Page")
                  } label: {
                      VStack{
                          Text("Click for send message")
                      }
                  }
                  .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                  .padding()
            
            VStack(spacing:15) {
                Text("Reviews")
                    .font(.system(size: 20,weight: .semibold))
                Button("Comment") {
                    commentViewState = true
                }
                .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                ForEach(0..<4) { _ in
                    CommentDesign()
                }
                
            }
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



extension CoachDetailView {
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


