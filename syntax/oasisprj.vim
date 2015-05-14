if version >= 600
	if exists("b:current_syntax")
		finish
	endif
else
	syntax clear
endif

"syn match oprojComment "^\s*#.*$" contains=oprojTodo
syn region  oprojComment	start="#" end="^$" end="[^\\]$" keepend contains=oprojTodo
syn keyword oprojTodo NOTE FIXME TODO XXX NOT

syn match oprojDeref /\$\w\+/
syn match oprojFieldDelim /[+\$]\?:/ contained
syn cluster oprojInner contains=oprojDeref,oprojComment,oprojLink
"syn match oprojNumber "\<\d\+\(\.\d\+\)*\>"
syn match oprojLink "\w\{2,6\}:\(\/\/\)\?\(\w\|[\-&=,?\:\.\/]\)*"

syn match oprojTop "^\s*\(OASISFormat\|AlphaFeatures\|BetaFeatures\|Name\|Version\|Synopsis\|Description\|Authors\|Copyrights\|Maintainers\|LicenseFile\|License\|OCamlVersion\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(FindlibVersion\|ConfType\|PreConfCommand\|PostConfCommand\|BuildType\|PreBuildCommand\|PostBuildCommand\|InstallType\|PreInstallCommand\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(PostInstallCommand\|PreUninstallCommand\|PostUninstallCommand\|PreCleanCommand\|PostCleanCommand\|PreDistcleanCommand\|PostDistcleanCommand\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(Homepage\|Categories\|FilesAB\|Plugins\|DisableOASISSection\|BuildDepends\|BuildTools\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(OASISFormat\|AlphaFeatures\|BetaFeatures\|Name\|Version\|Synopsis\|Description\|Authors\|Copyrights\|Maintainers\|LicenseFile\|License\|OCamlVersion\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(FindlibVersion\|ConfType\|PreConfCommand\|PostConfCommand\|BuildType\|PreBuildCommand\|PostBuildCommand\|InstallType\|PreInstallCommand\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(PostInstallCommand\|PreUninstallCommand\|PostUninstallCommand\|PreCleanCommand\|PostCleanCommand\|PreDistcleanCommand\|PostDistcleanCommand\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim
syn match oprojTop "^\s*\(Homepage\|Categories\|FilesAB\|Plugins\|DisableOASISSection\|BuildDepends\|BuildTools\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim

syn match oprojXTop "^\s*\(XCustomConf\|XCustomConfClean\|XCustomConfDistclean\|XCustomBuild\|XCustomBuildClean\|XCustomBuildDistclean\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XCustomInstall\|XCustomInstallClean\|XCustomInstallDistclean\|XCustomUninstall\|XCustomUninstallClean\|XCustomUninstallDistclean\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XOCamlbuildPluginTags\|XOCamlbuildExtraArgs\|XStdFilesREADME\|XStdFilesREADMEFilename\|XStdFilesINSTALL\|XStdFilesINSTALLFilename\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XStdFilesAUTHORS\|XStdFilesAUTHORSFilename\|XDevFilesMakefileNoTargets\|XDevFilesEnableMakefile\|XDevFilesEnableConfigure\):"me=e-1 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XCustomConf\|XCustomConfClean\|XCustomConfDistclean\|XCustomBuild\|XCustomBuildClean\|XCustomBuildDistclean\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XCustomInstall\|XCustomInstallClean\|XCustomInstallDistclean\|XCustomUninstall\|XCustomUninstallClean\|XCustomUninstallDistclean\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XOCamlbuildPluginTags\|XOCamlbuildExtraArgs\|XStdFilesREADME\|XStdFilesREADMEFilename\|XStdFilesINSTALL\|XStdFilesINSTALLFilename\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim
syn match oprojXTop "^\s*\(XStdFilesAUTHORS\|XStdFilesAUTHORSFilename\|XDevFilesMakefileNoTargets\|XDevFilesEnableMakefile\|XDevFilesEnableConfigure\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim

syn region regionFlag matchgroup=oprojSection start="^\s*Flag\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojFlag
syn region regionLibrary matchgroup=oprojSection start="^\s*Library\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojCommon,oprojLibrary,oprojXLibrary
syn region regionObject matchgroup=oprojSection start="^\s*Object\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojCommon,oprojObject
syn region regionExecutable matchgroup=oprojSection start="^\s*Executable\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojCommon,oprojExecutable
syn region regionDocument matchgroup=oprojSection start="^\s*Document\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojDocument,oprojXDocument
syn region regionTest matchgroup=oprojSection start="^\s*Test\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojTest,oprojXTest
syn region regionSourceRepository matchgroup=oprojSection start="^\s*SourceRepository\>" end="^s*\(Flag\|Library\|Object\|Executable\|Document\|Test\|SourceRepository\|if\)\>"me=s-1 contains=@oprojInner,oprojSourceRepository

syn match oprojCommon "^\s*\(Path\|Build\|Install\|DataFiles\|BuildDepends\|BuildTools\|CompiledObject\|CSources\|CCOpt\|CCLib\|DllLib\|DllPath\|ByteOpt\|NativeOpt\):"me=e-1 nextgroup=oprojFieldDelim contained 
syn match oprojFlag "^\s*\(Description\|Default\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojLibrary "^\s*\(Modules\|InternalModules\|Pack\|FindlibParent\|FindlibName\|FindlibContainers\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojObject "^\s*\(Modules\|FindlibFullName \):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojExecutable "^\s*\(MainIs\|Custom\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojDocument "^\s*\(BuildTools\|Type\|PreCommand\|PostCommand\|Title\|Authors\|Abstract\|Format\|Index\|InstallDir\|Build\|Install\|DataFiles\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojTest "^\s*\(Type\|TestTools\|Command\|WorkingDirectory\|PreCommand\|PostCommand\|Run\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojSourceRepository "^\s*\(Type\|Location\|Browser\|Module\|Branch\|Tag\|Subdir\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojFlag "^\s*\(Description\|Default\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojCommon "^\s*\(Path\|Build\|Install\|DataFiles\|BuildDepends\|BuildTools\|CompiledObject\|CSources\|CCOpt\|CCLib\|DllLib\|DllPath\|ByteOpt\|NativeOpt\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained 
syn match oprojLibrary "^\s*\(Modules\|InternalModules\|Pack\|FindlibParent\|FindlibName\|FindlibContainers\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojObject "^\s*\(Modules\|FindlibFullName \)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojExecutable "^\s*\(MainIs\|Custom\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojDocument "^\s*\(BuildTools\|Type\|PreCommand\|PostCommand\|Title\|Authors\|Abstract\|Format\|Index\|InstallDir\|Build\|Install\|DataFiles\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojTest "^\s*\(Type\|TestTools\|Command\|WorkingDirectory\|PreCommand\|PostCommand\|Run\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojSourceRepository "^\s*\(Type\|Location\|Browser\|Module\|Branch\|Tag\|Subdir\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained

syn match oprojXLibrary "^\s*\(XMETAEnable\|XMETADescription\|XMETAType\|XMETAExtraLines\|XMETARequires\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojXDocument "^\s*\(XOCamlbuildPath\|XOCamlbuildModules\|XOCamlbuildLibraries\|XOCamlbuildPluginTags\|XOCamlbuildExtraArgs\|XCustom\|XCustomClean\|XCustomDistclean\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojXTest "^\s*\(XCustomClean\|XCustomDistclean\):"me=e-1 nextgroup=oprojFieldDelim contained
syn match oprojXLibrary "^\s*\(XMETAEnable\|XMETADescription\|XMETAType\|XMETAExtraLines\|XMETARequires\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojXDocument "^\s*\(XOCamlbuildPath\|XOCamlbuildModules\|XOCamlbuildLibraries\|XOCamlbuildPluginTags\|XOCamlbuildExtraArgs\|XCustom\|XCustomClean\|XCustomDistclean\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained
syn match oprojXTest "^\s*\(XCustomClean\|XCustomDistclean\)[+\$]:"me=e-2 nextgroup=oprojFieldDelim contained

"TODO: find a better way 
syn sync fromstart

if version >= 508 || !exists("did_oasis_syntax_inits")
	if version < 508
		let did_oasis_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink oprojComment	Comment
	HiLink oprojTodo	ToDo
	HiLink oprojTop		Identifier
	HiLink oprojCommon	Identifier
	HiLink oprojFlag	Identifier
	HiLink oprojLibrary	Identifier
	HiLink oprojObject	Identifier
	HiLink oprojExecutable	Identifier
	HiLink oprojDocument	Identifier
	HiLink oprojTest	Identifier
	HiLink oprojSourceRepository	Identifier
	HiLink oprojString	String
	HiLink oprojSection	Label
        HiLink oprojFieldDelim	Delimiter
        HiLink oprojXLibrary    Special
        HiLink oprojXDocument   Special
        HiLink oprojXTest       Special
        HiLink oprojXTop        Special
	HiLink oprojError	Error
	HiLink oprojDeref	PreProc
	HiLink oprojLink        Underlined
	"HiLink oprojNumber      Number

	delcommand HiLink
endif
let b:current_syntax = "oasis-build"
