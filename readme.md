# VAWi Vorlage für wissenschaftliche Arbeiten

## Überblick

Das Template soll einen mordernen und minimalistischen Ansatz für wissenschaftliche Arbeiten widerspiegeln.

Weiterhin ist der Aufbau weitesgehend automatisiert. So sind alle persönlichen Variablen in `main.tex` zu setzen. Weiterhin werden alle Verzeichnisse nur erzeugt, wenn auch entsprechende Verweise vorhanden sind. Letztlich können bestimme Elemente je nach Typ der Arbeit ein- und ausgeblendet werden.

## Format

Die Arbeit nutzt OpenSans in der Schriftgröße 11 als Standard-Schriftart. Die Serifenlose Schrift bietet ein neutrales Schriftbild und ist am ehesten mit Arial zu vergleichen.

Bis zum Hauptteil ist das Template römisch nummeriert, danach arabisch. Der Zitierstil ist standardmäßig auf "Chicago Notes" eingestellt, kann aber beliebig angepasst werden.

### Aufbau des Verzeichnis

Das Template ist grundsätzlich in 4 Dateien aufgeteilt. Dazu kommen noch einige Ordner.

#### Dateien im Root-Verzeichnis

- `main.tex`

   Die Datei enthält das Dokument, sowie alle durch den Nutzer anzupassenden Variablen. Allerdings wird hier nicht der Hauptteil geschrieben, dieser ist zur Übersichtlichkeit in einer eigenen Datei.
- `config.tex`

   Manifestiert die grundlegende Formatierung der Vorlage. Im Regelfall muss hier nichts angepasst werden.
- `content.tex`

   Beinhaltet den Hauptteil der Arbeit.
- `bibliography.bib`

   Literaturreferenzen

#### Ordner

- `templates`

   Beinhaltet alle Seiten wie zum Beispiel das Deckblatt, den Sperrvermerk oder die Vertraulichkeitserklärung.
- `images`

   Ordner für alle verwendeten Bilder in der Arbeit
- `code`

   Ordner für verwendetet Code Referenzen

---

## Variablen

Die Variablen werden, wie bereits erwähnt in der `main.tex` Datei gesetzt. Dazu gehören alle Parameter die von Arbeit zu Arbeit angepasst werden müssen.

| Variable | Bedeutung |
--- | ---
Allgemeines |
`\title` | Titel der Arbeit
`\titleEN` | Englischer Titel der Arbeit
`\date` | Datum der Abgabe (Standard ist `\today`)
`\typeofwork` | Art der Arbeit (z.B. Masterarbeit, Projektarbeit)
`\company` | Unternehmen, falls die Arbeit einen Kotext hat
`\uni` | Universität an der die Arbeit geschrieben wird
Autor |
`\author` | Autor der Arbeit
`\street` | Adresse des Autors
`\zipcode` | Postleitzahl
`\city` | Stadt
`\mtrnr` | Matrikelnummer des Autors
Gutachter |
`\firstexpert` | erster Gutachter
`\secondexpert` | zweiter Gutachter
Abgabe |
`\submissiondate` | Abgabedatum
`\submissionsemester` | Abgabesemester

Neben den Text-Variablen gibt es noch 2 Boolean Variablen, die bestimmte Inhalte steuern. Dabei gilt: 

`1 == true`

`0 == false`

| Variable | Bedeutung |
--- | ---
`\secondsubmission` | Ein-/Ausblenden des zweiten Gutachters
`\confidential` | Ein-/Ausblenden des Sperrvermerks


## Build Prozess

Das Projekt kann mit `pdflatex` und `biber` kompiliert werden. Für VS Code mit
der Erweiterung `latex-workshop` sind bereits alle Build Parameter gesetzt.

Je nach dem ob shell-escape benötigt wird `pdflatex` mit folgenden
Parametern aufgerufen:

- `--shell-escape`
- `-synctex=1`
- `-interaction=nonstopmode`
- `-file-line-error`

Die kompletten Befehle können auch [hier](.vscode/settings.json) nachgeschaut
werden.

Die empfohlenen Build Schritte sind:

**pdflatex ➞ biber ➞ pdflatex × 2**

### DOCX Export

Für die Rechtschreibungsüberprüfung in Word, oder einfach zur Korrektur eines
Dritten kann das Dokument auch als Word-Datei exportiert werden. Dabei werden
nicht alle Funktionen korrekt abgebildet. Um dem PDF möglichst nahe zu kommen
beinhaltet das Projekt ein [Template](pandoc-template.docx).

Der Exportbefehel für Pandoc lautet:

```shell
pandoc main.tex -N --bibliography=bibliography.bib -o main.docx --reference-doc=pandoc-template.docx
```