#!/bin/bash
# Script per organizzare la cartella del progetto LaTeX

echo "Creo le cartelle di destinazione..."
mkdir -p lezioni
mkdir -p esercitazioni
mkdir -p assets
mkdir -p sandbox
mkdir -p _file_temporanei

# 1. Sposta le lezioni e le precisazioni
mv Lezione*.tex Precizazione*.tex lezioni/
echo "Moved: Lezioni e Precisazioni"

# 2. Sposta le esercitazioni
mv Esercitazione1.tex esercitazioni/
# Sposta il PDF dell'esercitazione (sembra un file sorgente, non compilato)
mv "esercitazine fondamenti 4 .pdf" esercitazioni/
echo "Moved: Esercitazioni"

# 3. Sposta gli assets (immagini, stili, grafici da includere)
mv *.jpg *.png *.sty assets/
mv grafici.tex assets/ # Assumo 'grafici.tex' sia un file da includere, non un progetto a sé
echo "Moved: Assets (immagini, stili)"

# 4. Sposta i file di test/prova (coso, prova, grafi)
mv coso.tex coso1.tex grafi.tex prova.tex style.tex sandbox/
echo "Moved: File di test in sandbox/"

# 5. Sposta TUTTI i file temporanei e i PDF compilati in una cartella
# È sicuro spostarli. Potrai cancellare la cartella _file_temporanei
# quando sarai sicuro di non averne bisogno.
mv *.log *.aux *.toc *.synctex* *.fdb_latexmk *.fls *.out *.pdf _file_temporanei/
echo "Moved: Tutti i file .log, .aux, .pdf, ecc. in _file_temporanei/"

echo "---"
echo "Fatto! La cartella è stata organizzata."
echo "Il file 'main.tex' è rimasto nella cartella principale."