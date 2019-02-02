//
//  PBXVariantGroup.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 01/02/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXVariantGroup: PBXTreeElement {

	public let children: [PBXFileReference]?
	
	init(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		if let objectIds = properties["children"] as? [String], let object = objects.find(ids: objectIds) as? [PBXFileReference] {
			children = object
		} else {
			children = nil
		}
		super.init(data: data)
	}
	
}
