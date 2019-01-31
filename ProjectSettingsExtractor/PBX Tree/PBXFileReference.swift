//
//  PBXFileReference.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXFileReference: PBXObject {
	
	public let lastKnownFileType: String?
	public let path: String?
	public let sourceTree: String?
	public let explicitFileType: String?
	public let includeInIndex: String?
	
	init?(data: PBXObject) {
		let properties = data.properties
		lastKnownFileType = properties["lastKnownFileType"] as? String
		path = properties["path"] as? String
		sourceTree = properties["sourceTree"] as? String
		explicitFileType = properties["explicitFileType"] as? String
		includeInIndex = properties["includeInIndex"] as? String
		super.init(data)
	}
	
}
