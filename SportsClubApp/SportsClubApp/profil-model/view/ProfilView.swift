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
    var profilePageList : [ProfilePageList] = [
        .init(id:0,title: "Like", subtitle: "See Like", view: AnyView(LikesPage())),
        .init(id:1,title: "Edit Profile", subtitle: "Change profile image and name surname",view: AnyView(EditPageView())),
        .init(id: 2, title: "Change Password", subtitle: "Change account password",
             view:AnyView(ChangePassword())),
        .init(id: 3, title: "Create Gym Club advert", subtitle: "Create an ad for your gym",view: AnyView(CreateGymClubsView())),
        .init(id: 4, title: "Create Coach advert", subtitle: "Create an ad for your education",
             view: AnyView(CreateCoachView())),
        .init(id: 5, title: "View Gym Club Ad", subtitle: "Update view gym club posting", view: AnyView(UpdateViewGymClub())),
        .init(id: 6, title: "View Coach Ad", subtitle: "Update view coach posting", view: AnyView(UpdateViewCoachAd()))
    
        
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
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
