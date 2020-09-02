//
//  SceneDelegate.swift
//  BEDialoguePlayback
//
//  Created by User on 02.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let dialogueLines = getDialogLines()
        let contentView = ContentView(dialogueLinesModel: dialogueLines)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

