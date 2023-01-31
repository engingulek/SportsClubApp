//
//  CoachAllView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct CoachAllView: View {
    @State private var searchText = ""
    @State private var selectedCategory = ""
    @ObservedObject var coachAllViewModel = CoachAllListViewModel()
    
  
    var body: some View {
        VStack {
            HStack {
              Image(systemName: "magnifyingglass")
                TextField("Search GYM Clubs", text: $searchText)
                    .onChange(of: searchText) { newValue in
                        if newValue != "" {
                            Task{
                                await coachAllViewModel.searchCoachAll(searchText: newValue)
                            }
                        }else{
                            Task {
                                await coachAllViewModel.coachAllService()
                            }
                        }
                        
                        
                    }
            } .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .frame(width: 300)
                .padding(.top)
               
            ScrollView {
                VStack {
                    ForEach(searchText == "" ? coachAllViewModel.coachs : coachAllViewModel.coachsSearch) { coach in
                        NavigationLink {
                          CoachDetailView(coach: coach)
                        } label: {
                            CoachListDesign(coach: coach)
                                .foregroundColor(.black)
                        }

                    }
                }.padding(.top)
            } .task {
                await coachAllViewModel.coachAllService()
            }
        }.navigationTitle("All Coach")
           
        
        
       
    }
}

struct CoachAllView_Previews: PreviewProvider {
    static var previews: some View {
        CoachAllView()
    }
}
