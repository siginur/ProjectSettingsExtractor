//
//  PBXBuildPhase.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXBuildPhase: PBXObject {
	
	public let buildActionMask: String?
	public let files: [PBXBuildFile]?
	public let runOnlyForDeploymentPostProcessing: String?
	
	init?(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		if let fileIds = properties["files"] as? [String], let files = objects.find(ids: fileIds) as? [PBXBuildFile] {
			self.files = files
		} else {
			files = nil
		}
		buildActionMask = properties["buildActionMask"] as? String
		runOnlyForDeploymentPostProcessing = properties["runOnlyForDeploymentPostprocessing"] as? String
		super.init(data)
	}

}
