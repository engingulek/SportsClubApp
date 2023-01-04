//
//  ProfilView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI

struct ProfilePageList :Hashable,Identifiable {
    let id :Int
    let title:String
    let subtitle:String

}

struct ProfilView: View {
    var profilePageList : [ProfilePageList] = [
        .init(id:0,title: "Like", subtitle: "See Like"),
        .init(id:1,title: "Edit Profile", subtitle: "Change profile image and name surname"),
        .init(id: 2, title: "Change Password", subtitle: "Change account password"),
        .init(id: 3, title: "Create Gym Clubs", subtitle: "Create a Gym Club advert"),
        .init(id: 4, title: "Create Coach", subtitle: "Create a Coach advert"),
        
    ]
    
    var viewList : [AnyView] = [
        AnyView(LikesPage()),
        AnyView( EditPageView()),
        AnyView(ChangePassword()),
        AnyView(CreateGymClubsView()),
        AnyView(CreateCoachView()),
       
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
                        viewList[page.id]
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

            
            
            
            /*NavigationLink {
                Text("Likes Page")
            } label: {
                VStack(alignment:.leading){
                    Text("Likes")
                        .foregroundColor(.black)
                    Text("See Likes")
                        .font(.system(size: 15))
                        .foregroundColor(.black.opacity(0.6))
                }
            }
            
            NavigationLink {
                Text("Likes Page")
            } label: {
                Text("Edit Profile")
                    
            }*/
           
            
          
            
        }.scrollContentBackground(.hidden)
            .navigationTitle("Profil")
           
        /*VStack{
            
            HStack {
                
            }
             
            List {
                Text("dsa")
            }.scrollContentBackground(.hidden)
            /*VStack {
                
                
              
                
                NavigationLink {
                    Text("Likes Page")
                } label: {
                    Text("Change Password")
                }
                Spacer()
                
               
                NavigationLink {
                    Text("Likes Page")
                } label: {
                    Text("Delete Profile")
                }
                NavigationLink {
                    Text("Likes Page")
                } label: {
                    Text("Sing Out")
                }
               
            } .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                .padding()*/
            
            Spacer()
        }.navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)*/
          
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
