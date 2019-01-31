//
//  PBXShellScriptBuildPhase.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXShellScriptBuildPhase: PBXBuildFile {

	let inputFileListPaths: Any?
	let inputPaths: Any?
	let outputFileListPaths: Any?
	let outputPaths: Any?
	let shellPath: String?
	let shellScript: String?
	
	override init?(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		inputFileListPaths = properties["inputFileListPaths"]
		inputPaths = properties["inputFileListPaths"]
		outputFileListPaths = properties["inputFileListPaths"]
		outputPaths = properties["inputFileListPaths"]
		shellPath = properties["inputFileListPaths"] as? String
		shellScript = properties["inputFileListPaths"] as? String
		super.init(objects: objects, data: data)
	}
	
}
