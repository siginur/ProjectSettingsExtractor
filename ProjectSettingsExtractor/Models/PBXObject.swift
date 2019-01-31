//
//  PbxObject.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXObject {
	
	public let id: String
	public let isa: IsaType
	public let properties: [String : Any]
	
	init?(id: String, properties: Properties) {
		self.id = id
		if let isa = properties["isa"] as? String {
			self.isa = IsaType(rawValue: isa)
		} else {
			return nil
		}
		self.properties = properties
	}
	
	init(_ source: PBXObject) {
		self.id = source.id
		self.isa = source.isa
		self.properties = source.properties
	}

}
