//
//  ProfilView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI

struct ProfilePageList :Identifiable {
    static func == (lhs: ProfilePageList, rhs: ProfilePageList) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.subtitle == rhs.subtitle
      
    }
    let id :Int
    let title:String
    let subtitle:String
    let view: AnyView
}

struct ProfilView: View {
    @State private var presentAlert = false
    @State private var changeNameSurnameState = false
    @State private var changeNameSurname  = ""
    var profilePageList : [ProfilePageList] = [
        .init(id:1,title: "Like", subtitle: "See Like", view: AnyView(LikesPage())),
        
        
        .init(id: 2, title: "Create Gym Club advert", subtitle: "Create an ad for your gym",view: AnyView(CreateGymClubsView())),
        .init(id: 3, title: "Create Coach advert", subtitle: "Create an ad for your education",
             view: AnyView(CreateCoachView())),
        .init(id: 4, title: "View Gym Club Ad", subtitle: "Update view gym club posting", view: AnyView(UpdateViewGymClub())),
        .init(id: 5, title: "View Coach Ad", subtitle: "Update view coach posting", view: AnyView(UpdateViewCoachAd()))
    
        
    ]
    
  
    var body: some View {
        List {
                HStack {
                    Image("profilImage")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: UIScreen.screenWidth/8,height:
                                UIScreen.screenHeight/8)
                
                Text("Amanda Kate")
                        .font(.system(size: 18,weight: .semibold))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                        .onTapGesture {
                            presentAlert = true
                        }
                        .font(.system(size: 20))
                }
            
            ForEach(profilePageList) { page in
                NavigationLink {
                    page.view
                } label: {
                    VStack(alignment:.leading){
                        Text(page.title)
                            .foregroundColor(.black)
                        Text(page.subtitle)
                            .font(.system(size: 15))
                            .foregroundColor(.black.opacity(0.6))
                    }
                }
            }
            
            Text("Delete Profile")
                .foregroundColor(.blue)
            Text("Sing Out")
                .foregroundColor(.red)
        }.scrollContentBackground(.hidden)
            .navigationTitle("Profil")
            .alert("Change", isPresented: $presentAlert, actions: {
                    TextField("Amanda Kate", text: $changeNameSurname)
                  Button("Change Image", action: {})
                Button("Save", role: .destructive,action: {})
                }, message: {
                    Text("Message")
                  })
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
