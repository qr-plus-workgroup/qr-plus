# QR+ Proof of Standard Testing

Welcome to the **QR+ Proof of Standard Testing Repository**! This is the official community feedback and support hub for validating whether the QR+ standard meets real-world use case requirements.

## 🎯 Purpose

This repository serves as a collaborative space for industry participants to:

- **Validate the standard** - Test if QR+ meets your use case requirements
- **Get implementation support** - Ask questions and troubleshoot issues
- **Report gaps and bugs** - Help identify limitations and implementation issues
- **Build knowledge** - Create a searchable database of common questions and solutions
- **Shape the future** - Contribute feedback that influences standard evolution

**Note:** This is NOT the implementation repository. This is for community feedback, testing, and support.

## 🚀 Getting Started

### 1. Browse Existing Content

Before creating new content, familiarize yourself with existing discussions and issues:

- **[View Discussions](../../discussions)** - Browse Q&A and troubleshooting
- **[View Issues](../../issues)** - See reported bugs and gaps
- **[View Project Board](../../../orgs/qr-plus-workgroup/projects/2)** - Track issue progress

### 2. Choose Your Entry Point

#### 🤔 Not sure what's wrong? Start with Discussions

If you're experiencing problems but don't know if it's a bug, your mistake, or a limitation:

**→ [Start a Discussion](../../discussions)**

- **Q&A** - Ask implementation questions
- **Troubleshooting** - "I'm stuck and don't know why"
- **Use Cases** - Discuss your scenarios
- **General** - Open-ended conversations

**We'll help you diagnose** the issue. If it turns out to be a real bug or standard gap, we'll convert it to an issue.

#### 🐛 Found a clear bug or gap? Create an Issue

If you've identified a specific problem:

**→ [Create an Issue](../../issues/new/choose)**

Choose the appropriate template:

- **Standard Gap** - Missing capability blocking your use case
- **Standard Ambiguity** - Spec is unclear or contradictory
- **Enhancement** - Nice-to-have improvement
- **Bug** - Sandbox doesn't match specification
- **Documentation** - Docs need improvement

## 📚 Understanding Issue Types

It's important to choose the right issue type. Here's a guide:

### Standard Gap vs Enhancement

The key difference is **whether you can implement your use case**:

| Type             | Can you work around it?         | Priority | Example                             |
| ---------------- | ------------------------------- | -------- | ----------------------------------- |
| **Standard Gap** | ❌ No - It blocks your use case | High     | "No way to express partial refunds" |
| **Enhancement**  | ✅ Yes - Workarounds exist      | Lower    | "Shorthand notation would be nice"  |

**Decision Test:**

- Ask yourself: "Can I implement my use case without this feature?"
- **NO** → **Standard Gap** (report it!)
- **YES** → **Enhancement** (still valuable feedback!)

### Other Issue Types

**Standard Ambiguity** - The spec is unclear or contradictory

- Example: "Section A says X, but Section B says Y"
- Example: "Not clear if this field is required or optional"

**Bug** - Sandbox implementation doesn't match the spec

- Example: "API returns 400 but spec says it should return 422"
- Example: "Field validation is too strict compared to spec"

**Documentation** - Docs need improvement

- Example: "Missing example for complex scenario"
- Example: "Typo in field description"

## 🏷️ Labels Explained

Issues are organized using labels:

### Priority

- 🔴 **`priority: high`** - Blocks testing or major use case
- 🟡 **`priority: medium`** - Important but workarounds exist
- 🟢 **`priority: low`** - Minor improvement or edge case

### Type

- **`type: standard-gap`** - Missing capability
- **`type: standard-ambiguity`** - Unclear specification
- **`type: enhancement`** - Nice-to-have improvement
- **`type: bug`** - Implementation issue
- **`type: documentation`** - Docs improvement

### Status

- **`status: investigating`** - Being analyzed
- **`status: confirmed`** - Verified as real issue
- **`status: wontfix`** - By design or out of scope
- **`status: duplicate`** - Already reported

## 📅 Milestones & Versions

The QR+ standard follows a specific versioning strategy:

### Specification Versions

- **Even minor versions (1.0, 1.2, 1.4)** - Published, stable for implementation
- **Odd minor versions (1.1, 1.3, 1.5)** - Draft, work in progress
- **Patch versions (1.2.1, 1.2.2)** - Incremental updates to published versions

### Sandbox Versions

The sandbox implementation tracks the spec version with an additional patch number:

- Example: **Sandbox v1.2.3** implements **Spec v1.2.x**
- Patch number indicates sandbox-specific fixes

When reporting bugs, please specify the sandbox version you're using.

## 🔄 Workflow: Discussion → Issue

Here's how community support works:

1. **Start with Discussion** if you're unsure what the problem is
2. **We help diagnose** the root cause through Q&A
3. **Three possible outcomes:**
   - ✅ **User error** - Marked as answered, stays in Discussions as knowledge base
   - 🐛 **Real bug** - Converted to Issue, tracked and fixed
   - 📝 **Standard gap** - Converted to Issue, considered for future versions

This process builds a searchable knowledge base while keeping Issues focused on actionable items.

## 🛠️ Resources

### Testing Resources

- **Sandbox Demo:** [pdef-sim.com](https://pdef-sim.com/h)
- **API Documentation:** [API Specs](https://pdef-sim.com/h?menu=doc-registry)
- **SARB QR+ Specification:** [QR+ Master Specification](https://pdef-sim.com/h?menu=doc-qr-plus-master)

### Getting Help

- **Implementation Questions:** [Start a Discussion](../../discussions)
- **Report Issues:** [Create an Issue](../../issues/new/choose)
- **Request Access:** To get access to the QR+ Simulator contact your organization's primary user or contact SARB's QR+ project team.

### Contributing

- Read our [Contributing Guide](CONTRIBUTING.md) for participation guidelines
- Check [Support Resources](SUPPORT.md) for help options

## 🤝 Community Guidelines

**Be respectful** - Everyone is here to improve the standard

**Be patient** - Troubleshooting takes time, especially for complex issues

**Be helpful** - Share your knowledge, mark helpful answers, reference past issues

**Be specific** - Provide details, examples, and context in your questions/reports

**Be constructive** - Feedback should be actionable and focused on improvement

## 📞 Contact

**Organization:** SARB PEM
**Moderators:** Niel Bester; Mari Few; Bheki Nzimande; Phomolo Moathodi

## 📄 License

Creative Commons for documentation

---

**Ready to get started?**

- 🤔 [Ask a Question](../../discussions/new?category=q-a)
- 🐛 [Report an Issue](../../issues/new/choose)
- 📖 [Browse Discussions](../../discussions)
- 👀 [View Open Issues](../../issues)
