//
//  ContentView.swift
//  BEDialoguePlayback
//
//  Created by User on 02.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dialogueViewModel: DialogueViewModel
        
    var body: some View {
        return NavigationView {
            ScrollView {
                ForEach(dialogueViewModel.statementsArray, id: \.self) { item in
                    DialogueBalloonView(statement: item.line).onAppear {
                        self.dialogueViewModel.say(statement: item.line)
                    }
                }
            }.padding(0)
                .background(Color(hex: 0xF9FAFB))
                .navigationBarTitle("Dialogue", displayMode: .inline)
        }.edgesIgnoringSafeArea([.leading, .trailing])
        .onAppear { [dialogueViewModel] in
            dialogueViewModel.fetchNextStatement()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dialogueViewModel = DialogueViewModel(dialogueLines: getDialogLines())
        return ContentView(dialogueViewModel: dialogueViewModel)
    }
}

struct DialogueBalloonView: View {
    @State var statement: String
    
    var body: some View {
        return Text(statement)
            .foregroundColor(.black)
            .font(.body)
            .padding(10.0)
            .background(Color(hex: 0xFDFDFE))
            .cornerRadius(5.0)
            .shadow(color: Color(hex: 0x00000, alpha: 0.5), radius: 4.0, x: 1, y: 1)
            .padding([.vertical], 15)
    }
}
