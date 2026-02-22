# ===================================================================
# FUNZIONE BASH PER ORGANIZZARE E PULIRE PROGETTI LATEX
# ===================================================================
# Per usarla:
# 1. Copia questa funzione nel tuo file ~/.bashrc o ~/.zshrc
# 2. Ricarica il terminale (o esegui 'source ~/.bashrc')
# 3. 'cd' nella tua cartella di progetto
# 4. Esegui il comando: organizza_latex
# ===================================================================

function organizza_latex() {
    echo "Sto per organizzare e pulire questo progetto LaTeX."
    echo "ATTENZIONE: Questo modificherà i file .tex nelle sottocartelle."
    echo "Verrà creato un backup (.bak) per ogni file modificato."
    echo "---"
    read -p "Sei nella cartella principale del progetto? (s/n) " confirm
    
    # Se la risposta non è 's', annulla
    if [[ "$confirm" != "s" ]]; then
        echo "Operazione annullata."
        return 1
    fi

    # --- 1. CREAZIONE CARTELLE ---
    echo "Creo le cartelle..."
    mkdir -p lezioni
    mkdir -p esercitazioni
    mkdir -p assets
    mkdir -p sandbox
    mkdir -p _file_temporanei

    # --- 2. ORGANIZZAZIONE FILE ---
    echo "Sposto i file..."
    
    # Sposta solo se i file esistono, altrimenti ignora l'errore
    mv Lezione*.tex Precizazione*.tex lezioni/ 2>/dev/null
    mv Esercitazione*.tex esercitazioni/ 2>/dev/null
    mv "esercitazine fondamenti 4 .pdf" esercitazioni/ 2>/dev/null
    mv *.jpg *.png *.sty grafici.tex assets/ 2>/dev/null
    mv coso*.tex grafi.tex prova.tex style.tex sandbox/ 2>/dev/null
    mv *.log *.aux *.toc *.pdf *.synctex* *.fdb_latexmk *.fls *.out _file_temporanei/ 2>/dev/null
    
    echo "File organizzati."

    # --- 3. PULIZIA PREAMBOLI (La parte importante) ---
    echo "Inizio pulizia preamboli duplicati (creo file .bak)..."
    
    # Definisco le cartelle dove pulire i file .tex
    local dirs_to_clean=("lezioni" "esercitazioni" "sandbox")
    
    for dir in "${dirs_to_clean[@]}"; do
        if [[ -d "$dir" ]]; then
            # Trova tutti i file .tex in quella cartella (non nelle sottocartelle)
            find "$dir" -maxdepth 1 -type f -name "*.tex" | while read -r file; do
                echo "Pulizia di: $file"
                
                # Crea un backup prima di modificare (es. Lezione1.tex -> Lezione1.tex.bak)
                # Questo comando è sicuro e funziona su Linux e macOS.
                sed -i.bak \
                    -e '/^\\documentclass/d' \
                    -e '/^\\usepackage/d' \
                    -e '/^\\begin{document}/d' \
                    -e '/^\\end{document}/d' \
                    "$file"
            done
        fi
    done
    
    echo "Pulizia completata. Controlla i file .tex e poi cancella i .bak"

    # --- 4. CREAZIONE .gitignore ---
    echo "Creo il file .gitignore..."
    # Usiamo 'cat << EOF' per scrivere un file multi-riga
cat > .gitignore << EOF
# File LaTeX da ignorare
*.aux
*.log
*.toc
*.out
*.fls
*.fdb_latexmk
*.synctex
*.synctex.gz
*.synctex(busy)
*~
.*.swp

# PDF (Opzionale: commenta se vuoi tenere i PDF su Git)
*.pdf

# File di backup di questo script
*.bak

# Cartella dei file temporanei
/_file_temporanei/
EOF

    echo "---"
    echo "🎉 OPERAZIONE COMPLETATA! 🎉"
    echo "La tua cartella è organizzata e i file .tex sono stati puliti."
    echo "Ricorda di controllare che 'main.tex' compili correttamente."
}