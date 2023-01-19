//
//  UpdateViewCoachAd.swift
//  SportsClubApp
//
//  Created by engin gülek on 15.01.2023.
//

import SwiftUI

struct UpdateViewCoachAd: View {
    @State var updateState = false
    @State var coachNameSurname : String = ""
    @State var coachDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five"
    @State var textFieldNameSurnameLimit = 20
    @State var textFieldDescriptionLimit = 275
    @State var textFieldNameSurnameLimitDecrase = 0
    @State var textFieldDescriptionLimitDecrase = 275
    @State var nameSurnameStatusCount = 0
    @State var descriptionStatusCount = 275
    @State var coachTechType = CoachTechType(imageName: "figure.pool.swim", tech: "Swim")
    var  coachTechTypeList : [CoachTechType] = [
        .init(imageName: "figure.yoga", tech: "Yoga"),
        .init(imageName: "figure.pool.swim", tech: "Swim"),
        .init(imageName: "figure.boxing", tech: "Boxing"),
        .init(imageName: "figure.climbing", tech: "Climbing"),
        .init(imageName: "figure.kickboxing", tech: "Kickboxing"),
        .init(imageName: "figure.pilates", tech: "Pilates")
    
    ]
    @State var pay : String = "$50"
    @State var selectedPayPerion : String = "Hours"
    
    
    var body: some View {
        ScrollView {
            VStack {
                buttons
                image
                updateState ? VStack {
                    coachNameSurnameTextField
                    coachTechTypePickerView
                    updatePayView
                } : nil
                updateState == false ?   VStack {
                    coachNameText
                    coachTechTypeText
                    payAndPeriodViewCoach 
                }: nil
                coachDescriptionTextField
                updateState ?
                Button("Save") {
                    
                }
                .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                .padding(.vertical) : nil
                
            }
        }.navigationTitle(updateState ? "Upcate Coach Ad" : "View Coaach Ad")
           
    }
}

struct UpdateViewCoachAd_Previews: PreviewProvider {
    static var previews: some View {
        UpdateViewCoachAd()
    }
}
