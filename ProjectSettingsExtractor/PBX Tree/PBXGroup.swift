//
//  PBXGroup.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXGroup: PBXObject {

	public let children: [PBXObject]?
	public let path: String?
	public let name: String?
	public let sourceTree: String?
	
	init?(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		if let childrenIds = properties["children"] as? [String], let children = objects.find(ids: childrenIds) {
			self.children = children
		} else {
			children = nil
		}
		path = properties["path"] as? String
		name = properties["name"] as? String
		sourceTree = properties["sourceTree"] as? String
		super.init(data)
	}
	
}
