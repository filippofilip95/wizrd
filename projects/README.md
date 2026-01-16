# Projects Directory

This folder contains internal projects and the project management templates.

## Folder Structure

```
projects/
├── templates/               # Project management templates
│   ├── context.md           # Current status tracking
│   ├── tasks.md             # Task checklist
│   └── plan.md              # Strategic decisions
│
└── [project-name]/          # Internal projects go here
```

## The 3-File Memory System

For any multi-week project, use these three files:

### 1. `plan.md` - The Constitution
- High-level decisions and WHY
- Rarely changes (only on strategy pivots)
- Contains: approach, timeline, success metrics, risks

### 2. `context.md` - Current State
- What's happening RIGHT NOW
- Updated every work session
- Contains: recent completions, active work, blockers

### 3. `tasks.md` - The Checklist
- Specific next actions
- Updated constantly
- Contains: in progress, next up, backlog, completed

## When to Use Projects vs Clients

| Use `/projects/` for | Use `/clients/` for |
|---------------------|---------------------|
| Internal initiatives | Client work |
| Product development | Client deliverables |
| Company improvements | Consulting projects |
| Personal projects | Anything client-specific |

## Creating a New Project

```bash
# 1. Create project folder
mkdir projects/my-project

# 2. Copy relevant templates
cp projects/templates/plan.md projects/my-project/
cp projects/templates/context.md projects/my-project/
cp projects/templates/tasks.md projects/my-project/

# 3. Fill in plan.md with strategy

# 4. Start tracking in context.md and tasks.md
```

## Best Practices

1. **Update context.md every session** - It's the AI's memory
2. **Keep plan.md stable** - Only change on major pivots
3. **Use tasks.md actively** - Check off as you go
4. **Archive completed projects** - Move to `/archive/` when done
