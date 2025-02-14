// Copyright (c) 2021 Timofey Solomko
// Licensed under MIT License
//
// See LICENSE for license information

import Foundation
import SWCompression
import SwiftCLI

class LZMACommand: Command {

    let name = "lzma"
    let shortDescription = "Extracts a LZMA archive"

    @Param var input: String
    @Param var output: String?

    func execute() throws {
        let fileData = try Data(contentsOf: URL(fileURLWithPath: self.input),
                        options: .mappedIfSafe)
        let outputPath = self.output ?? FileManager.default.currentDirectoryPath
        let decompressedData = try LZMA.decompress(data: fileData)
        try decompressedData.write(to: URL(fileURLWithPath: outputPath))
    }

}
