#!/bin/bash
# WIZRD Repository Validation Script
# For CI/CD integration - validates structure, consistency, standards
# Exit codes: 0 = pass, 1 = warnings, 2 = critical errors
#
# Usage:
#   ./scripts/validate-repo.sh           # Run full validation
#   ./scripts/validate-repo.sh --quick   # Quick check (structure only)

set -e

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
CRITICAL=0
WARNINGS=0
PASSED=0

# Report arrays
declare -a CRITICAL_ISSUES
declare -a WARNING_ISSUES
declare -a PASSED_CHECKS

# Helper functions
log_critical() {
    CRITICAL_ISSUES+=("$1")
    CRITICAL=$((CRITICAL+1))
    echo -e "${RED}[CRITICAL]${NC} $1"
}

log_warning() {
    WARNING_ISSUES+=("$1")
    WARNINGS=$((WARNINGS+1))
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_pass() {
    PASSED_CHECKS+=("$1")
    PASSED=$((PASSED+1))
    echo -e "${GREEN}[PASS]${NC} $1"
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Extract YAML frontmatter field
get_frontmatter_field() {
    local file="$1"
    local field="$2"
    sed -n '/^---$/,/^---$/p' "$file" | grep "^${field}:" | sed "s/^${field}:[[:space:]]*//" | head -1
}

# Check if file has valid YAML frontmatter
has_frontmatter() {
    local file="$1"
    head -1 "$file" | grep -q "^---$"
}

echo ""
echo "=========================================="
echo "  WIZRD REPOSITORY VALIDATION"
echo "  $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="
echo ""

# ============================================
# 1. DIRECTORY STRUCTURE
# ============================================
log_info "Checking directory structure..."

REQUIRED_DIRS=(
    ".claude/agents"
    ".claude/skills"
    "clients"
    "content"
    "operations"
    "knowledge-base"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        log_pass "Directory exists: $dir"
    else
        log_critical "Missing required directory: $dir"
    fi
done

# ============================================
# 2. ROOT FILES
# ============================================
log_info "Checking root files..."

if [ -f "CLAUDE.md" ]; then
    log_pass "CLAUDE.md exists"
else
    log_critical "Missing CLAUDE.md in root"
fi

if [ -f "AI-AGENTS.md" ]; then
    log_pass "AI-AGENTS.md exists"
else
    log_warning "Missing AI-AGENTS.md"
fi

# Quick mode - stop here
if [ "$1" == "--quick" ]; then
    echo ""
    echo "Quick check complete."
    exit 0
fi

# ============================================
# 3. AGENT VALIDATION
# ============================================
log_info "Validating agents..."

for agent_file in .claude/agents/*.md; do
    if [ -f "$agent_file" ]; then
        agent_name=$(basename "$agent_file" .md)

        # Skip template
        if [ "$agent_name" == "_template" ]; then
            continue
        fi

        # Check frontmatter exists
        if ! has_frontmatter "$agent_file"; then
            log_critical "Agent '$agent_name' missing YAML frontmatter"
            continue
        fi

        # Check required fields
        name=$(get_frontmatter_field "$agent_file" "name")
        description=$(get_frontmatter_field "$agent_file" "description")
        color=$(get_frontmatter_field "$agent_file" "color")

        if [ -z "$name" ]; then
            log_critical "Agent '$agent_name' missing 'name' field"
        elif [ "$name" != "$agent_name" ]; then
            log_warning "Agent '$agent_name' name mismatch (file: $agent_name, frontmatter: $name)"
        fi

        if [ -z "$description" ]; then
            log_critical "Agent '$agent_name' missing 'description' field"
        elif [[ ! "$description" == *"<example>"* ]]; then
            log_warning "Agent '$agent_name' description missing usage examples"
        fi

        if [ -z "$color" ]; then
            log_warning "Agent '$agent_name' missing 'color' field"
        fi

        log_pass "Agent validated: $agent_name"
    fi
done

# ============================================
# 4. SKILL VALIDATION
# ============================================
log_info "Validating skills..."

for skill_dir in .claude/skills/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")

        # Skip template
        if [ "$skill_name" == "_template" ]; then
            continue
        fi

        skill_file="${skill_dir}SKILL.md"

        if [ -f "$skill_file" ]; then
            # Check frontmatter
            if ! has_frontmatter "$skill_file"; then
                log_critical "Skill '$skill_name' missing YAML frontmatter"
                continue
            fi

            name=$(get_frontmatter_field "$skill_file" "name")
            description=$(get_frontmatter_field "$skill_file" "description")

            if [ -z "$name" ]; then
                log_critical "Skill '$skill_name' missing 'name' field"
            fi

            if [ -z "$description" ]; then
                log_critical "Skill '$skill_name' missing 'description' field"
            fi

            log_pass "Skill validated: $skill_name"
        else
            log_critical "Skill '$skill_name' missing SKILL.md"
        fi
    fi
done

# ============================================
# 5. CLIENT FOLDER VALIDATION
# ============================================
log_info "Validating client folders..."

for client_dir in clients/*/; do
    if [ -d "$client_dir" ]; then
        client_name=$(basename "$client_dir")

        # Skip templates and examples
        if [[ "$client_name" == "templates" || "$client_name" == "_example"* ]]; then
            continue
        fi

        claude_file="${client_dir}CLAUDE.md"

        # Check CLAUDE.md exists
        if [ ! -f "$claude_file" ]; then
            log_critical "Client '$client_name' missing CLAUDE.md"
            continue
        fi

        # Check frontmatter
        if ! has_frontmatter "$claude_file"; then
            log_critical "Client '$client_name' CLAUDE.md missing frontmatter"
            continue
        fi

        # Check required fields
        client_field=$(get_frontmatter_field "$claude_file" "client")
        industry=$(get_frontmatter_field "$claude_file" "industry")
        status=$(get_frontmatter_field "$claude_file" "status")

        if [ -z "$client_field" ]; then
            log_warning "Client '$client_name' missing 'client' field in frontmatter"
        fi

        if [ -z "$industry" ]; then
            log_warning "Client '$client_name' missing 'industry' field"
        fi

        if [ -z "$status" ]; then
            log_critical "Client '$client_name' missing 'status' field"
        elif [[ ! "$status" =~ ^(Active|Paused|Completed|Lead|Prospect) ]]; then
            log_warning "Client '$client_name' has invalid status: $status"
        fi

        # Check for context.md and tasks.md if Active
        if [[ "$status" =~ ^Active ]]; then
            if [ ! -f "${client_dir}context.md" ]; then
                log_warning "Active client '$client_name' missing context.md"
            fi
            if [ ! -f "${client_dir}tasks.md" ]; then
                log_warning "Active client '$client_name' missing tasks.md"
            fi
        fi

        # Check for stale tasks.md (>30 days)
        if [ -f "${client_dir}tasks.md" ]; then
            # macOS vs Linux stat compatibility
            if [[ "$OSTYPE" == "darwin"* ]]; then
                last_modified=$(stat -f %m "${client_dir}tasks.md" 2>/dev/null)
            else
                last_modified=$(stat -c %Y "${client_dir}tasks.md" 2>/dev/null)
            fi

            if [ -n "$last_modified" ]; then
                now=$(date +%s)
                days_old=$(( (now - last_modified) / 86400 ))
                if [ "$days_old" -gt 30 ] && [[ "$status" =~ ^Active ]]; then
                    log_warning "Client '$client_name' tasks.md is $days_old days old"
                fi
            fi
        fi

        log_pass "Client validated: $client_name"
    fi
done

# ============================================
# 6. GENERATE REPORT
# ============================================
echo ""
echo "=========================================="
echo "  VALIDATION SUMMARY"
echo "=========================================="
echo ""
echo -e "  ${GREEN}Passed:${NC}    $PASSED"
echo -e "  ${YELLOW}Warnings:${NC}  $WARNINGS"
echo -e "  ${RED}Critical:${NC}  $CRITICAL"
echo ""

# Determine exit code
if [ $CRITICAL -gt 0 ]; then
    echo -e "${RED}VALIDATION FAILED${NC} - Critical issues found"
    exit 2
elif [ $WARNINGS -gt 0 ]; then
    echo -e "${YELLOW}VALIDATION PASSED WITH WARNINGS${NC}"
    exit 1
else
    echo -e "${GREEN}VALIDATION PASSED${NC}"
    exit 0
fi
