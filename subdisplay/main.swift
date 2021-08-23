//
//  main.swift
//  subdisplay
//
//  Created by 垣本耀介 on 2021/06/25.
//

import Foundation

let mainDisplayID = CGMainDisplayID()
let maxDispaly: UInt32 = 4
var onlineDisplay = [CGDirectDisplayID](repeating: 0, count: Int(maxDispaly))
var displayCount: UInt32 = 0

CGGetOnlineDisplayList(maxDispaly, &onlineDisplay, &displayCount)
print("displayCount is \(displayCount)")

let target: CGDirectDisplayID? = onlineDisplay
   .lazy
   .filter { $0 != mainDisplayID }
   .first

let externalDisplayID = target ?? nil
var displayID = externalDisplayID
print("select = \(displayID?.description)")

var mode = CGDisplayCopyDisplayMode(displayID!)

var displayWidth = mode?.width
var displayHeight = mode?.height

CGDisplayStream(dispatchQueueDisplay: displayID,
                outputWidth: Int(outputsSize.width),
                outputHeight: <#T##Int#>,
                pixelFormat: <#T##Int32#>,
                properties: <#T##CFDictionary?#>,
                queue: <#T##DispatchQueue#>,
                handler: <#T##CGDisplayStreamFrameAvailableHandler?##CGDisplayStreamFrameAvailableHandler?##(CGDisplayStreamFrameStatus, UInt64, IOSurfaceRef?, CGDisplayStreamUpdate?) -> Void#>)
