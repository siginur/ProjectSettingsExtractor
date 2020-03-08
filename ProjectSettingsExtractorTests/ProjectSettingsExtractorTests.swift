//
//  ProjectSettingsExtractorTests.swift
//  ProjectSettingsExtractorTests
//
//  Created by Alexey Siginur on 30/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

import XCTest
@testable import ProjectSettingsExtractor

class ProjectSettingsExtractorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//		let settings = XcodeProjectSettings.init(xcodeProjectFile: URL(fileURLWithPath: "/Users/siginur/Developing/_libraries/SMDateTime/SMDateTime/SMDateTime.xcodeproj"))
//		let settings = XcodeProjectSettings.init(xcodeProjectFile: URL(fileURLWithPath: "/Users/siginur/Developing/_Pointer/workCalc/workCalc.xcodeproj"))
		let settings = XcodeProjectSettings.init(xcodeProjectFile: URL(fileURLWithPath: "/Users/siginur/Developing/_Pointer/HeartWorks/HeartM/HeartWorks.xcodeproj"))
		XCTAssertNotNil(settings)
		print(settings?.pbxProject.targets?.compactMap{
			$0.buildConfigurationList?.buildConfigurations?.compactMap {
				$0.buildSettings?.productBudleIdentifier
			}
		} ?? [])
	}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
