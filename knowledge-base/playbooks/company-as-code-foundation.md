# Company as Code - Foundation Document

**Purpose**: Core philosophy and structure for WIZRD-style repository
**Status**: Living document - evolves with the system

---

## Core Philosophy: Company as Code

### The Big Idea

Instead of scattered documents, chat histories, and forgotten decisions, your entire company operates as a **repository-based AI system** where:

- **Every client** = Folder with persistent context (CLAUDE.md)
- **Every project** = Memory system (plan.md, context.md, tasks.md)
- **Every workflow** = Automated skill with executable patterns
- **Every lesson** = Compounds into reusable knowledge
- **Every decision** = Documented and queryable forever

**Result**: AI becomes your company's operating system, not just a tool.

---

## The Paradigm Shift

### OLD WAY: Chat-Based AI (99% of users)
```
Monday: "AI, help me with Acme Corp proposal"
→ Paste client info
→ Paste discovery notes
→ Wait for generic response
→ Spend 2 hours customizing

Tuesday: "AI, update that proposal"
→ AI has ZERO memory from Monday
→ Re-explain everything
→ Re-paste all context
→ Repeat the cycle

Result: AI as forgetful intern you constantly train
```

### NEW WAY: Repository-Based AI (Top 1%)
```
Monday: "AI, analyze Acme Corp discovery and draft proposal"
→ AI reads /clients/acme/CLAUDE.md (instant context)
→ AI reads /clients/acme/discovery/*.md (all sessions)
→ Generates tailored proposal in 20 minutes

Tuesday: "AI, update Acme proposal with feedback"
→ AI remembers Monday (reads context.md)
→ AI knows the client (CLAUDE.md)
→ Updates proposal with minimal input

Result: AI as senior consultant with photographic memory
```

---

## The 7 Core Principles

### 1. Repository = Permanent Brain
- **NOT**: Temporary chat conversations
- **YES**: Persistent file structure AI reads forever
- **Example**: `/clients/acme/CLAUDE.md` loaded every session = instant context

### 2. CLAUDE.md = Context On Demand
- **NOT**: Re-explaining project details every conversation
- **YES**: One file with client pain points, communication style, guardrails
- **Result**: Every deliverable starts with full context, not from scratch

### 3. Dev Docs = Long-Term Memory
For multi-week projects:
- `plan.md` = Strategy + high-level decisions + WHY
- `context.md` = Current state (what's done, what's in progress, what's blocked)
- `tasks.md` = Checklist (specific next actions)
- **Result**: AI picks up EXACTLY where you left off, even weeks later

### 4. Skills = Workflows + Guidelines
- **NOT**: Just instructions in markdown
- **YES**: Instructions + templates + best practices
- **Result**: Consistent quality across all work

### 5. Progressive Disclosure = Smart Loading
Three levels to prevent context overload:
- **Level 1**: Metadata (YAML frontmatter) - always loaded
- **Level 2**: Full SKILL.md - loaded when triggered
- **Level 3**: Helper files - loaded as needed
- **Result**: Unlimited skill library, only load what's needed NOW

### 6. Agents = Isolated Processing
- **NOT**: Everything in one conversation (context pollution)
- **YES**: Spawn specialized agents for complex tasks
- **Example**: Research agent → Sales agent → Critic agent (pipeline)

### 7. Knowledge Compounding = Every Project Makes You Smarter
- Each project → Lessons learned → Content → Industry research → Better next project
- **Result**: Exponential improvement over time

---

## Repository Architecture

### Top-Level Structure
```
WIZRD-template/
├── CLAUDE.md                    # Company-wide context (loaded every session)
├── AI-AGENTS.md                 # Agent/skill system docs
│
├── .claude/                     # AI capabilities
│   ├── agents/                  # Complex multi-step workflows
│   └── skills/                  # Auto-invoked guidelines
│
├── clients/                     # Client projects
│   ├── templates/               # Reusable client docs
│   └── [client-name]/           # Each client gets a folder
│       ├── CLAUDE.md            # Client context
│       ├── context.md           # Current state
│       ├── tasks.md             # Next actions
│       └── deliverables/        # Project outputs
│
├── projects/                    # Internal projects
│   └── templates/               # Project management templates
│
├── knowledge-base/              # Compounding intelligence
│   ├── playbooks/               # How-to guides
│   ├── lessons-learned/         # Post-project insights
│   └── industry-research/       # Domain knowledge
│
├── content/                     # Marketing & thought leadership
│   └── templates/               # Content templates
│
└── operations/                  # Business operations
    └── templates/               # Operational templates
```

---

## The 3-File Memory System (Dev Docs)

### When to Use Dev Docs
- Multi-week projects (not one-off tasks)
- Complex client engagements
- Internal product development
- Any work spanning 3+ sessions

### The Three Files

#### 1. `plan.md` - The Strategy Document
**Purpose**: High-level decisions and WHY
**Never changes** unless strategy pivots

#### 2. `context.md` - What's Happening NOW
**Purpose**: Current state
**Updated frequently** (after every major work session)

#### 3. `tasks.md` - The Checklist
**Purpose**: Specific next actions
**Updated constantly** (check off as you go)

---

## Knowledge Compounding Loop

### The Virtuous Cycle

```
1. CLIENT PROJECT
   ↓
2. LESSONS LEARNED DOCUMENT
   (Post-project extraction)
   ↓
3. CONTENT GENERATION
   (Posts, articles, case studies)
   ↓
4. INDUSTRY RESEARCH FILE
   (Patterns across similar clients)
   ↓
5. SKILL IMPROVEMENTS
   (Better templates, workflows)
   ↓
6. NEXT CLIENT PROJECT
   (Starts with more context than the last)
```

---

## Automation Philosophy

### The 80/20 Rule
**Goal**: 80% automation, 20% human focus

**Human Focus Areas**:
- Strategy and complex problem-solving
- Client relationships and sales
- System improvement and evolution
- Final quality review

**Automation Areas**:
- Invoice generation
- Discovery synthesis
- Lead qualification
- Content creation
- Research and analysis
- Routine communications

---

## Common Patterns

### Starting a New Client Project
```
1. Create client folder: /clients/[client-name]/
2. Copy templates: CLAUDE.md, brief.md, discovery.md, proposal.md
3. Fill in CLAUDE.md: Industry, pain points, communication style, guardrails
4. Run discovery sessions → Save notes to discovery/
5. Use strategy agent: "Synthesize discovery sessions for [client]"
6. Generate proposal: "Create proposal based on discovery findings"
```

### Completing a Client Project
```
1. Document achievements
2. Extract lessons learned: /knowledge-base/lessons-learned/[client]-[project].md
3. Generate content: Posts, case study
4. Update industry research: Add patterns to relevant industry file
5. Improve skills/templates: Add learnings for next project
```

### Monthly Operations
```
1. Generate invoices
2. Create monthly report
3. Review content calendar
4. Update context.md for all active projects
5. Review lessons learned: What patterns emerged?
```

---

## Success Metrics

### Automation Metrics
- Hours saved per week
- Manual tasks eliminated
- Response time improvement

### Content Metrics
- Posts published
- Case studies created
- Lessons learned documented

### Knowledge Compounding
- Industry research files
- Reusable patterns
- Template improvements

---

## Using This Document

### For Humans
- **Read when**: Starting new projects, reviewing strategy, onboarding team
- **Update when**: Major architectural decisions, new patterns discovered
- **Share with**: Future team members, interested parties

### For AI
- **Load when**: Session start (via CLAUDE.md reference)
- **Reference for**: Understanding system architecture, following conventions
- **Update when**: New patterns validated through real projects

---

**Status**: Living document - evolves with system maturity
