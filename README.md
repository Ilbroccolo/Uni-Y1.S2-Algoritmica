# Appunti di Programmazione e Algoritmica (Bibbia 2.0)

Questo repository contiene gli appunti completi per il corso di Programmazione e Algoritmica (Anno 1, Informatica UNIPI), formattati in LaTeX con uno stile "Bibbia" avanzato.

## Struttura del Progetto

- **main.tex**: File root LaTeX che include tutte le lezioni tramite `\include`.
- **lezioni/**: Cartella contenente i file sorgente `.tex` per ogni lezione.
- **esercitazioni/**: File sorgente per le varie esercitazioni pratiche.
- **assets/**: Cartella contenente immagini, stili (`.sty`) e file statici importati.
- **sandbox/**: File di test e template.
- **scripts/**: Script Bash e utilità sviluppati per la pulizia e mantenimento del repository.

## Prerequisiti

Per compilare il progetto è necessario un ambiente LaTeX completo (es. TeX Live, MiKTeX, MacTeX).
Pacchetti principali richiesti:
- `tcolorbox` (per i box colorati)
- `tikz` (per i grafici)
- `listings` / `algorithmicx` (per il codice)
- `amsmath`, `amssymb`, `amsthm`

## Compilazione

Eseguire il comando `pdflatex` o `latexmk` sul file `main.tex`:

```bash
# Usa pdflatex (x2 per sincronizzare indici)
pdflatex main.tex
pdflatex main.tex

# Oppure usa latexmk
latexmk -pdf main.tex
```

## Crediti

Appunti basati sulle lezioni del corso di Programmazione e Algoritmica, redatti e riorganizzati in formato "Bibbia" per ottimizzare l'esperienza di apprendimento.
