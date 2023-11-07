# SubModule_Updater

  

## Descrizione

Questo script serve per aggiornare lo stesso ***submodule*** su piu' repositories diversi.
Questo script ***aggiorna*** il submodule nei repo, ed esegue un ***push*** delle modifiche direttamete sul repository.

## Download & Esecuzione

Per scaricare il repo e eseguire lo script seguire le seguenti istruzioni:

```bash

git clone https://github.com/gabriele-annese/SubModule_Updater.git

```

```bash

cd .\SubModule_Updater

```

```bash

powershell -ExecutionPolicy Bypass -File .\SubModule_Updater.ps1

```
## Funzionamento

Una volta lanciato lo script verranno chieste 3 cose:

* ***URL*** del submdoule da aggiornare 
    ![Alt text](./img/URLSubModule.png)

* Lista delle ***Path*** locali dei repo su cui si vuole aggiornare il submodule
    Una volta inserte tutte le path lasciare vuoto l'ultimo inserimento e premere invio
    ![Alt text](./img/Path.png)

* Un ***Commento*** per il commit 
    ![Alt text](./img/Commit.png)
