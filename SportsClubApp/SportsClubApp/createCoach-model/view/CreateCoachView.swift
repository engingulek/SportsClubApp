//
//  CreateCoachView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI

struct CreateCoachView: View {
    @State var coachNameSurname : String = ""
    @State var coachDescription : String = ""
    @State var textFieldNameSurnameLimit = 20
    @State var textFieldDescriptionLimit = 275
    @State var textFieldNameSurnameLimitDecrase = 0
    @State var textFieldDescriptionLimitDecrase = 0
    @State var nameSurnameStatusCount = 0
    @State var descriptionStatusCount = 0
    @State var pay:String = ""
    @State var selectedPayPeriod:CoachPayPeriod = .hoursly
    @State var coachTechType : CoachTechType?
    var  coachTechTypeList : [CoachTechType] = [
        .init(imageName: "figure.yoga", tech: "Yoga"),
        .init(imageName: "figure.pool.swim", tech: "Swim"),
        .init(imageName: "figure.boxing", tech: "Boxing"),
        .init(imageName: "figure.climbing", tech: "Climbing"),
        .init(imageName: "figure.kickboxing", tech: "Kickboxing"),
        .init(imageName: "figure.pilates", tech: "Pilates")
    
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                selectImage
                coachNameSurnameTextField
                coachTechTypePickerView
                // city country
                /// city country default api get
                
                descriptionTextField
                payPeriod
                saveButton
                
            }
        }
    }
}

struct CreateCoachView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCoachView()
    }
}
