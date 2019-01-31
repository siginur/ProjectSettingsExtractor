//
//  PBXTargetDependency.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXTargetDependency: PBXObject {

	public let target: String?
	public let targetProxy: PBXContainerItemProxy?
	
	init(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		target = properties["target"] as? String
		if let objectId = properties["targetProxy"] as? String, let object = objects[objectId] as? PBXContainerItemProxy {
			targetProxy = object
		} else {
			targetProxy = nil
		}
		super.init(data)
	}
	
}
