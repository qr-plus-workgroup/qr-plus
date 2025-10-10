# CLAUDE.md - QR+ Proof of Standard Testing Repository

This file provides guidance to Claude Code (claude.ai/code) when working with this repository.

## Project Overview

This is the **QR+ Proof of Standard Testing Repository** - a public GitHub repository for industry participants to validate whether the QR+ payment reference standard meets their use case requirements.

**Purpose:**
- Gather feedback on the QR+ standard from real-world implementation attempts
- Provide implementation support and troubleshooting
- Build a knowledge base of common issues and solutions
- Track standard gaps, ambiguities, and enhancement requests

**This is NOT the implementation repository.** The private development repository (sarb-payref) is maintained separately at `/workspace/`.

## Repository Context

**Organization:** `qr-plus-workgroup` (GitHub organization)
**Repository:** `qr-plus` (public)
**Local Path:** `/workspace/qr-plus/`
**Access Model:** Fully open - anyone can create issues/discussions

**Related Resources:**
- Private development repo: `/workspace/` (sarb-payref - NOT public)
- Sandbox demo: [URL when available]
- SARB documentation: [URL if applicable]

## Repository Structure

### Issues - Actionable Items
Issues track specific, actionable problems or requests:
- **Standard Gap** - Missing capability that blocks use case implementation
- **Standard Ambiguity** - Unclear or contradictory specification
- **Enhancement** - Nice-to-have improvement (workarounds exist)
- **Bug** - Sandbox implementation doesn't match spec
- **Documentation** - Documentation improvements needed

### Discussions - Questions & Knowledge Base
Discussions provide support and build community knowledge:
- **Q&A** (answer marking enabled) - Implementation questions
- **Troubleshooting** - "I'm stuck and don't know why" scenarios
- **Use Cases** - Share and discuss use case scenarios
- **General** - Open-ended conversations
- **Announcements** - Testing updates, spec releases

### Project Board
Tracks issue lifecycle through columns:
1. **Backlog** - New issues not yet reviewed
2. **Investigating** - Analyzing the issue
3. **Confirmed - Standard Gap** - Real standard limitation verified
4. **Confirmed - Bug** - Implementation issue verified
5. **In Progress** - Being worked on
6. **Resolved** - Fixed or answered
7. **Won't Fix** - By design or out of scope

### Milestones - Spec Versions
Milestones track spec version targets:
- **Even minor versions (1.0, 1.2, 1.4)** - Published/stable for implementation
- **Odd minor versions (1.1, 1.3, 1.5)** - Draft/working versions
- **Patch versions (1.2.x)** - Incremental updates to published specs
- **Sandbox versions** - Match spec major.minor + own patch (e.g., sandbox 1.2.3 implements spec 1.2.x)

## Label Conventions

### Priority Labels
- **`priority: high`** - Blocks testing or major use case not supported
- **`priority: medium`** - Important but workarounds exist
- **`priority: low`** - Minor improvement or edge case

### Type Labels

**`type: standard-gap`** (Dark red #b60205)
- **Definition:** The standard is **missing a required capability** that prevents use case implementation
- **Characteristics:** Blocking, no workarounds, represents deficiency in standard
- **Examples:**
  - "Standard has no way to express partial refunds"
  - "Cannot represent multi-currency transactions"
  - "No mechanism for recurring payment authorization"
  - "Missing required field for VAT compliance in EU"
- **Decision test:** "Can I implement my use case without this?" → NO = standard-gap

**`type: standard-ambiguity`** (Orange #d93f0b)
- **Definition:** The standard is unclear, contradictory, or open to multiple interpretations
- **Examples:**
  - "Spec says X in section A but Y in section B"
  - "Not clear whether field is required or optional"
  - "Multiple valid interpretations of rule"

**`type: enhancement`** (Light blue #0075ca)
- **Definition:** The standard **works** but could be **better/easier/more efficient**
- **Characteristics:** Not blocking, workarounds exist, quality-of-life improvement
- **Examples:**
  - "Would be nice to have shorthand notation for common patterns"
  - "Could improve performance by adding optional cache hint"
  - "Better error messages would help debugging"
- **Decision test:** "Can I implement my use case without this?" → YES = enhancement

**`type: bug`** (Red #d73a4a)
- Sandbox implementation doesn't match the specification
- Not a standard issue, but an implementation issue

**`type: documentation`** (Blue #0366d6)
- Documentation is unclear, incomplete, or incorrect

### Status Labels
- **`status: investigating`** - Analyzing root cause
- **`status: confirmed`** - Issue verified as real
- **`status: wontfix`** - By design or out of scope
- **`status: duplicate`** - Already reported elsewhere

## Workflows

### Participant Entry Points

**"I have a question about how to implement X"**
→ Direct to **Discussions (Q&A category)**

**"I'm stuck and don't know if it's a bug or my mistake"**
→ Direct to **Discussions (Troubleshooting category)**

**"I found a clear bug in the sandbox"**
→ Create **Issue** using bug template

**"The standard can't do X which I need"**
→ Create **Issue** using standard-gap or enhancement template (decide based on whether workarounds exist)

**"The spec is unclear about X"**
→ Create **Issue** using standard-ambiguity template

### Issue Triage Workflow

When a new issue is created:

1. **Review for clarity**
   - Does it have enough information?
   - Is the correct template used?
   - Ask for clarification if needed

2. **Verify labels**
   - Issue templates auto-apply type labels
   - Add priority label (high/medium/low)
   - Add `status: investigating` label
   - Move to "Investigating" column

3. **Diagnose root cause**
   - Is it a standard issue or implementation issue?
   - Is it blocking or nice-to-have?
   - Can it be reproduced?

4. **Apply status and move**
   - Add `status: confirmed` when verified
   - Move to appropriate column:
     - "Confirmed - Standard Gap" for standard issues
     - "Confirmed - Bug" for implementation issues
   - Assign to milestone if applicable

5. **Work and resolve**
   - Move to "In Progress" when actively working
   - Close and move to "Resolved" when fixed
   - Or close with `status: wontfix` and move to "Won't Fix"

### Discussion → Issue Conversion Workflow

When a Discussion reveals an actionable item:

1. **Help participant diagnose** the root cause
   - Is it user error? → Mark answer, keep in Discussions
   - Is it a bug or standard gap? → Convert to Issue

2. **Convert to Issue**
   - Use "Create issue from discussion" feature
   - Fill in appropriate issue template based on diagnosis
   - Link back to original discussion in issue description
   - Mark the discussion as answered (explain converted to issue)

3. **Triage the new issue** following issue workflow above

### Response Guidelines

**Be helpful and supportive:**
- Participants are testing to help improve the standard
- "I'm stuck" scenarios deserve patient troubleshooting
- Build knowledge base for future participants

**Be clear about issue categorization:**
- Explain difference between standard-gap and enhancement
- Help participants understand if something is blocking or nice-to-have
- Guide them to correct issue template

**Acknowledge limitations:**
- Some issues may be "by design"
- Standard can't support every use case
- Be transparent about trade-offs

**Build the knowledge base:**
- Mark helpful answers in Discussions
- Pin important discussions
- Reference past discussions/issues for common problems

## Access Management

**Organization:** `qr-plus-workgroup`

**Access Model:** Fully open community
- **Anyone** can create issues, discussions, and comments (no org membership required)
- **Public read access** to all repository content

**Teams:**
- **Moderators** (Maintain access) - Can manage issues, hide spam, block abusive users, set interaction limits

**Moderation:**
- Moderators monitor for spam and abusive behavior
- Can use GitHub's interaction limits if spam becomes problematic
- Can temporarily restrict issue creation to established contributors if needed
- Focus on building helpful, constructive community

**Spam Protection:**
- GitHub's built-in spam detection is active
- Moderators can hide spam comments and lock issues
- If spam becomes significant, can enable temporary interaction limits
- Can convert to gated access model (require org membership) if necessary

## GitHub Commands

When working with this repository, always specify the repo:

```bash
# List issues
gh issue list --repo qr-plus-workgroup/qr-plus

# View issue
gh issue view 123 --repo qr-plus-workgroup/qr-plus

# Create issue
gh issue create --repo qr-plus-workgroup/qr-plus

# List discussions
gh search repos --discussions --repo qr-plus-workgroup/qr-plus
```

## Configuration Management

Repository configuration is managed through:

**Version Controlled (in Git):**
- All markdown files (README, CONTRIBUTING, etc.)
- `.github/ISSUE_TEMPLATE/` - Issue form templates
- `.github/workflows/` - GitHub Actions automation
- `docs/configuration/` - Setup documentation
- `scripts/` - Automation scripts

**GitHub UI Only (documented in docs/):**
- Labels (can be recreated via `scripts/setup-labels.sh`)
- Milestones (can be recreated via `scripts/setup-milestones.sh`)
- Discussion categories
- Project board structure
- Organization/team permissions

**See `docs/configuration/initial-setup.md` for full setup instructions.**

## Automation

**Minimal automation enabled:**
- Issue templates auto-apply labels and assign to project board
- Welcome bot greets first-time contributors with guidance
- Stale bot flags inactive issues after 90 days (no auto-close)
- Project board automation moves issues between columns based on labels

**No AI moderation or auto-responses** - human judgment required for all triage and responses.

## Important Reminders

- **DO NOT commit local development work to this repo** - it's for community management only
- **DO NOT expose private implementation details** from sarb-payref - point to public sandbox/docs instead
- **DO NOT auto-close issues** - every issue deserves human review
- **DO treat participants with respect** - they're volunteering their time to improve the standard
- **DO build the knowledge base** - mark answers, pin important discussions, reference past issues

## Key Differences from sarb-payref

| Aspect | sarb-payref (private) | qr-plus (public) |
|--------|----------------------|------------------|
| Purpose | Development & implementation | Community feedback & testing |
| Audience | SARB team | Industry participants |
| Content | Source code, API specs, sandbox | Issues, discussions, docs |
| Access | Private | Fully public (anyone can contribute) |
| Focus | Building the standard | Validating the standard |
| CLAUDE.md | Dev workflows, architecture | Community management, triage |
