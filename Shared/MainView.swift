//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 21/03/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    @State private var charText: String = ""
    
    let openAI = OpenAISwift(authToken: "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")
    
    @State private var answers: [String] = []
    
    private var isFormValid: Bool {
        !charText.isEmptyOrWhiteSpace
    }
    
    private func performSearch() {
        openAI.sendCompletion(with: charText, maxTokens: 500) { result in
            switch result {
            case .success(let success):
                let answer = success.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                answers.append(answer)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    var body: some View {
        VStack{
            List(answers, id: \.self) { answer in
                Text(answer)
            }
            Spacer()
            HStack{
                TextField("Search...", text: $charText).textFieldStyle(.roundedBorder)
                Button{
                    //action
                    performSearch()
                } label: {
                    Image(systemName: "paperplane.circle.fill").font(.title).rotationEffect(Angle(degrees: 45))
                }.buttonStyle(.borderless).tint(.blue).disabled(!isFormValid)
            }
        }.padding(10)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
