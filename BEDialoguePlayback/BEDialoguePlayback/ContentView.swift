//
//  ContentView.swift
//  BEDialoguePlayback
//
//  Created by User on 02.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var dialogueLinesModel: [DialogueLine]
        
    var body: some View {
        return List {
            ForEach(dialogueLinesModel, id: \.self) { item in
                VStack {
                    DialogueBalloonView(statement: item.line)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dialogueLines = getDialogLines()
        return ContentView(dialogueLinesModel: dialogueLines)
    }
}

struct DialogueBalloonView: View {
    @State var statement: String
    
    var body: some View {
        say(statement: statement)
        return Text(statement)
    }
}
