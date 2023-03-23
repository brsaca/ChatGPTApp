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
    
    @State private var isSearching: Bool = false
    
    private var isFormValid: Bool {
        !charText.isEmptyOrWhiteSpace
    }
    
    private func performSearch() {
        isSearching = true
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
                    print(">>>> Error Saving:: \(error.localizedDescription)")
                }
                
                charText = ""
                isSearching = false
            case .failure(let failure):
                print(">>>> Error openAI:: \(failure.localizedDescription)")
                isSearching = false
            }
        }
    }
    
    var body: some View {
        VStack{
            ScrollView{
                ScrollViewReader { proxy in
                    ForEach(model.queries) { query in
                        VStack(alignment:.leading) {
                            Text(query.question).fontWeight(.bold)
                            Text(query.answer)
                        }.frame(maxWidth:.infinity, alignment: .leading)
                            .padding([.bottom], 10)
                            .id(query.id)
                            .listRowSeparator(.hidden)
                    }.listStyle(.plain)
                        .onChange(of: model.queries) { query in
                            if !model.queries.isEmpty {
                                let lastQuery = model.queries[model.queries.endIndex - 1]
                                withAnimation{
                                    proxy.scrollTo(lastQuery.id)
                                }
                            }
                        }
                }
            }.padding()
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
            .onChange(of: model.query) { query in
                model.queries.append(query)
            }
            .overlay(alignment: .center) {
                if isSearching {
                    ProgressView("Searching...")
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Model())
    }
}
