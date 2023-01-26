//
//  NearByGymClubsListView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct GymClubAllListView: View {
    @State private var searchText = ""
    @State private var selectedgymClubInfo = "all"
    @ObservedObject var gymClubAllViewModel = GymClubAllViewModel()
    @ObservedObject var gymClubInfoViewModel = GymClubInfoViewModel()
    @State private var searchState = false
    @State private var searchValue = ""

   
    var body: some View {
  
        ScrollView {
           
            
            HStack {
              Image(systemName: "magnifyingglass")
                TextField("Search GYM Clubs", text: $searchText)
                    .onChange(of: searchText) { newValue in
         
                        if newValue != ""{
                            self.searchState = true
                            Task {
                                await gymClubAllViewModel.searchGymClubAll(searchText: newValue )
                            }
                        }else{
                            self.searchState = false
                        }
                            
                          
                        
                        
                       
                    }
            } .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .frame(width: 300)
                .padding()
            
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack(spacing:20) {
                    ForEach(gymClubInfoViewModel.gymClubInfos) { gymClubInfo in
                        
                        if gymClubInfo.imageName == selectedgymClubInfo {
                            
                           CategoryDesign(name: gymClubInfo.name, backgroundColor: .black, forgroundColor: .white)
                               .onTapGesture {
                                   self.selectedgymClubInfo = gymClubInfo.imageName
                               }

                        }else{
                            CategoryDesign(name: gymClubInfo.name, backgroundColor: .white, forgroundColor: .black)
                                .onTapGesture {
                                    self.selectedgymClubInfo = gymClubInfo.imageName
                                }
                        }
                    }
                }.padding(.horizontal)
                    .padding(.top)
                    .task {
                        await gymClubInfoViewModel.gymClubInfosService()
                    }
            }
            
            searchState ?   nil :
            VStack(spacing: 20) {
                ForEach(gymClubAllViewModel.gymClubs) { gymClub in
                    NavigationLink {
                        ClubDetailsView(gymClub: gymClub)
                    } label: {
                        NearByGymClubListDesign(gymClub: gymClub)
                            .foregroundColor(.black)
                    }
                }
            }.padding(.top)
                .task {
                  await  self.gymClubAllViewModel.getGymClubAll()
                }
            
            searchState ?VStack(spacing: 20) {
                ForEach(gymClubAllViewModel.gymClubsSearch) { gymClub in
                    NavigationLink {
                        ClubDetailsView(gymClub: gymClub)
                    } label: {
                        NearByGymClubListDesign(gymClub: gymClub)
                            .foregroundColor(.black)
                    }
                }
            }.padding(.top) : nil
        
               
        }.navigationTitle("All GYM")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NearByGymClubsListView_Previews: PreviewProvider {
    static var previews: some View {
        GymClubAllListView()
    }
}
