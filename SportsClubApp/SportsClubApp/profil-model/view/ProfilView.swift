//
//  ProfilView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI
import Firebase
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
    
    @State private var changeNameSurnameState = false
    @State private var changeNameSurname  = ""
    @State private var showingAlert = false
    @ObservedObject var profilViewModel = ProfilViewModel()
    var profilePageList : [ProfilePageList] = [
        .init(id: 2, title: "Create Gym Club advert", subtitle: "Create an ad for your gym",view: AnyView(CreateGymClubsView())),
        .init(id: 4, title: "View Gym Club Ad", subtitle: "View gym club posting", view: AnyView(UpdateViewGymClub())),
    ]
    
  
    var body: some View {
        List {
                Text("Amanda Kate")
                        .font(.system(size: 18,weight: .semibold))
                        .padding(.horizontal)
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
            Text("Sing Out")
                .foregroundColor(.red)
                .onTapGesture {
                    let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
                }
        }.scrollContentBackground(.hidden)
            .navigationTitle("Profil")
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
           
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
