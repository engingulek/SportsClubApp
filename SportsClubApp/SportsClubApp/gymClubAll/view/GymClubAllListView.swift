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
    @State private var filterState = false
    @State private var test = [GymClubAllVM]()

   
    var body: some View {
  
        ScrollView {
            HStack {
              Image(systemName: "magnifyingglass")
                TextField("Search GYM Clubs", text: $searchText)
                    .onChange(of: searchText) { newValue in
                        self.selectedgymClubInfo = "all"
                        if newValue != ""{
                            self.searchState = true
                            self.filterState = false
                            self.selectedgymClubInfo = "all"
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
                                    
                                    print("Selected Test \(gymClubInfo.name)")
                                    self.selectedgymClubInfo = gymClubInfo.imageName
                                    self.searchState = false
                                    
                                    self.searchText = ""
                                    if selectedgymClubInfo == "all" {
                                        self.filterState = false
                                    }else{
                                        self.filterState = true
                                    }
                                        Task{
                                           
                                            await self.gymClubAllViewModel.filterGymClubAll(filterGymClubInfo: gymClubInfo)
                                    }
                                }
                        }
                    }
                }.padding(.horizontal)
                    .padding(.top)
                    .task {
                        await gymClubInfoViewModel.gymClubInfosService()
                    }
            }
            searchState || filterState ?
            VStack(spacing: 20) {
                ForEach(searchState ? gymClubAllViewModel.gymClubsSearch : gymClubAllViewModel.gymClubsFilter) { gymClub in
                    NavigationLink {
                        ClubDetailsView(gymClub: gymClub)
                    } label: {
                        NearByGymClubListDesign(gymClub: gymClub)
                        .foregroundColor(.black)
                    }
                }
            }.padding(.top).task {}
            :
            VStack(spacing: 20) {
                ForEach(gymClubAllViewModel.gymClubs) { gymClub in
                    NavigationLink {
                        ClubDetailsView(gymClub: gymClub)
                    } label: {
                        NearByGymClubListDesign(gymClub: gymClub)
                        .foregroundColor(.black)
                    }
                }
            }.padding(.top).task {await  self.gymClubAllViewModel.getGymClubAll()}
        }.navigationTitle("All GYM")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NearByGymClubsListView_Previews: PreviewProvider {
    static var previews: some View {
        GymClubAllListView()
    }
}
/****
 
 VStack(spacing: 20) {
     ForEach(test) { gymClub in
         NavigationLink {
             ClubDetailsView(gymClub: gymClub)
         } label: {
             NearByGymClubListDesign(gymClub: gymClub)
                 .foregroundColor(.black)
         }
     }
 }.padding(.top)
 
 
 
 */
