---
title: Claude Code Custom Slash Commands 
date: 2025-07-28
tags: claude code, artificial intelligence
description: 3 Custom Slash Commands to orchestrate an end-to-end development life cycle using Claude Code
---

Since moving from Aider to Claude Code, I struggled to get Claude to consistently perform certain
actions (like testing, linting, committing). Claude Code is more general purpose, while Aider felt
designed around core coding workflows.

At first, I thought that [leveraging hooks](https://docs.anthropic.com/en/docs/claude-code/hooks-guide) was going to be the key to getting a consistent workflow.
However, I ran into problems figuring out which hooks really mark the end of a task that indicates it
is time to lint or test or commit. Should I do it after every change? Or when it stops?

I know Claude can make a good decision of when to perform these tasks if I remember to provide a robust prompt.

Enter [Custom Slash Commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands#custom-slash-commands).
With Slash commands, I can now *automate the prompt* and get Claude to consistently perform certain steps without
having to fiddle around with custom hooks.

When this feature first came out, I used it sparingly as I thought hooks was going to be the answer. The big unlock
was to go a step further and use different slash commands to orchestrate my entire workflow.

My typical workflow:

1. Create a new GitHub Project focused around a specific set of tasks with an associated spec file as
the project README
2. Create GitHub Issues from the Project that maps to key deliverables
3. Work on each ticket in turn

What I did was take these steps and encode them as slash commands that I could run in turn to get to
the output I want. These files, like any prompt, need to be tuned to your specific usecase. For me, I
often find that Claude wants to create more code than is necessary or that Zen will make suggestions more
suitable for a very mature project. To prevent this, I throw in frequent reminders that I am part of
a startup and to keep the scope in check.

Please take these and modify them to your needs! To get the most out of them, it will require:

- [Zen MCP](https://github.com/BeehiveInnovations/zen-mcp-server)
- [GitHub CLI](https://cli.github.com/).

You can add these in a `commands` directory within either `~/.claude/` (user commands) or `.claude/` (project
commands). I also add a `resources` directory to store templates and HTML docs converted to markdown.

### Step 1: Create a Project

**Resources**

- [RedHat Style Guide](/public/redhat-style-guide.md)
- [Spec Doc Template](/public/spec-doc-template.md)

```md
---
allowed-tools: Bash(gh project *)
description: Create a project in Github and associate it with a README spec file
---

## References

- Redhat Style Guide: @~/.claude/resources/redhat-style-guide.md
- Spec Template: @~/.claude/resources/spec-doc-template.md

## Context

- All projects for the repo: !`gh project list`
- Organizations: !`gh org list`

## Your Task

1. Create a spec file from the Spec Template. Must follow the Redhat Style Guide. Analyze existing code to refine the spec. The spec is about: #$ARGUMENTS
2. Using zen, review the spec file. Keep in mind that this is for a solo developer running a startup!
3. Make any critical changes. If unsure, prompt user for feedback
4. Create the project using a reasonable title based on the ask
5. Use `gh project create` to create the project. Spec file cannot be added at this stage. It must be done with edit
6. Use `gh project edit --readme <text>` to add the spec file to the project
```

### Step 2: Create Issues for the Project

- [RedHat Style Guide](/public/redhat-style-guide.md)
- [GitHub Issue Template](/public/github-issue-template.md)
 
```md
---
allowed-tools: Bash
description: Create issues from a Project spec
---

## References

- RedHat Style Guide: @~/.claude/resources/redhat-style-guide.md
- Spec Template: @~/.claude/resources/github-issue-template.md

## Context

- Current Project details: !gh project view $ARGUMENTS --owner "YOU"
- Issues already in the Project: !gh project item-list $ARGUMENTS --owner "YOU"

## Your Task

1. Analyze the Project Details and the Issues already in the Project and create new issues for the current repository
IF AND ONLY IF there is a gap in the desired Project Spec and the Issues
```

### Step 3..n: Work on Issues

```md
---
allowed-tools: Bash(gh issue:*) 
description: Grab an issue and work on it
---

## References

- README: @README.md

## Context

- Issue description: !gh issue view $ARGUMENTS
- Assign issue: !gh issue edit $ARGUMENTS --add-assignee YOU 

## Your Task

1. Create a feature branch with a descriptive name
2. Implement the feature:
   - Write tests first based on acceptance criteria (when applicable)
   - Implement the minimum viable solution
   - Run linters and formatters to ensure code quality
   - Run tests to verify functionality
   - Confirm any build commands work (if applicable)
3. Validate the implementation:
   - Start the development server to test locally
   - Verify all acceptance criteria are met
   - Check for any breaking changes
4. Use zen to perform a code review. Fix any critical & high priority issues. Remember this is for a single person startup
so don't worry about scalability or "large company" problems. Security is ALWAYS important
5. Commit changes using conventional commit format: `git add . && git commit -m "feat: <description>"`
6. Open a pull request with structured description:
   - Summary of changes
   - Testing performed
   - Any recommended follow-up actions
   - Reference to close the issue: `CLOSES: #$2`
```
