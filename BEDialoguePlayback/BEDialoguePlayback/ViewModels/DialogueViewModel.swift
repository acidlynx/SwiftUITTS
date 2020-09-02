//
//  DialogueViewModel.swift
//  BEDialoguePlayback
//
//  Created by User on 02.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation
import Combine
import AVFoundation

let kSpeechVoiceLanguage = "en-US"

protocol DialogueStatementFetchable {
    func fetchNextStatement()
}

/// View Model for get next data of the Dialogue.
/// Also this model can speech statement.
class DialogueViewModel: NSObject, ObservableObject {
    @Published var statementsArray: [DialogueLine] = []
    
    private var dialogueStatemens: [DialogueLine]
    private var currentIndex: Int = 0
    
    private lazy var speechSyntesizer: AVSpeechSynthesizer = {
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = self
        return synthesizer
    }()
    
    init(dialogueLines: [DialogueLine]) {
        dialogueStatemens = dialogueLines
    }
    
    func say(statement: String) {
        let utterance = AVSpeechUtterance(string: statement)
        utterance.voice = AVSpeechSynthesisVoice(language: kSpeechVoiceLanguage)
        speechSyntesizer.speak(utterance)
    }
}

extension DialogueViewModel: DialogueStatementFetchable {
    func fetchNextStatement() {
        if currentIndex < dialogueStatemens.count {
            statementsArray.append(dialogueStatemens[currentIndex])
            currentIndex += 1
        }
    }
}

extension DialogueViewModel: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.fetchNextStatement()
    }
}
