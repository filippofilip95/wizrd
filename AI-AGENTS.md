# AI Agents & Skills - WIZRD System

This repository uses a structured agent/skill system for AI automation. If you're an AI assistant (Claude Code, Cursor, Windsurf, Gemini, etc.), read this to understand how to use the capabilities in `.claude/`.

---

## Directory Structure

```
.claude/
├── skills/          # Auto-invoked expertise (guidelines, templates)
│   ├── support/     # Client support workflows
│   ├── finance/     # Invoicing & pricing
│   └── marketing/   # Growth tactics
│
└── agents/          # Complex isolated tasks (multi-step workflows)
    ├── sales.md     # Lead qualification → proposals
    ├── strategy.md  # Discovery → AI strategy
    ├── build.md     # Development implementation
    └── content.md   # Multi-post content generation
```

---

## How to Use Skills

**Location:** `.claude/skills/{skill-name}/SKILL.md`

**What:** Auto-invoked guidelines, templates, standards
**When:** Load when user request matches skill description
**Format:** Each skill has `SKILL.md` with YAML frontmatter

### Available Skills

#### 1. Support (`support`)
**Triggers:** client issue, bug, support ticket, problem, troubleshooting
**Purpose:** Issue triage, resolution workflows, response templates
**Use when:** Handling client problems or support requests

#### 2. Finance (`finance`)
**Triggers:** invoice, payment, pricing, expense, financial report
**Purpose:** Invoice generation, pricing calculator, VAT calculations
**Use when:** Creating invoices, tracking expenses, financial operations

#### 3. Marketing (`marketing`)
**Triggers:** LinkedIn, DM, lead generation, growth metrics, outreach
**Purpose:** Social strategies, DM templates, engagement tactics
**Use when:** Planning social content, responding to leads, analyzing growth

### How to Load a Skill

**If you support Claude Code format:**
```markdown
Read `.claude/skills/{skill-name}/SKILL.md` when description matches request
```

**If you don't have native skill support:**
```markdown
When user mentions [trigger keywords], read:
.claude/skills/support/SKILL.md    # For support requests
.claude/skills/finance/SKILL.md    # For financial tasks
.claude/skills/marketing/SKILL.md  # For marketing/growth
```

---

## How to Use Agents

**Location:** `.claude/agents/{agent-name}.md`

**What:** Complex multi-step workflows requiring isolated context
**When:** User needs multi-step analysis or generation
**Format:** Single markdown file with YAML frontmatter + instructions

### Available Agents

| Agent | Purpose | Human Role | AI Level |
|-------|---------|------------|----------|
| `content` | Blog, social, case studies | Review | 95% |
| `sales` | Lead qual, proposals | Customize | 80% |
| `strategy` | Discovery, AI strategy | Finalize | 70% |
| `build` | Architecture, code | Implement | 40% |
| `research` | Company/industry analysis | Review | 95% |
| `audit` | Assessment framework | Present | 80% |
| `admin` | Follow-ups, invoices, scheduling | Execute | 70% |
| `review` | Repo health & validation | Auto | 100% |
| `critic` | Quality gate, devil's advocate | Review | 90% |
| `brainstormer` | Creative ideation (54 techniques) | Review | 95% |
| `elicit` | Deep extraction (50 methods) | Approve | 85% |
| `orchestrator` | Dispatcher, routes to best agent | Auto | 95% |

---

#### 1. Content (`content`)
**Purpose:** Multi-post content generation following your brand voice
**Use when:** Creating social posts, blog articles, case studies
**Multi-step:** Analyze source → select format → draft → quality check

#### 2. Sales (`sales`)
**Purpose:** Lead qualification → prospect research → proposal generation
**Use when:** New inquiry, creating proposals, qualifying leads
**Multi-step:** Research → qualify → prepare discovery → generate proposal

#### 3. Strategy (`strategy`)
**Purpose:** Discovery synthesis → opportunity analysis → strategic roadmaps
**Use when:** Analyzing discovery calls, creating strategies, industry research
**Multi-step:** Synthesize findings → identify opportunities → create roadmap

#### 4. Build (`build`)
**Purpose:** Technical architecture → implementation → testing → deployment
**Use when:** Building systems, implementing automations, technical work
**Multi-step:** Design → code → test → deploy → document

#### 5. Research (`research`)
**Purpose:** Deep company research, industry analysis, competitor research
**Use when:** Before proposals, assessments, client meetings
**Multi-step:** Gather data → analyze → synthesize → report

#### 6. Audit (`audit`)
**Purpose:** Assessment framework - opportunity assessment and deliverables
**Use when:** Running assessments for clients
**Multi-step:** Discovery → Analysis → Opportunity Matrix → Recommendations

#### 7. Admin (`admin`)
**Purpose:** Administrative tasks, follow-ups, invoices, scheduling
**Use when:** Client follow-ups, billing prep, weekly reviews
**Multi-step:** Check status → draft messages → prepare docs

#### 8. Review (`review`)
**Purpose:** Repository health checks, structure validation
**Use when:** Before PRs, periodic health checks, validating standards

#### 9. Critic (`critic`)
**Purpose:** Devil's advocate for quality control - proposals, strategies, content
**Use when:** Before sending proposals, validating strategies, content review
**Multi-step:** Analyze → find weaknesses → check alignment → verdict

#### 10. Brainstormer (`brainstormer`)
**Purpose:** Creative ideation using 54 proven techniques across 10 categories
**Use when:** Need fresh ideas, solving creative blocks, exploring possibilities
**Modes:** AUTONOMOUS (AI generates independently) or GUIDED (facilitates session)

#### 11. Elicit (`elicit`)
**Purpose:** Deep requirements extraction and strategy refinement using 50 methods
**Use when:** Refining proposals, deepening strategies, finding blind spots
**Multi-step:** Context analysis → method selection → iterative enhancement

#### 12. Orchestrator (`orchestrator`)
**Purpose:** Central dispatcher that routes requests to the best agent
**Use when:** Unsure which agent to use, complex multi-agent workflows

### How to Invoke an Agent

**If you support Claude Code agents:**
```markdown
Use Task tool with subagent_type parameter:
Task(subagent_type="sales", prompt="Qualify this lead...")
```

**If you don't have agent support:**
```markdown
Load the agent instructions and execute in isolated context:
1. Read `.claude/agents/{agent-name}.md`
2. Follow the instructions in a focused session
3. Return results without polluting main conversation
```

---

## Decision Tree: Skill vs Agent?

```
User Request
    │
    ├─ Simple guideline/template needed?
    │   └─ YES → Load SKILL from .claude/skills/
    │
    └─ Multi-step complex task?
        └─ YES → Invoke AGENT from .claude/agents/
```

**Examples:**

| Request | Type | What to Use |
|---------|------|-------------|
| "Create an invoice for ClientCo" | Template | **finance** skill |
| "How should I respond to this support ticket?" | Guideline | **support** skill |
| "New inquiry from Company X - qualify and create proposal" | Multi-step | **sales** agent |
| "Analyze this discovery call and create strategy" | Complex | **strategy** agent |
| "Build the reporting automation system" | Implementation | **build** agent |
| "Generate 3 LinkedIn posts from project learnings" | Multi-post | **content** agent |

---

## Skill File Format

```yaml
---
name: skill-name
description: What it does and when to use it (trigger keywords here)
---

# Skill Name

## Role
[What this skill provides]

## Core Workflow
[Step-by-step instructions]

## Guidelines
[Standards, templates, rules]
```

---

## Agent File Format

```yaml
---
name: agent-name
description: When to use this agent with examples
color: blue
---

# Agent Name

## Role
[What this agent does]

## Core Workflow
[Multi-step process]

## Decision Authority
[What to auto-execute vs request approval]
```

---

## For Non-Claude Code AIs

If you don't have native `.claude/` support:

1. **On session start:** Check if `.claude/skills/` and `.claude/agents/` exist
2. **Read this file** to understand available capabilities
3. **When user request matches triggers:** Read relevant skill SKILL.md
4. **For complex tasks:** Load agent .md file and execute in focused mode
5. **Preserve context:** Use agents to avoid polluting main conversation

---

## Quick Reference

```bash
# Skills (auto-invoke guidelines)
.claude/skills/support/SKILL.md      # Support workflows
.claude/skills/finance/SKILL.md      # Invoicing & pricing
.claude/skills/marketing/SKILL.md    # Growth tactics

# Agents (complex multi-step)
.claude/agents/content.md            # Social, case studies, blog
.claude/agents/sales.md              # Lead qual → proposal
.claude/agents/strategy.md           # Discovery → roadmap
.claude/agents/build.md              # Design → implementation
.claude/agents/research.md           # Company/industry research
.claude/agents/audit.md              # Assessment framework
.claude/agents/admin.md              # Follow-ups, invoices
.claude/agents/review.md             # Repo health & validation
.claude/agents/critic.md             # Quality gate, devil's advocate
.claude/agents/brainstormer.md       # Creative ideation (54 techniques)
.claude/agents/elicit.md             # Deep extraction (50 methods)
.claude/agents/orchestrator.md       # Dispatcher, routes to best agent
```

## Common Commands

```bash
# Content
"Use content agent to create LinkedIn posts for this week"
"Use content agent to create a case study"

# Research + Audit (pipeline)
"Use research agent to analyze [Company]"
"Use audit agent to create Opportunity Matrix"

# Sales
"Use sales agent to create proposal for [Company]"

# Admin
"Use admin agent to check client follow-ups"
"Use admin agent to prepare invoices"

# Review
"Use review agent to run health check"
"Use review agent to validate structure before PR"

# Critic (Quality Gate)
"Use critic agent to review this proposal"
"Use critic agent to validate this strategy"

# Brainstormer (Creative Ideation)
"Use brainstormer agent to brainstorm monetization ideas"  # autonomous
"Use brainstormer agent to help me brainstorm"             # guided

# Elicit (Deep Extraction)
"Use elicit agent to refine this proposal"
"Use elicit agent to find what I'm missing"

# Orchestrator (Dispatcher)
"Use orchestrator to help with [Project]"  # routes to best agent
"Prepare everything for client meeting"     # multi-agent workflow
```

---

**Compatible With:** Claude Code, Cursor, Windsurf, Gemini, any AI CLI that can read markdown
