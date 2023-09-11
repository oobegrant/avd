# Start Transcript
Start-Transcript -Path "C:\Install\FsLogix\Deploy-AppMasking.txt" -NoClobber

#Download HideAdobe.fxa from github (Needs to be publically accessible)
Invoke-WebRequest https://raw.githubusercontent.com/oobegrant/avd/main/HideAdobe.fxa -OutFile 'C:\Program Files\FSLogix\Apps\Rules\HideAdobe.fxa'

#Download HideAdobe.fxr from github (Needs to be publically accessible)
Invoke-WebRequest https://raw.githubusercontent.com/oobegrant/avd/main/HideAdobe.fxr -OutFile 'C:\Program Files\FSLogix\Apps\Rules\HideAdobe.fxr'

#Download MicrosoftVisio.fxa from github (Needs to be publically accessible)
Invoke-WebRequest https://raw.githubusercontent.com/oobegrant/avd/main/MicrosoftVisio.fxa -OutFile 'C:\Program Files\FSLogix\Apps\Rules\MicrosoftVisio.fxa'

#Download MicrosoftVisio.fxr from github (Needs to be publically accessible)
Invoke-WebRequest https://raw.githubusercontent.com/oobegrant/avd/main/MicrosoftVisio.fxr -OutFile 'C:\Program Files\FSLogix\Apps\Rules\MicrosoftVisio.fxr'

# Stop Transcript
Stop-Transcript