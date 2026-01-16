# PDF Generator

Convert markdown documents to professionally branded PDFs.

## Installation

```bash
# 1. Install Pandoc
brew install pandoc

# 2. Install WeasyPrint (recommended for best quality)
pip install weasyprint

# Or use the installer script
./generate-pdf.sh --install
```

## Quick Start

```bash
# Convert a case study
./generate-pdf.sh content/case-studies/my-project.md

# Convert with custom output path
./generate-pdf.sh document.md ~/Desktop/document.pdf

# Generate HTML (print to PDF from browser)
./generate-pdf.sh --html document.md

# Batch convert all case studies
./generate-pdf.sh --batch content/case-studies/
```

## Directory Structure

```
pdf-generator/
├── generate-pdf.sh          # Main conversion script
├── output/                   # Generated PDFs go here
├── templates/
│   ├── styles.css           # Brand styling (customize this!)
│   └── template.html        # HTML wrapper
└── README.md
```

## Customization

### Brand Colors
Edit `templates/styles.css`:
```css
:root {
  --primary: #552cd5;    /* Your brand color */
  --text: #171717;       /* Body text */
  --accent: #0ea5e9;     /* Highlights */
}
```

### Footer
Edit `templates/template.html` to add your:
- Company name
- Website
- Contact info
- Logo (SVG recommended)

## PDF Engines

The script tries these in order:
1. **WeasyPrint** - Best quality, pip install
2. **pdflatex** - Good quality, brew install basictex
3. **prince** - Commercial, excellent quality
4. **(fallback)** - Generates HTML for browser printing

## Usage with Claude Code

```bash
# Via the /pdf skill
/pdf content/case-studies/my-project.md

# Or ask directly
"Generate a PDF from the ACME case study"
```

## Tips

- Use `--html` if PDF engine isn't working - print from browser
- PDFs go to `output/` by default
- On macOS, PDFs auto-open after generation
- Batch mode processes all .md files in a directory
