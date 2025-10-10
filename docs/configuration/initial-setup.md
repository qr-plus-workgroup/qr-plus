# Initial Repository Setup

This document provides complete instructions for setting up the QR+ Proof of Standard Testing repository on GitHub.

## Prerequisites

- GitHub account with owner/admin permissions
- GitHub CLI (`gh`) installed and authenticated
- Git installed locally
- Access to create GitHub organization (free for open source)

## Setup Checklist

- [x] Create GitHub organization
- [ ] Create teams
- [ ] Create repository
- [ ] Configure repository settings
- [ ] Enable Discussions
- [ ] Create Discussion categories
- [ ] Create labels
- [ ] Create milestones
- [ ] Create Project board
- [ ] Configure workflows
- [ ] Create welcome announcement

## Step 1: Create GitHub Organization

**Why:** Provides better access control, team management, and project continuity

### Via GitHub Web UI

1. Go to https://github.com/organizations/new
2. Choose "Create a free organization"
3. **Organization name:** `qr-plus-workgroup`
4. **Contact email:** [Your email]
5. **This organization belongs to:** Choose appropriate option
6. Complete setup wizard

### Configure Organization Settings

1. Go to organization settings
2. **Member privileges:**
   - Base permissions: Read
   - Allow members to create repositories: No (admin only)
3. **Third-party access:**
   - Configure as needed for your security requirements

## Step 2: Create Teams

Teams provide moderation capabilities for the open community.

### Via GitHub Web UI

1. Go to organization → Teams
2. Create **"Moderators"** team:
   - **Name:** Moderators
   - **Description:** Trusted members who help with moderation, triage, and admin
   - **Visibility:** Visible
   - **Permissions:** Maintain access to qr-plus repository

### Via GitHub CLI

```bash
# Create Moderators team
gh api orgs/qr-plus-workgroup/teams \
  -f name="Moderators" \
  -f description="Trusted members who help with moderation, triage, and admin" \
  -f privacy="closed"
```

**Note:** Since the repository is fully open (anyone can create issues/discussions), we only need the Moderators team for spam control and issue management. No Participants team is required.

## Step 3: Create Repository

### Option A: Via GitHub Web UI

1. Go to organization → Repositories → New
2. **Name:** `qr-plus`
3. **Description:** "QR+ Payment Standard - Proof of Standard Testing & Community Feedback"
4. **Visibility:** Public
5. **Initialize:** Do not initialize (we'll push existing content)
6. Create repository

### Option B: Via GitHub CLI

```bash
cd /workspace/qr-plus
gh repo create qr-plus-workgroup/qr-plus \
  --public \
  --description "QR+ Payment Standard - Proof of Standard Testing & Community Feedback" \
  --source=. \
  --remote=origin
```

## Step 4: Configure Repository Settings

### General Settings

1. Repository → Settings → General
2. **Features:**
   - ✅ Issues
   - ✅ Discussions (enable if not already)
   - ❌ Projects (we'll use organization-level project)
   - ❌ Wiki (use Discussions instead)
   - ❌ Sponsorships (unless relevant)
3. **Pull Requests:**
   - ✅ Allow squash merging
   - ✅ Automatically delete head branches
4. **Archives:**
   - ❌ Do not archive (this is active repo)

### Permissions

1. Settings → Collaborators and teams
2. **Add teams:**
   - Add "Moderators" team with **Maintain** role
3. **Base permission:** Read (anyone can view and create issues/discussions in public repos)

### Branch Protection (Optional but Recommended)

If you plan to have a main branch with documentation:

1. Settings → Branches → Add rule
2. **Branch name pattern:** `main`
3. **Rules:**
   - ✅ Require pull request before merging
   - ✅ Require approvals: 1
   - ✅ Dismiss stale reviews
4. Save changes

## Step 5: Enable and Configure Discussions

### Enable Discussions

1. Repository → Settings → General → Features
2. Enable **Discussions**

### Create Discussion Categories

1. Repository → Discussions → Categories (gear icon)
2. Create the following categories:

**Q&A** (Question/Answer format)

- **Name:** Q&A
- **Description:** Implementation questions and answers
- **Format:** Question / Answer (enable answer marking)
- **Emoji:** ❓

**Troubleshooting** (Open discussion)

- **Name:** Troubleshooting
- **Description:** Help when you're stuck - we'll diagnose together
- **Format:** Open-ended discussion
- **Emoji:** 🚨

**Use Cases** (Open discussion)

- **Name:** Use Cases
- **Description:** Share and discuss implementation scenarios
- **Format:** Open-ended discussion
- **Emoji:** 💼

**General** (Open discussion)

- **Name:** General
- **Description:** Open-ended conversations about the standard
- **Format:** Open-ended discussion
- **Emoji:** 💬

**Announcements** (Announcement format)

- **Name:** Announcements
- **Description:** Testing updates, spec releases, important information
- **Format:** Announcement (maintainers only)
- **Emoji:** 📢

## Step 6: Create Labels

Labels organize and categorize issues.

### Via Script (Recommended)

```bash
cd /workspace/qr-plus
./scripts/setup-labels.sh
```

This creates all labels with correct colors and descriptions.

### Via GitHub CLI (Manual)

See `scripts/setup-labels.sh` for exact label specifications, or create manually via Repository → Issues → Labels.

### Verify Labels

```bash
gh label list --repo qr-plus-workgroup/qr-plus
```

Should show 14 labels (3 priority + 5 type + 5 status + 1 stale).

See [labels.md](labels.md) for complete label reference.

## Step 7: Create Milestones

Milestones track spec versions.

### Via Script (Recommended)

```bash
cd /workspace/qr-plus
./scripts/setup-milestones.sh
```

### Adjust for Your Versioning

Edit the script or update milestones manually to match your actual spec versions:

```bash
# List milestones
gh api repos/qr-plus-workgroup/qr-plus/milestones

# Update milestone
gh api repos/qr-plus-workgroup/qr-plus/milestones/{number} -X PATCH \
  -f title="v1.0" \
  -f description="Your description" \
  -f due_on="2025-12-31T23:59:59Z"
```

See [milestones.md](milestones.md) for milestone strategy.

## Step 8: Create Project Board

GitHub Projects (new) provides powerful project management.

### Create Project

1. Organization → Projects → New project
2. **Name:** "QR+ Standard Testing"
3. **Template:** Start from scratch (or Board template)
4. **Visibility:** Public

### Create Views

**Board View:**

1. Add columns:
   - Backlog
   - Investigating
   - Confirmed - Standard Gap
   - Confirmed - Bug
   - In Progress
   - Resolved
   - Won't Fix
2. Group by: Status (use single-select field)

**Table View:**

- Shows all issues with all fields
- Good for filtering and bulk operations

**Roadmap View:**

- Timeline visualization
- Group by milestone

### Add Custom Fields

1. **Status** (Single select)

   - Options: Backlog, Investigating, Confirmed - Standard Gap, Confirmed - Bug, In Progress, Resolved, Won't Fix
   - Used for board columns

2. **Sandbox Version** (Text)
   - For tracking which sandbox version is affected

### Configure Automation

1. Project → Settings (…) → Workflows
2. **Auto-add items:**
   - When issues are created → Add to project → Set Status: Backlog
3. **Auto-archive:**
   - When issues are closed → Set Status: Resolved or Won't Fix
4. **Status transitions:**
   - Configure based on labels (requires GraphQL API or manual rules)

### Alternative: Project-Auto-Add Workflow

If automation doesn't work as expected, the repository includes a GitHub Actions workflow:

`.github/workflows/project-auto-add.yml`

This requires:

1. Creating a GitHub Personal Access Token (classic) with `repo` and `project` scopes
2. Adding it as a repository secret named `GH_PROJECT_TOKEN`
3. Updating the project URL in the workflow file

## Step 9: Configure GitHub Actions Workflows

The repository includes several workflows that may need configuration.

### Review Workflows

1. `.github/workflows/welcome.yml` - Welcome first-time contributors ✅ Works as-is
2. `.github/workflows/auto-label.yml` - Auto-label issues ✅ Works as-is
3. `.github/workflows/stale.yml` - Mark stale issues ✅ Works as-is
4. `.github/workflows/project-auto-add.yml` - Add issues to project ⚠️ Needs token

### Set Up Project Auto-Add (Optional)

If you want issues automatically added to the project board:

1. Create GitHub Personal Access Token:

   - GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate new token
   - Scopes: `repo`, `project`
   - Copy token

2. Add as repository secret:

   - Repository Settings → Secrets and variables → Actions
   - New repository secret
   - Name: `GH_PROJECT_TOKEN`
   - Value: [paste token]

3. Update workflow file:
   - Edit `.github/workflows/project-auto-add.yml`
   - Update `project-url` with your actual project URL

**Alternative:** Use GitHub Projects' built-in automation instead (recommended).

## Step 10: Initialize Git and Push

### Initialize Local Repository

```bash
cd /workspace/qr-plus

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial repository setup

- Add community documentation (README, CONTRIBUTING, SUPPORT, CLAUDE.md)
- Add issue templates (standard-gap, standard-ambiguity, enhancement, bug, documentation)
- Add GitHub Actions workflows (welcome, auto-label, stale, project-auto-add)
- Add setup scripts (labels, milestones)
- Add configuration documentation

🤖 Generated with Claude Code"
```

### Connect to GitHub

```bash
# Add remote
git remote add origin https://github.com/qr-plus-workgroup/qr-plus.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 11: Create Welcome Announcement

Create a pinned discussion to welcome participants.

### Via GitHub Web UI

1. Repository → Discussions → New discussion
2. **Category:** Announcements
3. **Title:** "Welcome to QR+ Proof of Standard Testing!"
4. **Body:**

```markdown
# Welcome to QR+ Proof of Standard Testing! 👋

Thank you for your interest in helping validate the QR+ payment reference standard!

## What is this repository?

This is the official community hub for testing and validating whether the QR+ standard meets real-world use case requirements. We're looking for:

- **Feedback** on whether the standard supports your use cases
- **Bug reports** when the sandbox doesn't match the spec
- **Questions** about implementation
- **Discussion** about use cases and approaches

## How to get started

1. **Browse existing content:** Check [Discussions](../../discussions) and [Issues](../../issues)
2. **Ask questions:** Start a [Discussion](../../discussions/new?category=q-a)
3. **Report issues:** Use our [Issue Templates](../../issues/new/choose)
4. **Contribute:** Anyone can create issues and discussions - no membership required!

## Important resources

- 📖 [Contributing Guide](../../CONTRIBUTING.md) - How to participate
- 🏷️ [Label Guide](docs/configuration/labels.md) - Understanding issue types
- 🎯 [Milestones](../../milestones) - Spec version roadmap
- 💬 [Discussions](../../discussions) - Ask questions, share ideas

## Current Status

- **Spec Version:** [Current version]
- **Sandbox Version:** [Current version]
- **Active Milestone:** [Current milestone]

## Get involved

We welcome all feedback! Whether you find bugs, have questions, or want to discuss use cases, your input helps make QR+ better for everyone.

**Questions?** Start a discussion or reach out to [contact info].

Happy testing! 🚀
```

5. **Pin this discussion** after creating it

## Step 12: Verify Setup

Go through this checklist to ensure everything is working:

- [ ] Repository is public and accessible
- [ ] Discussions are enabled with correct categories
- [ ] Labels are created (run `gh label list`)
- [ ] Milestones are created (run `gh api repos/qr-plus-workgroup/qr-plus/milestones`)
- [ ] Teams have correct permissions
- [ ] Project board is set up and public
- [ ] Workflows are enabled (check Actions tab)
- [ ] Welcome announcement is pinned
- [ ] README displays correctly on repository homepage
- [ ] Issue templates work (try creating test issue)
- [ ] Discussion categories work (try creating test discussion)

## Post-Setup Tasks

### Invite First Moderators

1. Identify trusted community members to help with moderation
2. Invite to organization and add to Moderators team:
   ```bash
   # Invite to organization
   gh api orgs/qr-plus-workgroup/invitations \
     -f invitee_id={github_user_id} \
     -f role=direct_member \
     -f team_ids[]={moderators_team_id}
   ```
3. Or via Web UI: Organization → People → Invite member, then add to Moderators team

**Note:** Regular participants don't need organization membership - anyone can create issues and discussions in the public repository.

### Update Documentation Placeholders

Several files have placeholders that need your specific information:

- **README.md:** Add sandbox URL, spec URL, contact info
- **SUPPORT.md:** Add contact methods, escalation info
- **CONTRIBUTING.md:** Update with your contact details

### Set Up Spec Version Tracking

Update milestones to match your actual spec versioning:

1. Close placeholder milestones if not applicable
2. Create milestones matching current spec status
3. Update milestone descriptions with accurate timelines

### Configure Repository Topics

Add topics to help discovery:

```bash
gh repo edit qr-plus-workgroup/qr-plus \
  --add-topic qr-plus \
  --add-topic payment-standard \
  --add-topic testing \
  --add-topic south-africa \
  --add-topic fintech
```

Or via Web UI: Repository → About (gear icon) → Topics

## Troubleshooting

### Workflow Permissions Error

If workflows fail with permission errors:

1. Repository → Settings → Actions → General
2. **Workflow permissions:** Read and write permissions
3. **Allow GitHub Actions to create and approve pull requests:** Enable
4. Save

### Project Auto-Add Not Working

If issues aren't added to project automatically:

1. Verify `GH_PROJECT_TOKEN` secret is set correctly
2. Check token has `repo` and `project` scopes
3. Verify project URL in workflow file
4. Check Actions tab for error logs
5. Alternative: Use GitHub Projects' built-in automation

### Discussion Categories Missing

If discussion categories don't appear:

1. Ensure Discussions are enabled (Settings → Features)
2. Refresh page
3. Create categories via Discussions → Categories (gear icon)

## Maintenance

### Regular Tasks

**Weekly:**

- Review new issues and apply labels
- Answer questions in Discussions
- Update project board

**Monthly:**

- Review stale issues
- Update milestone progress
- Post status updates in Announcements

**Per Release:**

- Create new milestone for next version
- Update README with new versions
- Close completed milestones
- Post release notes

### Backup

The repository itself is the backup, but consider:

- **Export project data** periodically (Projects → … → Export)
- **Document major decisions** in Discussions or docs/
- **Keep CLAUDE.md updated** with process changes

## Related Documentation

- [Labels Reference](labels.md)
- [Milestones Strategy](milestones.md)
- [Contributing Guide](../../CONTRIBUTING.md)
- [Repository CLAUDE.md](../../CLAUDE.md)

## Support

If you encounter issues during setup:

- Check GitHub Docs: https://docs.github.com
- Open issue in this repository
- Contact [your contact info]

---

**Setup complete?** Time to invite your first participants and start testing! 🎉
