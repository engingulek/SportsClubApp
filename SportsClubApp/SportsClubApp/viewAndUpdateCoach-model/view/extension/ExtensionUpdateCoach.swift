//
//  ExtensionUpdateCoach.swift
//  SportsClubApp
//
//  Created by engin gülek on 19.01.2023.
//


import SwiftUI
// MARK: -Partner
extension UpdateViewCoachAd {
    var buttons : some View {
        HStack {
            Button(updateState ? "View" : "Update") {
                updateState.toggle()
            }.foregroundColor(.blue)
            
            Button("Delete") {
                print("Delete Button run")
            }.foregroundColor(.red)
        }.padding(.horizontal)
    }
    
    
    var image : some View {
        ZStack(alignment: .bottomTrailing) {
            Image("coach")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.screenHeight / 5)
                .clipShape(Circle())
            updateState ? changeImageButton : nil
        }
    }
    
    var coachDescriptionTextField : some View {
        VStack {
            Text("\(updateState ? "Update" : "View") information about the gym club")
                .padding(.top)
                .font(.system(size: 20,weight: .bold))
            TextField("Gym Description", text: $coachDescription ,axis: .vertical)
                .font(.system(size: 15))
                .padding()
                .lineLimit(6, reservesSpace: true)
                .textFieldStyle(.plain)
                .border(.black)
                .padding()
                .disabled(updateState ? false : true)
                .onChange(of: coachDescription) { newValue in
                    limitDescriptionTextField(limit: textFieldDescriptionLimit, value: newValue)
                }
            updateState ?
            HStack {
                textFieldDescriptionLimitDecrase < textFieldDescriptionLimit ? nil : Text("Character Limit")
                    .foregroundColor(.red)
                Spacer()
                Text("\(textFieldDescriptionLimitDecrase)/\(textFieldDescriptionLimit)")
                    .foregroundColor(
                        textFieldDescriptionLimitDecrase < textFieldDescriptionLimit ? .black
                        : .red
                    )
            }.padding(.horizontal) : nil
            
        }
    }
}

// MARK : -When updateState is true
extension UpdateViewCoachAd {
    var changeImageButton : some View {
        Button("+") {
            print("Change Image")
        }
        .font(.system(size: 25))
        .padding(.horizontal,5)
        .background(.blue)
        .cornerRadius(10)
        .foregroundColor(.white)
        .padding()
    }
    
    var coachNameSurnameTextField : some View {
        VStack {
            TextField("Name", text: $coachNameSurname)
                .asTextField(textContentType: .name)
                .onChange(of: coachNameSurname) { newValue in
                    limitNameSurnmeTextField(limit: textFieldNameSurnameLimit, value: newValue)
                }
            
            HStack {
                textFieldNameSurnameLimitDecrase < textFieldNameSurnameLimit
                ? nil :
                Text("CharacterLimit")
                    .foregroundColor(.red)
                Spacer()
                Text("\(textFieldNameSurnameLimitDecrase)/\(textFieldNameSurnameLimit)")
                    .foregroundColor(
                        textFieldNameSurnameLimitDecrase < textFieldNameSurnameLimit ? .black :
                                .red
                    )
            }.padding(.horizontal)
        }
    }
    
    var coachTechTypePickerView : some View {
        Picker("Please choose a tech type",selection: $coachTechType){
            ForEach(coachTechTypeList, id: \.self) { techType in
                Text(techType.tech)
            }
        }.pickerStyle(.wheel)
            .padding(.horizontal)
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
                        Text("Monthly").tag(CoachPayPeriod.monthly)
                        Text("Weekly").tag(CoachPayPeriod.weekly)
                        Text("Hoursly").tag(CoachPayPeriod.hoursly)
                    }
            }
        }.padding(.horizontal)
    }
    
}


// MARK : -When updateState is false

extension UpdateViewCoachAd {
    var coachNameText : some View {
        Text("Coach Name")
            .padding([.horizontal,.vertical])
    }
    
    var coachTechTypeText : some View {
        Text(coachTechType.tech)
    }
    
    var payAndPeriodViewCoach : some View {
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

// MARK : - Function
extension UpdateViewCoachAd {
    func limitNameSurnmeTextField(limit:Int,value:String){
        if nameSurnameStatusCount < value.count {
            textFieldNameSurnameLimitDecrase += 1
        }else if value.count == 20 {
            nameSurnameStatusCount = value.count
        }else{
            textFieldNameSurnameLimitDecrase -= 1
        }
        if value.count > limit {
            coachNameSurname = String(value.prefix(limit))
            textFieldNameSurnameLimitDecrase = 20
        }
        nameSurnameStatusCount = value.count
    }
    
    func limitDescriptionTextField(limit:Int,value:String){
        if descriptionStatusCount < value.count {
            descriptionStatusCount = value.count
            textFieldDescriptionLimitDecrase += 1
        }else if value.count == 275 {
            descriptionStatusCount = value.count
        }else{
            descriptionStatusCount = value.count
            textFieldDescriptionLimitDecrase -= 1
        }
        if value.count > limit {
            coachDescription = String(value.prefix(limit))
            textFieldDescriptionLimitDecrase = 275
        }
        
    }
}
