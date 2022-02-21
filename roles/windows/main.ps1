"Checking if elevated...`n"
$IsElevated = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (!$IsElevated) {
    "Script must be run as an Administrator!"
    break
}

"Installing Chocolatey..."
$null = choco --version

if ($?) {
    "Existing version was found, Skipping!`n"
}
else {

    $null = Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    "Done!`n"
}



"Installing python3..."
$null = choco --version
if ($?) {
    "Existing version was found, Skipping!`n"
}
else {
    $null = choco install python3 -y
    "Done!`n"
}



# "Cloning  Nerd Fonts repository..."
# $tmpExists = Test-Path $HOME/tmp
# if (!$tmpExists) {
#     mkdir -p $HOME/tmp
# }

# $fontsExists = Test-Path $HOME/tmp/nerd-fonts
# if ($fontsExists) {
#     "Existing fonts where found, Skipping!`n"
# }
# else {
#     $null = git clone https://github.com/ryanoasis/nerd-fonts.git $HOME/tmp/nerd-fonts
#     "Done!`n"
# }

"Downloading FiraCode Nerd Font Mono"
curl -L -o $HOME/tmp/"Fura Mono Regular Nerd Font Complete Windows Compatible.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.otf
"Done!"

"Installing FiraCode Nerd Font Mono"
$font = Get-ChildItem $HOME/tmp/ -Filter "Fura Mono Regular*.otf" -Recurse

"Install fonts"
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in Get-ChildItem *.otf)
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        Write-Output $fileName
        Get-ChildItem $file | ForEach-Object{ $fonts.CopyHere($_.fullname) }
    }
}
Copy-Item *.otf c:\windows\fonts\


# "Installing FiraCode patched font..."
# $installScriptExists = Test-Path $HOME/tmp/nerd-fonts/install.ps1
# if ($installScriptExists) {
#     ./$HOME/tmp/nerd-fonts/install.ps1 FiraCode
#     "Done!`n"
# }
# else {
#     "Install Script could not be found. Recloning Nerd Fonts repository..."
#     Remove-Item -R -Force $HOME/tmp/nerd-fonts
#     $null = git clone https://github.com/ryanoasis/nerd-fonts.git $HOME/tmp/nerd-fonts

#     "Retrying installing FiraCode patched font..."
#     ./$HOME/tmp/nerd-fonts/install.ps1 FiraCode
#     if ($?) {
#         "Done!`n"
#     }
#     else {
#         "ERROR! Could not install font!`n"
#     }
# }



"Installing Oh My POSH...."
$null = Get-Package oh-my-posh

if ($?) {
    "Existing version was found, Skipping!`n"
}
else {
    $null = Install-Module oh-my-posh -Scope CurrentUser
    "Done!`n"
}



"Installing Terminal Icons...."
$null = Get-Package Terminal-Icons

if ($?) {
    "Existing version was found, Skipping!`n"
}
else {
    $null = Install-Module -Name Terminal-Icons -Repository PSGallery
    "Done!`n"
}
