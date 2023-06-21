//
//  CentralTimer.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import Foundation
import Combine

// shared central timers
public var secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // once per second
public var halfSecondTimer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect() // twice per second
public var tenthSecondTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect() // ten times per second
public var hundredthSecondTimer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect() // 100 times per second
