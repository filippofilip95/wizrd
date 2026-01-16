# Clients Directory

This folder contains all client projects. Each client gets their own folder with standardized structure.

## Folder Structure

```
clients/
├── templates/               # Copy these for new clients
│   ├── CLAUDE.md            # Client context template
│   ├── brief.md             # Initial lead qualification
│   ├── discovery.md         # Discovery call notes
│   ├── proposal.md          # Project proposal
│   └── contract.md          # Contract summary
│
├── _example-acme-widgets/   # Example client (delete when ready)
│
└── [client-name]/           # Real client folders go here
    ├── CLAUDE.md            # Client context (always load)
    ├── context.md           # Current project status
    ├── tasks.md             # Task checklist
    └── deliverables/        # Project outputs
```

## Creating a New Client

```bash
# 1. Copy templates
cp -r clients/templates clients/[client-name]

# 2. Fill in CLAUDE.md with client info

# 3. Add context.md and tasks.md as project progresses

# 4. Store deliverables in deliverables/
```

## Client Lifecycle

### 1. Lead Stage
- Create folder with `brief.md`
- Qualify using sales agent
- Score ICP fit

### 2. Discovery Stage
- Fill in `discovery.md` after calls
- Use strategy agent to synthesize

### 3. Proposal Stage
- Generate proposal using `proposal.md` template
- Use sales agent to customize

### 4. Active Project
- Maintain `CLAUDE.md`, `context.md`, `tasks.md`
- Update after every work session

### 5. Completion
- Document achievements
- Extract lessons learned
- Archive or mark as completed

## CLAUDE.md Best Practices

1. **Keep it scannable** - Use bullet points and headers
2. **Include quotes** - Direct client quotes are gold
3. **Document guardrails** - What NOT to do is as important as what to do
4. **Update regularly** - As you learn more about the client

## Naming Conventions

- Folder names: `lowercase-with-dashes`
- File names: Use the templates (CLAUDE.md, context.md, etc.)
- Deliverables: `[date]-[type]-[description].[ext]`

---

See `_example-acme-widgets/` for a complete example.
