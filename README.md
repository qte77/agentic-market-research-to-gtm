<!-- markdownlint-disable MD028 no-blanks-blockquote -->
<!-- markdownlint-disable MD033 no-inline-html -->
# AI Startup Market Research Framework

> Stop Guessing. Start Dominating. - Automated market intelligence for AI startups that refuse to fail.

> Go Vertical. Not Ballistic. - Market research and go-to-market strategy development framework for aligning AI startups with investor and market opportunities.

[![License](https://img.shields.io/badge/license-BSD3Clause-58f4c2.svg)](LICENSE)
![Version](https://img.shields.io/badge/version-1.0.0-58f4c2.svg)
[![vscode.dev](https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=vscode.dev&labelColor=2c2c32&color=007acc&logoColor=007acc)](https://vscode.dev/github/qte77/agentic-market-research-and-gtm)
[![Codespace](https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=Codespace%20Dev&labelColor=2c2c32&color=007acc&logoColor=007acc)](https://github.com/codespaces/new?repo=qte77/agentic-market-research-and-gtm&devcontainer_path=.devcontainer/devcontainer.json)
[![llms.txt (UitHub)](https://img.shields.io/badge/llms.txt-uithub-800080.svg)](https://uithub.com/qte77/agentic-market-research-and-gtm)

## Disclaimer

> This project heavily relies on the seemingly non-deterministic function-approximation capabilities of LLM-Agents.

## Purpose

Analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns to identify optimal market opportunities and develop actionable go-to-market strategies.

## Usage

> 2025-08-21: Usage of `claude-sonnet-4-20250514` is adviced as `Opus` is not as capable for this setup

### Execution Methods

| Method | Command | Description | Use Case |
|--------|---------|-------------|----------|
| **Interactive Claude Workflow** | `claude` with user input `"Read and execute the workflow described in AGENTS.md"` | Interactive Claude session with AGENTS.md orchestration | Real-time analysis with human oversight |
| **Non-interactive Workflow** | `claude -p "Read and execute the workflow described in AGENTS.md"` | Claude orchestrates sub-agents | Advanced workflow with error handling |
| **Automated Complete Pipeline** | `make all` | Full pipeline with dependency management | Recommended for advanced users |
| **Individual Phases** | `make research && make gtm && make synthesis` | Run specific phases independently | Resume from failure or selective processing |
| **Manual Tasks** | `cat .claude/agents/market_research.md \| claude -p "execute"`<br>`cat .claude/agents/gtm_strategy.md \| claude -p "execute"`<br>`cat .claude/agents/research_synthesizer.md \| claude -p "execute"` | Direct agent execution | Debugging or custom workflows |

### Configuration Setup

Before running the pipeline, configure your research targets:

1. **Edit `config/sources.md`** - Add projects/companies to be analyzed and aligned (required)
2. **Edit `config/targets.md`** - Add organizations/markets to align with (required)
3. **Edit `config/requirements_pmf.md`** - Add PMF analysis requirements (optional)
4. **Edit `config/requirements_gtm.md`** - Add GTM strategy requirements (optional)
5. **Edit `config/requirements_research.md`** - Add synthesis requirements (optional)
6. **Edit `config/validation_criteria.md`** - Add validation criteria (optional)

### Configuration Examples

**Adding New Source Projects** (`config/sources.md`):

```markdown
## Primary Project

- [>>> company name here <<<](https://company.url)
  - Additional information for this source #1
  - Additional information for this source #N
```

**Adding New Alignment Target** (`config/targets.md`):

```markdown
## Primary Targets

- [Accelerator Program](https://accelerator.com)
  - Program requirements and portfolio analysis
```

## Requirements

- **Claude Code CLI** (`npm install -gs @anthropic-ai/claude-code`)
- **Make** (build automation)
- **Node.js and npm** (for Claude Code CLI installation)

**Prerequisites for all methods:**

- Configuration files setup in `config/`
- Claude Code CLI installed (`make setup_claude_code`)
- Output directories exist (`make create_struct`)

## Setup

```bash
make setup_claude_code     # Install Claude Code CLI
```

or use the pre-configured [Devcontainer](.devcontainer/devcontainer.json).

## Automated Features

- Auto-creates directory structure via hooks
- Real-time progress tracking and notifications
- Completion summaries with file listings

For detailed configuration instructions and examples, see individual files in `config/` directory and `AGENTS.md` for orchestration details.

## Expected Outcomes

**Market Research Output** (`results/research/`):

- Technical capability analysis of source projects
- Target organization opportunity assessment
- Portfolio company competitive analysis
- Strategic alignment recommendations

**Product-Market Fit Analysis** (`results/pmf/`):

- Problem-solution fit validation
- Customer engagement and satisfaction metrics
- Market readiness and adoption indicators
- PMF scoring and optimization recommendations

**Go-to-Market Strategy** (`results/gtm/`):

- Customer segmentation and ideal customer profiles
- Value propositions and positioning strategies
- Sales channels and acquisition strategies
- Launch plan with metrics and timelines

**Slide Deck Generation** (`results/slide_decks/`):

- Investor-ready presentation materials
- Executive summaries in slide format
- Visual storytelling with data-driven narratives
- Template-based presentations (Sequoia Capital, YC, etc.)

**Research Synthesis** (`results/synthesis/` and `results/pipeline_execution_summary.md`):

- Executive summaries highlighting key opportunities
- Strategic alignment and implementation priorities
- Actionable next steps and honest assessments
- Complete pipeline overview with success metrics

## Project Structure

```bash
├── .claude/agents/          # Claude Code sub-agent definitions
│   ├── market-research-specialist.md  # Market research analysis
│   ├── product-market-fit-analyst.md  # PMF validation and optimization
│   ├── gtm-strategy-developer.md      # Go-to-market strategy
│   ├── research-synthesizer.md        # Cross-analysis and synthesis
│   ├── slide-deck-generator.md        # Presentation generation
│   └── results-validator.md           # Quality assurance and validation
├── config/                  # Configuration files
│   ├── sources.md           # Projects to be analyzed (required)
│   ├── targets.md           # Organizations/markets to align with (required)
│   ├── requirements_pmf.md  # PMF analysis requirements (optional)
│   ├── requirements_gtm.md  # GTM strategy requirements (optional)
│   ├── requirements_research.md # Synthesis requirements (optional)
│   └── validation_criteria.md  # Quality standards and validation rules (optional)
├── templates/               # Presentation templates
│   └── slide_decks/         # Slide deck templates (Sequoia, YC, etc.)
├── results/                 # Generated outputs
│   ├── archive/             # Prior runs (timestamped)
│   ├── research/            # Market research analysis
│   ├── pmf/                 # Product-market fit analysis
│   ├── gtm/                 # Go-to-market strategy
│   ├── synthesis/           # Cross-analysis and strategic integration
│   ├── slide_decks/         # Investor-ready presentations
│   ├── validation/          # Quality assurance reports
│   └── logs/                # Session and progress tracking
├── AGENTS.md                # Workflow orchestration with validation loops
├── SUBAGENTS.md             # Shared guidelines for all sub-agents
└── Makefile                 # Pipeline automation with validation
```

## Architecture Overview

This framework uses **orchestrated sub-agents** for automated market research and strategy development:

```text
┌───────────────────────────────────────────────────────────────────────────┐
│                        ORCHESTRATION LAYER                                │
│       ┌─────────────────┐              ┌─────────────────┐                │
│       │   AGENTS.md     │              │    Makefile     │                │
│       │ (Workflow Mgmt) │      OR      │  (Automation)   │                │
│       └─────────────────┘              └─────────────────┘                │
└───────────────┬────────────────────────────────────┬──────────────────────┘
                │                                    │
                ▼                                    ▼
┌───────────────────────────────────────────────────────────────────────────┐
│                         SUB-AGENT PIPELINE                                │
│                                                                           │
│  ┌──────────────────┐    ┌─────────────────┐    ┌──────────────────────┐  │
│  │ market-research- │ -> │ results-        │    │ gtm-strategy-        │  │
│  │   specialist     │    │   validator     │ -> │   developer          │  │
│  │                  │ <- │ (feedback loop) │    │                      │  │
│  └─────────┬────────┘    └─────────────────┘    └─────────┬────────────┘  │
│            │                                              │  ▲            │
│            ▼                                              ▼  │            │
│  ┌─────────────────┐     ┌─────────────────┐    ┌─────────────────────┐   │
│  │ results/        │     │  results/gtm/   │ <- │ results-validator   │   │
│  │   research/     │     │                 │    │  (feedback loop)    │   │
│  └─────────┬───────┘     └────────────┬────┘    └─────────────────────┘   │
│            └──────────────────┐       │                                   │
│                               ▼       ▼                                   │
│                          ┌──────────────────────┐                         │
│                          │ research-synthesizer │                         │
│                          │                      │                         │
│                          └─────────┬────────────┘                         │
│                                    │                                      │
│                                    ▼                                      │
│                           ┌─────────────────┐                             │
│                           │ results/        │                             │
│                           │  synthesis/     │                             │
│                           └─────────────────┘                             │
└───────────────────────────────────────────────────────────────────────────┘
                ▲                                   ▲
                │                                   │
┌───────────────────────────────────────────────────────────────────────────┐
│                       SHARED GUIDELINES                                   │
│                                                                           │
│  ┌─────────────────────────────────────────────────────────────────────┐  │
│  │                      SUBAGENTS.md                                   │  │
│  │                                                                     │  │
│  │  • File creation requirements      • Citation standards             │  │
│  │  • Standard framework components   • Markdown formatting            │  │
│  │  • Implementation instructions     • Quality standards              │  │
│  └─────────────────────────────────────────────────────────────────────┘  │
└───────────────────────────────────────────────────────────────────────────┘
```

### Orchestration Layer

- **[AGENTS.md](AGENTS.md)** - Workflow orchestration with validation feedback loops
- **[Makefile](Makefile)** - Automated pipeline execution with validation options

### Sub-Agent Layer

- **[market-research-specialist](.claude/agents/market-research-specialist.md)** - Technical capability and competitive analysis
- **[product-market-fit-analyst](.claude/agents/product-market-fit-analyst.md)** - PMF validation and optimization
- **[gtm-strategy-developer](.claude/agents/gtm-strategy-developer.md)** - Go-to-market strategy and customer segmentation
- **[research-synthesizer](.claude/agents/research-synthesizer.md)** - Cross-analysis and strategic integration
- **[slide-deck-generator](.claude/agents/slide-deck-generator.md)** - Investor-ready presentation generation
- **[results-validator](.claude/agents/results-validator.md)** - Quality assurance and claim verification

### Shared Guidelines

- **[SUBAGENTS.md](SUBAGENTS.md)** - Common standards for all sub-agents including file creation requirements, citation standards, and markdown formatting

## Pipeline Features

- ✅ **6-Phase Automated Pipeline**: Market Research → PMF Analysis → GTM Strategy → Research Synthesis → Slide Deck Generation → Pipeline Summary
- ✅ **Validation Feedback Loops**: Quality assurance with configurable validation cycles (default 1 cycle per phase)
- ✅ **Pipeline Termination Logic**: Critical phases (1,3,4) halt pipeline on failure; non-critical phases (2,5) marked as FAILED but continue
- ✅ **Orchestration Abstraction**: AGENTS.md works with any executing agent (Claude Code, other AI systems)
- ✅ **Environment Variable Tracking**: `CURRENT_AGENT` tracking for progress monitoring and hooks
- ✅ **Automatic Timestamp Logging**: Pipeline duration calculation with start/end timestamps

## TODO

- [x] **Validator Sub-Agent Implementation**
  - [x] Create `.claude/agents/results-validator.md` - Validation task definition with claim verification, consistency checks, completeness assessment, and quality scoring
  - [x] Add `config/validation_criteria.md` - Quality standards and validation checkpoints
  - [x] Implement feedback loop workflow: `research → validate → pmf → validate → gtm → validate → synthesis → validate → slides → validate → summary`
  - [x] Enhanced Makefile targets: with and without validation feedback loop
  - [x] Validation options: configurable cycles, pipeline termination logic
  - [x] Cross-reference validation against source materials and phase consistency
- [x] **Slide deck and One Pager generator**
  - [x] Condense research and GTM into a concise Slide Deck and One Pager
  - [x] Provide deck templates by Sequoia, YC, a16z, etc.
  - [x] Save locally as Markdown
  - [ ] Use pageon.ai or similar services to generate slides using Markdown
- [x] **PMF Analysis Phase**
  - [x] Create `.claude/agents/product-market-fit-analyst.md` - PMF validation and optimization
  - [x] Problem-solution fit validation and customer signal analysis
  - [x] PMF scoring framework and optimization recommendations
- [ ] **Pipeline Quality Improvements**
  - [ ] Confidence metrics and quality scoring for each phase
  - [ ] Automated error detection and iterative refinement capability
  - [ ] Validation reporting in pipeline execution summary
  - [ ] Option to use with or without validation feedback
- [ ] **Shared memory usage**
  - [ ] [cipher](https://github.com/campfirein/cipher), Cipher is an opensource memory layer specifically designed for coding agents. Compatible with Cursor, Windsurf, Claude Desktop, Claude Code, Gemini CLI, AWS's Kiro, VS Code, and Roo Code through MCP, and coding agents, such as Kimi K2. Built by <https://byterover.dev/>
- [ ] **MCP Integration for Enhanced Data Access**
  - [ ] GitHub MCP Server - Automated repository analysis and competitor tracking
  - [ ] Notion MCP Server - Centralized research documentation and collaboration
  - [ ] cipher, See 'Shared memory usage'
  - [ ] Airtable MCP Server - Structured competitive landscape and funding databases
  - [ ] Financial APIs (Stripe, Crunchbase) - Real-time funding and market data
  - [ ] Replace manual web searches with automated API calls in all agents
  - [ ] Real-time competitive monitoring dashboards and alert systems
- [ ] **Progress Dashboard and Monitoring**
  - As layed out in [todo_hooks_progress_dashboard_solutions](.claude/todo_hooks_progress_dashboard_solutions.md)
  - [ ] Terminal-based live dashboard with visual progress indicators
  - [ ] Claude Code hooks for automatic progress tracking on file writes
  - [ ] Desktop notifications for pipeline completion milestones
  - [ ] JSON-based progress data for programmatic access
  - [ ] HTML dashboard generator for web-based monitoring
  - [ ] Real-time file size and completion percentage tracking
