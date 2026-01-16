---
company: Your Company Name
founder: Your Name
location: Your City, Country
established: 2024
---

# WIZRD - Company as Code

> Run `/init` to personalize this template for your business.

## Company Overview
[Your company] helps businesses leverage AI for competitive advantage.

**Your Details:**
- **Company**: [Your Company Name]
- **Location**: [Your City, Country]
- **Founded**: [Year]
- **Status**: [Remote-first / Hybrid / Office]

**Services:** (customize to your offerings)
1. **AI Strategy & Assessment**: Audits that pinpoint high-impact AI opportunities
2. **AI Agents & Automation**: Custom automations that eliminate repetitive tasks
3. **AI-Powered Applications**: Custom tools and integrations

## Brand Voice
Define your brand voice here:
- Direct and honest
- Practical and results-focused
- Builder mentality (behind-the-scenes, lessons learned)
- [Add your unique voice characteristics]

## Output Standards
- **Client Deliverables**: Data-driven, action-oriented, concise
- **Proposals**: Custom (never generic), include ROI projections
- **Documentation**: Always include "Why" + "How" + "What's Next"

## Automation Goals
- Automate routine operations via Claude Code (content drafts, research, admin)
- Human focuses on: Strategy, client relationships, high-value work
- Agent system validates patterns through daily use

## Guardrails
- Never share client-specific data publicly (anonymize case studies)
- Always validate data before presenting to clients
- Escalate to human: New contracts, major decisions, custom pricing
- Brand consistency: Every output should sound like you wrote it

## Knowledge Base
- See `/knowledge-base/playbooks/` for implementation patterns
- See `.claude/skills/` and `.claude/agents/` for AI capabilities
- See `/clients/templates/` for project templates
- See `AI-AGENTS.md` for complete agent/skill documentation

## How This Repository Works
1. **Skills auto-activate** based on description triggers (see `.claude/skills/`)
2. **Agents handle complex tasks** via isolated workflows (see `.claude/agents/`)
3. **Client projects** get their own CLAUDE.md with specific context
4. **Dev Docs** (plan.md, context.md, tasks.md) track multi-week projects
5. **Everything compounds** - every project makes the system smarter

## Available Capabilities

### Skills (Auto-Invoked Guidelines)
Located in `.claude/skills/` - auto-activate based on request:
1. **support** - Client issue triage, bug resolution, response templates
2. **finance** - Invoice generation, pricing calculator, expense tracking
3. **marketing** - Growth tactics, DM templates, engagement metrics

### Agents (Complex Multi-Step Tasks)
Located in `.claude/agents/` - invoke for isolated work:
1. **sales** - Lead qualification → research → proposal generation
2. **strategy** - Discovery synthesis → AI opportunities → roadmaps
3. **build** - Architecture → implementation → testing → deployment
4. **content** - Multi-post content generation

---

When you start work:
- Tell me which client/project
- I'll load relevant CLAUDE.md + skills
- I remember previous decisions
- I suggest next actions

Ready to work.
