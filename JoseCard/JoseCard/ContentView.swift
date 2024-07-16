//
//  ContentView.swift
//  JoseCard
//
//  Created by Jose Manuel Malagón Alba on 16/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0, green: 124/255, blue: 237/255)
                .ignoresSafeArea(.all)
            VStack {
                Image("jose")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.white), lineWidth: 5))
                Text("Jose Manuel Malagón")
                    .font(Font.custom("Pacifico-Regular", size: 28))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Divider()
                InfoView(imageName: "phone.fill",
                         infoTextString: "+34 680 532 032")
                InfoView(imageName: "envelope.fill",
                         infoTextString: "contact@josemalagon.es")
            }
        }
    }
}

#Preview {
    ContentView()
}
