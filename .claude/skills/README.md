# Skills Directory

Skills are auto-invoked guidelines that provide templates, standards, and workflows for specific domains.

## How Skills Work

1. **Auto-activation**: Skills load automatically when your request matches their trigger keywords
2. **Guidelines-focused**: Skills provide standards and templates, not full workflows
3. **Complement agents**: Use skills for guidance, agents for complex multi-step tasks

## Available Skills

| Skill | Triggers | Purpose |
|-------|----------|---------|
| `init` | `/init`, setup, initialize, configure | **Setup wizard** - personalizes repo after cloning |
| `support` | client issue, bug, ticket, problem | Issue triage, response templates |
| `_template` | - | Template for creating new skills |

### User-Invocable Skills

Some skills can be run directly with slash commands:

```bash
/init    # Run the setup wizard to personalize your WIZRD
```

## Creating New Skills

1. Copy `_template/SKILL.md` to a new folder
2. Update the frontmatter (name, description with triggers)
3. Customize the content for your domain
4. Add any supporting files (templates, scripts)

## Skill File Format

```yaml
---
name: skill-name
description: Use this skill for [purpose]. Triggers when user mentions [keywords].
---

# [Skill Name]

## Role
[What this skill provides]

## When to Use
[Trigger conditions]

## Core Workflow
[Step-by-step guidance]

## Templates
[Reusable templates]

## Guidelines
[Do's and don'ts]
```

## Skills vs Agents

| Aspect | Skills | Agents |
|--------|--------|--------|
| Complexity | Simple, single-focus | Complex, multi-step |
| Invocation | Auto-activated by keywords | Explicitly called |
| Output | Guidelines, templates | Full deliverables |
| Context | Minimal | Full conversation |

**Rule of thumb**: If you need a template or quick guidance → Skill. If you need multi-step work → Agent.
