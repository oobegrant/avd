Start-Transcript -Path "C:\Install\AcrobatPro\AcrobatPro.txt" -NoClobber
# install prerequisites 

# download Visual C++ 2013 
mkdir C:\Install\AcrobatPro
#Invoke-WebRequest https://aka.ms/highdpimfc2013x86enu -OutFile C:\Install\AcrobatPro\vcredist_x86.exe
Invoke-WebRequest https://aka.ms/highdpimfc2013x64enu -OutFile C:\Install\AcrobatPro\vcredist_x64.exe

# install Visual C++ 2013 
#Start-Process C:\Install\AcrobatPro\vcredist_x86.exe -ArgumentList '/install /quiet /norestart' -Wait
Start-Process C:\Install\AcrobatPro\vcredist_x64.exe -ArgumentList '/install /quiet /norestart' -Wait

# install prerequisite NuGet
Install-PackageProvider -Name NuGet -Force

# install Evergreen powershell module
Install-Module -Name Evergreen -Force 

# install adobe pro
#Invoke-WebRequest AcroPro.msi
#Invoke-WebRequest AcroPro.mst

# get acrobat pro
$AcrobatPro = Get-EvergreenApp -Name AdobeAcrobatProStdDC | Where-Object { $_.Architecture -eq "x64" -and $_.Sku -eq "Pro"}

# download acrobat pro
#host on a local storage account
#Copy Acrobat_DC_Web_x64_WWMUI.zip to C:\Install\AcrobatPro

Copy-Item \\austechavdprofiles.file.core.windows.net\fslogixprofiles\Acrobat_DC_Web_x64_WWMUI.zip C:\Install\AcrobatPro
#Invoke-WebRequest $AcrobatPro.uri -OutFile C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI.zip

#Unzip Acrobat_DC_Web_x64_WWMUI.zip
Expand-Archive -Path C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI.zip -DestinationPath C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI

#Install using AcroPro.msi and AcroPro.mst
#Need to host AcroPro.mst somewhere? Host on a local storage account
#Copy AcroPro.mst to C:\Install\AcrobatPro
Copy-Item \\austechavdprofiles.file.core.windows.net\fslogixprofiles\AcroPro.mst C:\Install\AcrobatPro

Start-Process msiexec.exe -ArgumentList '/I "C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI\Adobe Acrobat\AcroPro.msi" /qn /norestart TRANSFORMS="C:\Install\AcrobatPro\AcroPro.mst"' -Wait

# install adobe acrobat update
#Invoke-WebRequestion AcrobatDCx64Upd2200320310.msp
#Disregard the below ?

#Start-Process msiexec.exe -ArgumentList '/p "C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI\Adobe Acrobat\AcrobatDCx64Upd2200320310.msp" /qn /norestart' -Wait
Stop-Transcript
