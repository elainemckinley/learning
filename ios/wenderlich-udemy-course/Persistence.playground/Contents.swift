import Foundation

FileManager.documentDirectoryURL.path

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)

let stringUrl = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathComponent("txt")
