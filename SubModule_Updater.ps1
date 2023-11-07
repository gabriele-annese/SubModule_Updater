#Sezione ASCII
$AsciiText = @"

   ___  ____  ____     __       __  ___        __     __      __  __        __     __         
  / _ )/ __/ / __/_ __/ /  ____/  |/  /__  ___/ /_ __/ /__   / / / /__  ___/ /__ _/ /____ ____
 / _  / _/  _\ \/ // / _ \/___/ /|_/ / _ \/ _  / // / / -_) / /_/ / _ \/ _  / _ `/ __/ -_) __/
/____/___/ /___/\_,_/_.__/   /_/  /_/\___/\_,_/\_,_/_/\__/  \____/ .__/\_,_/\_,_/\__/\__/_/   
                                                                /_/                           

"@

#Sezione Colori
$Green = [char]27 + "[32m"  # Green text
$Reset = [char]27 + "[0m"   # Reset text color
$Red = [char]27 + "[31m"    # Red text

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

# Ciclo ogni repo
foreach ($repo in $repositories) {
    # Mi posiziono nella path del repo
    Set-Location -Path $repo

    #Inizializzo submodule
    Write-Host "${Green}`n ************* Inizializzo submodule del repo $repo ************* `n${Reset}"
    git submodule update --init --recursive

    # Aggiorno submodule
    Write-Host "${Green}`n ************* Inizio aggiornamento Submodule ************* `n${Reset}"
    cd Tools
    git pull "$urlBranchRepo"
    Write-Host "${Green}`n ************* Fine aggiornamento Submodule ************* `n${Reset}"

    Pusho le modifiche
    Write-Host "${Green}`n ************* Inizio Push Modifiche ************* `n${Reset}"
    cd ..
    git add .
    git commit -m "$commitMessage"
    git push
    Write-Host "${Green}`n ************* Fine Push Modifiche ************* `n${Reset}"

    Set-Location -Path $PSScriptRoot  # Ritorno alla Path dove è stato lanciato lo script
}

