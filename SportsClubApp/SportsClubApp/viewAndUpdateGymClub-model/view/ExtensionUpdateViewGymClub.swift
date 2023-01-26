//
//  ExtensionUpdateViewGymClub.swift
//  SportsClubApp
//
//  Created by engin gülek on 15.01.2023.
//

import SwiftUI

//MARK : -When updateState is false
extension UpdateViewGymClub {
    var gymClubImage : some View {
        Image("gymClubsOne")
            .resizable()
            .scaledToFill()
            .cornerRadius(15)
            .frame(height: UIScreen.screenHeight / 4)
            .padding([.horizontal,.all])
    }
    
    var gymNameText : some View {
        Text("LifeTime Gym")
            .font(.system(size: 20,weight: .bold))
    }
    var cityAndCountryText : some View {
        
        HStack(alignment:.center) {
            Text("New York")
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .padding()
                .multilineTextAlignment(.center)
            
            
            Text("United States")
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .padding()
        }
        .foregroundColor(.white)
    }
    
    var openAndCloseTime : some View {
        VStack {
            HStack {
                Text("Open Time")
                    .fontWeight(.semibold)
                Text("\(getOpenTime)")
            }
            HStack {
                Text("Close Time")
                    .fontWeight(.semibold)
                Text("\(getCloseTime)")
            }
        }.font(.system(size: 18))
    }
    
    var payAndPeriodView : some View {
        HStack {
            Text(pay)
            Spacer()
            Text(selectedPayPerion)
        } .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(15)
            .padding(.horizontal)
    }
    
}


//MARK : -When updateState is true

extension UpdateViewGymClub {
    
    var changeImageButton : some View {
        Button("Change Image") {
            print("Change Image Action")
        }.buttonStyle(StartPageButtonStyle(foregroundColor: .black, backgroundColor: .white))
            .padding(.bottom)
    }
    
    var changeGymNameTextField  : some View {
        VStack {
            TextField("Gym Name", text: $changeGymName)
                .asTextField(textContentType: .name)
                .onChange(of: changeGymName) { newValue in
                    limitGymNameTextField(textFieldGymClubNameLimit, newValue)
                }
            HStack {
                textFieldGymClubNameLimitDecrase < textFieldGymClubNameLimit ? nil : Text("Character Limit")
                    .foregroundColor(.red)
                Spacer()
                Text("\(textFieldGymClubNameLimitDecrase)/\(textFieldGymClubNameLimit)")
                     .foregroundColor(
                         textFieldGymClubNameLimitDecrase < textFieldGymClubNameLimit ? .black : .red
                     )
            }.padding(.horizontal)
        }
        
    }
    
    var changeOpenCloseTimeDatePicker : some View {
        VStack {
            DatePicker("Open Time",selection: $selectOpenTime,displayedComponents: .hourAndMinute)
            DatePicker("Close Time",selection: $selectCloseTime,displayedComponents: .hourAndMinute)
        }.padding([.vertical,.horizontal])
    }
    
    
    
    
    var addTypeGymClubListView : some View {
        VStack {
            Text("Selectable")
                .font(.system(size: 18,weight: .semibold))
            /*ForEach(addTypeGymClubList) { data in
                HStack {
                   // Text(data.name)
                       Spacer()
                    Button("Add") {
                        
                    }.foregroundColor(.blue)
                }
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal)
            }*/
        }.padding(.vertical)
    }
    
    
    var updatePayView : some View {
        VStack {
            Text("Update the price and period type")
            .padding(.top)
            .font(.system(size: 20,weight: .bold))
            HStack{
                TextField("Pay", text: $pay)
                    .padding([.vertical,.horizontal],10)
                    .keyboardType(.numberPad)
                    .border(Color.black.opacity(0.2))
                
                    Picker("Pay Period", selection: $selectedPayPerion) {
                        Text("Year").tag(Pay.year)
                        Text("Month").tag(Pay.month)
                        Text("Day").tag(Pay.day)
                    }
            }
        }.padding(.horizontal)
    }
    
    
  
    
}

// MARK: -Partner
extension UpdateViewGymClub {
    var getTypeGymClubListView : some View {
        VStack {
            Text("Your Selected")
                .font(.system(size: 18,weight: .semibold))
            /*ForEach(getTypeGymClubList) { data in
                HStack {
                   // Text(data.name)
                       Spacer()
                    updateState ?
                    Button("Remove") {
                        
                    }.foregroundColor(.red) : nil
                }
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal)
            }*/
        }.padding(.vertical)
    }
    
    
    var gymClubDescriptionTextField : some View {
        VStack {
            Text("\(updateState ? "Update" : "Give") information about the gym club")
                .padding(.top)
                .font(.system(size: 20,weight: .bold))
            TextField("Gym Description", text: $gymClubDescription ,axis: .vertical)
                .font(.system(size: 15))
                .padding()
                .lineLimit(6, reservesSpace: true)
                .textFieldStyle(.plain)
                .border(.black)
                .padding()
                .disabled(updateState ? false : true)
             .onChange(of: gymClubDescription) { newValue in
                limitGymDescriptionTextField(limit: textFieldGymDescriptionLimit, value: newValue)
                
            }
            updateState ?    HStack {
                textFieldDescriptionDecrase < textFieldGymDescriptionLimit ? nil : Text("Character Limit")
                    .foregroundColor(.red)
                Spacer()
                Text("\(textFieldDescriptionDecrase)/275")
                    .foregroundColor(
                        textFieldDescriptionDecrase < textFieldGymDescriptionLimit ? .black
                        : .red
                    )
            }.padding(.horizontal) : nil
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


