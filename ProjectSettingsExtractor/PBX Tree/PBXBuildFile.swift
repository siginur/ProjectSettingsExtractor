//
//  PBXBuildFile.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXBuildFile: PBXObject {

	public let fileRef: PBXFileReference
	public let settings: [String : Any]?

	init?(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		guard let objectId = properties["fileRef"] as? String, let fileRef = objects[objectId] as? PBXFileReference else {
			return nil
		}
		self.fileRef = fileRef
		settings = properties["settings"] as? Properties
		super.init(data)
	}

}
