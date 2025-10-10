# Contributing to QR+ Proof of Standard Testing

Thank you for participating in the QR+ Proof of Standard testing program! Your feedback and contributions help ensure the standard meets real-world needs.

## Table of Contents

- [How to Participate](#how-to-participate)
- [Before You Start](#before-you-start)
- [Creating Quality Issues](#creating-quality-issues)
- [Participating in Discussions](#participating-in-discussions)
- [Issue Lifecycle](#issue-lifecycle)
- [Best Practices](#best-practices)
- [Community Standards](#community-standards)

## How to Participate

### 1. Choose the Right Tool

#### Use Discussions When:

- ❓ You have a question about implementation
- 🤷 You're stuck and don't know what's wrong
- 💬 You want to discuss a use case or approach
- 🧠 You're exploring ideas before committing to an issue

**Start here if unsure!** We'll guide you through diagnosis.

#### Use Issues When:

- 🐛 You've identified a clear bug
- 🚫 You've found a blocking limitation in the standard
- ❓ The specification is ambiguous or contradictory
- ✨ You have a specific enhancement suggestion
- 📚 Documentation needs improvement

**Use issue templates** to ensure you provide all necessary information.

## Before You Start

### Search First

Before creating new content:

1. **Search existing issues:** [Issues](../../issues) - Use keywords to find similar reports
2. **Search discussions:** [Discussions](../../discussions) - Check Q&A and troubleshooting
3. **Check project board:** [Project](../../projects) - See what's in progress

**Why?** Duplicates waste time and fragment conversations. If you find something similar:

- 👍 React to show you're affected too
- 💬 Add your specific use case or details as a comment
- 🔗 Reference it in your new issue if different enough

### Understand Version Context

QR+ uses a specific versioning strategy:

**Specification Versions:**

- **Even** (1.0, 1.2, 1.4) = Published/stable
- **Odd** (1.1, 1.3, 1.5) = Draft/work-in-progress
- **Patch** (1.2.1) = Incremental updates

**Sandbox Versions:**

- Format: `1.2.3` where `1.2` matches spec, `.3` is sandbox patch
- Always specify which sandbox version you're testing against

## Creating Quality Issues

### Use the Right Template

We provide templates to guide you:

1. **Standard Gap** - Missing capability that blocks your use case

   - Test: "Can I implement my use case without this?" → NO
   - Example: "No way to represent recurring payments"

2. **Standard Ambiguity** - Unclear or contradictory specification

   - Example: "Section A says required, Section B says optional"

3. **Enhancement** - Nice-to-have improvement (workarounds exist)

   - Test: "Can I implement my use case without this?" → YES
   - Example: "Shorthand notation would simplify implementation"

4. **Bug** - Sandbox doesn't match the specification

   - Example: "API returns 400 instead of specified 422"

5. **Documentation** - Docs need improvement
   - Example: "Missing example for multi-currency scenario"

### What Makes a Good Issue?

#### ✅ Good Issue Characteristics

**Clear Title**

- ❌ "Problem with payments"
- ✅ "Cannot express partial refund in payment status"

**Specific Description**

- Explain WHAT you're trying to do
- Explain WHY it's important (your use case)
- Explain HOW it fails or what's missing
- Include relevant spec sections if applicable

**Reproducible (for bugs)**

- Steps to reproduce
- Expected behavior
- Actual behavior
- Sandbox version
- Request/response examples (sanitized)

**Context**

- What use case are you implementing?
- What have you tried?
- Any workarounds you've found?

#### ❌ Poor Issue Examples

**Too Vague**

> "The API doesn't work"

**Better:**

> "POST /paylinks returns 500 error when amount exceeds 999999 (sandbox v1.2.3)"

**No Context**

> "Need field X"

**Better:**

> "Cannot represent VAT breakdown for EU compliance - need tax line items in payment details"

**Opinion Only**

> "This design is bad"

**Better:**

> "Current error structure requires parsing string messages instead of error codes, making programmatic error handling difficult"

## Participating in Discussions

### Q&A Category

**When to use:** You have a specific question about implementation

**How to ask good questions:**

1. **Provide context:** What are you trying to accomplish?
2. **Show what you've tried:** Include code snippets or API calls
3. **Be specific:** "How do I X?" rather than "X doesn't work"
4. **Include versions:** Sandbox version, spec version
5. **Mark answers:** Help future users by marking the answer that solved your problem

**Example:**

```markdown
**Context:** I'm implementing a paylink for e-commerce checkout

**Question:** How do I specify the merchant name in the paylink?

**What I've tried:**

- Set `merchantName` field but getting validation error
- Checked spec section 3.2 but example doesn't match

**Sandbox version:** 1.2.3
```

### Troubleshooting Category

**When to use:** You're stuck and don't know if it's a bug, your mistake, or standard limitation

**How to get help:**

1. **Describe symptoms:** What's happening vs. what you expect
2. **Share context:** Use case, implementation approach
3. **Include details:** Error messages, request/response, versions
4. **Be open:** It might be user error - that's okay! We're here to help
5. **Provide updates:** When you try suggestions, report results

**We'll help you:**

- Diagnose the root cause
- Determine if it's a bug, gap, or usage issue
- Convert to Issue if needed
- Build knowledge base for others

### Use Cases Category

**When to use:** Discuss implementation scenarios and approaches

**Good topics:**

- "How others are handling X scenario"
- "Best practices for Y use case"
- "Trade-offs between approaches A and B"

### General Category

For everything else - brainstorming, feedback, meta-discussions about the testing process.

## Issue Lifecycle

Understanding how issues progress:

### 1. **Backlog** (New issue created)

- Issue templates auto-label and assign to project
- Awaiting triage by moderator

### 2. **Investigating** (Triage in progress)

- Moderator reviews for clarity
- May ask clarifying questions
- Attempts to reproduce (for bugs)
- Determines appropriate classification

### 3. **Confirmed** (Issue verified)

- **Confirmed - Standard Gap:** Real limitation in spec
- **Confirmed - Bug:** Implementation doesn't match spec
- Priority assigned (high/medium/low)
- Milestone assigned (target spec version)

### 4. **In Progress** (Being worked on)

- Active work happening
- May have spec updates or code changes

### 5. **Resolved** (Fixed/Answered)

- Standard gap: Addressed in spec update
- Bug: Fixed in sandbox
- Documentation: Updated
- Issue closed with explanation

### 6. **Won't Fix** (Closed)

- By design: Intentional trade-off
- Out of scope: Not suitable for standard
- Duplicate: Merged with another issue
- Cannot reproduce: Insufficient information after follow-up

**You can comment on closed issues** if you have new information or the issue recurs.

## Best Practices

### Communication

✅ **Do:**

- Be respectful and professional
- Assume good intent
- Provide constructive feedback
- Use clear, specific language
- Thank people for their help
- Mark helpful answers
- Reference related issues/discussions

❌ **Don't:**

- Demand features or fixes
- Be dismissive of limitations
- Spam "+1" comments (use reactions instead 👍)
- Derail discussions with off-topic comments
- Share confidential information

### Technical Content

✅ **Do:**

- Use code blocks for code/JSON
- Sanitize sensitive data (tokens, real account numbers)
- Include relevant spec section references
- Provide minimal reproducible examples
- Specify versions (spec, sandbox)
- Update issues with new findings

❌ **Don't:**

- Paste huge logs (use relevant excerpts)
- Include production credentials
- Make assumptions without testing
- Report bugs in old sandbox versions without checking latest

### Collaboration

✅ **Do:**

- Search before creating
- Link related content
- Share workarounds you discover
- Help others in discussions
- Provide feedback on proposed solutions
- Test proposed fixes when possible

❌ **Don't:**

- Create duplicate issues
- Hijack threads with unrelated issues
- Pressure for immediate responses
- Make conflicting demands

## Community Standards

All participants are expected to maintain professional and respectful interactions.

**Core Principles:**

- **Be respectful:** Treat everyone with dignity
- **Be collaborative:** We're all working toward the same goal
- **Be patient:** Diagnosis and fixes take time
- **Be constructive:** Focus on improvement, not criticism
- **Be inclusive:** Welcome all perspectives and experiences

**Issues with other participants:** Report to repository owners/moderators privately. Serious violations may result in blocking from the forum.

## Getting Help

**For questions about:**

- **Using the repository:** Create a discussion in General category
- **Access issues:** Contact repository owner
- **Community standards issues:** Contact moderators privately
- **Technical implementation:** Start a discussion in Q&A or Troubleshooting

## Recognition

We value all contributions! Active, helpful participants may be:

- Promoted to **Moderators** team (if interested)
- Acknowledged in release notes
- Credited in spec acknowledgments

## Questions About Contributing?

If anything in this guide is unclear, please:

1. Create a discussion in the General category
2. Suggest improvements via an issue
3. Contact a moderator

---

**Thank you for helping improve QR+!** Your feedback makes a real difference in shaping a standard that works for everyone.
