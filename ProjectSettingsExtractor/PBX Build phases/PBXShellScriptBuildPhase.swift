//
//  PBXShellScriptBuildPhase.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXShellScriptBuildPhase: PBXBuildPhase {

	let name: String?
	let inputFileListPaths: [Any]?
	let inputPaths: [String]?
	let outputFileListPaths: [Any]?
	let outputPaths: [String]?
	let shellPath: String?
	let shellScript: String?
	let showEnvVarsInLog: String?
	
	override init?(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		inputFileListPaths = properties["inputFileListPaths"] as? [Any]
		inputPaths = properties["inputPaths"] as? [String]
		outputFileListPaths = properties["outputFileListPaths"] as? [Any]
		outputPaths = properties["outputPaths"] as? [String]
		shellPath = properties["shellPath"] as? String
		shellScript = properties["shellScript"] as? String
		showEnvVarsInLog = properties["showEnvVarsInLog"] as? String
		name = properties["name"] as? String
		super.init(objects: objects, data: data)
	}
	
}
