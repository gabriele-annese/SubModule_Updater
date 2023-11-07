# SubModule_Updater

  

## Descrizione

Questo script serve per aggiornare lo stesso ***submodule*** su piu' repositories diversi.

Questo script ***aggiorna*** il submodule nei repo, ed esegue un ***push*** delle modifiche direttamete sul repository.

## Download & Esecuzione

Per scaricare il repo e lanciare lo script bisogna aprire un ***cmd*** o una ***powershell*** e eseguire i seguenti comandi:

```bash

git clone https://github.com/gabriele-annese/SubModule_Updater.git

```

```bash

cd .\SubModule_Updater

```
Lo script non è ***firmato digitalmente***, quindi per evitare errori di esecuzione bisogna lanciare lo script in questo modo 

```bash

powershell -ExecutionPolicy Bypass -File .\SubModule_Updater.ps1

```
## Funzionamento

Una volta lanciato lo script verrà chiesto di inserire 3 parametri:

* Inserire l'***URL*** del submdoule da aggiornare 

    ![Alt text](./img/URLSubModule.png)

* Inserire la lista delle ***Path*** locali dei repo su cui si vuole aggiornare il submodule.

    Per andare avanti una volta inserte tutte le path lasciare vuoto l'ultimo inserimento e premere invio.
    ![Alt text](./img/Path.png)

* inserire un ***Commento*** per il commit 

    ![Alt text](./img/Commit.png)
