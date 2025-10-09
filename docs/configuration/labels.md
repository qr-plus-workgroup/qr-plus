# Label Reference

This document describes all labels used in the QR+ repository for issue tracking and organization.

## Quick Reference Table

| Label | Color | Category | Usage |
|-------|-------|----------|-------|
| `priority: high` | Red | Priority | Blocks testing or major use case |
| `priority: medium` | Yellow | Priority | Important but workarounds exist |
| `priority: low` | Green | Priority | Minor improvement or edge case |
| `type: standard-gap` | Dark Red | Type | Missing capability blocks use case |
| `type: standard-ambiguity` | Orange | Type | Unclear specification |
| `type: enhancement` | Light Blue | Type | Nice-to-have improvement |
| `type: bug` | Red | Type | Implementation doesn't match spec |
| `type: documentation` | Blue | Type | Documentation improvement |
| `status: investigating` | Yellow | Status | Analyzing the issue |
| `status: confirmed` | Green | Status | Issue verified |
| `status: wontfix` | Gray | Status | By design or out of scope |
| `status: duplicate` | Light Gray | Status | Already reported |
| `status: stale` | Yellow-Green | Status | No recent activity |

## Priority Labels

### `priority: high` 🔴
**When to use:** Issue blocks testing or prevents implementation of a major use case

**Examples:**
- Standard gap that prevents entire feature implementation
- Critical bug that breaks core functionality
- Ambiguity that blocks multiple implementers

**SLA:** Review within 3 business days

### `priority: medium` 🟡
**When to use:** Important issue but workarounds exist or impact is limited

**Examples:**
- Enhancement that would significantly improve experience
- Bug with known workaround
- Gap affecting edge cases

**SLA:** Review within 1 week

### `priority: low` 🟢
**When to use:** Minor improvement, edge case, or nice-to-have

**Examples:**
- Minor convenience enhancement
- Documentation typo
- Rare edge case bug

**SLA:** Review when capacity allows

## Type Labels

### `type: standard-gap` 🚫
**Definition:** The standard is **missing a required capability** that blocks use case implementation

**Key characteristic:** No workarounds exist - you **cannot** implement your use case

**Examples:**
- "No way to express partial refunds"
- "Cannot represent multi-currency transactions"
- "Missing required field for regulatory compliance"

**Decision test:** "Can I implement my use case without this?" → **NO** = standard-gap

**Priority guidance:** Usually high or medium priority

###`type: standard-ambiguity` ❓
**Definition:** The specification is unclear, contradictory, or open to multiple interpretations

**Examples:**
- "Section A says required, Section B says optional"
- "Not clear if timestamps should be UTC or local"
- "Multiple valid interpretations of this rule"

**Why it matters:** Ambiguity leads to incompatible implementations

**Priority guidance:** High if blocking, medium if affecting multiple implementers

### `type: enhancement` ✨
**Definition:** The standard **works** but could be **better/easier/more efficient**

**Key characteristic:** Workarounds exist - you **can** implement your use case

**Examples:**
- "Shorthand notation would simplify code"
- "Optional cache hint could improve performance"
- "Convenience field would avoid recalculation"

**Decision test:** "Can I implement my use case without this?" → **YES** = enhancement

**Priority guidance:** Usually medium or low priority

### `type: bug` 🐛
**Definition:** Sandbox implementation doesn't match the QR+ specification

**Examples:**
- "API returns 400 but spec says 422"
- "Field validation too strict compared to spec"
- "Response format doesn't match spec schema"

**Not a bug:** If spec is unclear or missing something - use standard-ambiguity or standard-gap instead

**Priority guidance:** Based on severity and workaround availability

### `type: documentation` 📚
**Definition:** Documentation is unclear, incomplete, incorrect, or missing

**Examples:**
- Missing example for complex scenario
- Typo in spec
- Out-of-date API reference
- Broken links

**Note:** For spec clarity issues that affect implementation, use standard-ambiguity instead

**Priority guidance:** Usually low unless blocking testing

## Status Labels

### `status: investigating` 🔍
**Meaning:** Issue is being analyzed by moderators/maintainers

**Applied:** Automatically to new issues, or manually during triage

**Next steps:** Verify issue, reproduce if applicable, determine root cause

### `status: confirmed` ✅
**Meaning:** Issue has been verified as legitimate

**Applied:** After investigation confirms the issue is real

**Next steps:** Assign to milestone, work on fix/clarification

### `status: wontfix` ⛔
**Meaning:** Issue will not be addressed

**Reasons:**
- By design - intentional trade-off
- Out of scope - not suitable for standard
- Cannot reproduce - insufficient information after follow-up

**Note:** Issue will be closed with explanation

### `status: duplicate` ➕
**Meaning:** Already reported in another issue

**Applied:** When issue is duplicate of existing issue

**Action:** Close with reference to original issue

### `status: stale` ⏳
**Meaning:** No activity for 90+ days (issues) or 60+ days (PRs)

**Applied:** Automatically by stale bot

**Does NOT mean:** Issue will be auto-closed

**Action needed:** Respond if still relevant

## Label Combinations

### Common Combinations

**New Bug Report:**
- `type: bug`
- `priority: medium` (default, adjust as needed)
- `status: investigating`

**Confirmed Standard Gap:**
- `type: standard-gap`
- `priority: high`
- `status: confirmed`
- Assigned to milestone

**Enhancement Request:**
- `type: enhancement`
- `priority: low` or `priority: medium`
- `status: investigating`

## Applying Labels

### Who Can Apply Labels?

- **Moderators:** Can apply any label
- **Issue templates:** Auto-apply type labels
- **Automation:** Applies default priority and status labels
- **Contributors:** Cannot apply labels (request via comment)

### Label Guidelines

1. **Every issue should have:**
   - One type label
   - One priority label
   - One status label

2. **Update labels as issue progresses:**
   - `investigating` → `confirmed` after verification
   - Adjust priority based on impact assessment
   - Add `wontfix` or `duplicate` before closing

3. **Don't over-label:**
   - Use only labels that add value
   - Don't create custom labels without discussion

## Creating Labels

Labels can be created via:

1. **Script:** Run `/workspace/qr-plus/scripts/setup-labels.sh`
2. **GitHub UI:** Repository Settings → Labels
3. **GitHub CLI:** `gh label create "name" --color "hex" --description "desc"`

See `scripts/setup-labels.sh` for exact label specifications.

## Related Documentation

- [Issue Templates](../../.github/ISSUE_TEMPLATE/) - Auto-apply type labels
- [Contributing Guide](../../CONTRIBUTING.md) - When to use which template/label
- [CLAUDE.md](../../CLAUDE.md) - Label conventions and workflows
