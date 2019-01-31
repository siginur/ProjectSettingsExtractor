//
//  PBXNativeTarget.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXNativeTarget: PBXObject {

	public let buildConfigurationList: XCConfigurationList?
	public let buildPhases: [PBXBuildPhase]?
	public let buildRules: [String]?
	public let dependencies: [PBXTargetDependency]?
	public let name: String?
	public let productName: String?
	public let productReference: PBXFileReference?
	public let productType: String?
	
	init(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		
		if let objectId = properties["buildConfigurationList"] as? String, let object = objects[objectId] as? XCConfigurationList {
			buildConfigurationList = object
		} else {
			buildConfigurationList = nil
		}
		if let objectIds = properties["buildPhases"] as? [String], let object = objects.find(ids: objectIds) as? [PBXBuildPhase] {
			buildPhases = object
		} else {
			buildPhases = nil
		}
		if let objectIds = properties["dependencies"] as? [String], let object = objects.find(ids: objectIds) as? [PBXTargetDependency] {
			dependencies = object
		} else {
			dependencies = nil
		}
		if let objectId = properties["productReference"] as? String, let object = objects[objectId] as? PBXFileReference {
			productReference = object
		} else {
			productReference = nil
		}
		buildRules = properties["buildRules"] as? [String]
		name = properties["name"] as? String
		productName = properties["productName"] as? String
		productType = properties["productType"] as? String
		super.init(data)
	}
	
}
