// Copyright (c) 2021 Timofey Solomko
// Licensed under MIT License
//
// See LICENSE for license information

import Foundation
import SWCompression
import SwiftCLI

protocol ContainerCommand: Command {

    associatedtype ContainerType: Container

    var info: Bool { get }
    var extract: String? { get }
    var verbose: Bool { get }
    var input: String { get }

}

extension ContainerCommand {

    func execute() throws {
        let fileData = try Data(contentsOf: URL(fileURLWithPath: self.input),
                                options: .mappedIfSafe)
        if info {
            let entries = try ContainerType.info(container: fileData)
            swcomp.printInfo(entries)
        } else if let outputPath = self.extract {
            if try !isValidOutputDirectory(outputPath, create: true) {
                print("ERROR: Specified path already exists and is not a directory.")
                exit(1)
            }

            let entries = try ContainerType.open(container: fileData)
            try swcomp.write(entries, outputPath, verbose)
        }
    }

}
