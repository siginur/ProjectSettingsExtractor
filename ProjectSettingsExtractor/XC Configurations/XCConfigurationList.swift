//
//  XCConfigurationList.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 30/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class XCConfigurationList: PBXObject {
	
	public let buildConfigurations: [XCBuildConfiguration]?
	public let defaultConfigurationIsVisible: String?
	public let defaultConfigurationName: String?
	
	init(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		defaultConfigurationIsVisible = properties["defaultConfigurationIsVisible"] as? String
		defaultConfigurationName = properties["defaultConfigurationName"] as? String
		if let buildConfigurationsIds = properties["buildConfigurations"] as? [String], let buildConfigurations = objects.find(ids: buildConfigurationsIds) as? [XCBuildConfiguration] {
			self.buildConfigurations = buildConfigurations
		} else {
			buildConfigurations = nil
		}
		super.init(data)
	}
}
