//
//  CoachAllView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct CoachAllView: View {
    @State private var searchText = ""
    @State private var selectedCategoryIndex = 0
    private let categoryNameList = [
        Category(id: 0, categoryName: "All"),
        Category(id: 1, categoryName: "Yoga"),
        Category(id: 2, categoryName: "Swim"),
        Category(id: 3, categoryName: "Fitness"),
        Category(id: 4, categoryName: "Fitness"),
        Category(id: 5, categoryName: "Fitness")
    ]
    var body: some View {
        VStack {
            HStack {
              Image(systemName: "magnifyingglass")
                TextField("Search GYM Clubs", text: $searchText)
                    .onChange(of: searchText) { newValue in}
            } .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .frame(width: 300)
                .padding(.top)
               
            
            ScrollView(.horizontal,showsIndicators: false) {
                /*LazyHStack(spacing:20) {
                    ForEach(categoryNameList) { category in
                        if category.id == selectedCategoryIndex {
                            
                            CategoryDesign(categoryName: category.categoryName, backgroundColor: .black, forgroundColor: .white)
                                .onTapGesture {
                                    self.selectedCategoryIndex = category.id
                                }

                        }else{
                            CategoryDesign(categoryName: category.categoryName, backgroundColor: .white, forgroundColor: .black)
                                .onTapGesture {
                                    self.selectedCategoryIndex = category.id
                                }
                        }
                      
                        
                    }
                }.padding(.horizontal)
                    .padding(.top)*/
                 
            
            }.frame(maxHeight : UIScreen.screenHeight/9)
                .padding(.vertical)
            ScrollView {
       
                VStack {
                    ForEach(0..<5) { _ in
                        NavigationLink {
                            CoachDetailView()
                        } label: {
                            CoachListDesign()
                                .foregroundColor(.black)
                        }

                    }
                }.padding(.top)
            }
        }.navigationTitle("All Coach")
        
        
       
    }
}

struct CoachAllView_Previews: PreviewProvider {
    static var previews: some View {
        CoachAllView()
    }
}
