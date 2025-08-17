<!-- markdownlint-disable MD028 no-blanks-blockquote -->
<!-- markdownlint-disable MD033 no-inline-html -->
# AI Startup Market Research Framework

> Stop Guessing. Start Dominating. - Automated market intelligence for AI startups that refuse to fail.

> Go Vertical. Not Ballistic. - Market research and go-to-market strategy development framework for aligning AI startups with investor and market opportunities.

## Purpose

Analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns to identify optimal market opportunities and develop actionable go-to-market strategies.

## Usage

### Configuration Setup

Before running the pipeline, configure your research targets:

1. **Edit `config/sources.md`** - Add projects/companies to be analyzed and aligned
2. **Edit `config/targets.md`** - Add organizations/markets to align with
3. **Edit `config/comments_research.md`** - Add auxiliary comments, e.g., constraints and focus areas for market research
4. **Edit `config/comments_gtm.md`** - Add auxiliary comments, e.g., specific guidance for go-to-market strategy

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

- **Accelerator Program**: https://accelerator.com
  - Program requirements and portfolio analysis
```

### Execution Methods

| Method | Command | Description | Use Case |
|--------|---------|-------------|----------|
| **Automated Complete Pipeline** | `make all` | Full 3-phase pipeline with dependencies | Recommended for advanced users |
| **Interactive Claude Workflow** | `claude` with user input `"Read and execute the workflow described in AGENTS.md"` | Interactive Claude session with AGENTS.md orchestration | Real-time analysis with human oversight |
| **Non-interactive Workflow** | `claude -p "Read and execute the workflow described in AGENTS.md"` | Claude orchestrates sub-agents | Advanced workflow with error handling |
| **Individual Phases** | `make research && make gtm && make synthesis` | Run specific phases independently | Resume from failure or selective processing |
| **Manual Tasks** | `cat .claude/agents/market_research.md \| claude -p "execute"`<br>`cat .claude/agents/gtm_strategy.md \| claude -p "execute"`<br>`cat .claude/agents/research_synthesizer.md \| claude -p "execute"` | Direct agent execution | Debugging or custom workflows |
| **Setup & Utilities** | `make create_struct && make clean_struct && make setup_claude_code` | Environment preparation | Initial setup and maintenance |

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

**Go-to-Market Strategy** (`results/gtm/`):

- Customer segmentation and ideal customer profiles
- Value propositions and positioning strategies
- Sales channels and acquisition strategies
- Launch plan with metrics and timelines

**Research Synthesis** (`results/pipeline_execution_summary.md`):

- Executive summaries highlighting key opportunities
- Strategic alignment and implementation priorities
- Actionable next steps and honest assessments
- Complete pipeline overview with success metrics

## Project Structure

```bash
├── .claude/agents/          # Claude Code sub-agent definitions
│   ├── market_research_specialist.md  # Market research analysis
│   ├── gtm_strategy_developer.md      # Go-to-market strategy
│   ├── results_validator.md           # Quality assurance and validation
│   └── research_synthesizer.md        # Cross-analysis and synthesis
├── config/                  # Configuration files
│   ├── sources.md           # Projects to be analyzed
│   ├── targets.md           # Organizations/markets to align with
│   ├── comments_research.md # Research constraints and focus areas
│   ├── comments_gtm.md      # GTM strategy guidance
│   └── validation_criteria.md  # Quality standards and validation rules
├── results/                 # Generated outputs
│   ├── archive/             # Prior runs (timestamped)
│   ├── research/            # Market research analysis
│   ├── gtm/                 # Go-to-market strategy
│   ├── validation/          # Quality assurance reports
│   ├── synthesis/           # Cross-analysis and strategic integration
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

- **[market-research-specialist](.claude/agents/market_research_specialist.md)** - Technical capability and competitive analysis
- **[gtm-strategy-developer](.claude/agents/gtm_strategy_developer.md)** - Go-to-market strategy and customer segmentation
- **[results-validator](.claude/agents/results_validator.md)** - Quality assurance and claim verification
- **[research-synthesizer](.claude/agents/research_synthesizer.md)** - Cross-analysis and strategic integration

### Shared Guidelines

- **[SUBAGENTS.md](SUBAGENTS.md)** - Common standards for all sub-agents including file creation requirements, citation standards, and markdown formatting

## TODO

- [x] **Validator Sub-Agent Implementation**
  - [ ] Create `.claude/agents/validator.md` - Validation task definition with claim verification, consistency checks, completeness assessment, and quality scoring
  - [ ] Add `config/validation_criteria.md` - Quality standards and validation checkpoints
  - [ ] Implement feedback loop workflow: `research → validate → gtm → validate → synthesis`
  - [ ] Enhanced Makefile targets: with and without validation feedback loop
  - [ ] Validation options: hard stops vs soft warnings vs auto-retry with feedback
  - [ ] Cross-reference validation against source materials and phase consistency
- [ ] **Slide deck and One Pager generator**
  - [ ] Condense research and GTM into a concise Slide Deck and One Pager
  - [ ] Povide deck templates by Sequoia, YC, a16z, etc.
  - [ ] Save locally as Markdown
  - [ ] Use pageon.ai or similar services to generate slieds using Markdown
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
