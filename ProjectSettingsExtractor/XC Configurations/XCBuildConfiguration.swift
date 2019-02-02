//
//  XCBuildConfiguration.swift
//  ProjectSettingsExtractor
//
//  Created by Alexey Siginur on 30/01/2019.
//  Copyright © 2019 merkova. All rights reserved.
//

public class XCBuildConfiguration: PBXObject {

	public let baseConfigurationReference: PBXFileReference?
	public let buildSettings: XCBuildSettings?
	public let name: String?

	init(objects: PBXObjectMap, data: PBXObject) {
		let properties = data.properties
		name = properties["name"] as? String
		if let buildSettings = properties["buildSettings"] as? [String : Any] {
			self.buildSettings = XCBuildSettings(data: buildSettings)
		} else {
			buildSettings = nil
		}
		if let objectId = properties["baseConfigurationReference"] as? String, let object = objects[objectId] as? PBXFileReference {
			self.baseConfigurationReference = object
		} else {
			baseConfigurationReference = nil
		}
		super.init(data)
	}
	
}


public class XCBuildSettings {
	
	public let assetCatalogCompilerAppIconName: String?
	public let clangEnableModules: String? // YES
	public let codeSignIdentity: String? // ""
	public let codeSignStyle: String? // Automic
	public let definesModule: String? // YES
	public let developmentTeam: String? // HU4P847GG9
	public let frameworkSearchPaths: [String]?
	public let dylibCompatibilityVersion: String? // 1
	public let dylibCurrentVersion: String? // 1
	public let dylibInstallNameBase: String? // "@rpath"
	public let infoPlistFile: String? // SMDateTimeTests/Info.plist
	public let installPath: String? // "$(LOCAL_LIBRARY_DIR)/Frameworks"
	public let ldRunPathSearchPaths: [String]? // LD_RUNPATH_SEARCH_PATHS = ("$(inherited)", "@executable_path/Frameworks", "@loader_path/Frameworks")
	public let alwaysEmbedSwiftStandartLibraries: String? // YES = ""
	public let productBudleIdentifier: String? // com.merkova.SMDateTimeTests
	public let productName: String? // "$(TARGET_NAME)"
	public let skipInstall: String? // YES
	public let swiftVersion: String? // 4.2
	public let targetedDeviceFamily: String? // "1,2"
	public let alwaysSearchUserPaths: String? // NO
	public let clangAnalyzerNonNull: String? // YES;
	public let clangAnalyzerNumberObjectConversion: String? // YES_AGGRESSIVE;
	public let clangCxxLanguageStandart: String? // "gnu++14";
	public let clangCxxLibrary: String? // "libc++";
	public let clangEnableObjcArc: String? // YES;
	public let clangEnableObjcWeak: String? // YES;
	public let clangWarnBlockCaptureAutoReleasing: String? // YES;
	public let clangWarnboolConversion: String? // YES;
	public let clangWarnComma: String? // YES;
	public let clangWarnConstantConversion: String? // YES;
	public let clangWarnDeprecatedObjcImplementations: String? // YES;
	public let clangWarnDirectObjcIsaUsage: String? // YES_ERROR;
	public let clangWarnDocumentationComments: String? // YES;
	public let clangWarnEmptyBody: String? // YES;
	public let clangWarnEnumConversion: String? // YES;
	public let clangWarnInfiniteRecursion: String? // YES;
	public let clangWarnIntConversion: String? // YES;
	public let clangWarnNonLiteralNullConversion: String? // YES;
	public let clangWarnObjcImplicitRetainSelf: String? // YES;
	public let clangWarnObjcLiteralConversion: String? // YES;
	public let clangWarnObjcRootClass: String? // YES_ERROR;
	public let clangWarnRangeLoppAnalysis: String? // YES;
	public let clangWarnStrictPrototypes: String? // YES;
	public let clangWarnSuspiciousMove: String? // YES;
	public let clangWarnUnguardedAvailability: String? // YES_AGGRESSIVE;
	public let clangWarnUnreachableCode: String? // YES;
	public let clangWarnDuplicateMethodMatch: String? // YES;
	public let copyPhaseStrip: String? // no;
	public let currentProjectVersion: String? // 1;
	public let debugInformationFormat: String? // "dwarf-with-dsym";
	public let enableNsAssertions: String? // no;
	public let enableStrictObjcMsgSend: String? // yes;
	public let gccCLanguageStandard: String? // gnu11;
	public let gccNoCommonBlocks: String? // yes;
	public let gccWarn64To32BitConversion: String? // yes;
	public let gccWarnAboutReturnType: String? // yes_error;
	public let gccWarnUndeclaredSelector: String? // yes;
	public let gccWarnUninitializedAutos: String? // yes_aggressive;
	public let gccWarnUnusedFunction: String? // yes;
	public let gccWarnUnusedVariable: String? // yes;
	public let iphoneosDeploymentTarget: String? // 11.0;
	public let mtlEnableDebugInfo: String? // no;
	public let mtlFastMath: String? // yes;
	public let sdkRoot: String? // iphoneos;
	public let swiftCompilationMode: String? // wholemodule;
	public let swiftOptimizationLevel: String? // "-o";
	public let validateProduct: String? // yes;
	public let versioningSystem: String? // "apple-generic";
	public let versionInfoPrefix: String? // "";
	public let enableTestability: String? // YES;
	public let gccDynamicNoPic: String? // NO;
	public let gccOptimizationLevel: String? // 0;
	public let gccPreprocessorDefinitions: String? // ("DEBUG=1", "$(inherited)");
	public let onlyActiveArch: String? // YES;
	public let swiftActiveCompilationConditions: String? // DEBUG;
	
	
	init(data: [String : Any]) {
		assetCatalogCompilerAppIconName = data["ASSETCATALOG_COMPILER_APPICON_NAME"] as? String
		clangEnableModules = data["CLANG_ENABLE_MODULES"] as? String
		codeSignIdentity = data["CODE_SIGN_IDENTITY"] as? String
		codeSignStyle = data["CODE_SIGN_STYLE"] as? String
		definesModule = data["DEFINES_MODULE"] as? String
		developmentTeam = data["DEVELOPMENT_TEAM"] as? String
		frameworkSearchPaths = data["FRAMEWORK_SEARCH_PATHS"] as? [String]
		dylibCompatibilityVersion = data["DYLIB_COMPATIBILITY_VERSION"] as? String
		dylibCurrentVersion = data["DYLIB_CURRENT_VERSION"] as? String
		dylibInstallNameBase = data["DYLIB_INSTALL_NAME_BASE"] as? String
		infoPlistFile = data["INFOPLIST_FILE"] as? String
		installPath = data["INSTALL_PATH"] as? String
		ldRunPathSearchPaths = data["LD_RUNPATH_SEARCH_PATHS"] as? [String]
		alwaysEmbedSwiftStandartLibraries = data["ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES"] as? String
		productBudleIdentifier = data["PRODUCT_BUNDLE_IDENTIFIER"] as? String
		productName = data["PRODUCT_NAME"] as? String
		skipInstall = data["SKIP_INSTALL"] as? String
		swiftVersion = data["SWIFT_VERSION"] as? String
		targetedDeviceFamily = data["TARGETED_DEVICE_FAMILY"] as? String
		alwaysSearchUserPaths = data["ALWAYS_SEARCH_USER_PATHS"] as? String
		clangAnalyzerNonNull = data["CLANG_ANALYZER_NONNULL"] as? String
		clangAnalyzerNumberObjectConversion = data["CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION"] as? String
		clangCxxLanguageStandart = data["CLANG_CXX_LANGUAGE_STANDARD"] as? String
		clangCxxLibrary = data["CLANG_CXX_LIBRARY"] as? String
		clangEnableObjcArc = data["CLANG_ENABLE_OBJC_ARC"] as? String
		clangEnableObjcWeak = data["CLANG_ENABLE_OBJC_WEAK"] as? String
		clangWarnBlockCaptureAutoReleasing = data["CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING"] as? String
		clangWarnboolConversion = data["CLANG_WARN_BOOL_CONVERSION"] as? String
		clangWarnComma = data["CLANG_WARN_COMMA"] as? String
		clangWarnConstantConversion = data["CLANG_WARN_CONSTANT_CONVERSION"] as? String
		clangWarnDeprecatedObjcImplementations = data["CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS"] as? String
		clangWarnDirectObjcIsaUsage = data["CLANG_WARN_DIRECT_OBJC_ISA_USAGE"] as? String
		clangWarnDocumentationComments = data["CLANG_WARN_DOCUMENTATION_COMMENTS"] as? String
		clangWarnEmptyBody = data["CLANG_WARN_EMPTY_BODY"] as? String
		clangWarnEnumConversion = data["CLANG_WARN_ENUM_CONVERSION"] as? String
		clangWarnInfiniteRecursion = data["CLANG_WARN_INFINITE_RECURSION"] as? String
		clangWarnIntConversion = data["CLANG_WARN_INT_CONVERSION"] as? String
		clangWarnNonLiteralNullConversion = data["CLANG_WARN_NON_LITERAL_NULL_CONVERSION"] as? String
		clangWarnObjcImplicitRetainSelf = data["CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF"] as? String
		clangWarnObjcLiteralConversion = data["CLANG_WARN_OBJC_LITERAL_CONVERSION"] as? String
		clangWarnObjcRootClass = data["CLANG_WARN_OBJC_ROOT_CLASS"] as? String
		clangWarnRangeLoppAnalysis = data["CLANG_WARN_RANGE_LOOP_ANALYSIS"] as? String
		clangWarnStrictPrototypes = data["CLANG_WARN_STRICT_PROTOTYPES"] as? String
		clangWarnSuspiciousMove = data["CLANG_WARN_SUSPICIOUS_MOVE"] as? String
		clangWarnUnguardedAvailability = data["CLANG_WARN_UNGUARDED_AVAILABILITY"] as? String
		clangWarnUnreachableCode = data["CLANG_WARN_UNREACHABLE_CODE"] as? String
		clangWarnDuplicateMethodMatch = data["CLANG_WARN__DUPLICATE_METHOD_MATCH"] as? String
		copyPhaseStrip = data["COPY_PHASE_STRIP"] as? String
		currentProjectVersion = data["CURRENT_PROJECT_VERSION"] as? String
		debugInformationFormat = data["DEBUG_INFORMATION_FORMAT"] as? String
		enableNsAssertions = data["ENABLE_NS_ASSERTIONS"] as? String
		enableStrictObjcMsgSend = data["ENABLE_STRICT_OBJC_MSGSEND"] as? String
		gccCLanguageStandard = data["GCC_C_LANGUAGE_STANDARD"] as? String
		gccNoCommonBlocks = data["GCC_NO_COMMON_BLOCKS"] as? String
		gccWarn64To32BitConversion = data["GCC_WARN_64_TO_32_BIT_CONVERSION"] as? String
		gccWarnAboutReturnType = data["GCC_WARN_ABOUT_RETURN_TYPE"] as? String
		gccWarnUndeclaredSelector = data["GCC_WARN_UNDECLARED_SELECTOR"] as? String
		gccWarnUninitializedAutos = data["GCC_WARN_UNINITIALIZED_AUTOS"] as? String
		gccWarnUnusedFunction = data["GCC_WARN_UNUSED_FUNCTION"] as? String
		gccWarnUnusedVariable = data["GCC_WARN_UNUSED_VARIABLE"] as? String
		iphoneosDeploymentTarget = data["IPHONEOS_DEPLOYMENT_TARGET"] as? String
		mtlEnableDebugInfo = data["MTL_ENABLE_DEBUG_INFO"] as? String
		mtlFastMath = data["MTL_FAST_MATH"] as? String
		sdkRoot = data["SDKROOT"] as? String
		swiftCompilationMode = data["SWIFT_COMPILATION_MODE"] as? String
		swiftOptimizationLevel = data["SWIFT_OPTIMIZATION_LEVEL"] as? String
		validateProduct = data["VALIDATE_PRODUCT"] as? String
		versioningSystem = data["VERSIONING_SYSTEM"] as? String
		versionInfoPrefix = data["VERSION_INFO_PREFIX"] as? String
		enableTestability = data["ENABLE_TESTABILITY"] as? String
		gccDynamicNoPic = data["GCC_DYNAMIC_NO_PIC"] as? String
		gccOptimizationLevel = data["GCC_OPTIMIZATION_LEVEL"] as? String
		gccPreprocessorDefinitions = data["GCC_PREPROCESSOR_DEFINITIONS"] as? String
		onlyActiveArch = data["ONLY_ACTIVE_ARCH"] as? String
		swiftActiveCompilationConditions = data["SWIFT_ACTIVE_COMPILATION_CONDITIONS"] as? String
	}
	
}
