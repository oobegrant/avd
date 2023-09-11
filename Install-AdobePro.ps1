# install prerequisites 

# download Visual C++ 2013 
Invoke-WebRequest https://aka.ms/highdpimfc2013x86enu -OutFile C:\Install\AcrobatPro\vcredist_x86.exe
Invoke-WebRequest https://aka.ms/highdpimfc2013x64enu -OutFile C:\Install\AcrobatPro\vcredist_x64.exe

# install Visual C++ 2013 
Start-Process C:\Install\AcrobatPro\vcredist_x86.exe -ArgumentList '/install /quiet /norestart' -Wait
Start-Process C:\Install\AcrobatPro\vcredist_x64.exe -ArgumentList '/install /quiet /norestart' -Wait


# install adobe pro
Start-Process msiexec.exe -ArgumentList '/I "C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI\Adobe Acrobat\AcroPro.msi" /qn /norestart TRANSFORMS="C:\Install\AcrobatPro\AcroPro.mst"' -Wait

# install adobe acrobat update
Start-Process msiexec.exe -ArgumentList '/p "C:\Install\AcrobatPro\Acrobat_DC_Web_x64_WWMUI\Adobe Acrobat\AcrobatDCx64Upd2200320310.msp" /qn /norestart' -Wait 