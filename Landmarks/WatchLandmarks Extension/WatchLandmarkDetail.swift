//
//  WatchLandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by Никита Попов on 24.07.2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
         ScrollView {
                     VStack {
                         CircleImage(image: self.landmark.image.resizable())
                             .scaledToFill()
                         
                         Text(self.landmark.name)
                             .font(.headline)
                             .lineLimit(0)
                         
                         Toggle(isOn:
                         $userData.landmarks[self.landmarkIndex].isFavorite) {
                             Text("Favorite")
                         }
                         
                         Divider()
                         
                         Text(self.landmark.park)
                             .font(.caption)
                             .bold()
                             .lineLimit(0)
                         
                         Text(self.landmark.state)
                             .font(.caption)
                        
                        Divider()
                                       
                                       WatchMapView(landmark: self.landmark)
                                           .scaledToFit()
                                           .padding()
                     }
            .padding(16)
                 }
        .navigationBarTitle("Landmarks")
             }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
         return Group {
                   WatchLandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
                       .previewDevice("Apple Watch Series 4 - 44mm")
                   
                   WatchLandmarkDetail(landmark: userData.landmarks[1]).environmentObject(userData)
                       .previewDevice("Apple Watch Series 2 - 38mm")
                    WatchLandmarkDetail(landmark: userData.landmarks[3]).environmentObject(userData)
                                  .previewDevice("Apple Watch Series 3 - 42mm")
               }
    }
}
