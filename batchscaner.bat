@echo off
cd /d "%~dp0"
set "counter=0"
:: (c) copyright 2025 SubvisionKenzo !
:: Name : Kenzo
:: Version original : 0.0.1

:: Version !
set "version=1.0.1"
set "filepath=Batchscaner"
set "libS=cipher bcdedit reg SendKeys attrib  payload webhooks"
set "files=GUI.bat"
title Malisiouce fils Scanner [%version%]
setlocal EnableDelayedExpansion
color 37

set "arg=0"

for %%l in (%*) do (
	set "arg=%%l"
)

set "filsname=batchscaner"
set "app1=GUI2"

:: App 1 !

if /i %arg% EQU 9 goto LegacyGUI
if /i %arg% EQU 3 goto onlinescan
if /i %arg% EQU 1 goto all

:: Configuration du language


if exist "C:\lang.txt" goto Skip1
if exist "C:\Program Files\Windows NT\TableTextService\TableTextService.dll" set lang=FR

if %lang%=="FR" (
    set "text=Fichier infecter Trouver :"
    set "menu=Entrer le non ou le chemain du dossier"
    set "prevew1=Analise de :"
    set "prevew2=Fichier infecter trouver :"
    set "text2=Voulez vous suprimer :"
    set "menu2=Entrer [5] pour le rapport fichier"
    set "text6=Scan en cour :"
    set "menu3=Pour réparer les problemes [9]"
    set "text4=Entrer la lettre de votre lecteur !"
    set "menu4=Pour le gestionnaire des taches [10]"
    set "btnclose=Fermer"
) else (
    set "text=Infected fils found :"
    set "menu=Enter the name or the path of the folder"
    set "prevew1=analizing :"
    set "prevew2=File Infected is :"
    set "text2=Do you want to delet :"
    set "menu2=Enter [5] for show fils rapport"
    set "text6=Scan in progress :"
    set "menu3=For recovery obtions enter [9]"
    set "text4=Enter your principal drive letter !"
    set "btnclose=Close"
    set "menu4=For the task manager [10]"
)
:Skip2

:: Verification du fichier source utilis  !
if exist Library.txt goto continue

:: Fichier dictionnaire signature command !
echo %libS% > Library.txt

:: Load barre !
echo Add-Type -AssemblyName System.Windows.Forms >> loading.ps1
echo $form = New-Object Windows.Forms.Form >> loading.ps1
echo $form.Text = "Chargement en cours..." >> loading.ps1
echo $form.Width = 300 >> loading.ps1
echo $form.Height = 100 >> loading.ps1
echo $form.StartPosition = "CenterScreen" >> loading.ps1
echo $progressBar = New-Object Windows.Forms.ProgressBar >> loading.ps1
echo $progressBar.Minimum = 0 >> loading.ps1
echo $progressBar.Maximum = 100 >> loading.ps1
echo $progressBar.Value = 0 >> loading.ps1
echo $progressBar.Width = 250 >> loading.ps1
echo $progressBar.Height = 20 >> loading.ps1
echo $progressBar.Location = '20,20' >> loading.ps1
echo $form.Controls.Add($progressBar) >> loading.ps1
echo $form.Show() >> loading.ps1
echo for ($i = 0; $i -le 100; $i += 5) { >> loading.ps1
echo     Start-Sleep -Milliseconds 100 >> loading.ps1
echo     $progressBar.Value = $i >> loading.ps1
echo     $form.Refresh() >> loading.ps1
echo } >> loading.ps1
echo $form.Close() >> loading.ps1

PowerShell -ExecutionPolicy Bypass -File "loading.ps1" /wait
del loading.ps1
start %filsname%
exit

:: Lancement du system
:continue

set "namepathfile=scan.txt"
set "namepathtext=Bienvenue dans l'assistant d'analyse"
set "namepathtext2=Analyse classique"

cls
echo.------------------------------------------
echo. %menu%
echo. %menu2%
echo. %menu3%
echo. %menu4
echo. Pour un scan hors connection taper [2]
echo. Pour des mise a jour taper [4]
echo. 
echo.------------------------------------------
echo. Info Licence tapez [6]
echo.------------------------------------------
if exist GUI.ps1 goto skip

:return1
:: Programme d'interface !
echo Add-Type -AssemblyName System.Windows.Forms >> GUI.ps1
echo Add-Type -AssemblyName System.Drawing >> GUI.ps1
echo  $form = New-Object Windows.Forms.Form >> GUI.ps1
echo $form.Text = "%filepath% scanner" >> GUI.ps1
echo $form.Size = New-Object Drawing.Size(510, 400) >> GUI.ps1
echo $form.StartPosition = "CenterScreen" >> GUI.ps1
echo $form.FormBorderStyle = "FixedDialog" >> GUI.ps1
echo $form.MaximizeBox = $false >> GUI.ps1
echo $form.BackColor = [Drawing.Color]::White >> GUI.ps1
echo # === Étape Présentation === >> GUI.ps1
echo $labelTitle = New-Object Windows.Forms.Label >> GUI.ps1
echo $labelTitle.Text = "%namepathtext%" >> GUI.ps1
echo $labelTitle.Font = New-Object Drawing.Font("Segoe UI", 12, [Drawing.FontStyle]::Bold) >> GUI.ps1
echo $labelTitle.AutoSize = $true >> GUI.ps1
echo $labelTitle.Location = "180,20" >> GUI.ps1
echo $form.Controls.Add($labelTitle) >> GUI.ps1
echo # Description ! >> GUI.ps1
echo $labelDesc = New-Object Windows.Forms.Label >> GUI.ps1
echo $labelDesc.Text = "Obtion et outis disponibles :" >> GUI.ps1
echo $labelDesc.Size = "360,40" >> GUI.ps1
echo $labelDesc.Location = "180,70" >> GUI.ps1
echo $form.Controls.Add($labelDesc) >> GUI.ps1
echo # Checkbox Analyse classique >> GUI.ps1
echo $chkAnalyse = New-Object Windows.Forms.CheckBox >> GUI.ps1
echo $chkAnalyse.Text = "%namepathtext2%" >> GUI.ps1
echo $chkAnalyse.Location = New-Object Drawing.Point(10, 323) >> GUI.ps1
echo $form.Controls.Add($chkAnalyse) >> GUI.ps1
echo # Zone de saisie pour le chemin >> GUI.ps1
echo $inputPath = New-Object Windows.Forms.TextBox >> GUI.ps1
echo $inputPath.Location = New-Object Drawing.Point(120, 326) >> GUI.ps1
echo $inputPath.Size = New-Object Drawing.Size(200, 25) >> GUI.ps1
echo $inputPath.Visible = $false >> GUI.ps1
echo $form.Controls.Add($inputPath) >> GUI.ps1
echo # Bouton "Parcourir" >> GUI.ps1
echo $browseBtn = New-Object Windows.Forms.Button >> GUI.ps1
echo $browseBtn.Text = "Parcourir" >> GUI.ps1
echo $browseBtn.Location = New-Object Drawing.Point(325, 325) >> GUI.ps1
echo $browseBtn.Size = New-Object Drawing.Size(70, 23) >> GUI.ps1
echo $browseBtn.Visible = $false >> GUI.ps1
echo $browseBtn.Add_Click({ >> GUI.ps1
echo     $dialog = New-Object Windows.Forms.FolderBrowserDialog >> GUI.ps1
echo     if ($dialog.ShowDialog() -eq "OK") { >> GUI.ps1
echo         $inputPath.Text = $dialog.SelectedPath >> GUI.ps1
echo     } >> GUI.ps1
echo }) >> GUI.ps1
echo $form.Controls.Add($browseBtn) >> GUI.ps1
echo # Affichage conditionnel du champ chemin >> GUI.ps1
echo $chkAnalyse.Add_CheckedChanged({ >> GUI.ps1
echo     if ($chkAnalyse.Checked) { >> GUI.ps1
echo         $inputPath.Visible = $true >> GUI.ps1
echo         $browseBtn.Visible = $true >> GUI.ps1
echo     } else { >> GUI.ps1
echo         $inputPath.Visible = $false >> GUI.ps1
echo         $browseBtn.Visible = $false >> GUI.ps1
echo     } >> GUI.ps1
echo }) >> GUI.ps1
echo # Bouton Exécuter >> GUI.ps1
echo $runBtn = New-Object Windows.Forms.Button >> GUI.ps1
echo $runBtn.Text = "Terminer" >> GUI.ps1
echo $runBtn.Location = New-Object Drawing.Point(400, 325) >> GUI.ps1
echo $runBtn.Size = New-Object Drawing.Size(80, 23) >> GUI.ps1
echo $runBtn.Add_Click({ >> GUI.ps1
echo     if ($chkAnalyse.Checked -and $inputPath.Text -ne "") { >> GUI.ps1
echo         Set-Content -Path "%namepathfile%" -Value $inputPath.Text >> GUI.ps1
echo         Start-Process "batchscanner.bat" -ArgumentList "analyse" >> GUI.ps1
echo     } >> GUI.ps1
echo     elseif ($chkOffline.Checked -or $chkLicence.Checked) { >> GUI.ps1
echo         Set-Content -Path "PS.txt" -Value "true" >> GUI.ps1
echo         Start-Process "batchscanner.bat" -ArgumentList "PS" >> GUI.ps1
echo     } >> GUI.ps1
echo     else { >> GUI.ps1
echo         [System.Windows.Forms.MessageBox]::Show("Sélectionne une option valide.", "Erreur", "OK", "Error") >> GUI.ps1
echo         return >> GUI.ps1
echo     } >> GUI.ps1
echo     $form.Close() >> GUI.ps1
echo }) >> GUI.ps1
echo $form.Controls.Add($runBtn) >> GUI.ps1
echo # Ligne orizontal ! >> GUI.ps1
echo $line1 = New-Object Windows.Forms.Label >> GUI.ps1
echo $line1.BorderStyle = 'Fixed3D' >> GUI.ps1
echo $line1.Height = 4 >> GUI.ps1
echo $line1.Width = 690 >> GUI.ps1
echo $line1.Location = '-5,311' >> GUI.ps1
echo $form.Controls.Add($line1) >> GUI.ps1
echo # ===== Panel gris en bas (footer accueil) ===== >> GUI.ps1
echo $footerPanel = New-Object Windows.Forms.Panel >> GUI.ps1
echo $footerPanel.Size = New-Object Drawing.Size(610, 50) >> GUI.ps1
echo $footerPanel.Location = New-Object Drawing.Point(0,312) >> GUI.ps1
echo $footerPanel.BackColor = [Drawing.Color]::FromArgb(230, 230, 230) >> GUI.ps1
echo $form.Controls.Add($footerPanel) >> GUI.ps1
echo # ===== Label de version dans le footer (ex: Version 1.0.1) ===== >> GUI.ps1
echo $labelVersionFooter = New-Object Windows.Forms.Label >> GUI.ps1
echo $labelVersionFooter.Text = "Version " + $versionName >> GUI.ps1
echo $labelVersionFooter.Font = New-Object Drawing.Font("Segoe UI", 8) >> GUI.ps1
echo $labelVersionFooter.AutoSize = $true >> GUI.ps1
echo $labelVersionFooter.Location = New-Object Drawing.Point(650, 60) >> GUI.ps1
echo $footerPanel.Controls.Add($labelVersionFooter) >> GUI.ps1
echo # Lancer >> GUI.ps1
echo [System.Windows.Forms.Application]::EnableVisualStyles() >> GUI.ps1
echo $form.ShowDialog() >> GUI.ps1
%return0%

:skip

echo @echo off >> cheking.bat
echo timeout 1 >> cheking.bat
echo :: Vérifier si le script est en cours d'exécution >> cheking.bat
echo tasklist /FI "%filepath% scanner eq powershell.exe" | find /i "powershell.exe" >> cheking.bat
echo if errorlevel 0 ( >> cheking.bat
echo     echo Aucun problem trouver ! >> cheking.bat
echo     exit >> cheking.bat
echo ) else ( >> cheking.bat
echo     echo Script introuvable ou manquant ! >> cheking.bat
echo     start %filsname%.bat 9 >> cheking.bat
echo ) >> cheking.bat
echo exit >> cheking.bat
start cheking.bat

:: Lancer le script PowerShell
PowerShell -ExecutionPolicy Bypass -File "GUI.ps1" /wait
timeout 1
del cheking.bat

if exist scan.txt goto scanes
if exist PS.txt goto endprocess

:scanes
if not exist scan.txt set /p folder=">>"
for /f "delims=" %%t in (scan.txt) do set folder=%%t
del scan.txt
if /i %folder% EQU 10 goto Gestionnaire
if /i %folder% EQU 9 goto Obtions
if /i %folder% EQU 7 goto AnalizeInTime
if /i %folder% EQU 6 goto certificat
if /i %folder% EQU 5 goto show all
if /i %folder% EQU 2 goto setupscan
if /i %folder% EQU 4 goto update
:: Analise des fichier et rep rtoire
set SCAN_FOLDER=%folder%
if "%SCAN_FOLDER%"=="" set SCAN_FOLDER=.

for /f "delims=" %%a in (Library.txt) do set lib=%%a

for /r "%SCAN_FOLDER%" %%f in (*.bat *.vbs *.json *.xml *.jar) do (
    set FILE=%%f
    set /a counter2=counter2+1
    echo. Total    : %counter2%
    echo.
    echo. %prevew1%  %FILE%

    findstr /i "%lib%" "%%f" >nul
    if !errorlevel! EQU 0 (
        powershell -Command "Write-Host '%prevew2% %%f' -ForegroundColor Red"
        set get_all=%%f > nul
        set /a counter=counter+1
        echo %%f >> Fils.txt
    )
)

:: Messages de sortie !
If /i %counter% EQU 0 goto cleaned1
echo Add-Type -AssemblyName System.Windows.Forms >> informe.ps1
echo $notif = New-Object System.Windows.Forms.NotifyIcon >> informe.ps1
echo $notif.Icon = [System.Drawing.SystemIcons]::Information >> informe.ps1
echo $notif.BalloonTipTitle = "%filsname%.bat" >> informe.ps1
echo $notif.BalloonTipText = "%counter% Menace potentiel detecter !" >> informe.ps1
echo $notif.Visible = $true >> informe.ps1
echo $notif.ShowBalloonTip(3000) >> informe.ps1
echo Start-Sleep -Seconds 5 >> informe.ps1
echo $notif.Dispose() >> informe.ps1

PowerShell -ExecutionPolicy Bypass -File "informe.ps1" /wait
del informe.ps1

If /i %counter% EQU 0 goto cleaned1
echo Notification = msgbox("%text% %counter% - %get_all%",vbInformation,"%filsname%.bat") >> Info.vbs
echo intGUI = _ >> Info.vbs
echo Msgbox("%text2% - %get_all%", _ >> Info.vbs
echo vbInformation + vbYesNo, "%filsname%.bat") >> Info.vbs
echo If IntGUI = vbYes Then >> Info.vbs
echo Set objShell = WScript.CreateObject("WScript.Shell") >> Info.vbs
echo objShell.Run "cmd /c if exist Library.txt (echo File Found && start %filsname%.bat 1 && exit) else (echo error loclized fils path && exit)" >> Info.vbs
echo Else >> Info.vbs
echo WScript.Quit >> Info.vbs
echo End If >> Info.vbs
start Info.vbs
timeout 1 > nul
del Info.vbs
echo %get_all% >> Fils.txt
exit

:all
set "FILS=Fils.txt"
for /f "delims=" %%b in (%FILS%) do (
    set /a %FILS%=%%b
    if /i %FILS% EQU %filepath% set "b=I"
    del %%b
    if exist %get_all% set "STAT=Actif"
)
echo Info = msgbox("stat = [%STAT%] %get_all%",vbInformation,"%filsname%.bat Rapport")  >> Info.vbs
start Info.vbs
timeout 1 > nul
del Info.vbs
del Fils.txt
exit

:setupscan
pause
:: Prepare le system pour le scan hors ligne !
pushd "C:\"
mkdir SCAN
popd
xcopy "%filsname%.bat" "C:\SCAN"
pushd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo pushd "C:\SCAN" >> scan.bat
echo start %filsname%.bat 3 >> scan.bat
echo popd >> scan.bat
echo del scan.bat >> scan.bat
echo exit >> scan.bat
popd
setsh interface set interface "wifi" admin=disable
shutdown /r /t 60
exit

:onlinescan
setsh interface set interface "wifi" admin=enable
color 37
title %filsname%.bat - Offline Scanner
echo %libS% > Library.txt

:: Lancemant du scan hor connection !
pushd "C:\Windows\System32"
popd
timeout 1 > nul

echo ^<html^> >> bsod.hta
echo ^<head^> >> bsod.hta
echo   ^<title^>Mise à jour Windows^</title^> >> bsod.hta
echo   ^<HTA:APPLICATION  >> bsod.hta
echo     ID="updateSim" >> bsod.hta
echo     APPLICATIONNAME="WindowsUpdateSim" >> bsod.hta
echo     BORDER="none" >> bsod.hta
echo     SHOWINTASKBAR="yes" >> bsod.hta
echo     SINGLEINSTANCE="yes" >> bsod.hta
echo     WINDOWSTATE="maximize" >> bsod.hta
echo     SCROLL="no" >> bsod.hta
echo   ^> >> bsod.hta
echo   ^<style^> >> bsod.hta
echo  html, body { >> bsod.hta
echo     margin: 0; >> bsod.hta
echo     padding: 0; >> bsod.hta
echo     overflow: hidden; >> bsod.hta
echo     background-color: #0A7FD0; >> bsod.hta
echo     color: white; >> bsod.hta
echo     font-family: Segoe UI, sans-serif; >> bsod.hta
echo     height: 100%; >> bsod.hta
echo     width: 100%; >> bsod.hta
echo     display: flex; >> bsod.hta
echo     justify-content: center; >> bsod.hta
echo     align-items: center; >> bsod.hta
echo   } >> bsod.hta
echo   #container { >> bsod.hta
echo     text-align: center; >> bsod.hta
echo     margin-top: 200px; /* Décale vers le bas */ >> bsod.hta
echo   } >> bsod.hta
echo   #gifContainer { >> bsod.hta
echo     margin-bottom: 30px; >> bsod.hta
echo   } >> bsod.hta
echo   #progressText { >> bsod.hta
echo     font-size: 28px; >> bsod.hta
echo     margin-top: 20px; >> bsod.hta
echo   } >> bsod.hta
echo   #statusMessage { >> bsod.hta
echo     font-size: 18px; >> bsod.hta
echo     margin-top: 10px; >> bsod.hta
echo   } >> bsod.hta
echo   ^</style^> >> bsod.hta
echo ^</head^> >> bsod.hta
echo ^<body^> >> bsod.hta
echo   ^<div id="container"^> >> bsod.hta
echo     ^<div id="gifContainer"^> >> bsod.hta
echo       ^<img src="loading.gif" width="80" height="80"^> >> bsod.hta
echo     ^</div^> >> bsod.hta
echo     ^<div id="progressText"^>Scanning : 0% complete.^</div^> >> bsod.hta
echo     ^<div id="statusMessage"^>Don't turn off your PC. This will take a while.^</div^> >> bsod.hta
echo   ^</div^> >> bsod.hta
echo   ^<script language="VBScript"^> >> bsod.hta
echo     Dim percent >> bsod.hta
echo     percent = 0 >> bsod.hta
echo     Sub UpdateProgress >> bsod.hta
echo       If percent ^< 100 Then >> bsod.hta
echo         percent = percent + Int((4 * Rnd) + 1) >> bsod.hta
echo         If percent ^> 100 Then percent = 100 >> bsod.hta
echo         progressText.innerText = "%text6% " & percent & "%" & " complete." >> bsod.hta
echo         ^window.setTimeout "UpdateProgress", Int((6000 * Rnd) + 4000^) >> bsod.hta
echo       Else >> bsod.hta
echo         progressText.innerText = "Cleaning up..." >> bsod.hta
echo         statusMessage.innerText = "Don't turn off your computer" >> bsod.hta
echo       End If >> bsod.hta
echo     End Sub >> bsod.hta
echo     Randomize >> bsod.hta
echo     UpdateProgress >> bsod.hta
echo   ^</script^> >> bsod.hta
echo ^</body^> >> bsod.hta
echo ^</html^> >> bsod.hta
cls

:: Analise des repertoire susepdible.
set SCAN_FOLDER="C:\Windows"
if "%SCAN_FOLDER%"=="" set SCAN_FOLDER=.

for /f "delims=" %%a in (Library.txt) do set lib=%%a

for /r "%SCAN_FOLDER%" %%f in (*.bat *.vbs *.xml *.hta) do (
    set FILE=%%f
    set /a counter2=counter2+1
    echo 
    echo total scanned : %counter2%
    echo total infected : %counter%
    echo clean : %FILE%

    findstr /i "%lib%" "%%f" >nul
    if !errorlevel! EQU 0 (
        echo infected : %%f
        set get_all=%%f
        set /a counter=counter+1
        echo %%f >> Fils.txt
    )
)

:: Clean le dossier temp !
del /s /q "C:\Users\%username%\AppData\Local\Temp\*.*"
timeout 5 > nul
shutdown /r /t 1
start "" /wait "bsod.hta"
del /s /f /q "bsod.hta"
exit

:update
set version=%version%
set "link=https://github.com/SubvisionKenzo/ProgrammeUpdate/blob/main/"
echo ^<Update^> >> index.xml
echo 	^<version^>%version%^</version^> >> index.xml
echo 	^<latest^>1.0.1^</latest^> >> index.xml
echo 	^<url^>%link%^</url^> >> index.xml
echo 	^<changelog^> >> index.xml
echo 		Update for %filepath% >> index.xml
echo 	^</changelog^> >> index.xml
echo 	^<Update^>false^</Update^> >> index.xml
echo ^</Update^> >> index.xml

:: Recherche de mise a jours !
for /f "tokens=2 delims=<>" %%a in ('findstr "<latest>" index.xml') do (
  set "latest=%%a"
)
if %latest% EQU %version% goto continue
start "%link%%filepath%%latest%.bat"
echo function Show-ProgressBar { >> bar.ps1
echo     $total = 100 >> bar.ps1
echo     $spinner = @('|', '/', '-', '\') >> bar.ps1
echo     $barLength = 40 >> bar.ps1
echo     for ($i = 0; $i -le $total; $i++) { >> bar.ps1
echo         $percent = [math]::Round(($i / $total) * 100) >> bar.ps1
echo         $filledLength = [math]::Floor(($i / $total) * $barLength) >> bar.ps1
echo         $emptyLength = $barLength - $filledLength >> bar.ps1
echo         # Construire la barre >> bar.ps1
echo         $filled = '=' * $filledLength >> bar.ps1
echo         $empty = ' ' * $emptyLength >> bar.ps1
echo         $bar = $filled + $empty >> bar.ps1
echo         # Insérer le pourcentage au centre >> bar.ps1
echo         $centerIndex = [math]::Floor($barLength / 2) - 2 >> bar.ps1
echo         $left = $bar.Substring(0, $centerIndex) >> bar.ps1
echo         $right = $bar.Substring($centerIndex + 4) >> bar.ps1
echo         # Spinner >> bar.ps1
echo         $spinChar = $spinner[$i % $spinner.Length] >> bar.ps1
echo         # Affichage en deux couleurs >> bar.ps1
echo         Write-Host "`r[$spinChar] [" -NoNewline >> bar.ps1
echo         Write-Host "$left" -NoNewline -ForegroundColor Green >> bar.ps1
echo         Write-Host "$percent%" -NoNewline -ForegroundColor Red >> bar.ps1
echo         Start-Sleep -Milliseconds 100 >> bar.ps1
echo     } >> bar.ps1
echo     Write-Host "`nUpdateScanner Finish Total update find [%found%] installed []." >> bar.ps1
echo } >> bar.ps1
echo Show-ProgressBar >> bar.ps1
PowerShell -ExecutionPolicy Bypass -File "bar.ps1" /wait
del GUI.ps1
exit

:cleaned1
echo Notification = msgbox("%text% %counter% - %get_all%",vbInformation,"%filsname%.bat") >> Info.vbs
start Info.vbs
timeout 1 > nul
del Info.vbs
pause
exit

:show all
:: Rapport des fichier trouvait !
echo Add-Type -AssemblyName System.Windows.Forms >> report.ps1
echo $form = New-Object System.Windows.Forms.Form >> report.ps1
echo $form.Text = "%filsname% rapport de detection !" >> report.ps1
echo $form.Size = '600,400' >> report.ps1
echo $listBox = New-Object System.Windows.Forms.ListBox >> report.ps1
echo $listBox.Size = '570,330' >> report.ps1
echo $listBox.Location = '10,10' >> report.ps1
echo $listBox.Font = 'Consolas, 10' >> report.ps1
echo $listBox.ScrollAlwaysVisible = $true >> report.ps1
echo $listBox.HorizontalScrollbar = $true >> report.ps1
echo $infectedFile = "Fils.txt" >> report.ps1
echo if (Test-Path $infectedFile) { >> report.ps1
echo     $infectedList = Get-Content $infectedFile >> report.ps1
echo     $listBox.Items.AddRange($infectedList) >> report.ps1
echo } else { >> report.ps1
echo     $listBox.Items.Add("Aucun fichier infect  trouvais !") >> report.ps1
echo } >> report.ps1
echo $form.Controls.Add($listBox) >> report.ps1
echo $form.ShowDialog() >> report.ps1

PowerShell -ExecutionPolicy Bypass -File "report.ps1" /wait
del report.ps1
goto continue

:certificat

:: Compilation du certificat txt pour étre utiliser !
echo Editeur : [SUBVISION] Kenzo (c) copyright 2025 >> certified.txt
echo Description : Antivirus(BATCH) scanner. >> certified.txt
echo Licence : Ce programme a etait creer uniquement dans un but >> certified.txt
echo pedagogique et Utils , interdisant toute reproduction commerciale non autorise.. >> certified.txt
echo C'est un outil open-source et fiable.  >> certified.txt
echo Type : Fichier de commande Windows. >> certified.txt

:: Certificat et droit d'auteur !
echo Add-Type -AssemblyName System.Windows.Forms >> report.ps1
echo $form = New-Object System.Windows.Forms.Form >> report.ps1
echo $form.Text = "%filsname% Certificat !" >> report.ps1
echo $form.Size = '600,400' >> report.ps1
echo $listBox = New-Object System.Windows.Forms.ListBox >> report.ps1
echo $listBox.Size = '570,330' >> report.ps1
echo $listBox.Location = '10,10' >> report.ps1
echo $listBox.Font = 'Consolas, 10' >> report.ps1
echo $listBox.ScrollAlwaysVisible = $true >> report.ps1
echo $listBox.HorizontalScrollbar = $true >> report.ps1
echo $infectedFile = "certified.txt" >> report.ps1
echo if (Test-Path $infectedFile) { >> report.ps1
echo     $infectedList = Get-Content $infectedFile >> report.ps1
echo     $listBox.Items.AddRange($infectedList) >> report.ps1
echo } else { >> report.ps1
echo     $listBox.Items.Add("Le certificat et vide !") >> report.ps1
echo } >> report.ps1
echo $form.Controls.Add($listBox) >> report.ps1
echo $form.ShowDialog() >> report.ps1

PowerShell -ExecutionPolicy Bypass -File "report.ps1" /wait
del report.ps1
del certified.txt
exit

:endprocess
del PS.txt
exit

:AnalizeInTime
:: Code IcI !
del GUI.ps1
set "return=goto return0"
set "namepathfile=Setting.txt"
set "namepathtext=Parametre de Protection temp partielle !"
set "namepathtext2=Protection :"
goto return1
:return0
PowerShell -ExecutionPolicy Bypass -File "GUI.ps1" /wait
if exist Setting.txt goto 
del setting.ps1
exit
:Setting
for /f "delims=" %%w in (Setting.txt) do set setting=%%w
if %setting% EQU 1 goto On

:On
del Setting.txt
pushd "C:\"
mkdir SCAN
popd && pushd "C:\SCAN"
:: Structure du code de surveience
if exist config.bat goto SKIP
echo @echo off >> config.bat
echo :restart >> config.bat
echo >> config.bat
echo timeout 2 >> config.bat
echo PowerShell -ExecutionPolicy Bypass -File "Xscan.ps1" /wait  >> config.bat
echo if %errorlevel% EQU 1 exit  >> config.bat
echo goto restart >> config.bat
popd && pushd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
:: Sytem de lancement !
echo pushd "C:\SCAN" >> Laucher.bat
echo start "config.bat" >> Laucher.bat
echo exit >> Laucher.bat
:SKIP
exit

:Skip1
for /f "delims=" %%z in (Setting.txt) do (
    set "language=%%z"
    set %language%
)
goto Skip2

:LegacyGUI
del cheking.bat
echo :--------------------------------------:
echo :Chose your option ! Obtion : [6, 2, 4]:
echo :Enter your directory fils to scan !   :
echo :--------------------------------------:
set /p folder=">>"
goto scanes

:Obtions
echo :--------------------------------------:
echo :    Recovery reset PC [1](Admin)      :
echo :      Restart to the BIOS [2]         :
echo : To recovery Windows update[3](Admin) :
echo : Drivers Update [4](admin)            :
echo :--------------------------------------:
set /p Recove=">>"
if /i %Recove% EQU 1 goto ResetBoot
if /i %Recove% EQU 2 goto bios
if /i %Recove% EQU 3 goto updatereset
if /i %Recove% EQU 4 goto driveupdate
exit
:ResetBoot
echo.%text4%
set /p drive=">>"
%drive%:
cd \windows\system32\configmd backup
copy *.* backup
cd regback
copy *.* ..
shutdown /r /t 10 /f
exit

:bios
shutdown /wf /t 10
exit

:Gestionnaire

:: Programme !
echo Add-Type -AssemblyName System.Windows.Forms >> %app1%.ps1
echo Add-Type -AssemblyName System.Drawing >> %app1%.ps1
echo # Formulaire principal >> %app1%.ps1
echo $form = New-Object System.Windows.Forms.Form >> %app1%.ps1
echo $form.Text = "Task Manager !" >> %app1%.ps1
echo $form.Size = New-Object System.Drawing.Size(800,500) >> %app1%.ps1
echo # ListView des processus >> %app1%.ps1
echo $listView = New-Object System.Windows.Forms.ListView >> %app1%.ps1
echo $listView.View = 'Details' >> %app1%.ps1
echo $listView.FullRowSelect = $true >> %app1%.ps1
echo $listView.GridLines = $true >> %app1%.ps1
echo $listView.Size = New-Object System.Drawing.Size(760,350) >> %app1%.ps1
echo $listView.Location = New-Object System.Drawing.Point(20,20) >> %app1%.ps1
echo $listView.Columns.Add("Nom", 200) >> %app1%.ps1
echo $listView.Columns.Add("PID", 80) >> %app1%.ps1
echo $listView.Columns.Add("Memoire (MB)", 100) >> %app1%.ps1
echo $listView.Columns.Add("Signature", 150) >> %app1%.ps1
echo $form.Controls.Add($listView) >> %app1%.ps1
echo # TextBox pour entrer le nom du programme à lancer >> %app1%.ps1
echo $textBox = New-Object System.Windows.Forms.TextBox >> %app1%.ps1
echo $textBox.Location = New-Object System.Drawing.Point(380,400) >> %app1%.ps1
echo $textBox.Size = New-Object System.Drawing.Size(200,40) >> %app1%.ps1
echo $form.Controls.Add($textBox) >> %app1%.ps1
echo # Bouton Fermer >> %app1%.ps1
echo $btnFermer = New-Object System.Windows.Forms.Button >> %app1%.ps1
echo $btnFermer.Text = "%btnclose%" >> %app1%.ps1
echo $btnFermer.BackColor = 'Red' >> %app1%.ps1
echo $btnFermer.ForeColor = 'White' >> %app1%.ps1
echo $btnFermer.Location = New-Object System.Drawing.Point(20,400) >> %app1%.ps1
echo $btnFermer.Size = New-Object System.Drawing.Size(100,40) >> %app1%.ps1
echo $form.Controls.Add($btnFermer) >> %app1%.ps1
echo # Bouton Ouvrir (exemple : ouvre Notepad) >> %app1%.ps1
echo $btnOuvrir = New-Object System.Windows.Forms.Button >> %app1%.ps1
echo $btnOuvrir.Text = "Ouvrir" >> %app1%.ps1
echo $btnOuvrir.BackColor = 'DodgerBlue' >> %app1%.ps1
echo $btnOuvrir.ForeColor = 'White' >> %app1%.ps1
echo $btnOuvrir.Location = New-Object System.Drawing.Point(140,400) >> %app1%.ps1
echo $btnOuvrir.Size = New-Object System.Drawing.Size(100,40) >> %app1%.ps1
echo $form.Controls.Add($btnOuvrir) >> %app1%.ps1
echo # Bouton Créer (lance le programme entré dans la TextBox) >> %app1%.ps1
echo $btnCreer = New-Object System.Windows.Forms.Button >> %app1%.ps1
echo $btnCreer.Text = "Creer" >> %app1%.ps1
echo $btnCreer.BackColor = 'LimeGreen' >> %app1%.ps1
echo $btnCreer.ForeColor = 'White' >> %app1%.ps1
echo $btnCreer.Location = New-Object System.Drawing.Point(260,400) >> %app1%.ps1
echo $btnCreer.Size = New-Object System.Drawing.Size(100,40) >> %app1%.ps1
echo $form.Controls.Add($btnCreer) >> %app1%.ps1
echo # Fonction de mise à jour des processus >> %app1%.ps1
echo function Refresh-ProcessList { >> %app1%.ps1
echo     $listView.Items.Clear() >> %app1%.ps1
echo     $processes = Get-Process ^|^ Sort-Object -Property Name >> %app1%.ps1
echo     foreach ($proc in $processes) { >> %app1%.ps1
echo         $item = New-Object System.Windows.Forms.ListViewItem($proc.ProcessName) >> %app1%.ps1
echo         $item.SubItems.Add($proc.Id) >> %app1%.ps1
echo         $item.SubItems.Add([math]::Round($proc.WorkingSet64 / 1MB, 2)) >> %app1%.ps1
echo         try { >> %app1%.ps1
echo             $sig = Get-AuthenticodeSignature $proc.Path >> %app1%.ps1
echo             if ($sig.Status -eq 'Valid') { >> %app1%.ps1
echo                 $item.SubItems.Add("Signe") >> %app1%.ps1
echo                 $item.ForeColor = 'Blue' >> %app1%.ps1
echo             } else { >> %app1%.ps1
echo                 $item.SubItems.Add("Non signe") >> %app1%.ps1
echo                 $item.ForeColor = 'Red' >> %app1%.ps1
echo             } >> %app1%.ps1
echo         } catch { >> %app1%.ps1
echo             $item.SubItems.Add("Inconnu") >> %app1%.ps1
echo             $item.ForeColor = 'Green' >> %app1%.ps1
echo         } >> %app1%.ps1
echo         $listView.Items.Add($item) >> %app1%.ps1
echo     } >> %app1%.ps1
echo } >> %app1%.ps1
echo # Timer pour rafraîchir toutes les secondes >> %app1%.ps1
echo $timer = New-Object System.Windows.Forms.Timer >> %app1%.ps1
echo $timer.Interval = 60000 >> %app1%.ps1
echo $timer.Add_Tick({ Refresh-ProcessList }) >> %app1%.ps1
echo $timer.Start() >> %app1%.ps1
echo # Action bouton Fermer >> %app1%.ps1
echo $btnFermer.Add_Click({ >> %app1%.ps1
echo     if ($listView.SelectedItems.Count -gt 0) { >> %app1%.ps1
echo         $pid = $listView.SelectedItems[0].SubItems[1].Text >> %app1%.ps1
echo         Stop-Process -Id $pid -Force >> %app1%.ps1
echo         Refresh-ProcessList >> %app1%.ps1
echo     } >> %app1%.ps1
echo }) >> %app1%.ps1
echo # Action bouton Ouvrir >> %app1%.ps1
echo $btnOuvrir.Add_Click({ >> %app1%.ps1
echo     Start-Process "notepad.exe" >> %app1%.ps1
echo }) >> %app1%.ps1
echo # Action bouton Créer avec TextBox >> %app1%.ps1
echo $btnCreer.Add_Click({ >> %app1%.ps1
echo     $input = $textBox.Text.Trim() >> %app1%.ps1
echo     if ($input -ne "") { >> %app1%.ps1
echo         try { >> %app1%.ps1
echo             Start-Process $input >> %app1%.ps1
echo         } catch { >> %app1%.ps1
echo             [System.Windows.Forms.MessageBox]::Show("Impossible de lancer '$input'", "Erreur", "OK", "Error") >> %app1%.ps1
echo         } >> %app1%.ps1
echo     } >> %app1%.ps1
echo }) >> %app1%.ps1
echo # Lancement du formulaire >> %app1%.ps1
echo $form.Add_Shown({ Refresh-ProcessList }) >> %app1%.ps1
echo $form.ShowDialog() >> %app1%.ps1

:: Lancement de gestionnaire des taches!
PowerShell -ExecutionPolicy Bypass -File "%app1%.ps1" /wait
del %app1%.ps1
exit

:updatereset

echo. Are you shure you want to running Recovery Update module ?
echo. This action restarting and reset your update fils and system !
pause > nul

:: Reset Windows !

 net stop bits 
 net stop wuauserv 
 net stop appidsvc 
 net stop cryptsvc 

pushd\
pushd "Program Files"
pushd \ProgramData
pushd "Application Data"
pushd Microsoft
pushd Network
pushd Downloader
dir 
del . /F /Q
popd
pushd "C:\Windows\System32"
regsvr32.exe /s atl.dll
timeout 3 > nul
echo regsvr32.exe /s atl.dll >> reset.bat
echo regsvr32.exe /s urlmon.dll >> reset.bat
echo regsvr32.exe /s mshtml.dll >> reset.bat
echo regsvr32.exe /s shdocvw.dll >> reset.bat
echo regsvr32.exe /s jscript.dll >> reset.bat
echo regsvr32.exe /s vbscript.dll >> reset.bat
echo regsvr32.exe /s scrrun.dll >> reset.bat
echo regsvr32.exe /s msxml.dll >> reset.bat
echo regsvr32.exe /s msxml3.dll >> reset.bat
echo regsvr32.exe /s msxml6.dll >> reset.bat
echo regsvr32.exe /s actxprxy.dll >> reset.bat
echo regsvr32.exe /s softpub.dll >> reset.bat
echo regsvr32.exe /s wintrust.dll >> reset.bat
echo regsvr32.exe /s dssenh.dll >> reset.bat
echo regsvr32.exe /s rsaenh.dll >> reset.bat
echo regsvr32.exe /s gpkcsp.dll >> reset.bat
echo regsvr32.exe /s sccbase.dll >> reset.bat
echo regsvr32.exe /s slbcsp.dll >> reset.bat
echo regsvr32.exe /s cryptdlg.dll >> reset.bat
echo regsvr32.exe /s oleaut32.dll >> reset.bat
echo regsvr32.exe /s ole32.dll >> reset.bat
echo regsvr32.exe /s shell32.dll >> reset.bat
echo regsvr32.exe /s initpki.dll >> reset.bat
echo regsvr32.exe /s wuapi.dll >> reset.bat
echo regsvr32.exe /s wuaueng.dll >> reset.bat
echo regsvr32.exe /s wuaueng1.dll >> reset.bat
echo regsvr32.exe /s wucltui.dll >> reset.bat
echo regsvr32.exe /s wups.dll >> reset.bat
echo regsvr32.exe /s wups2.dll >> reset.bat
echo regsvr32.exe /s wuweb.dll >> reset.bat
echo regsvr32.exe /s qmgr.dll >> reset.bat
echo regsvr32.exe /s qmgrprxy.dll >> reset.bat
echo regsvr32.exe /s wucltux.dll >> reset.bat
echo regsvr32.exe /s muweb.dll >> reset.bat
echo regsvr32.exe /s wuwebv.dll >> reset.bat
start reset.bat /wait
timeout 1
del reset.bat
popd

Reset networking
netsh winsock reset
netsh winsock reset proxy
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
shutdown -r -t 10
exit

:driveupdate
:: Lancement des mise a jours !
echo if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) { >> drive.ps1
echo     Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser >> drive.ps1
echo } >> drive.ps1
echo Import-Module PSWindowsUpdate >> drive.ps1
echo Get-WindowsUpdate -Category Drivers -Install -AcceptAll -AutoReboot >> drive.ps1
timeout 1 > nul
powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0drive.ps1\"' -Verb RunAs" /wait
exit
