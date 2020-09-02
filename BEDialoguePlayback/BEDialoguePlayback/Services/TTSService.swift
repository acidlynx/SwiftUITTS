//
//  TTSService.swift
//  BEDialoguePlayback
//
//  Created by User on 02.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation
import AVFoundation

let kSpeechVoiceLanguage = "en-US"

func say(statement: String) {
    let utterance = AVSpeechUtterance(string: statement)
    utterance.voice = AVSpeechSynthesisVoice(language: kSpeechVoiceLanguage)
    
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(utterance)
}
