//
//  ExtensionUpdateViewGymClub.swift
//  SportsClubApp
//
//  Created by engin gülek on 15.01.2023.
//

import SwiftUI
import Kingfisher

extension UpdateViewGymClub {
    var gymClubImage : some View {
        KFImage(URL(string: profilViewModel.userGymClub[0].imageUrl))
            .resizable()
            .scaledToFill()
            .cornerRadius(15)
            .frame(height: UIScreen.screenHeight / 4)
            .padding([.horizontal,.all])
    }
    
    var gymNameText : some View {
        Text(profilViewModel.userGymClub[0].name)
            .font(.system(size: 20,weight: .bold))
    }
    var cityAndCountryText : some View {
        
        HStack(alignment:.center) {
            Text(profilViewModel.userGymClub[0].location.city!)
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .padding()
                .multilineTextAlignment(.center)
            
            
            Text(profilViewModel.userGymClub[0].location.state!)
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .padding()
        }
        .foregroundColor(.white)
    }
    
    var gymClubInfosView: some View {
        
  
            ForEach (profilViewModel.userGymClub[0].gymSportInfo , id:  \.self) { sportInfo in
                    HStack{
                        Image(systemName: sportInfo.imageName)
                            .font(.system(size: 25))
                        Text(sportInfo.name)
                            .font(.system(size: 25))
                    }
            }.padding(.vertical)
    }
    
    var openAndCloseTime : some View {
        VStack {
            HStack {
                Text("Open Time")
                    .fontWeight(.semibold)
                Text(profilViewModel.userGymClub[0].startClock)
            }
            HStack {
                Text("Close Time")
                    .fontWeight(.semibold)
                Text(profilViewModel.userGymClub[0].startClock)
            }
        }.font(.system(size: 18))
    }
    
    var payAndPeriodView : some View {
        HStack {
            Text(String(profilViewModel.userGymClub[0].payPeriod.pay!))
            Spacer()
            Text(profilViewModel.userGymClub[0].payPeriod.period!)
        } .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(15)
            .padding(.horizontal)
    }
    
    
    
    
    
    var gymClubDescriptionTextField : some View {
        VStack {
            Text(" Information about the gym club")
                .padding(.top)
                .font(.system(size: 20,weight: .bold))
            TextField("Gym Description", text: $gymClubDescription ,axis: .vertical)
                .font(.system(size: 15))
                .padding()
                .lineLimit(6, reservesSpace: true)
                .textFieldStyle(.plain)
                .border(.black)
                .padding()
                .disabled(true)
            
        }
    }
    
}

// MARK: -Functions
extension UpdateViewGymClub {
    func limitGymNameTextField(_ limit : Int, _ value : String) {
       /* textFieldGymClubNameLimitDecrase = textFieldGymClubNameLimitDecrase + 1
        print(textFieldGymClubNameLimitDecrase)*/
        print("On Change \(value)")
        
        if gymNameStatusCount < value.count{
            gymNameStatusCount = value.count
            textFieldGymClubNameLimitDecrase += 1
        }else if value.count == 20 {
            gymNameStatusCount = value.count
        }
        else{
            gymNameStatusCount = value.count
            textFieldGymClubNameLimitDecrase -= 1
        }
        if value.count > limit {
            changeGymName = String(value.prefix(limit))
            textFieldGymClubNameLimitDecrase = 20
        }
    }
    
    func limitGymDescriptionTextField(limit: Int, value :String){
        if gymDescriptionStatusCount < value.count {
            gymDescriptionStatusCount = value.count
            textFieldDescriptionDecrase += 1
        }else if value.count == 275 {
            gymDescriptionStatusCount = value.count
        }else {
            gymDescriptionStatusCount = value.count
            textFieldDescriptionDecrase -= 1
        }
        if value.count > limit {
            gymClubDescription = String(value.prefix(limit))
            textFieldDescriptionDecrase = 275
        }
    }
}


