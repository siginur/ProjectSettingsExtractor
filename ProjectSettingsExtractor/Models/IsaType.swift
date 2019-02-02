//
//  IsaType.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public enum IsaType: Hashable {
	case PBXBuildFile
	case PBXContainerItemProxy
	case PBXFileReference
	case PBXVariantGroup
	case PBXFrameworksBuildPhase
	case PBXGroup
	case PBXHeadersBuildPhase
	case PBXNativeTarget
	case PBXProject
	case PBXResourcesBuildPhase
	case PBXShellScriptBuildPhase
	case PBXSourcesBuildPhase
	case PBXTargetDependency
	case XCBuildConfiguration
	case XCConfigurationList
	case other(String)
	
	public init(rawValue: String) {
		switch rawValue {
		case "PBXBuildFile": self = .PBXBuildFile
		case "PBXContainerItemProxy": self = .PBXContainerItemProxy
		case "PBXFileReference": self = .PBXFileReference
		case "PBXVariantGroup": self = .PBXVariantGroup
		case "PBXFrameworksBuildPhase": self = .PBXFrameworksBuildPhase
		case "PBXGroup": self = .PBXGroup
		case "PBXHeadersBuildPhase": self = .PBXHeadersBuildPhase
		case "PBXNativeTarget": self = .PBXNativeTarget
		case "PBXProject": self = .PBXProject
		case "PBXResourcesBuildPhase": self = .PBXResourcesBuildPhase
		case "PBXShellScriptBuildPhase": self = .PBXShellScriptBuildPhase
		case "PBXSourcesBuildPhase": self = .PBXSourcesBuildPhase
		case "PBXTargetDependency": self = .PBXTargetDependency
		case "XCBuildConfiguration": self = .XCBuildConfiguration
		case "XCConfigurationList": self = .XCConfigurationList
		default:
			self = .other(rawValue)
		}
	}
	
}
