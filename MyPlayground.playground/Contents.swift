//: Playground - noun: a place where people can play

import UIKit
import Foundation


// 디폴트 NSFileManager 객체에 대한 참조체 얻기

//let filemgr = NSFileManager.defaultManager();

// 현재 애플리케이션의 Documents 디렉토리 얻기

// get the documents folder url
let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
// create the destination url for the text file to be saved
let fileURL = documentDirectory.appendingPathComponent("file.txt")
