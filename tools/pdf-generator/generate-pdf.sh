#!/bin/bash
# WIZRD PDF Generator
# Converts Markdown files to branded PDFs using Pandoc
#
# Usage: ./generate-pdf.sh <input.md> [output.pdf]
#        ./generate-pdf.sh --html <input.md>  (generates HTML, print to PDF from browser)
#
# Requirements:
#   brew install pandoc
#   One of: weasyprint, pdflatex, or use --html for browser printing

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/templates"
OUTPUT_DIR="$SCRIPT_DIR/output"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect available PDF engine
detect_pdf_engine() {
    if command -v weasyprint &> /dev/null; then
        echo "weasyprint"
    elif command -v pdflatex &> /dev/null; then
        echo "pdflatex"
    elif command -v prince &> /dev/null; then
        echo "prince"
    else
        echo "none"
    fi
}

# Check dependencies
check_dependencies() {
    if ! command -v pandoc &> /dev/null; then
        echo -e "${RED}Error: pandoc is not installed${NC}"
        echo "Install with: brew install pandoc"
        exit 1
    fi

    PDF_ENGINE=$(detect_pdf_engine)

    if [ "$PDF_ENGINE" = "none" ]; then
        echo -e "${YELLOW}No PDF engine found. Options:${NC}"
        echo "  1. pip install weasyprint (recommended)"
        echo "  2. brew install --cask basictex"
        echo "  3. Use --html flag to generate HTML and print from browser"
        echo ""
    else
        echo -e "${BLUE}Using PDF engine: $PDF_ENGINE${NC}"
    fi
}

# Generate HTML (for browser printing)
generate_html() {
    local INPUT_FILE="$1"
    local OUTPUT_FILE="$2"

    if [ -z "$OUTPUT_FILE" ]; then
        BASENAME=$(basename "$INPUT_FILE" .md)
        OUTPUT_FILE="$OUTPUT_DIR/${BASENAME}.html"
    fi

    mkdir -p "$(dirname "$OUTPUT_FILE")"

    echo -e "${YELLOW}Generating HTML...${NC}"
    echo "  Input:  $INPUT_FILE"
    echo "  Output: $OUTPUT_FILE"

    pandoc "$INPUT_FILE" \
        --template="$TEMPLATE_DIR/template.html" \
        --css="$TEMPLATE_DIR/styles.css" \
        --embed-resources \
        --standalone \
        --metadata title="$(head -1 "$INPUT_FILE" | sed 's/^#\s*//')" \
        -o "$OUTPUT_FILE"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Success!${NC} HTML generated: $OUTPUT_FILE"
        echo -e "${BLUE}Tip: Open in browser and use Print → Save as PDF${NC}"

        if [[ "$OSTYPE" == "darwin"* ]]; then
            open "$OUTPUT_FILE"
        fi
    else
        echo -e "${RED}Error generating HTML${NC}"
        exit 1
    fi
}

# Main function
generate_pdf() {
    local INPUT_FILE="$1"
    local OUTPUT_FILE="$2"

    # Validate input
    if [ -z "$INPUT_FILE" ]; then
        echo -e "${RED}Error: No input file specified${NC}"
        echo "Usage: $0 <input.md> [output.pdf]"
        exit 1
    fi

    if [ ! -f "$INPUT_FILE" ]; then
        echo -e "${RED}Error: File not found: $INPUT_FILE${NC}"
        exit 1
    fi

    # Check for PDF engine
    PDF_ENGINE=$(detect_pdf_engine)

    if [ "$PDF_ENGINE" = "none" ]; then
        echo -e "${YELLOW}No PDF engine available. Generating HTML instead...${NC}"
        generate_html "$INPUT_FILE" "${OUTPUT_FILE%.pdf}.html"
        return
    fi

    # Generate output filename if not provided
    if [ -z "$OUTPUT_FILE" ]; then
        BASENAME=$(basename "$INPUT_FILE" .md)
        OUTPUT_FILE="$OUTPUT_DIR/${BASENAME}.pdf"
    fi

    # Ensure output directory exists
    mkdir -p "$(dirname "$OUTPUT_FILE")"

    echo -e "${YELLOW}Generating PDF with $PDF_ENGINE...${NC}"
    echo "  Input:  $INPUT_FILE"
    echo "  Output: $OUTPUT_FILE"

    # Run pandoc
    pandoc "$INPUT_FILE" \
        --template="$TEMPLATE_DIR/template.html" \
        --css="$TEMPLATE_DIR/styles.css" \
        --embed-resources \
        --standalone \
        --pdf-engine="$PDF_ENGINE" \
        --metadata title="$(head -1 "$INPUT_FILE" | sed 's/^#\s*//')" \
        -o "$OUTPUT_FILE"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Success!${NC} PDF generated: $OUTPUT_FILE"

        # Open on macOS
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open "$OUTPUT_FILE"
        fi
    else
        echo -e "${RED}Error generating PDF${NC}"
        exit 1
    fi
}

# Batch conversion
batch_convert() {
    local INPUT_DIR="$1"
    local PATTERN="${2:-*.md}"
    local FORMAT="${3:-pdf}"

    echo -e "${YELLOW}Batch converting: $INPUT_DIR/$PATTERN${NC}"

    find "$INPUT_DIR" -name "$PATTERN" -type f | while read -r file; do
        if [ "$FORMAT" = "html" ]; then
            generate_html "$file"
        else
            generate_pdf "$file"
        fi
    done
}

# Install helper
install_weasyprint() {
    echo -e "${YELLOW}Setting up WeasyPrint...${NC}"

    if command -v brew &> /dev/null; then
        echo "Installing via Homebrew + pip..."
        python3 -m venv "$SCRIPT_DIR/.venv"
        source "$SCRIPT_DIR/.venv/bin/activate"
        pip install weasyprint
        echo -e "${GREEN}WeasyPrint installed!${NC}"
        echo "Note: Activate venv before running: source $SCRIPT_DIR/.venv/bin/activate"
    else
        echo -e "${RED}Please install manually:${NC}"
        echo "  python3 -m venv $SCRIPT_DIR/.venv"
        echo "  source $SCRIPT_DIR/.venv/bin/activate"
        echo "  pip install weasyprint"
    fi
}

# Parse arguments
case "$1" in
    --html)
        check_dependencies
        generate_html "$2" "$3"
        ;;
    --batch)
        check_dependencies
        batch_convert "$2" "$3" "$4"
        ;;
    --install)
        install_weasyprint
        ;;
    --help|-h)
        echo "WIZRD PDF Generator"
        echo ""
        echo "Usage:"
        echo "  $0 <input.md> [output.pdf]      Convert to PDF"
        echo "  $0 --html <input.md> [out.html] Convert to HTML (print from browser)"
        echo "  $0 --batch <dir> [*.md] [pdf|html]  Batch convert"
        echo "  $0 --install                    Setup WeasyPrint in venv"
        echo "  $0 --help                       Show this help"
        echo ""
        echo "Examples:"
        echo "  $0 content/case-studies/project.md"
        echo "  $0 --html proposal.md"
        echo "  $0 --batch content/case-studies/"
        ;;
    *)
        check_dependencies
        generate_pdf "$1" "$2"
        ;;
esac
