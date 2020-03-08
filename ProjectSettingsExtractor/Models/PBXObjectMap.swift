//
//  PBXObjectMap.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

internal typealias PBXObjectMap = [String : PBXObject]

internal extension Dictionary where Key == String, Value == PBXObject {
	
	func find(ids: [String]) -> [Value]? {
		var result = [Value]()
		for objectId in ids {
			if let object = self[objectId] {
				result.append(object)
			} else {
				return nil
			}
		}
		return result
	}
	
}
