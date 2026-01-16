# Tools Directory

Utility scripts and tools for WIZRD operations.

## Available Tools

### PDF Generator
`tools/pdf-generator/`

Convert markdown documents to branded PDFs.

```bash
# Quick usage
./tools/pdf-generator/generate-pdf.sh content/case-studies/project.md

# Or via skill
/pdf content/case-studies/project.md
```

**Features:**
- Markdown to PDF conversion
- Customizable brand styling
- Batch conversion support
- HTML fallback (print from browser)

**Setup:**
```bash
brew install pandoc
pip install weasyprint
```

See `tools/pdf-generator/README.md` for details.

---

## Adding New Tools

1. Create a folder: `tools/[tool-name]/`
2. Add a `README.md` with usage instructions
3. Optionally create a matching skill in `.claude/skills/`
4. Update this README

## Tool Guidelines

- Keep tools self-contained in their folder
- Include clear installation instructions
- Provide usage examples
- Add `.gitkeep` to empty output directories
