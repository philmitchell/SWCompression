//
//  SWCompressionTests.swift
//  SWCompressionTests
//
//  Created by Timofey Solomko on 16.10.16.
//  Copyright © 2016 Timofey Solomko. All rights reserved.
//

import XCTest
@testable import SWCompression

class SWCompressionTests: XCTestCase {

    func testHelloWorldFile() {
        let testData = try? Data(contentsOf: Constants.helloWorldArchivePath)
        XCTAssertNotNil(testData, "Failed to load test archive")
        let decompressedData = try? GzipArchive.unarchive(archiveData: testData!)
        XCTAssertNotNil(decompressedData, "Failed to decompress")
        guard decompressedData != nil else { return }
        let decompressedString = String(data: decompressedData!, encoding: .utf8)
        XCTAssertNotNil(decompressedString, "Failed to convert decompressed data to string")
        XCTAssertEqual(decompressedString!, "Hello, World!\n", "Decompression was incorrect")
    }

    func testSecondTestFile() {
        let testData = try? Data(contentsOf: Constants.secondTestArchivePath)
        XCTAssertNotNil(testData, "Failed to load test archive")
        let decompressedData = try? GzipArchive.unarchive(archiveData: testData!)
        XCTAssertNotNil(decompressedData, "Failed to decompress")
        guard decompressedData != nil else { return }
        let decompressedString = String(data: decompressedData!, encoding: .utf8)
        XCTAssertNotNil(decompressedString, "Failed to convert decompressed data to string")
        let answerString = try? String(contentsOf: Constants.secondTestAnswerPath, encoding: .utf8)
        XCTAssertNotNil(answerString, "Failed to get the answer")
        guard answerString != nil else { return }
        XCTAssertEqual(decompressedString!, answerString!, "Decompression was incorrect")
    }

    func testEmptyFile() {
        let testData = try? Data(contentsOf: Constants.emptyFileArchivePath)
        XCTAssertNotNil(testData, "Failed to load test archive")
        let decompressedData = try? GzipArchive.unarchive(archiveData: testData!)
        XCTAssertNotNil(decompressedData, "Failed to decompress")
        guard decompressedData != nil else { return }
        let decompressedString = String(data: decompressedData!, encoding: .utf8)
        XCTAssertNotNil(decompressedString, "Failed to convert decompressed data to string")
        XCTAssertEqual(decompressedString!, "")
    }

    func testHelloWorldZlibFile() {
        let testData = try? Data(contentsOf: Constants.helloWorldZlibPath)
        XCTAssertNotNil(testData, "Failed to load test archive")
        let decompressedData = try? ZlibArchive.unarchive(archiveData: testData!)
        XCTAssertNotNil(decompressedData, "Failed to decompress")
        guard decompressedData != nil else { return }
        let decompressedString = String(data: decompressedData!, encoding: .utf8)
        XCTAssertNotNil(decompressedString, "Failed to convert decompressed data to string")
        XCTAssertEqual(decompressedString!, "Hello, World!\n", "Decompression was incorrect")
    }

    func testSecondZlibFile() {
        let testData = try? Data(contentsOf: Constants.secondZlibTestPath)
        XCTAssertNotNil(testData, "Failed to load test archive")
        let decompressedData = try? ZlibArchive.unarchive(archiveData: testData!)
        XCTAssertNotNil(decompressedData, "Failed to decompress")
        guard decompressedData != nil else { return }
        let decompressedString = String(data: decompressedData!, encoding: .utf8)
        XCTAssertNotNil(decompressedString, "Failed to convert decompressed data to string")
        let answerString = try? String(contentsOf: Constants.secondZlibTestAnswerPath, encoding: .utf8)
        XCTAssertNotNil(answerString, "Failed to get the answer")
        guard answerString != nil else { return }
        XCTAssertEqual(decompressedString!, answerString!, "Decompression was incorrect")
    }

    func testThirdZlibFile() {
        let testData = try? Data(contentsOf: Constants.thirdZlibTestPath)
        XCTAssertNotNil(testData, "Failed to load test archive")
        let decompressedData = try? ZlibArchive.unarchive(archiveData: testData!)
        XCTAssertNotNil(decompressedData, "Failed to decompress")
        guard decompressedData != nil else { return }
        let decompressedString = String(data: decompressedData!, encoding: .utf8)
        XCTAssertNotNil(decompressedString, "Failed to convert decompressed data to string")
        let answerString = try? String(contentsOf: Constants.thirdZlibTestAnswerPath, encoding: .utf8)
        XCTAssertNotNil(answerString, "Failed to get the answer")
        guard answerString != nil else { return }
        XCTAssertEqual(decompressedString!, answerString!, "Decompression was incorrect")
    }

}
