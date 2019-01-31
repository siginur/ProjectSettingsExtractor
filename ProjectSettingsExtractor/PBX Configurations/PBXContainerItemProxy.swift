//
//  PBXContainerItemProxy.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class PBXContainerItemProxy: PBXObject {

	public let containerPortal: String?
	public let proxyType: String?
	public let remoteGlobalIdString: String?
	public let remoteInfo: String?
	
	init(data: PBXObject) {
		let properties = data.properties
		containerPortal = properties["containerPortal"] as? String
		proxyType = properties["proxyType"] as? String
		remoteGlobalIdString = properties["remoteGlobalIDString"] as? String
		remoteInfo = properties["remoteInfo"] as? String
		super.init(data)
	}
	
}
