//
//  ContentView.swift
//  MacOS Rounded Screen
//
//  Created by Samiyuru Menik on 10/8/21.
//

import SwiftUI

class CornersWindow: NSWindow {
    
    override func makeKey() {
        // Do nothing.
    }
    
    override func makeMain() {
        // Do nothing.
    }
    
}

class ContentView: NSView {
    
    let cornerRadius:CGFloat = 10.5
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.clear.set()
        dirtyRect.fill()
        
        NSColor.black.set()
        
        var cornerPath:NSBezierPath
        
        cornerPath = NSBezierPath()
        cornerPath.move(to: NSPoint(x: bounds.minX, y: bounds.maxY - cornerRadius))
        cornerPath.appendArc(from: NSPoint(x: bounds.minX, y: bounds.maxY), to: NSPoint(x: bounds.minX + cornerRadius, y: bounds.maxY), radius: cornerRadius)
        cornerPath.line(to: NSPoint(x: bounds.minX, y: bounds.maxY))
        cornerPath.close()
        cornerPath.lineWidth = 0
        cornerPath.fill()
        
        cornerPath = NSBezierPath()
        cornerPath.move(to: NSPoint(x: bounds.maxX, y: bounds.maxY - cornerRadius))
        cornerPath.appendArc(from: NSPoint(x: bounds.maxX, y: bounds.maxY), to: NSPoint(x: bounds.maxX - cornerRadius, y: bounds.maxY), radius: cornerRadius)
        cornerPath.line(to: NSPoint(x: bounds.maxX, y: bounds.maxY))
        cornerPath.close()
        cornerPath.lineWidth = 0
        cornerPath.fill()
        
        cornerPath = NSBezierPath()
        cornerPath.move(to: NSPoint(x: bounds.minX, y: bounds.minY + cornerRadius))
        cornerPath.appendArc(from: NSPoint(x: bounds.minX, y: bounds.minY), to: NSPoint(x: bounds.minX + cornerRadius, y: bounds.minY), radius: cornerRadius)
        cornerPath.line(to: NSPoint(x: bounds.minX, y: bounds.minY))
        cornerPath.close()
        cornerPath.lineWidth = 0
        cornerPath.fill()
        
        cornerPath = NSBezierPath()
        cornerPath.move(to: NSPoint(x: bounds.maxX, y: bounds.minY + cornerRadius))
        cornerPath.appendArc(from: NSPoint(x: bounds.maxX, y: bounds.minY), to: NSPoint(x: bounds.maxX - cornerRadius, y: bounds.minY), radius: cornerRadius)
        cornerPath.line(to: NSPoint(x: bounds.maxX, y: bounds.minY))
        cornerPath.close()
        cornerPath.lineWidth = 0
        cornerPath.fill()
    }
    
}

