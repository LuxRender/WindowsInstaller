; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "LuxRender"
#define MyAppVersion "1.5"
#define MyAppVerName "LuxRender 1.5"
#define MyAppPublisher "LuxRender"
#define MyAppURL "http://www.luxrender.net"
#define MyAppExeName "luxrender.exe"
;#define MyAppArch "x86"
#define MyAppArch "x64"
#define MyAppCLArch "OpenCL"
;#define MyAppCLArch "NoOpenCL"

#define PackageLuxBlend25
;#define PackageLuxMax
;#define PackageLuxXSI

#define MyAppBitness StringChange(StringChange(MyAppArch, "x86", "32"), "x64", "64")
#define MyAppBitnessStr StringChange(StringChange(MyAppArch, "x86", "32bit"), "x64", "64bit")
#define MyLuxFileRoot StringChange("LuxRender " + MyAppBitness + " " + MyAppCLArch, " ", "_")  
#define LuxBlend26File StringChange("LuxBlend27 " + MyAppVersion + " " + MyAppBitnessStr + " " + MyAppCLArch + ".zip", " ", "_")
#define LuxBlend26Readme "LuxBlend27_README.rtf"  
#define VCRedistFile "vcredist_" + MyAppArch + ".exe"
#pragma message "Lux file root: '" + MyLuxFileRoot + "'"
#pragma message "LuxBlend27 file: '" + LuxBlend26File + "'"

#define MyAppRegRoot "SOFTWARE\LuxRender"

#define ExampleSceneDir "{commondocs}\LuxRender\Example Scene"
#define ExampleSceneFile "LuxRender_test_scene.lxs"

#define RegValInstallDir "InstallDir"
#define RegValFirewallException "FirewallException"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C289183E-1DD8-42FA-8DFE-94F61ED1CFA3}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppVerName} {#MyAppArch} {#MyAppCLArch}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=Source\gpl-3.0.txt
InfoAfterFile=Source\infoafter.txt
OutputBaseFilename={#MyAppVerName} {#MyAppArch} {#MyAppCLArch} Setup
Compression=lzma/ultra64
SolidCompression=true
MinVersion=0,5.0.2195
ChangesEnvironment=true
ChangesAssociations=true
InternalCompressLevel=ultra64
VersionInfoVersion=1.3.199
VersionInfoDescription={#MyAppName} {#MyAppArch} {#MyAppCLArch}
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion=1.3.199
VersionInfoCompany={#MyAppPublisher}
UninstallDisplayIcon={app}\luxrender.exe
WizardImageFile=Source\wizardimage4.bmp
WizardImageBackColor=clBlack
WizardSmallImageFile=Source\wizardimagesmall.bmp
#if Copy(MyAppArch, 1, 3) == "x64"
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
#endif

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"

[Types]
Name: "default"; Description: {cm:DefaultInstallation}
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: main; Description: LuxRender; Flags: fixed; Types: default full compact custom; Languages: 
Name: examplescene; Description: Example Scene; Types: default full; Languages: 
Name: exporters; Description: Exporters; Types: full
;Name: exporters\luxblend; Description: LuxBlend - Exporter for Blender 2.49; Types: full
#ifdef PackageLuxBlend25
Name: exporters\luxblend25; Description: LuxBlend27 - Exporter for Blender 2.7x; Flags: checkablealone; Types: full
#endif
#ifdef PackageLuxMax
Name: exporters\luxmax; Description: LuxMax - Exporter for 3ds Max {#MyAppArch} 2010-2012; Types: full
#endif
#ifdef PackageLuxXSI
Name: exporters\luxsi; Description: LuXSI - Exporter for Softimage (x86 only); Types: full
#endif

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: firewallexception; Description: {cm:AddFirewallException}; GroupDescription: {cm:AdditionalTasks}; Components: main; MinVersion: 0,5.01.2600
Name: addtopath; Description: {cm:AddToPath}; GroupDescription: {cm:AdditionalTasks}; Components: main
Name: associatelxs; Description: {cm:AssociateLXS}; GroupDescription: {cm:AdditionalTasks}; Components: main; Flags: unchecked checkablealone
Name: associatelxs\noicons; Description: {cm:AssociateLXSNoIcons}; GroupDescription: {cm:AdditionalTasks}; Flags: exclusive; Components: main
Name: associatelxs\icons1; Description: {cm:AssociateLXSIcons1}; GroupDescription: {cm:AdditionalTasks}; Flags: exclusive unchecked; Components: main
Name: associatelxs\icons2; Description: {cm:AssociateLXSIcons2}; GroupDescription: {cm:AdditionalTasks}; Flags: exclusive unchecked; Components: main

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: Source\Files\{#VCRedistFile}; DestDir: {tmp}; Flags: deleteafterinstall ignoreversion
Source: Source\Files\{#MyLuxFileRoot}\*; Excludes: "LuxBlend*.py, PyLux\*"; DestDir: {app}; Flags: recursesubdirs ignoreversion; Components: main
Source: Source\Files\COPYING.txt; DestDir: {app}; Flags: ignoreversion; Components: ; Tasks: ; Languages: 
Source: Source\Files\README.txt; DestDir: {app}; Flags: ignoreversion; Components: ; Tasks: ; Languages: 
Source: Source\Files\run_slave.cmd; DestDir: {app}; Flags: ignoreversion; Components: main
Source: Source\Files\Example Scene\*; DestDir: {#ExampleSceneDir}; Flags: recursesubdirs uninsneveruninstall onlyifdoesntexist; Components: examplescene

;Source: Source\Files\LuxBlend_0.1.py; DestDir: {code:GetBlenderScriptDir}; Flags: ignoreversion; Components: exporters\luxblend; DestName: LuxBlend_{#MyAppVersion}.py
#ifdef PackageLuxBlend25
;Source: Source\Files\LuxBlend25\luxrender\*; DestDir: {code:GetBlender25ScriptDir}\addons\luxrender; Flags: ignoreversion recursesubdirs; Components: exporters\luxblend25;
;Source: Source\Files\LuxBlend25\presets\*; DestDir: {code:GetBlender25ScriptDir}\presets; Flags: ignoreversion recursesubdirs; Components: exporters\luxblend25;
;Source: Source\Files\{#MyLuxFileRoot}\PyLux\Python3\*; DestDir: {code:GetBlender25ScriptDir}\addons\luxrender; Flags: ignoreversion; Components: exporters\luxblend25\pylux;
Source: Source\Files\{#MyLuxFileRoot}\{#LuxBlend26File}; DestDir: {app}; Flags: ignoreversion;  Components: exporters\luxblend25;
Source: Source\Files\{#LuxBlend26Readme}; DestDir: {app}; Flags: ignoreversion;  Components: exporters\luxblend25;
#endif
#ifdef PackageLuxMax
Source: Source\Files\LuxMax\Scripts\*; DestDir: {code:GetMaxRootDir}\Scripts; Flags: ignoreversion recursesubdirs; Components: exporters\luxmax;
Source: Source\Files\LuxMax\Plugins\*; DestDir: {code:GetMaxRootDir}\Plugins; Flags: ignoreversion recursesubdirs; Components: exporters\luxmax;
#endif
#ifdef PackageLuxXSI
Source: Source\Files\LuXSI\*; DestDir: {code:GetXSIAddonsDir}\LuXSI; Flags: ignoreversion recursesubdirs; Components: exporters\luxsi;
#endif

Source: Source\Files\Icons\Scheme1\*; DestDir: {app}\Icons\Scheme1; Flags: ignoreversion; Components: ; Tasks: associatelxs; Languages: 
Source: Source\Files\Icons\Scheme2\*; DestDir: {app}\Icons\Scheme2; Flags: ignoreversion; Components: ; Tasks: associatelxs; Languages: 
Source: Source\Files\Icons\Scheme3\*; DestDir: {app}\Icons\Scheme3; Flags: ignoreversion; Components: ; Tasks: associatelxs; Languages: 
Source: Source\Files\Icons\Scheme4\*; DestDir: {app}\Icons\Scheme4; Flags: ignoreversion; Components: ; Tasks: associatelxs; Languages: 

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {group}\{cm:WebsiteName}; Filename: {#MyAppURL}; Flags: excludefromshowinnewinstall; 
Name: {group}\{cm:StartLuxRenderSlave}; Filename: {app}\run_slave.cmd; IconFilename: {app}\luxconsole.exe; Flags: excludefromshowinnewinstall;
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon; Flags: excludefromshowinnewinstall;
Name: {group}\{cm:ExampleScene}; Filename: {commondocs}\LuxRender\Example Scene; Comment: Folder containg the example scenes; Flags: foldershortcut excludefromshowinnewinstall; Components: examplescene;
Name: {group}\{cm:ReadmeFile}; Filename: {app}\README.txt; Flags: excludefromshowinnewinstall;
#ifdef PackageLuxBlend25
Name: {group}\{cm:LuxBlend25ReadmeFile}; Filename: {app}\{#LuxBlend26Readme}; Flags: excludefromshowinnewinstall;
#endif
#ifdef PackageLuxMax
Name: {group}\{cm:LuxMaxDocumentation}; Filename: http://www.luxrender.net/forum/viewtopic.php?f=33&t=6258; Comment: {cm:LuxMaxDocumentation} (web); Flags: excludefromshowinnewinstall; Components: exporters\luxmax;
#endif

[InstallDelete]
Name: {app}\LuxRender.url; Type: files
;Name: {code:GetBlenderScriptDir}\LuxBlend_0.6.py; Type: files; Components: exporters\luxblend; Tasks: ; Languages: 
;Name: {code:GetBlenderScriptDir}\LuxBlend_0.7.py; Type: files; Components: exporters\luxblend; Tasks: ; Languages: 
Name: {app}\Icons\Scheme1; Type: dirifempty
Name: {app}\Icons\Scheme2; Type: dirifempty
Name: {app}\Icons\Scheme3; Type: dirifempty
Name: {app}\Icons\Scheme4; Type: dirifempty
Name: {app}\Icons; Type: dirifempty

[Run]
Filename: {tmp}\{#VCRedistFile}; Parameters: "/install /passive"; StatusMsg: "Installing Visual C++ 2013 Redistributable Package..."
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#MyAppName}}; Flags: nowait postinstall skipifsilent; WorkingDir: {code:LuxRunParameters}
#ifdef PackageLuxBlend25
Filename: {app}\{#LuxBlend26Readme}; Description: {cm:LaunchLuxBlend25Readme}; Flags: shellexec nowait postinstall skipifsilent;
#endif
#ifdef PackageLuxXSI
Filename: {code:GetXSIAddonsDir}\LuXSI\README.txt; Description: View the LuXSI readme; Flags: shellexec nowait postinstall skipifsilent; Components: exporters\luxsi;
#endif

[Registry]
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Session Manager\Environment; ValueType: string; ValueName: LUXRENDER_ROOT; ValueData: {app}; Flags: uninsdeletevalue; Components: ; Tasks: ; Languages: 
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Session Manager\Environment; ValueType: expandsz; ValueName: Path; ValueData: "{olddata};%LUXRENDER_ROOT%"; Tasks: addtopath; Languages: ; Flags: preservestringtype dontcreatekey; Check: NotAlreadyInPath
Root: HKCR; SubKey: .lxs; ValueType: string; ValueData: LuxRender.SceneFile; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.SceneFile; ValueType: string; ValueData: LuxRender Scene File; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.SceneFile\Shell; ValueType: string; ValueData: Open; Flags: uninsdeletevalue; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.SceneFile\Shell\Open\Command; ValueType: string; ValueData: """{app}\luxrender.exe"" ""%1"""; Flags: uninsdeletevalue; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.SceneFile\Shell\Edit\Command; ValueType: expandsz; ValueData: "%SystemRoot%\system32\NOTEPAD.EXE ""%1"""; Flags: uninsdeletevalue; Tasks: associatelxs
Root: HKCR; Subkey: LuxRender.SceneFile\DefaultIcon; ValueType: string; ValueData: {app}\luxrender.exe,0; Flags: uninsdeletevalue; Tasks: associatelxs\noicons
Root: HKCR; Subkey: LuxRender.SceneFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme1\LuxRender snow lxs.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
Root: HKCR; Subkey: LuxRender.SceneFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme2\LuxRender stealth lxs.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
;Root: HKCR; Subkey: LuxRender.SceneFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme3\big S lxs green aura snow.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
;Root: HKCR; Subkey: LuxRender.SceneFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme4\big S lxs green aura stealth.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
Root: HKCR; SubKey: .lxm; ValueType: string; ValueData: LuxRender.MaterialFile; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.MaterialFile; ValueType: string; ValueData: LuxRender Material Definition File; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; Subkey: LuxRender.MaterialFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme1\LuxRender snow lbm ball.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
Root: HKCR; Subkey: LuxRender.MaterialFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme2\LuxRender stealth lbm ball.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
;Root: HKCR; Subkey: LuxRender.MaterialFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme3\big M lxm blender aura snow.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
;Root: HKCR; Subkey: LuxRender.MaterialFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme4\big M lxm blender aura stealth.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
Root: HKCR; SubKey: .lxo; ValueType: string; ValueData: LuxRender.GeometryFile; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.GeometryFile; ValueType: string; ValueData: LuxRender Geometry File; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; Subkey: LuxRender.GeometryFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme1\LuxRender snow lxo mercury moon.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
Root: HKCR; Subkey: LuxRender.GeometryFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme2\LuxRender stealth lxo mercury moon.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
;Root: HKCR; Subkey: LuxRender.GeometryFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme3\big O lxo blender aura snow.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
;Root: HKCR; Subkey: LuxRender.GeometryFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme4\big O lxo blender aura stealth.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
Root: HKCR; SubKey: .lxv; ValueType: string; ValueData: LuxRender.VolumeFile; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.VolumeFile; ValueType: string; ValueData: LuxRender Scene Volume Definition File; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; Subkey: LuxRender.VolumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme1\LuxRender snow lxv smoke.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
Root: HKCR; Subkey: LuxRender.VolumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme2\LuxRender stealth lxv smoke.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
;Root: HKCR; Subkey: LuxRender.VolumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme3\big V lxv blender aura snow.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
;Root: HKCR; Subkey: LuxRender.VolumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme4\big V lxv blender aura stealth.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
Root: HKCR; SubKey: .flm; ValueType: string; ValueData: LuxRender.ResumeFile; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; SubKey: LuxRender.ResumeFile; ValueType: string; ValueData: LuxRender Resume FLM File; Flags: uninsdeletekey; Tasks: associatelxs
Root: HKCR; Subkey: LuxRender.ResumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme1\LuxRender snow flm lens.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
Root: HKCR; Subkey: LuxRender.ResumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme2\LuxRender stealth flm lens.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
;Root: HKCR; Subkey: LuxRender.ResumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme3\big M flm blue aura snow.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons1
;Root: HKCR; Subkey: LuxRender.ResumeFile\DefaultIcon; ValueType: string; ValueData: {app}\Icons\Scheme4\big M flm blue aura stealth.ico; Flags: uninsdeletevalue; Tasks: associatelxs\icons2
Root: HKLM; Subkey: {#MyAppRegRoot}; ValueType: string; ValueName: {#RegValInstallDir}; ValueData: {app}; Flags: uninsdeletekeyifempty uninsdeletevalue
Root: HKLM; Subkey: {#MyAppRegRoot}; ValueType: dword; ValueName: {#RegValFirewallException}; ValueData: 1; Tasks: firewallexception; Flags: uninsdeletekeyifempty uninsdeletevalue; Components: 

[CustomMessages]
BlenderScriptDirCaption=Select Blender 2.72 script directory
BlenderScriptDirDesc=Where should LuxBlend be installed?
BlenderScriptDirSubCaption=In order to function, LuxBlend needs to be installed in the Blender 2.72 scripts directory. This is typically the directory named "scripts" located inside the ".blender" directory you use.%n%nVerify or select the Blender 2.72 script directory in which Setup should install LuxBlend, then click Next.
BlenderPythonCaption=Python support
BlenderPythonDesc=Please read the following important information before continuing.
BlenderPythonSubCaption=LuxBlend requires Python functionality
BlenderPythonMsg2=LuxBlend {\b requires} full Python functionality in Blender. Thus you need to ensure that Blender is set up with full Python functionality. This requires that the correct version of Python is installed separately. For example if you use Blender 2.72, you should install Python 3.4.x.\par%n\par%nFor more information on how to set up Blender with full Python functionality see http://wiki.blender.org/index.php/Doc:Manual/Introduction/Installing_Blender/Python \par%n\par%nFor information on how to download Python see http://www.python.org/download/ \par
BlenderPythonMsg={\colortbl ;\red255\green0\blue0;}Setup could not locate Python. {\cf1 LuxBlend will not function without full Python support in Blender 2.72}. You should install the same Python version as Blender was compiled with in order to get full Python support. For example if you use Blender 2.72, you should install Python 3.4.x.\par%n\par%nFor more information on how to set up Blender with full Pyton functionality see http://wiki.blender.org/index.php/Doc:Manual/Introduction/Installing_Blender/Python \par%n\par%nFor information on how to download Python see http://www.python.org/download/ \par
VerifyLuxBlendLocation=Are you sure you want to install LuxBlend into the following directory?%n%n"%1"%n%nIt seems that the directory is not a regular Blender 2.49 script directory.%n
LuxBlendLocation=LuxBlend location:

Blender25ScriptDirCaption=Select Blender 2.7x script directory
Blender25ScriptDirDesc=Where should LuxBlend27 be installed?
Blender25ScriptDirSubCaption=In order to function, LuxBlend27 needs to be installed in the Blender 2.7x scripts directory.%n%nVerify or select the Blender 2.7x script directory in which Setup should install LuxBlend27, then click Next.%n%nNote: do not select the "addons" directory, but the parent of the "addons" directory.
VerifyLuxBlend25Location=Are you sure you want to install LuxBlend27 into the following directory?%n%n"%1"%n%nIt seems that the directory is not a regular Blender 2.7x script directory.
LuxBlend25Location=LuxBlend27 location:
LuxBlend25ReadmeFile=LuxBlend27 installation instructions
LaunchLuxBlend25Readme=View the LuxBlend27 installation instructions

MaxRootDirCaption=Select LuxMax installation directory
MaxRootDirDesc=Where should LuxMax be installed?
MaxRootDirSubCaption=In order to function, LuxMax needs to be installed in the 3ds Max scripts and plugin directories.%n%nVerify or select the 3ds Max root directory in which Setup should install LuxMax, then click Next.
VerifyMaxLocation=Are you sure you want to install LuxMax into the following directory?%n%n"%1"%n%nIt seems that the directory is not a proper 3ds Max root directory.%n
MaxLocation=LuxMax location:
LuxMaxDocumentation=LuxMax Documentation

XSIAddonsDirCaption=Select LuXSI installation directory
XSIAddonsDirDesc=Where should LuXSI be installed?
XSIAddonsDirSubCaption=In order to function, LuXSI needs to be installed in the Softimage addons directory.%n%nVerify or select the Softimage addon directory in which Setup should install LuXSI, then click Next.
VerifyXSIAddonsLocation=Are you sure you want to install LuXSI into the following directory?%n%n"%1"%n%nIt seems that the directory is not a proper Softimage addons directory.%n
XSIAddonsLocation=LuXSI location:

DefaultInstallation=Default installation
AdditionalTasks=Additional options:
AddToPath=Add install directory to system PATH. This makes it easier to use luxconsole and luxmerger.
AssociateLXS=Associate LuxRender Scene Files (.lxs etc) with LuxRender.
AssociateLXSNoIcons=Use default icon scheme.
AssociateLXSIcons1=Use light gray icon scheme.
AssociateLXSIcons2=Use dark gray icon scheme.
WebsiteName={#MyAppName} Website
ExampleScene=Example Scenes
ExampleLocation=Example scenes location:
StartLuxRenderSlave=Start LuxRender Slave
AddFirewallException=Add Firewall exception for LuxRender slave
LuxConsole={#MyAppName} Slave
ReadmeFile=Readme file

[Code]
var
	BlenderScriptDirPage: TInputDirWizardPage;
	Blender25ScriptDirPage: TInputDirWizardPage;
	PythonInfoPage: TOutputMsgMemoWizardPage;
	MaxRootDirPage: TInputDirWizardPage;
	XSIAddonsDirPage: TInputDirWizardPage;

function NotAlreadyInPath: boolean;
var
	sl: TStringList;
	s: string;
begin
	result:= false;
	sl:= TStringList.Create;
	try
		if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
				'System\CurrentControlSet\Control\Session Manager\Environment',
				'Path', s) then
			// return false since we couldn't determine status
			exit;
		StringChangeEx(s, ';', #13#10, true);
		sl.Text:= s;
		if sl.IndexOf('%LUXRENDER_ROOT%') >= 0 then
			exit;
	finally
		sl.Free;
	end;
	result:= true;
end;

function FindBlenderScriptDir: string;
var
	regRoot: array[0..15] of integer;
	i, rootCount: integer;
	sl: TStringList;
begin
	result:= '';

	rootCount:= 0;
	if IsWin64 then
	begin
		regRoot[rootCount]:= HKEY_LOCAL_MACHINE_64;
		rootCount:= rootCount + 1;
		regRoot[rootCount]:= HKEY_CURRENT_USER_64;
		rootCount:= rootCount + 1;
	end;
	regRoot[rootCount]:= HKEY_LOCAL_MACHINE_32;
	rootCount:= rootCount + 1;
	regRoot[rootCount]:= HKEY_CURRENT_USER_32;
	rootCount:= rootCount + 1;

	// Set default directory if empty
	for i:= 0 to rootCount-1 do
	begin
		if RegQueryStringValue(regRoot[i], 'SOFTWARE\BlenderFoundation',
				'Home_Dir', result) then
		begin
			result:= AddBackslash(result) + '.blender\scripts';
			exit;
		end
	end;

	// not in registry, try other env and places
	sl:= TStringList.Create;
	try
		sl.Add(AddBackslash(GetEnv('HOME')) + '.blender\scripts');
		sl.Add(AddBackslash(ExpandConstant('{userdocs}')) + '.blender\scripts');
		sl.Add(AddBackslash(ExpandConstant('{commondocs}')) + '.blender\scripts');
		for i:= 0 to sl.Count-1 do
		begin
		  if DirExists(sl[i]) then
      begin
        result:= sl[i];
        break;
      end;
		end;
	finally
		sl.free;
	end;
end;

function FindBlender25ScriptDir: string;
var
	regRoot: array[0..15] of integer;
	i, rootCount: integer;
	sl: TStringList;
	droot, ver: string;
	fr: TFindRec;
	cont: boolean;
begin
	result:= '';

	rootCount:= 0;
	if IsWin64 then
	begin
		regRoot[rootCount]:= HKEY_LOCAL_MACHINE_64;
		rootCount:= rootCount + 1;
		regRoot[rootCount]:= HKEY_CURRENT_USER_64;
		rootCount:= rootCount + 1;
	end;
	regRoot[rootCount]:= HKEY_LOCAL_MACHINE_32;
	rootCount:= rootCount + 1;
	regRoot[rootCount]:= HKEY_CURRENT_USER_32;
	rootCount:= rootCount + 1;

  // this is the proper location	
  droot:= AddBackslash(ExpandConstant('{userappdata}')) + 'Blender Foundation\Blender\';

  // get installed blender version
  ver := '2.70'; // assume first official
	for i:= 0 to rootCount-1 do
	begin
	  if RegQueryStringValue(regRoot[i], 'SOFTWARE\BlenderFoundation',
			'ShortVersion', result) then				
		begin
		  ver := result;
      result:= droot + ver + '\scripts';
		  exit;		
	 	end;
	end;

  
  // otherwise try to locate latest  
  cont:= FindFirst(droot + '?.*', fr); 

  while cont do
  begin
    //MsgBox(fr.Name, mbInformation, MB_OK);
    if CompareText(ver, fr.Name) < 0 then
      ver:= fr.Name;
    
    cont:= FindNext(fr);   
  end;

	FindClose(fr);
    
	result:= droot + ver + '\scripts';

  //MsgBox(result, mbInformation, MB_OK);
	
	if not DirExists(RemoveBackslashUnlessRoot(result)) then
    result:= '';	
end;

function LocatePython: boolean;
var
	regRoot: array[0..15] of integer;
	pythonRoot: array[0..0] of string;
	i, j, rootCount: integer;
	keys: TArrayOfString;
begin
	rootCount:= 0;
	if IsWin64 then
	begin
		regRoot[rootCount]:= HKEY_LOCAL_MACHINE_64;
		rootCount:= rootCount + 1;
		regRoot[rootCount]:= HKEY_CURRENT_USER_64;
		rootCount:= rootCount + 1;
	end;
	regRoot[rootCount]:= HKEY_LOCAL_MACHINE_32;
	rootCount:= rootCount + 1;
	regRoot[rootCount]:= HKEY_CURRENT_USER_32;
	rootCount:= rootCount + 1;

	pythonRoot[0]:= 'SOFTWARE';
	for i:= 0 to rootCount-1 do
	begin
		for j:= 0 to 0 do
		begin
			result:= RegGetSubkeyNames(regRoot[i], pythonRoot[j] + '\Python\PythonCore', keys);
			result:= result and (GetArrayLength(keys) > 0);
			if result then
				exit;
		end;
	end;
	result:= (GetEnv('PYTHONPATH') <> '') and (DirExists(GetEnv('PYTHONPATH')));
end;

function FindMaxRootDir: string;
var
	regRoot: array[0..15] of integer;
	i, VerI, rootCount: integer;
	sl: TStringList;
begin
	result:= '';

	rootCount:= 0;
	if IsWin64 then
	begin
		regRoot[rootCount]:= HKEY_LOCAL_MACHINE_64;
		rootCount:= rootCount + 1;
		regRoot[rootCount]:= HKEY_CURRENT_USER_64;
		rootCount:= rootCount + 1;
	end;
	regRoot[rootCount]:= HKEY_LOCAL_MACHINE_32;
	rootCount:= rootCount + 1;
	regRoot[rootCount]:= HKEY_CURRENT_USER_32;
	rootCount:= rootCount + 1;

	// Set default directory if empty
	for i:= 0 to rootCount-1 do
	begin
    for VerI := 14 downto 12 do
    begin
      if RegQueryStringValue(regRoot[i], 'Autodesk\3dsMax' + IntToStr(VerI) + '.0\MAX-1:409',
        'Installdir', result) then
      begin
        result:= AddBackslash(result);
        exit;
      end;
		end;
	end;
end;

function FindXSIAddonsDir: string;
var
	regRoot: array[0..15] of integer;
	i, VerI, rootCount: integer;
	sl: TStringList;
begin
	result:= '';

	sl:= TStringList.Create;
	try
		sl.Add(AddBackslash(GetEnv('XSI_USERHOME')) + '\Addons');
		for i:= 0 to sl.Count-1 do
		begin
      if DirExists(RemoveBackslashUnlessRoot(sl[i])) then
      begin
        result:= sl[i];
        break;
      end;
    end;
	finally
		sl.free;
	end;
end;

function SanityCheckBlenderScriptDir(ScriptDir: string): boolean;
var
  FindRec: TFindRec;
begin
	result:= False;
	if not DirExists(RemoveBackslashUnlessRoot(ScriptDir)) then
		exit;
	if not DirExists(ScriptDir + 'bpydata') then
		exit;
	if not FindFirst(ScriptDir + '*.py', FindRec) then
		exit;
	FindClose(FindRec);
	result:= True;
end;

function SanityCheckBlender25ScriptDir(ScriptDir: string): boolean;
begin
	result:= False;
	// can't assume much more than this
	if CompareText(ExtractFileName(RemoveBackslashUnlessRoot(ScriptDir)), 'scripts') <> 0 then
	  exit; 
{		
	if not DirExists(RemoveBackslashUnlessRoot(ScriptDir)) then
		exit;
	if not DirExists(ScriptDir + 'addons') then
		exit;
	if not DirExists(ScriptDir + 'modules') then
		exit;
	if not DirExists(ScriptDir + 'presets') then
		exit;
}
	result:= True;
end;

function SanityCheckMaxRootDir(ScriptDir: string): boolean;
begin
	result:= False;
	if not DirExists(RemoveBackslashUnlessRoot(ScriptDir)) then
		exit;
	if not DirExists(ScriptDir + 'Scripts') then
		exit;
	if not DirExists(ScriptDir + 'Plugins') then
		exit;
	if not FileExists(ScriptDir + '3dsmax.exe') then
	  exit;
	result:= True;
end;

function SanityCheckXSIAddonsDir(ScriptDir: string): boolean;
begin
	result:= False;
	if not DirExists(RemoveBackslashUnlessRoot(ScriptDir)) then
		exit;
	if CompareText(ExtractFileName(RemoveBackslashUnlessRoot(ScriptDir)), 'Addons') <> 0 then
		exit;
	result:= True;
end;

procedure InitializeWizard;
begin
	XSIAddonsDirPage := CreateInputDirPage(wpSelectComponents,
		CustomMessage('XSIAddonsDirCaption'), CustomMessage('XSIAddonsDirDesc'),
		CustomMessage('XSIAddonsDirSubCaption'),
		False, '');
	XSIAddonsDirPage.Add('');
  XSIAddonsDirPage.Values[0] := GetPreviousData('XSIAddonsDir', ''); 	


	MaxRootDirPage := CreateInputDirPage(wpSelectComponents,
		CustomMessage('MaxRootDirCaption'), CustomMessage('MaxRootDirDesc'),
		CustomMessage('MaxRootDirSubCaption'),
		False, '');
	MaxRootDirPage.Add('');
	MaxRootDirPage.Values[0] := GetPreviousData('MaxRootDir', '');
	
	Blender25ScriptDirPage := CreateInputDirPage(wpSelectComponents,
		CustomMessage('Blender25ScriptDirCaption'), CustomMessage('Blender25ScriptDirDesc'),
		CustomMessage('Blender25ScriptDirSubCaption'),
		False, '');
	Blender25ScriptDirPage.Add('');
	Blender25ScriptDirPage.Values[0] := GetPreviousData('Blender25ScriptDir', '');
	

	BlenderScriptDirPage := CreateInputDirPage(wpSelectComponents,
		CustomMessage('BlenderScriptDirCaption'), CustomMessage('BlenderScriptDirDesc'),
		CustomMessage('BlenderScriptDirSubCaption'),
		False, '');
	BlenderScriptDirPage.Add('');

	PythonInfoPage := CreateOutputMsgMemoPage(BlenderScriptDirPage.ID,
		CustomMessage('BlenderPythonCaption'), CustomMessage('BlenderPythonDesc'),
		CustomMessage('BlenderPythonSubCaption'),
		'{\rtf1\ansi ' + CustomMessage('BlenderPythonMsg') + ' }');

	BlenderScriptDirPage.Values[0] := GetPreviousData('BlenderScriptDir', '');
end;


function ShouldSkipPage(PageID: Integer): Boolean;
begin
  // check if we should skip
	result:= false;
	if (PageID = BlenderScriptDirPage.ID) or (PageId = PythonInfoPage.ID) then
	begin
		//result:= not IsComponentSelected('exporters\luxblend');
		result:= true;
	end;
	if (PageId = PythonInfoPage.ID) and (not result) then
	begin
		result:= LocatePython;
		exit;
	end;
	if (PageID = Blender25ScriptDirPage.ID) then
	begin
		//result:= not IsComponentSelected('exporters\luxblend25');
		result:= true;
	end;
	if (PageID = MaxRootDirPage.ID) then
	begin
		result:= not IsComponentSelected('exporters\luxmax');
	end;
	if (PageID = XSIAddonsDirPage.ID) then
	begin
		result:= not IsComponentSelected('exporters\luxsi');
	end;	
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
	// Store the selected directory for further reinstall/upgrade
	SetPreviousData(PreviousDataKey, 'BlenderScriptDir', BlenderScriptDirPage.Values[0]);
	SetPreviousData(PreviousDataKey, 'Blender25ScriptDir', Blender25ScriptDirPage.Values[0]);
	SetPreviousData(PreviousDataKey, 'MaxRootDir', MaxRootDirPage.Values[0]);
	SetPreviousData(PreviousDataKey, 'XSIAddonsDir', XSIAddonsDirPage.Values[0]);	
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
	Result := False;

	if CurPageID = wpSelectComponents then
	begin
  	// Set default folder if empty
  	if (BlenderScriptDirPage.Values[0] = '') then
  	begin
  		BlenderScriptDirPage.Values[0]:= FindBlenderScriptDir;
  	end;
  
  	if (Blender25ScriptDirPage.Values[0] = '') then
  	begin
  		Blender25ScriptDirPage.Values[0]:= FindBlender25ScriptDir;
  	end;
  	
  	if (MaxRootDirPage.Values[0] = '') then
  	begin
  		MaxRootDirPage.Values[0]:= FindMaxRootDir;
  	end;

  	if (XSIAddonsDirPage.Values[0] = '') then
  	begin
  		XSIAddonsDirPage.Values[0]:= FindXSIAddonsDir;
  	end;  	
  end;

	if CurPageID = BlenderScriptDirPage.ID then
	begin
		if not SanityCheckBlenderScriptDir(AddBackslash(BlenderScriptDirPage.Values[0])) then
		begin
			// if sanity check fails, ask user to verify directory
			if MsgBox(FmtMessage(CustomMessage('VerifyLuxBlendLocation'), [BlenderScriptDirPage.Values[0]]),
					mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDNO then
				exit;
		end;
	end;
	if CurPageID = Blender25ScriptDirPage.ID then
	begin
		if not SanityCheckBlender25ScriptDir(AddBackslash(Blender25ScriptDirPage.Values[0])) then
		begin
			// if sanity check fails, ask user to verify directory
			if MsgBox(FmtMessage(CustomMessage('VerifyLuxBlend25Location'), [Blender25ScriptDirPage.Values[0]]),
					mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDNO then
				exit;
		end;
	end;
	if CurPageID = MaxRootDirPage.ID then
	begin
		if not SanityCheckMaxRootDir(AddBackslash(MaxRootDirPage.Values[0])) then
		begin
			// if sanity check fails, ask user to verify directory
			if MsgBox(FmtMessage(CustomMessage('VerifyMaxLocation'), [MaxRootDirPage.Values[0]]),
					mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDNO then
				exit;
		end;
	end;
	if CurPageID = XSIAddonsDirPage.ID then
	begin
		if not SanityCheckXSIAddonsDir(AddBackslash(XSIAddonsDirPage.Values[0])) then
		begin
			// if sanity check fails, ask user to verify directory
			if MsgBox(FmtMessage(CustomMessage('VerifyXSIAddonsLocation'), [XSIAddonsDirPage.Values[0]]),
					mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDNO then
				exit;
		end;
	end;	
	Result := True;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
	MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
	S: String;
begin
	// Fill the 'Ready Memo' with the normal settings and the custom settings
	S:= '';

	S:= S + MemoDirInfo + NewLine + NewLine;
	if (not ShouldSkipPage(BlenderScriptDirPage.ID)) then
	begin
		S:= S + CustomMessage('LuxBlendLocation') + NewLine;
		S:= S + Space + BlenderScriptDirPage.Values[0] + NewLine;
		S:= S + NewLine;
	end;

	if (not ShouldSkipPage(Blender25ScriptDirPage.ID)) then
	begin
		S:= S + CustomMessage('LuxBlend25Location') + NewLine;
		S:= S + Space + Blender25ScriptDirPage.Values[0] + NewLine;
		S:= S + NewLine;
	end;

	if (not ShouldSkipPage(MaxRootDirPage.ID)) then
	begin
		S:= S + CustomMessage('MaxLocation') + NewLine;
		S:= S + Space + MaxRootDirPage.Values[0] + NewLine;
		S:= S + NewLine;
	end;

	if (not ShouldSkipPage(XSIAddonsDirPage.ID)) then
	begin
		S:= S + CustomMessage('XSIAddonsLocation') + NewLine;
		S:= S + Space + XSIAddonsDirPage.Values[0] + NewLine;
		S:= S + NewLine;
	end;

	if IsComponentSelected('examplescene') then
	begin
		S:= S + CustomMessage('ExampleLocation') + NewLine;
		S:= S + Space + ExpandConstant('{#ExampleSceneDir}') + NewLine;
		S:= S + NewLine;
	end;

	Result:= S;
end;

function GetBlenderScriptDir(Param: String): String;
begin
	Result := BlenderScriptDirPage.Values[0];
end;

function GetBlender25ScriptDir(Param: String): String;
begin
	Result := Blender25ScriptDirPage.Values[0];
end;

function GetMaxRootDir(Param: String): String;
begin
	Result := MaxRootDirPage.Values[0];
end;

function GetXSIAddonsDir(Param: String): String;
begin
	Result := XSIAddonsDirPage.Values[0];
end;

function LuxRunParameters(Param: string): string;
begin
	result:= '';
	if not IsComponentSelected('examplescene') then
		exit;

//	result:= ExpandConstant('{#ExampleSceneDir}\{#ExampleSceneFile}');
	result:= ExpandConstant('{#ExampleSceneDir}');
	if DirExists(result) then
//		result:= AddQuotes(result)
		result:= result
	else
		result:= '';
end;

// firewall code from CHB
// http://news.jrsoftware.org/news/innosetup/msg43799.html
const
	NET_FW_SCOPE_ALL = 0;
	NET_FW_IP_VERSION_ANY = 2;

procedure SetFirewallException(AppName, FileName:string);
var
	FirewallObject: Variant;
	FirewallManager: Variant;
	FirewallProfile: Variant;
begin
	try
		FirewallObject := CreateOleObject('HNetCfg.FwAuthorizedApplication');
		FirewallObject.ProcessImageFileName := FileName;
		FirewallObject.Name := AppName;
		FirewallObject.Scope := NET_FW_SCOPE_ALL;
		FirewallObject.IpVersion := NET_FW_IP_VERSION_ANY;
		FirewallObject.Enabled := True;
		FirewallManager := CreateOleObject('HNetCfg.FwMgr');
		FirewallProfile := FirewallManager.LocalPolicy.CurrentProfile;
		FirewallProfile.AuthorizedApplications.Add(FirewallObject);
	except
	end;
end;

procedure RemoveFirewallException(FileName: string);
var
	FirewallManager: Variant;
	FirewallProfile: Variant;
begin
	try
		FirewallManager := CreateOleObject('HNetCfg.FwMgr');
		FirewallProfile := FirewallManager.LocalPolicy.CurrentProfile;
		FirewallProfile.AuthorizedApplications.Remove(FileName);
	except
	end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
	if (CurStep = ssPostInstall) then
	begin
		if IsTaskSelected('firewallexception') then
		begin
			SetFirewallException(CustomMessage('LuxConsole'), ExpandConstant('{app}') + '\luxconsole.exe');
		end;
	end;
end;

var
  InstalledFirewallException: boolean;

function InitializeUninstall(): Boolean;
var
  val: Cardinal;
begin
	result:= True;

	InstalledFirewallException:= False;
	if RegQueryDWordValue(HKEY_LOCAL_MACHINE, '{#MyAppRegRoot}', '{#RegValFirewallException}', val) then
		InstalledFirewallException:= val <> 0;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
	if (CurUninstallStep = usPostUninstall) then
	begin
		if InstalledFirewallException then
			RemoveFirewallException(ExpandConstant('{app}') + '\luxconsole.exe');
	end;
end;
