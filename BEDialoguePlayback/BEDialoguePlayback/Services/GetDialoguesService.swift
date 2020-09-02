//
//  GetDialoguesService.swift
//  BEDialoguePlayback
//
//  Created by User on 02.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []
var gameTimer: AnyCancellable?

let kDialoguesFileName = "Dialogues"
let kDialoguesFileExtension = "json"

/// Read dialog lines from the JSON-file and return as `[DialogueLine]`
/// The name and extenstion of file are stored in constants
func getDialogLines() -> [DialogueLine]{
    guard let url = Bundle.main.url(forResource: kDialoguesFileName, withExtension: kDialoguesFileExtension) else {
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let dialogueLines = try decoder.decode([DialogueLine].self, from: data)
        return dialogueLines
    } catch {
        return []
    }
}
