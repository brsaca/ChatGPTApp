//
//  HistoryView.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 22/03/23.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject private var model: Model
    @Environment(\.dismiss) private var dismiss
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)])
    private var historyItemResults: FetchedResults<HistoryItem>
    
    var body: some View {
        List(historyItemResults){ historyItem in
            Text(historyItem.question ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    model.query = Query(question: historyItem.question ?? "", answer: historyItem.answer ?? "")
                    #if os(iOS)
                        dismiss()
                    #endif
                }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(Model())
    }
}
