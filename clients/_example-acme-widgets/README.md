# Example Client: Acme Widgets

**This is a fictional example** to demonstrate how to structure client folders in WIZRD.

## What's Included

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Client context loaded every session |
| `context.md` | Current project status |
| `tasks.md` | Task checklist |
| `deliverables/` | Project outputs |

## How to Use This Example

1. **Read through each file** to understand the format
2. **When you get a real client**, copy the `/clients/templates/` folder instead
3. **Delete this example** once you're comfortable with the structure

## Key Patterns Demonstrated

### CLAUDE.md
- YAML frontmatter for metadata
- Client overview in a scannable format
- Pain points with direct quotes
- Stakeholder mapping
- Client-specific guardrails

### context.md
- Current phase tracking
- Recent completions
- Active work items
- Blockers with clear ownership
- Next steps

### tasks.md
- In progress with subtasks
- Prioritized backlog
- Clear owners and due dates
- Blocked items tracked separately

## Creating Your First Client

```bash
# 1. Copy templates
cp -r clients/templates clients/your-client-name

# 2. Fill in CLAUDE.md with client info

# 3. Add context.md and tasks.md as project progresses

# 4. Store deliverables in deliverables/
```

---

Feel free to delete this folder once you understand the structure!
