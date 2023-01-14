//
//  ExtensionView.swift
//  SportsClubApp
//
//  Created by engin gülek on 14.01.2023.
//

import SwiftUI
enum CoachPayPeriod : String,CaseIterable,Identifiable {
    case hoursly,weekly,monthly
    var id:Self {self}
}

// MARK: -View
extension CreateCoachView {
    var selectImage : some View {
        Image("selectImageCircle")
            .resizable()
            .scaledToFit()
            .frame(height: UIScreen.screenHeight / 5)
            .clipShape(Circle())
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
    
    var payPeriod : some View {
        VStack {
            Text("Enter the price and period type")
            .padding(.top)
            .font(.system(size: 20,weight: .bold))
            HStack {
                TextField("Pay", text: $pay)
                    .padding([.vertical,.horizontal],10)
                    .keyboardType(.numberPad)
                    .border(Color.black.opacity(0.2))
                
                Picker("Pay Period", selection: $selectedPayPeriod) {
                   Text("Hoursly").tag(CoachPayPeriod.hoursly)
                    Text("Weekly").tag(CoachPayPeriod.weekly)
                    Text("Monthly").tag(CoachPayPeriod.monthly)
                }
            }
        }.padding(.horizontal)
    }
    
    var coachTechTypePickerView : some View {
        Picker("Please choose a tech type",selection: $coachTechType){
            ForEach(coachTechTypeList, id: \.self) { techType in
                Text(techType.tech)
            }
        }.pickerStyle(.wheel)
            .padding(.horizontal)
    }
    
    var descriptionTextField : some View {
        VStack {
            Text("Tell about yourself")
                .padding(.top)
                .font(.system(size: 20,weight: .bold))
            TextField("Your Description", text: $coachDescription,axis: .vertical)
                .padding()
                .lineLimit(6,reservesSpace: true)
                .textFieldStyle(.plain)
                .border(.black)
                .onChange(of: coachDescription) { newValue in
                    limitDescriptionTextField(limit: textFieldDescriptionLimit, value: newValue)
                }
            HStack {
                textFieldDescriptionLimitDecrase < textFieldDescriptionLimit ? nil : Text("Character Limit")
                    .foregroundColor(.red)
                Spacer()
                Text("\(textFieldDescriptionLimitDecrase)/\(textFieldDescriptionLimit)")
                    .foregroundColor(
                        textFieldDescriptionLimitDecrase < textFieldDescriptionLimit ? .black
                        : .red
                    )
            }
        }.padding(.horizontal)
    }
    
    var saveButton : some View {
        Button("Save") {
            
        }
        .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
        .padding(.vertical)
    }
      
    

}
// MARK: - Functions
extension CreateCoachView {
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
