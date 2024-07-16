//
//  InfoView.swift
//  JoseCard
//
//  Created by Jose Manuel Malagón Alba on 16/7/24.
//

import SwiftUI

struct InfoView: View {
    
    let imageName: String
    let infoTextString: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                Text(infoTextString)
                    .foregroundStyle(Color("InfoColor"))
            })
            .padding(.all)
    }
}


#Preview {
    InfoView(imageName: "phone.fill",
             infoTextString: "+34 680 532 032")
    .previewLayout(.sizeThatFits)
}
