//
//  XcodeProjectSettings.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 31/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

internal typealias Properties = [String : Any]

private let availableXcodeVersions = ["Xcode 9.3"]

public class XcodeProjectSettings {
	
	public let archiveVersion: String
	public let objectVersion: String
	public let classes: [String : Any]
	public let objects: [String : PBXObject]
	public let pbxProject: PBXProject

	public init?(xcodeProjectFile: URL) {
		let url = xcodeProjectFile.appendingPathComponent("project.pbxproj")
		guard let data = try? Data(contentsOf: url, options: []),
			let propertyList = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil),
			let properties = propertyList as? Properties,
			let objects = properties["objects"] as? [String : Properties],
			let archiveVersion = properties["objects"] as? String,
			let objectVersion = properties["objectVersion"] as? String,
			let classes = properties["objectVersion"] as? Properties,
			let rootObjectId = properties["rootObject"] as? String else {
				return nil
		}
		
		self.archiveVersion = archiveVersion
		self.objectVersion = objectVersion
		self.classes = classes
		
		guard let objectsMap = buildObjectsMap(objects) else {
			return nil
		}
		self.objects = objectsMap
		
		guard let projectData = self.objects[rootObjectId], let project = PBXProject(objects: self.objects, data: projectData) else {
			return nil
		}
		self.pbxProject = project
		
		let projectXcodeVersion = self.pbxProject.compatibilityVersion
		if availableXcodeVersions.contains(projectXcodeVersion) == false {
			return nil
		}
	}
	
}

private func buildObjectsMap(_ objects: [String : Properties]) -> PBXObjectMap? {
	var src = objects.compactMap { PBXObject(id: $0, properties: $1) }
	var objects = PBXObjectMap()
	var skipped = [PBXObject]()

	// PBXFileReference
	let pbxFileReferenceList = extractObjects(from: &src, isa: .PBXFileReference)
	for data in pbxFileReferenceList {
		objects[data.id] = PBXFileReference(data: data)
	}
	
	// PBXBuildFile
	let pbxBuildFileList = extractObjects(from: &src, isa: .PBXBuildFile)
	for data in pbxBuildFileList {
		if let object = PBXBuildFile(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			return nil
		}
	}
	
	// PBXGroup
	let pbxGroupList = extractObjects(from: &src, isa: .PBXGroup)
	for data in pbxGroupList {
		if let object = PBXGroup(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			skipped.append(data)
		}
	}
	while skipped.count > 0 {
		for data in skipped {
			if let object = PBXGroup(objects: objects, data: data) {
				objects[data.id] = object
			} else {
				skipped.append(data)
			}
		}
	}
	
	// PBXFrameworksBuildPhase
	let pbxFrameworksBuildPhaseList = extractObjects(from: &src, isa: .PBXFrameworksBuildPhase)
	for data in pbxFrameworksBuildPhaseList {
		if let object = PBXFrameworksBuildPhase(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			return nil
		}
	}
	
	// PBXHeadersBuildPhase
	let pbxHeadersBuildPhase = extractObjects(from: &src, isa: .PBXHeadersBuildPhase)
	for data in pbxHeadersBuildPhase {
		if let object = PBXHeadersBuildPhase(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			return nil
		}
	}
	
	// PBXResourcesBuildPhase
	let pbxResourcesBuildPhase = extractObjects(from: &src, isa: .PBXResourcesBuildPhase)
	for data in pbxResourcesBuildPhase {
		if let object = PBXResourcesBuildPhase(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			return nil
		}
	}
	
	// PBXSourcesBuildPhase
	let pbxSourcesBuildPhase = extractObjects(from: &src, isa: .PBXSourcesBuildPhase)
	for data in pbxSourcesBuildPhase {
		if let object = PBXSourcesBuildPhase(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			return nil
		}
	}
	
	// PBXShellScriptBuildPhase
	let pbxShellScriptBuildPhase = extractObjects(from: &src, isa: .PBXShellScriptBuildPhase)
	for data in pbxShellScriptBuildPhase {
		if let object = PBXShellScriptBuildPhase(objects: objects, data: data) {
			objects[data.id] = object
		} else {
			return nil
		}
	}
	
	// XCBuildConfiguration
	let xcBuildConfiguration = extractObjects(from: &src, isa: .XCBuildConfiguration)
	for data in xcBuildConfiguration {
		objects[data.id] = XCBuildConfiguration(data: data)
	}
	
	// XCConfigurationList
	let xcConfigurationList = extractObjects(from: &src, isa: .XCConfigurationList)
	for data in xcConfigurationList {
		objects[data.id] = XCConfigurationList(objects: objects, data: data)
	}
	
	// PBXContainerItemProxy
	let pbxContainerItemProxy = extractObjects(from: &src, isa: .PBXContainerItemProxy)
	for data in pbxContainerItemProxy {
		objects[data.id] = PBXContainerItemProxy(data: data)
	}
	
	// PBXTargetDependency
	let pbxTargetDependency = extractObjects(from: &src, isa: .PBXTargetDependency)
	for data in pbxTargetDependency {
		objects[data.id] = PBXTargetDependency(objects: objects, data: data)
	}
	
	// PBXNativeTarget
	let pbxNativeTarget = extractObjects(from: &src, isa: .PBXNativeTarget)
	for data in pbxNativeTarget {
		objects[data.id] = PBXNativeTarget(objects: objects, data: data)
	}
	
	return objects
}

private func extractObjects(from objects: inout [PBXObject], isa: IsaType) -> [PBXObject] {
	let result = objects.filter { $0.isa == isa }
	objects.removeAll { $0.isa == isa }
	return result
}
