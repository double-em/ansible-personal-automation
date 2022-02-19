# Terraform
Set-Alias -Name tf C:\ProgramData\chocolatey\bin\terraform.exe

Function tf_p {terraform plan}
Set-Alias -Name tfp -Value tf_p

Function tf_a {terraform plan}
Set-Alias -Name tfa -Value tf_a

# Kubectl
Set-Alias -Name k C:\ProgramData\chocolatey\bin\kubectl.exe

Function k_p {kubectl get pods}
Set-Alias -Name kp -Value k_p

Function k_s {kubectl get svc}
Set-Alias -Name ks -Value k_s

Function k_d {kubectl get deploy}
Set-Alias -Name kd -Value k_d

Set-Alias -Name kn -Value kubens

# Git
Set-Alias -Name g "C:\Program Files\Git\cmd\git.exe"

Function g_a($message) {git commit -am $message}
Set-Alias -Name ga -Value g_a

Function g_add {git add .}
Set-Alias -Name gadd -Value g_add

# CD
Function cd_re {Set-Location $HOME/source/repos}
Set-Alias -Name cdre -Value cd_re

Function cd_de {Set-Location $HOME/Desktop}
Set-Alias -Name cdde -Value cd_de

Function cd_do {Set-Location $HOME/Downloads}
Set-Alias -Name cddo -Value cd_do

# Terminal
Function ls_a {Get-ChildItem -Force}
Set-Alias -Name ll -Value ls_a

Import-Module oh-my-posh
Set-PoshPrompt -Theme spaceship

Import-Module -Name Terminal-Icons
