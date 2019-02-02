//
//  PBXTreeElement.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 02/02/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXTreeElement: PBXObject {
	
	public let name: String?
	public let sourceTree: String?

	init(data: PBXObject) {
		let properties = data.properties
		name = properties["name"] as? String
		sourceTree = properties["sourceTree"] as? String
		super.init(data)
	}

}
