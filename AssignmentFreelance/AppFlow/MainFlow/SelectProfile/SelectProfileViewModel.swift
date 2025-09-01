//
//  SelectProfileViewModel.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 31/08/25.
//

import SwiftUI

class SelectProfileViewModel: ObservableObject {
    
    @Published var profiles: [Profile] = [
        Profile(
            id: 0,
            image:"image1", name:"Annie Watson",
            age:27, offset: 0),
        Profile(
            id: 0,
            image:"image2", name:"Leena le",
            age:45, offset: 0),
        Profile(
            id: 0,
            image:"image3", name:"Salma Hayek",
            age:53, offset: 0),
        Profile(
            id: 0,
            image:"image3", name:"Anjelina Jolie",
            age:50, offset: 0),

        ]
    
    func getIndex(profile: Profile) -> Int{
        return profiles.firstIndex { profileData in
            profileData.id == profile.id
        } ?? 0
    }
    
    
}


struct Profile: Identifiable{
    var id: Int
    var image: String
    var name: String
    var age : Int
    var offset: CGFloat
}



