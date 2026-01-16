# WIZRD - Company as Code

> **Your entire business as a repository-based AI system.**

Transform how you work: every client, project, and workflow becomes code that AI understands and executes. No more re-explaining context. No more forgotten decisions. Your company has a permanent brain.

---

## What is WIZRD?

**WIZRD** is a "Company as Code" template - your business operations encoded as a repository that AI reads, understands, and acts on:

- **Every client** = Folder with persistent context (CLAUDE.md)
- **Every project** = Memory system (plan.md, context.md, tasks.md)
- **Every workflow** = Automated agent or skill
- **Every lesson** = Compounds into reusable knowledge

**Result**: AI becomes your operating system, not just a tool.

---

## 4-Minute Setup

### 1. Install Prerequisites
```bash
# Install Claude Code CLI
npm install -g @anthropic-ai/claude-code
```

### 2. Clone This Template
```bash
git clone https://github.com/filippofilip95/WIZRD.git my-company
cd my-company
```

### 3. Run the Setup Wizard
```bash
claude
```

Then run:
```
/init
```

The setup wizard will:
- Ask about your company and services
- Configure your brand voice
- Auto-populate CLAUDE.md
- Optionally create your first client folder
- Clean up example files

### 4. Start Working

That's it. Claude now has context about your entire company.

---

## Repository Structure

```
WIZRD/
├── CLAUDE.md                    # Company-wide context (loaded every session)
├── AI-AGENTS.md                 # Agent/skill system documentation
│
├── .claude/
│   ├── agents/                  # 14 specialized agents for complex tasks
│   └── skills/                  # Auto-invoked guidelines and templates
│
├── clients/
│   ├── templates/               # Reusable client document templates
│   └── _example-acme-widgets/   # Example client (delete when ready)
│
├── projects/
│   └── templates/               # Project management templates
│
├── knowledge-base/
│   └── playbooks/               # How-to guides and patterns
│
├── content/
│   └── templates/               # Content creation templates
│
└── operations/
    └── templates/               # Operational templates
```

---

## Key Concepts

### 1. CLAUDE.md = Instant Context
Every folder can have a `CLAUDE.md` that AI reads automatically:
- Root `CLAUDE.md` = Company context
- Client `CLAUDE.md` = Client-specific context
- Project `CLAUDE.md` = Project-specific context

### 2. Dev Docs = Long-Term Memory
For multi-week projects, use the 3-file system:
- `plan.md` = Strategy + high-level decisions (rarely changes)
- `context.md` = Current status (update every session)
- `tasks.md` = Task checklist (update constantly)

### 3. Agents = Complex Tasks
14 specialized agents for multi-step workflows:
- `sales` - Lead qualification → proposals
- `content` - Multi-post content generation
- `strategy` - Discovery synthesis → roadmaps
- `build` - Architecture → implementation
- And 10 more...

### 4. Skills = Guidelines
Auto-invoked templates and standards:
- `support` - Client issue triage
- Templates for common tasks

---

## Quick Start Commands

Once you're in Claude Code:

```bash
# Create a new client
"Create a new client folder for [Company Name]"

# Qualify a lead
"Use the sales agent to qualify this new inquiry: [paste inquiry]"

# Generate content
"Use the content agent to create LinkedIn posts from [topic]"

# Analyze a discovery call
"Use the strategy agent to synthesize this discovery transcript"

# Review before sending
"Use the critic agent to review this proposal"
```

---

## Creating Your First Client

```bash
# 1. Copy the templates
cp -r clients/templates clients/acme-corp

# 2. Fill in CLAUDE.md
# Open clients/acme-corp/CLAUDE.md and add client details

# 3. Start working
claude
"Let's work on the Acme Corp project"
```

See `clients/_example-acme-widgets/` for a complete example.

---

## Available Agents

| Agent | Purpose | Use When |
|-------|---------|----------|
| `sales` | Lead qualification, proposals | New inquiry, need proposal |
| `content` | Social posts, case studies | Creating content |
| `strategy` | Discovery synthesis, roadmaps | After discovery calls |
| `build` | Technical implementation | Building solutions |
| `research` | Company/industry analysis | Before meetings |
| `audit` | AI opportunity assessment | Running audits |
| `admin` | Follow-ups, invoices | Admin tasks |
| `review` | Repo health checks | Validating structure |
| `critic` | Quality review | Before sending |
| `brainstormer` | Idea generation | Need fresh ideas |
| `elicit` | Deep requirements | Finding blind spots |
| `orchestrator` | Route to best agent | Unsure which agent |
| `content-sk` | Slovak content | Slovak language |

See `AI-AGENTS.md` for detailed documentation.

---

## The Knowledge Compounding Loop

```
1. CLIENT PROJECT
   ↓
2. LESSONS LEARNED
   ↓
3. CONTENT GENERATION
   ↓
4. INDUSTRY RESEARCH
   ↓
5. BETTER TEMPLATES
   ↓
6. NEXT PROJECT (starts smarter)
```

Every project makes your system smarter.

---

## Customization Checklist

- [ ] Update `CLAUDE.md` with your company info
- [ ] Review and customize agents in `.claude/agents/`
- [ ] Add your own skills in `.claude/skills/`
- [ ] Create your first real client folder
- [ ] Delete `_example-acme-widgets/` when ready
- [ ] Add your knowledge to `knowledge-base/`

---

## Philosophy: Company as Code

> **Your company isn't a collection of documents. It's a codebase.**

The old way: Re-explain context every conversation. AI forgets everything. You're the eternal onboarding manager for a goldfish.

The new way: Your entire company - clients, projects, decisions, processes - lives in a git repository. AI reads it. AI understands it. AI picks up exactly where you left off, even weeks later.

**This is Company as Code.**

See `knowledge-base/playbooks/company-as-code-foundation.md` for the full philosophy.

---

## Contributing

This template is open source. Feel free to:
- Adapt it for your business
- Share improvements
- Create industry-specific versions

---

## Credits

Inspired by:
- The "Company as Code" movement
- Claude Code's `.claude/` conventions
- Real-world agency operations

---

## License

MIT License - Use freely, adapt as needed.

---

**Ready to transform your business?** Start with `claude` and see the difference.
