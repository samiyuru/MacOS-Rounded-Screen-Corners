//
//  AppDelegate.swift
//  MacOS Rounded Screen
//
//  Created by Samiyuru Senarathne on 10/8/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var windows: [NSWindow] = []
    
    func makeRoundedCorners() -> Void {
        let screens:[NSScreen] = NSScreen.screens
        
        for screen in screens {
            let window: NSWindow = CornersWindow(contentRect: screen.frame, styleMask: .borderless, backing: .buffered, defer: false, screen: screen)
            window.isReleasedWhenClosed = false
            window.isOpaque = false
            window.backgroundColor = NSColor.clear
            window.alphaValue = 1
            window.hasShadow = false
            window.ignoresMouseEvents = true
            window.collectionBehavior = [.stationary, .ignoresCycle, .canJoinAllSpaces, .fullScreenAuxiliary]
            
            let contentView = ContentView(frame: screen.frame)
            window.contentView = contentView
            
            window.orderFront(self)
            window.level = .screenSaver
            
            windows.append(window)
        }
    }
    
    func clearRoundedCorners() -> Void {
        for window in windows {
            window.close()
        }
        windows.removeAll()
    }

    func applicationDidChangeScreenParameters(_ notification: Notification) {
        clearRoundedCorners()
        makeRoundedCorners()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        clearRoundedCorners()
        makeRoundedCorners()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

