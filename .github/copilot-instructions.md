# Copilot Instructions

This is the repository that you will be working in: <https://github.com/amgookool/amg-dev.git>

The repository is a monorepo managed by `pnpm` that contains multiple projects. There are frontend applications located in the `apps` directory where there can be multiple frontend applications built with different frameworks such as React, Svelte, Vue, Angular, etc. There are also backend applications located in the `services` directory where there can be multiple backend applications built with different frameworks such as Express, NestJS, Django, Flask, etc. The `packages` directory contains shared code that can be used across multiple projects.

There are other directories such as `documentation` where you can find the documenation for the projects, `configurations` where you can find configurations to setup terminals, editors and various cli tools and applications, `notes` where you can find my personal notes on various topics.

The key branches of this repository are:

- main
- development

## Version Control

We use git for version control. Here are rules when creating branches and commit messages:

When creating branches, i would like you to categorize them into the following categories:

- Feature Branches
  - Purpose: Used for new features or enhancements
  - Naming Convention: feature/branch-name
  - Example: feature/add-new-button
- Bug Fixes
  - Purpose: Used for fixing bugs
  - Naming Convention: bugfix/branch-name
  - Example: bugfix/fix-login-error
- Hotfixes
  - Purpose: Used for critical fixes
  - Naming Convention: hotfix/branch-name
  - Example: hotfix/fix-security-vulnerability
- Refactor
  - Purpose: Used for refactoring code
  - Naming Convention: refactor/branch-name
  - Example: refactor/update-authentication-flow
- Documentation
  - Purpose: Used for updating documentation
  - Naming Convention: docs/branch-name
  - Example: docs/update-readme
- Chore
  - Purpose: Used for general tasks and maintenance
  - Naming Convention: chore/branch-name
  - Example: chore/update-dependencies

When creating commit messages, analyze the changes that was made in the file and write a brief high level overview of the changes that was made. Additionally, if the commit is related to a specific issue, please reference the issue number in the commit message. You will use emojis to categorize the commit messages. Here are the emojis that you will use along with their corresponding categories:

- ✨: New Features or functionalities
- 🐛: Bug Fixes changes
- 🚑: Hotfixes changes
- ♻️: Refactor changes
- 📝: Documenation changes
- 🧹: Chore changes
- 🎨: Style(Formatting - no code) changes
- ⚡ : Performance Improvements
- 🧪: Testing related changes
- 🚀: Deployment
- 📦: Dependency Updates
- 🛠: Configuration Changes
- 📖: Readme Updates
- 🚧: Work in Progress
- 🚨: Breaking Changes
- 🤖: CI/CD
- 💄: UI and style file Updates
- 🎉: Creation of project (used in monorepos)
- 🚚: Moves or renames files
- 🔥: Deprecated or Dead code
- 🥅: Error handling
- 📅: Database changes
- 🌱: Seed files
- 🙈: GitIgnore, Dockerignore file changes
- 🔀: Merges
- 📱: Responsive Design Changes
- 🏗️: Architectural Changes
- 🛂: Security
- ⏪: Reverts
- 🏷️: Types changes
- 💬: Updates to text content literals
- 🖼️: Asset updates

When creating a commit message, please use the following format:

`<emoji>: commit message`

## Tech Stack

This repository uses multiple programming languages, frameworks, libraries and tools. Here is a list of some of the technologies that are used in this repository:

- JavaScript/TypeScript
- Node.js
- React
- Svelte
- Vite
- Vitest
- act ( Github Actions Local Runner)
