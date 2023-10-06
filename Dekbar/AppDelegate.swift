//
//  AppDelegate.swift
//  Dekbar
//
//  Created by Hector on 26-09-23.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var timer: Timer?
    var excecutionInterval = 0.7
    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var time = 1
    var stateButton = true
    // Crea a Dek
    var dek = Dek()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        if let button = statusItem.button {
            button.action = #selector(self.togglePopover(_:))
        }
        
        dek = Dek(name: "Dek", age: 0, appearance: "•_•)", appearanceDescription: "poker face")

        
        // Iniciar la tarea cuando la aplicación carga
        startTask()
        statusItem.button?.title = ""
        statusItem.button?.target = self
        NSApp.setActivationPolicy(.accessory)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Detener el timer si la aplicación se está cerrando
        timer?.invalidate()
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        dek.sayHey()
        
        if (stateButton){
            timer?.invalidate()
            statusItem.button?.title = dek.appearance
            stateButton = false
        } else {
            startTask()
            stateButton = true
        }
    }

    func startTask() {
        // Configurar el timer para que se ejecute cada 1 segundo
        timer = Timer.scheduledTimer(timeInterval: excecutionInterval, target: self, selector: #selector(self.performTask), userInfo: nil, repeats: true)
        
        // Para que el timer funcione incluso cuando la aplicación está en segundo plano
        RunLoop.current.add(timer!, forMode: .common)
    }

    @objc func performTask() {
        switch time {
        case 1:
            statusItem.button?.title = "┏(-_-)┛";
            time = 2
            break
        case 2:
            statusItem.button?.title = "┗(-_-﻿ )┓";
            time = 3
            break
        case 3:
            statusItem.button?.title = "┗(-_-)┛ ";
            time = 4
            break
        case 4:
            statusItem.button?.title = "┏( -_-﻿)┛  ";
            time = 5
            break
        case 5:
            statusItem.button?.title = "┏(-_-)┓";
            time = 6
            break
        case 6:
            statusItem.button?.title = "/(-_-)/";
            time = 7
            break
        case 7:
            statusItem.button?.title = "\\(-_-)\\";
            time = 1
            break
        default:
            statusItem.button?.title = "Powered by HC";
            time = 1
        }
    }
}

