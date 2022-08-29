//
//  AppDelegate.swift
//  ClamPower
//
//  Created by Sung Park on 2022/08/29.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var currentChargingState = false

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { timer in
            // sudo pmset -a disablesleep 0 && sudo pmset -a displaysleep 10
            // sudo pmset -a disablesleep 1 && sudo pmset -a displaysleep 0
            if getChargingState() {
                print("Mac is charging currently")
                if !(true.isSameAsAnotherValue(&self.currentChargingState)) {
                    print("Now Mac is charging")
                    let process = Process()
                    process.executableURL = URL(fileURLWithPath: "/bin/sh")
                    process.arguments = ["-c", "sudo pmset -a disablesleep 1 && sudo pmset -a displaysleep 0"]
                    try! process.run()
                }
            } else {
                print("Mac is discharging currently")
                if !(false.isSameAsAnotherValue(&self.currentChargingState)) {
                    print("Now Mac is discharging")
                    let process = Process()
                    process.executableURL = URL(fileURLWithPath: "/bin/sh")
                    process.arguments = ["-c", "sudo pmset -a disablesleep 0 && sudo pmset -a displaysleep 10"]
                    try! process.run()
                }
            }
        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
