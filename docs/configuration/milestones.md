# Milestone Strategy

This document explains how milestones are used to track QR+ specification versions and issue targeting.

## Overview

Milestones in the QR+ repository represent target specification versions for issues and features. They help organize work and communicate what will be addressed in each spec release.

## Versioning Strategy

QR+ follows a specific versioning pattern to distinguish stable and draft versions:

### Version Pattern

```
major.minor.patch
  │     │     │
  │     │     └─ Incremental updates (1.2.1, 1.2.2, etc.)
  │     └─────── Feature releases
  └───────────── Breaking changes
```

### Even vs Odd Minor Versions

**Even Minor Versions** (1.0, 1.2, 1.4, 2.0, etc.)
- **Published/Stable** specifications
- Safe for production implementation
- Thoroughly reviewed and approved
- Official SARB releases

**Odd Minor Versions** (1.1, 1.3, 1.5, etc.)
- **Draft/Work-in-Progress** versions
- Under active development
- Subject to change
- Not for production use

**Examples:**
- `v1.0` - First published spec (stable) ✅
- `v1.1.x` - Draft working on improvements (unstable) 🚧
- `v1.2` - Second published spec with v1.1.x changes (stable) ✅
- `v1.3.x` - Next draft cycle (unstable) 🚧
- `v1.4` - Third published spec (stable) ✅

### Patch Versions

**Specification Patches** (1.2.1, 1.2.2)
- Clarifications and corrections
- No functional changes
- Backward compatible
- Published as needed

## Sandbox Versioning

The sandbox implementation has its own versioning that tracks the spec:

**Format:** `spec-major.spec-minor.sandbox-patch`

**Examples:**
- Sandbox `1.2.3` implements Spec `v1.2.x`
- Sandbox `1.2.4` still implements Spec `v1.2.x` (sandbox bug fixes)
- Sandbox `1.4.1` implements Spec `v1.4`

**When reporting bugs:** Always specify sandbox version, not just spec version.

## Milestone Structure

### Active Milestones

**Current Published Version** (e.g., `v1.0`)
- Issues found in currently published spec
- Critical fixes may warrant patch release
- Usually only showstopper bugs

**Current Draft Version** (e.g., `v1.1.x (Draft)`)
- Active development work
- New features and enhancements
- Non-critical bug fixes
- Standard gaps being addressed

**Next Published Version** (e.g., `v1.2`)
- Target for next stable release
- Will contain all approved work from draft
- Represents commitment to deliver

**Backlog**
- Not yet assigned to specific version
- Needs prioritization
- May be assigned during planning cycles

### Milestone Lifecycle

1. **Creation**
   - Created when version planning begins
   - Clear description of version goals
   - Optional due date

2. **Active Development**
   - Issues assigned during triage
   - Work progresses
   - Regular review of progress

3. **Completion**
   - All issues resolved or moved
   - Spec published
   - Milestone closed

4. **Archive**
   - Closed milestones remain for history
   - Can be reopened for patches if needed

## Assigning Issues to Milestones

### Triage Decision Tree

```
Is this issue blocking testing?
├─ YES → Assign to current draft milestone (high priority)
└─ NO  → Continue evaluation
    │
    Is this a critical bug in published spec?
    ├─ YES → Assign to patch release milestone
    └─ NO  → Continue evaluation
        │
        Is this a standard gap or major enhancement?
        ├─ YES → Assign to next draft or Backlog
        └─ NO  → Assign to Backlog (lower priority)
```

### Assignment Guidelines

**Assign to Current Draft when:**
- Issue blocks testing
- Standard gap affecting multiple participants
- Critical ambiguity causing implementation problems

**Assign to Next Published when:**
- Committing to deliver in next release
- Draft work is substantially complete
- Feature is essential for release

**Assign to Backlog when:**
- Lower priority enhancement
- Needs more discussion
- Not blocking current work
- Future consideration

**Don't assign milestone when:**
- Issue marked `wontfix`
- Duplicate of another issue
- Still investigating (assign after confirmation)

## Working with Milestones

### Creating Milestones

**Via Script:**
```bash
cd /workspace/qr-plus
./scripts/setup-milestones.sh
```

**Via GitHub CLI:**
```bash
gh api repos/qr-plus-workgroup/qr-plus/milestones \
  -f title="v1.4" \
  -f description="Fourth published specification release" \
  -f due_on="2025-12-31T23:59:59Z"
```

**Via GitHub UI:**
Repository → Issues → Milestones → New milestone

### Updating Milestones

**Change due date:**
```bash
gh api repos/qr-plus-workgroup/qr-plus/milestones/{number} -X PATCH \
  -f due_on="2025-12-31T23:59:59Z"
```

**Update description:**
```bash
gh api repos/qr-plus-workgroup/qr-plus/milestones/{number} -X PATCH \
  -f description="Updated description"
```

### Closing Milestones

**When to close:**
- All issues resolved or reassigned
- Specification published
- No more work planned for this version

**How to close:**
```bash
gh api repos/qr-plus-workgroup/qr-plus/milestones/{number} -X PATCH \
  -f state="closed"
```

Or via GitHub UI: Milestones → Edit → Close milestone

## Milestone Planning

### Planning Cycle

1. **Review Backlog**
   - Identify high-priority issues
   - Assess implementation complexity
   - Consider participant feedback

2. **Create Next Draft Milestone**
   - Set version number (next odd version)
   - Define scope and goals
   - Estimate timeline

3. **Assign Issues**
   - Move high-priority from Backlog
   - Assign new issues during triage
   - Balance scope vs. timeline

4. **Track Progress**
   - Regular review of milestone progress
   - Adjust scope if needed
   - Communicate status to community

5. **Prepare for Publication**
   - Create next published milestone
   - Move completed work from draft
   - Final review and approval

### Scope Management

**Avoid scope creep:**
- Be realistic about capacity
- Not every issue needs immediate attention
- Better to deliver small stable releases than delay large ones

**Communicate changes:**
- If removing issues from milestone, explain why
- If delaying milestone, update due date and notify community
- Keep milestone descriptions current

## Milestone Reporting

### Progress Tracking

**View milestone status:**
```bash
gh api repos/qr-plus-workgroup/qr-plus/milestones
```

**Filter issues by milestone:**
```bash
gh issue list --milestone "v1.2" --repo qr-plus-workgroup/qr-plus
```

**Milestone burndown:**
- GitHub UI provides automatic burndown charts
- Track open vs closed issues over time

### Communication

**Regular updates:**
- Post milestone progress in Announcements discussion
- Update milestone description with current status
- Set realistic due dates and adjust as needed

**Release notes:**
- When closing milestone, create release notes
- Summarize what was delivered
- Link to closed issues
- Acknowledge contributors

## Examples

### Example: v1.2 Planning

**Scenario:** v1.1.x draft work is complete, ready to publish as v1.2

**Actions:**
1. Create `v1.2` milestone with description: "Second published QR+ specification"
2. Set due date: 3 months from now
3. Move all completed v1.1.x issues to v1.2
4. Review remaining v1.1.x issues:
   - Completed → v1.2
   - In progress → v1.3.x (new draft)
   - Not started → Backlog
5. Publish spec when milestone complete
6. Close v1.2 milestone
7. Create v1.3.x draft for next cycle

### Example: Critical Bug in Published Spec

**Scenario:** Critical bug found in v1.2 (published spec)

**Actions:**
1. Create `v1.2.1` milestone for patch release
2. Assign critical bug to v1.2.1
3. Fix bug in sandbox and spec
4. Publish v1.2.1 patch release
5. Close milestone

## Related Documentation

- [Labels](labels.md) - Priority and status labels work with milestones
- [CLAUDE.md](../../CLAUDE.md) - Milestone conventions and workflows
- [Contributing Guide](../../CONTRIBUTING.md) - How participants interact with milestones
