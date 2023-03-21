//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 21/03/23.
//

import SwiftUI

struct MainView: View {
    @State private var charText: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                TextField("Search...", text: $charText).textFieldStyle(.roundedBorder)
                Button{
                    //action
                } label: {
                    Image(systemName: "paperplane.circle.fill").font(.title).rotationEffect(Angle(degrees: 45))
                }.buttonStyle(.borderless).tint(.blue)
            }
        }.padding(10)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
