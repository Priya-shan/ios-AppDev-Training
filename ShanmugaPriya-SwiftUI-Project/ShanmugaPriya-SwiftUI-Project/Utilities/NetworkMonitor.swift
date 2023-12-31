//
//  NetworkMonitor.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 16/10/23.
//

import Foundation
import Network

final class NetworkMonitor:ObservableObject{
    @Published var isConnected = true
    let monitor = NWPathMonitor()
    let networkQueue = DispatchQueue(label:"Monitor")
    //secondary thread -> weak conn
    //primary thread -> weak conn not required
    init(){
        monitor.pathUpdateHandler = {
            path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: networkQueue)
    }
}
