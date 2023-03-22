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
    
    @EnvironmentObject private var model: Model
    
    private var isFormValid: Bool {
        !charText.isEmptyOrWhiteSpace
    }
    
    private func performSearch() {
        openAI.sendCompletion(with: charText, maxTokens: 500) { result in
            switch result {
            case .success(let success):
                let answer = success.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                let query = Query(question: charText, answer: answer)
                DispatchQueue.main.async {
                    model.queries.append(query)
                }
                
                do{
                    try model.saveQuery(query)
                } catch {
                    print(error.localizedDescription)
                }
                
                charText = ""
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    var body: some View {
        VStack{
            List(model.queries) { query in
                VStack {
                    Text(query.question).fontWeight(.bold)
                    Text(query.answer)
                }
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
        MainView().environmentObject(Model())
    }
}
