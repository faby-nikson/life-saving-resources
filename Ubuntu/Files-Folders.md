
Files / Folders
======

Folders
------

Current path:

`pwd`

Affichage du poids des fichiers en bytes / répertoires triés par poids
/!\ attention commande longue sur gros répertoire:

`du -sk * | sort -rn`

Liste des répertoires du dossier courant avec leur poids respectifs:

`du --si --max-depth=1`

`du -h --max-depth=1 | sort -hr`

Afficher les dossiers excédant 1G:

`du -sm * | awk '$1 > 1024'`


Files
------

Affichage des fichiers du plus vieux au plus récent

`ls -lrt`




### Suppression

Suppression récursive à partir du répertoire courant des fichiers Thumbs :

`find . -type f -name "Thumbs.db" -exec rm -f {} \;`

Supprimer les dossiers .svn d'un projet:

`sudo find . -type d -name .svn -exec rm -rf {} \;`

Suppression récursive avec Prompt (option I majuscule) des répertoires et fichiers :

`rm -rfI cible_a_supprimer`

### Archives

Compression:

`tar czfv votre_archive.tar.gz votre_dossier/`

Extraction:

`tar zxvf votre_archive.tar.gz`

Compresser automatiquement tous les fichiers d'un dossier:

`gzip *`