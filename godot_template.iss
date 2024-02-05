#define MyAppName "Godot Template"
#define MyAppVersion "1.2.0"
#define MyAppPublisher "Godot Foundation"
#define MyAppURL "https://godotengine.org/"
#define MyAppExeName "Godot Template.exe"

[Setup]
AppId={{C3A2A334-89B7-418A-BE3A-3663927567B7}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName="C:\Program Files (x86)\Steam\steamapps\common\{#MyAppName} NSB"
DisableProgramGroupPage=yes
LicenseFile=LICENSE
OutputDir=build\windows\installer\x86_64
OutputBaseFilename={#MyAppName} {#MyAppVersion} Installer
SetupIconFile=icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "build\windows\standalone\x86_64\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "build\windows\standalone\x86_64\Godot Template.pck"; DestDir: "{app}"; Flags: ignoreversion
Source: "icon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent