//
//  PBXProject.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXProject: PBXObject {
	
	public let attributes: PBXProjectAttributes?
	public let buildConfigurationList: XCConfigurationList?
	public let compatibilityVersion: String
	public let developmentRegion: String?
	public let hasScannedForEncodings: String?
	public let knownRegions: [String]?
	public let mainGroup: PBXGroup?
	public let productRefGroup: PBXGroup?
	public let projectDirPath: String?
	public let projectRoot: String?
	public let targets: [PBXNativeTarget]?
	
	init?(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		if let data = properties["attributes"] as? Properties {
			attributes = PBXProjectAttributes(data: data)
		} else {
			attributes = nil
		}
		if let objectId = properties["buildConfigurationList"] as? String, let object = objects[objectId] as? XCConfigurationList {
			buildConfigurationList = object
		} else {
			buildConfigurationList = nil
		}
		if let compatibilityVersion = properties["compatibilityVersion"] as? String {
			self.compatibilityVersion = compatibilityVersion
		} else {
			return nil
		}
		developmentRegion = properties["developmentRegion"] as? String
		hasScannedForEncodings = properties["hasScannedForEncodings"] as? String
		knownRegions = properties["knownRegions"] as? [String]
		if let objectId = properties["mainGroup"] as? String, let object = objects[objectId] as? PBXGroup {
			mainGroup = object
		} else {
			mainGroup = nil
		}
		if let objectId = properties["productRefGroup"] as? String, let object = objects[objectId] as? PBXGroup {
			productRefGroup = object
		} else {
			productRefGroup = nil
		}
		projectDirPath = properties["projectDirPath"] as? String
		projectRoot = properties["projectRoot"] as? String
		
		if let objectIds = properties["targets"] as? [String], let object = objects.find(ids: objectIds) as? [PBXNativeTarget] {
			targets = object
		} else {
			targets = nil
		}
		super.init(data)
	}

}

public class PBXProjectAttributes {
	
	public let lastSwiftUpdateCheck: String?
	public let lastUpgradeCheck: String?
	public let organizationName: String?
	public let targetAttributes: [String : TargetAttributes]?
	
	init(data: Properties) {
		lastSwiftUpdateCheck = data["LastSwiftUpdateCheck"] as? String
		lastUpgradeCheck = data["LastUpgradeCheck"] as? String
		organizationName = data["ORGANIZATIONNAME"] as? String
		if let targetAttributes = data["TargetAttributes"] as? [String : Any] {
			var tmp = [String : TargetAttributes]()
			for (key, value) in targetAttributes {
				if let value = value as? Properties {
					tmp[key] = TargetAttributes(data: value)
				}
			}
			self.targetAttributes = tmp
		} else {
			targetAttributes = nil
		}
	}
	
}

public class TargetAttributes {
	
	public let createdOnToolsVersion: String?
	public let lastSwiftMigration: String?
	
	init(data: Properties) {
		createdOnToolsVersion = data["CreatedOnToolsVersion"] as? String
		lastSwiftMigration = data["LastSwiftMigration"] as? String
	}
	
}
