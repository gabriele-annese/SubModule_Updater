#Sezione ASCII
$AsciiText = @"
   _____       __          __  ___          __      __        __  __          __      __           
  / ___/__  __/ /_        /  |/  /___  ____/ /_  __/ /__     / / / /___  ____/ /___ _/ /____  _____
  \__ \/ / / / __ \______/ /|_/ / __ \/ __  / / / / / _ \   / / / / __ \/ __  / __ `/ __/ _ \/ ___/
 ___/ / /_/ / /_/ /_____/ /  / / /_/ / /_/ / /_/ / /  __/  / /_/ / /_/ / /_/ / /_/ / /_/  __/ /    
/____/\__,_/_.___/     /_/  /_/\____/\__,_/\__,_/_/\___/   \____/ .___/\__,_/\__,_/\__/\___/_/     
                                                               /_/                                 

"@

#Sezione Colori
$Green = [char]27 + "[32m"  # Green text
$Reset = [char]27 + "[0m"   # Reset text color
$Red = [char]27 + "[31m"    # Red text
$Yellow = [char]27 + "[33m"  # Yellow text

Write-Host ${Red}$AsciiText${Reset}

$urlSubModule = Read-Host "${Green}[-]Inserisci URL del submodule${Reset}"

# Inizializzo lista dei repositories vuota
$repositories = @()  
do {
    $input = Read-Host "${Green}[-]Inserisci Path del repo (premi invio senza inserire nulla per completare)${Reset}" #Input dell'utente
    if ($input -ne "") {
        $repositories += $input #Aggiungo input alla lista
    }
} while ($input -ne "")

$commitMessage = Read-Host "${Green}[-]Inserisci il messaggio del commit${Reset}"

# Prendo la Folder del submodule tramite URL 
function Get-LastPartOfPath {
    param (
        [string]$urlSubModule
    )

    $parts = $urlSubModule -split '/'
    $lastPart = $parts[-1]
    return $lastPart
}
$FolderSubModule = Get-LastPartOfPath($urlSubModule)


# Ciclo ogni repo
foreach ($repo in $repositories) {
    # Mi posiziono nella path del repo
    Set-Location -Path $repo

    #Inizializzo submodule
    Write-Host "${Green}`n ************* Inizializzo submodule del repo $repo ************* `n${Reset}"
    git submodule update --init --recursive

    # Aggiorno submodule
    Write-Host "${Green}`n ************* Inizio aggiornamento Submodule ************* `n${Reset}"
    cd $FolderSubModule
    git pull "$urlBranchRepo"
    Write-Host "${Green}`n ************* Fine aggiornamento Submodule ************* `n${Reset}"

    #Pusho le modifiche
    Write-Host "${Green}`n ************* Inizio Push Modifiche ************* `n${Reset}"
    cd ..
    git add .
    git commit -m "$commitMessage"
    git push
    Write-Host "${Green}`n ************* Fine Push Modifiche ************* `n${Reset}"

    Set-Location -Path $PSScriptRoot  # Ritorno alla Path dove è stato lanciato lo script
}

