<!-- markdownlint-disable MD028 no-blanks-blockquote -->
<!-- markdownlint-disable MD033 no-inline-html -->
# AI Startup Market Research Framework

> Stop Guessing. Start Dominating. - Automated market intelligence for AI startups that refuse to fail.

> Go Vertical. Not Ballistic. - Market research and go-to-market strategy development framework for aligning AI startups with investor and market opportunities.

[![License](https://img.shields.io/badge/license-BSD3Clause-58f4c2.svg)](LICENSE)
![Version](https://img.shields.io/badge/version-2.0.0-58f4c2.svg)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Ready-FF6B35?logo=anthropic&logoColor=white)](https://claude.ai/code)
[![vscode.dev](https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=vscode.dev&labelColor=2c2c32&color=007acc&logoColor=007acc)](https://vscode.dev/github/qte77/agentic-market-research-to-gtm)
[![Codespace Dev](https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=Codespace%20Dev&labelColor=2c2c32&color=007acc&logoColor=007acc)](https://github.com/codespaces/new?repo=qte77/agentic-market-research-to-gtm&devcontainer_path=.devcontainer/devcontainer.json)
[![llms.txt (UitHub)](https://img.shields.io/badge/llms.txt-uithub-800080.svg)](https://uithub.com/qte77/agentic-market-research-to-gtm)

## Purpose

Analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns to identify optimal market opportunities and develop actionable go-to-market strategies.

`Source Analysis → Landscape Research → Market Analysis → PMF Analysis → GTM Strategy → Contradiction Analysis → Synthesis → Slide Decks → Pipeline Summary`

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
| **Main Agent Orchestration** | `claude -p "Read and execute the workflow described in AGENTS.md"` | Full pipeline with TodoWrite progress tracking, Task tool management, and validation routing | **RECOMMENDED** - Complete orchestration |
| **Orchestrated with Mode** | `claude -p "Execute in [concise\|detailed] mode: Read and execute AGENTS.md"` | Mode-specific execution with automatic subagent transmission | Executive vs research-grade outputs |
| **Legacy Automated** | `make orchestrated` / `make all` | Batch execution via Makefile targets | Backward compatibility |
| **Individual Phases** | `make landscape research pmf gtm contradictions synthesis slides` | Run specific phases independently | Resume from failure or testing |
| **Development & Debugging** | `cat .claude/agents/[subagent].md \| claude -p "execute"` | Direct subagent execution | Phase-specific debugging |

### Agent-Based Workflow (AGENTS.md)

The new orchestrated workflow in [AGENTS.md](AGENTS.md) provides comprehensive pipeline management with the following capabilities:

#### Key Features

- **TodoWrite Progress Tracking** - Real-time task status updates with pending/in_progress/completed states
- **Task Tool Subagent Management** - Automated subagent execution with proper dependency handling
- **Parallel Phase Execution** - Phase 0 (Source Analysis) and Phase 1A (Industry Landscape) run simultaneously for optimal performance
- **Validation Loop Integration** - Built-in quality assurance with results-validator feedback and correction cycles
- **Mode Transmission** - Automatic detection and transmission of both content depth and strategic approach modes to all subagents
- **Phase Dependency Management** - Ensures proper execution order while optimizing for parallel processing where possible

#### Execution Flow

1. **Phase 0 + Phase 1A (Parallel)** - Source project analysis and industry landscape research execute simultaneously
2. **Phase 1B** - Market research analysis using outputs from both Phase 0 and 1A
3. **Phase 2** - Product-market fit analysis based on market research findings
4. **Phase 3** - Go-to-market strategy development leveraging research and PMF insights
5. **Phase 4** - Contradiction analysis across all prior phases
6. **Phase 5** - Research synthesis integrating key findings and resolving contradictions
7. **Phase 6** - Slide deck generation for investor presentations
8. **Phase 7** - Automated pipeline execution summary with strategic insights

#### Validation Strategy

- **Default Validation** - 1 correction loop (n=1) for each validated phase
- **Override Options** - Skip validation, multiple iterations (n=1 to N), or strict validation (unlimited loops)
- **Feedback Integration** - results-validator feedback automatically forwarded to respective phase subagents for targeted corrections
- **Quality Assurance** - Cross-phase consistency analysis and strategic integration validation

### Pipeline Execution Modes

The framework supports dual-mode execution combining content depth and strategic approach:

#### Content Depth Modes

| Mode | Target | Output | Content Depth |
|------|--------|--------|---------------|
| **Concise** | Executive-focused insights | Same file structure (5-6 files per phase) | 1-2 pages per file (500-1000 words) |
| **Detailed** | Research-grade thoroughness | 5-6 comprehensive files per phase | 3-5 pages per file (1500-2500 words) |

#### Strategic Approach Modes

| Mode | Research Approach | Market Sizing | Growth Strategy | Risk Profile |
|------|-------------------|---------------|-----------------|--------------|
| **Conservative** | Proven segments, realistic capture rates (0.1-1% TAM) | Lower-end TAM/SOM/SAM estimates | Measured growth (2-5x annually) | Risk-aware, mitigation-focused |
| **Ambitious** | Adjacent markets, optimistic capture rates (1-10% TAM) | Higher-end TAM/SOM/SAM estimates | Aggressive growth (5-20x annually) | Opportunity-focused, bold strategies |

**Mode Combinations (2x2 Matrix)**:

- **Concise + Conservative**: Executive summaries with safe recommendations and realistic market sizing
- **Concise + Ambitious**: Executive summaries with bold strategies and optimistic projections  
- **Detailed + Conservative**: Comprehensive analysis with measured approaches and proven market estimates
- **Detailed + Ambitious**: Comprehensive analysis with aggressive growth plans and expansive market opportunity

**Default Modes**: Concise + Conservative (executive-focused with risk-aware approach)

**Mode Examples:**

```sh
# Main agent orchestration (RECOMMENDED) - Dual mode combinations
claude -p "Read and execute the workflow described in AGENTS.md"  # Default: concise + conservative
claude -p "Execute in detailed conservative mode: Read and execute AGENTS.md"  # Comprehensive + measured
claude -p "Execute in concise ambitious mode: Read and execute AGENTS.md"      # Executive + bold
claude -p "Execute in detailed ambitious mode: Read and execute AGENTS.md"     # Comprehensive + aggressive

# Legacy automated execution with dual modes
make orchestrated                                    # Default: concise + conservative
make orchestrated DETAIL_MODE=detailed STRATEGY_MODE=conservative  # Comprehensive + measured
make orchestrated DETAIL_MODE=concise STRATEGY_MODE=ambitious      # Executive + bold  
make orchestrated DETAIL_MODE=detailed STRATEGY_MODE=ambitious     # Comprehensive + aggressive

# Individual phases with dual modes
make landscape DETAIL_MODE=detailed STRATEGY_MODE=ambitious
make research pmf gtm DETAIL_MODE=concise STRATEGY_MODE=conservative
```

**Mode Transmission:** Main agent automatically detects and transmits both content depth and strategic approach modes to all subagents via Task tool prompts. Both modes logged to `results/logs/mode_log.txt`.

### Pipeline Monitoring

The framework includes logging and progress tracking capabilities.

**Pipeline Monitoring** - Check current pipeline status:

```sh
# View execution logs
cat results/logs/mode_log.txt
ls results/logs/
# Check directory structure and outputs
ls results/
```

## Requirements

- **Claude Code CLI** (`npm install -gs @anthropic-ai/claude-code`)
- **Make** (build automation)
- **Node.js and npm** (for Claude Code CLI installation)
- **POSIX Shell** (`sh`, `dash`, `bash` - for dashboard and hooks)
- **Standard Unix Tools** (`find`, `wc`, `awk`, `date` - widely available)

**Prerequisites for all methods:**

- Configuration files setup in `config/`
- Claude Code CLI installed (`make setup_claude_code`)
- Output directories exist (`make create_struct`)

## Automated Features

- Auto-creates directory structure via hooks
- Real-time progress tracking and notifications
- Completion summaries with file listings

For detailed configuration instructions and examples, see individual files in `config/` directory and `AGENTS.md` for orchestration details.

## Expected Outcomes

**Industry Landscape Research** (`results/landscape/`):

- Comprehensive competitive analysis and market mapping
- Open-source ecosystem analysis and opportunities
- Academic research trends and technical innovations
- Technology trends analysis and future directions
- Factual industry overview and competitive intelligence

**Source Project Analysis** (`results/source/`):

- Technical architecture and capability analysis
- AI/ML differentiation and competitive advantages
- Security, compliance, and scalability assessment
- Technical positioning and innovation analysis

**Market Research Analysis** (`results/research/`):

- Strategic alignment with investor priorities using source analysis
- Funding patterns and business model analysis
- Investment readiness assessment and recommendations
- Market positioning based on technical capabilities

**Product-Market Fit Analysis** (`results/pmf/`):

- Problem-solution alignment validation
- Market readiness assessment
- Customer pain point analysis
- Competitive positioning evaluation
- PMF strength scoring and optimization recommendations

**Go-to-Market Strategy** (`results/gtm/`):

- Customer segmentation and ideal customer profiles
- Value propositions optimized for confirmed product-market fit
- Sales channels and acquisition strategies aligned with PMF findings
- Launch plan with metrics and timelines leveraging PMF insights

**Contradiction Analysis** (`results/contradictions/`):

- Cross-phase contradiction detection and resolution frameworks
- Gap assessment and vulnerability analysis
- Objection handling and counter-argument development
- Risk mitigation strategies and conflict resolution

**Research Synthesis** (`results/synthesis/`):

- Executive summaries highlighting key opportunities
- Strategic alignment and implementation priorities
- Contradiction resolution strategies and conflict mitigation
- Actionable next steps and honest assessments

**Slide Deck Presentations** (`results/slide_decks/`):

- Investor-ready presentation materials
- Visual storytelling with data-driven narratives
- Template-based decks (Sequoia, YC, etc.)

**Pipeline Execution Summary** (`results/pipeline_execution_summary.md`):

- Complete pipeline overview with success metrics
- Key strategic insights and alignment analysis
- Implementation roadmap and next steps

## Project Structure

```sh
├── AGENTS.md                # 🎯 MAIN ORCHESTRATION WORKFLOW (RECOMMENDED)
│                            # TodoWrite tracking + Task tool management
│                            # 7-phase pipeline with parallel execution & validation
├── SUBAGENTS.md             # Shared guidelines for all specialized sub-agents
├── .claude/agents/          # Claude Code sub-agent definitions
│   ├── source-project-analyst.md         # Phase 0: Source project technical analysis
│   ├── industry-landscape-researcher.md  # Phase 1A: Industry landscape (parallel with Phase 0)
│   ├── market-research-specialist.md     # Phase 1B: Strategic market research
│   ├── product-market-fit-analyst.md     # Phase 2: Product-market fit validation
│   ├── gtm-strategy-developer.md         # Phase 3: Go-to-market strategy
│   ├── contradiction-analyzer.md         # Phase 4: Contradiction analysis and objection handling
│   ├── research-synthesizer.md           # Phase 5: Cross-analysis and synthesis
│   ├── slide-deck-generator.md           # Phase 6: Presentation materials
│   └── results-validator.md              # Quality assurance and validation (all phases)
├── config/                  # Pipeline configuration and research parameters
│   ├── sources.md           # Projects to be analyzed (Phase 0 input)
│   ├── targets.md           # Organizations/markets to align with
│   ├── comments_research.md # Research constraints and focus areas
│   ├── comments_gtm.md      # GTM strategy guidance
│   └── validation_criteria.md  # Quality standards and validation rules
├── results/                 # Generated pipeline outputs
│   ├── archive/             # Prior runs (timestamped with execution modes)
│   ├── source/              # Phase 0: Source project technical analysis
│   ├── landscape/           # Phase 1A: Industry landscape and competitive intelligence
│   ├── research/            # Phase 1B: Strategic market research and investment analysis
│   ├── pmf/                 # Phase 2: Product-market fit validation
│   ├── gtm/                 # Phase 3: Go-to-market strategy
│   ├── contradictions/      # Phase 4: Contradiction analysis and objection handling
│   ├── synthesis/           # Phase 5: Cross-analysis and strategic integration
│   ├── slide_decks/         # Phase 6: Investor-ready presentations
│   ├── validation/          # Quality assurance reports and feedback summaries
│   └── logs/                # Pipeline execution logs and mode tracking
└── Makefile                 # Legacy pipeline automation (backward compatibility)
```

## Architecture Overview

This framework uses **orchestrated sub-agents** via the AGENTS.md workflow for automated market research and strategy development:

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                      MAIN AGENT ORCHESTRATION (AGENTS.md)                   │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ • TodoWrite Progress Tracking    • Task Tool Subagent Management    │    │
│  │ • Dual Mode Detection & Transmission                                │    |
│  │ • Validation Loop Integration    • Phase Dependency Management      │    │
│  │ • Parallel Execution Optimization • Correction Feedback Routing     │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
└─────────────────┬───────────────────────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                      7-PHASE PIPELINE EXECUTION FLOW                        │
│                                                                             │
│ Phase 0: Source Analysis     Phase 1A: Industry Landscape (PARALLEL)        │
│    ↓ results/source/           ↓ results/landscape/                         │
│    └─────────────┬─────────────┘                                            │
│                  ▼                                                          │
│ Phase 1B: Market Research → results/research/  → → → → → → → ┐              │
│                  ↓                                           ↓              │
│ Phase 2: PMF Analysis → results/pmf/                         ↓              │
│                  ↓                                           ↓              │
│ Phase 3: GTM Strategy → results/gtm/  → → → → → → → → → → → →↓              │
│                  ↓                                           ↓              │
│ Phase 4: Contradiction Analysis → results/contradictions/    ↓              │
│                  ↓                                           ↓              │
│ Phase 5: Research Synthesis ← ← ← ← ← ← ← ← ← ← ← ← ← ← ← ← ←┘              │
│          → results/synthesis/                                               │
│                  ↓                                                          │
│ Phase 6: Slide Deck Generation → results/slide_decks/                       │
│                  ↓                                                          │
│ Phase 7: Pipeline Summary → results/pipeline_execution_summary.md           │
│                                                                             │
│ Validation: results-validator → results/validation/[phase]_feedback_*.md    │
│ • Default: 1 correction loop per validated phase                            │
│ • Override: Skip, multiple loops (n=1 to N), or strict (unlimited)          │
└─────────────────────────────────────────────────────────────────────────────┘
                                  ▲
                                  │
┌─────────────────────────────────────────────────────────────────────────────┐
│                           SHARED GUIDELINES & CONFIGURATION                 │
│  ┌──────────────────────────┐    ┌──────────────────────────────────────┐   │
│  │     SUBAGENTS.md         │    │    config/validation_criteria.md     │   │
│  │ • File creation standards│    │ • Quality thresholds & scoring       │   │
│  │ • Citation requirements  │    │ • Source authority hierarchy         │   │
│  │ • Markdown formatting    │    │ • Data freshness requirements        │   │
│  │ • Dual mode adaptation   │    │ • Success criteria definitions       │   │
│  └──────────────────────────┘    └──────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Orchestration Layer

- **[Main Agent (AGENTS.md)](AGENTS.md)** - Pipeline orchestrator with TodoWrite progress tracking and Task tool subagent management (**RECOMMENDED**)
  - Manages 7-phase execution flow with parallel optimization and dependency tracking
  - Handles validation feedback routing with configurable correction loops
  - Detects and transmits dual execution modes (concise/detailed + conservative/ambitious) to all subagents
  - Provides real-time progress updates and comprehensive pipeline monitoring
- **[Makefile](Makefile)** - Legacy batch execution via direct subagent calls for backward compatibility

### Sub-Agent Layer (Domain-Specific Execution)

- **Phase 0**: [source-project-analyst](.claude/agents/source-project-analyst.md) → `results/source/` (analyzes config/sources.md)
- **Phase 1A**: [industry-landscape-researcher](.claude/agents/industry-landscape-researcher.md) → `results/landscape/`
- **Phase 1B**: [market-research-specialist](.claude/agents/market-research-specialist.md) → `results/research/` (reads source + landscape)
- **Phase 2**: [product-market-fit-analyst](.claude/agents/product-market-fit-analyst.md) → `results/pmf/` (reads research)
- **Phase 3**: [gtm-strategy-developer](.claude/agents/gtm-strategy-developer.md) → `results/gtm/` (reads research + PMF)
- **Phase 4**: [contradiction-analyzer](.claude/agents/contradiction-analyzer.md) → `results/contradictions/` (reads all prior)
- **Phase 5**: [research-synthesizer](.claude/agents/research-synthesizer.md) → `results/synthesis/` (reads research + GTM + contradictions)
- **Phase 6**: [slide-deck-generator](.claude/agents/slide-deck-generator.md) → `results/slide_decks/` (reads synthesis)
- **Validation**: [results-validator](.claude/agents/results-validator.md) → `results/validation/[phase]_*.md` (validates any phase)

### Shared Guidelines & Configuration

- **[SUBAGENTS.md](SUBAGENTS.md)** - Common standards: file creation, citations, markdown formatting (referenced by all subagents)
- **[config/validation_criteria.md](config/validation_criteria.md)** - Quality thresholds, source hierarchy, validation standards (referenced by results-validator)

## TODO

- [x] **Product-Market Fit Analysis Integration**
  - [x] Create `.claude/agents/product-market-fit-analyst.md` - PMF validation specialist
  - [x] Integrate PMF analysis into workflow between research and GTM phases
  - [x] Update GTM strategy developer to leverage PMF findings
  - [x] Add PMF validation targets to Makefile
  - [x] Update documentation to reflect 6-phase pipeline
- [x] **Dual-Phase Research Structure**
  - [x] Separate industry landscape research from strategic market analysis
  - [x] Create `industry-landscape-researcher.md` for competitive intelligence and academic research
  - [x] Update `market-research-specialist.md` to focus on strategic investment analysis
  - [x] Implement clean directory separation: `results/landscape/` and `results/research/`
  - [x] Update validation, monitoring, and Makefile automation for new structure
- [x] **Validator Sub-Agent Implementation**
  - [x] Create `.claude/agents/results-validator.md` - Validation task definition with claim verification, consistency checks, completeness assessment, and quality scoring
  - [x] Add `config/validation_criteria.md` - Quality standards and validation checkpoints
  - [x] Implement feedback loop workflow: `research → validate → pmf → validate → gtm → validate → synthesis`
  - [x] Enhanced Makefile targets: with and without validation feedback loop
  - [x] Validation options: hard stops vs soft warnings vs auto-retry with feedback
  - [x] Cross-reference validation against source materials and phase consistency
- [x] **Slide deck and One Pager generator**
  - [x] Create `.claude/agents/slide-deck-generator.md` - Presentation materials specialist
  - [x] Condense research and GTM into investor-ready slide decks
  - [x] Provide deck templates by Sequoia, YC, a16z, etc.
  - [x] Save locally as Markdown
  - [ ] Use pageon.ai or similar services to generate slides using Markdown
- [x] **Progress Dashboard and Monitoring**
  - [x] Terminal-based live dashboard with visual progress indicators
  - [x] Claude Code hooks for automatic progress tracking on file writes
  - [x] JSON-based progress data for programmatic access
  - [ ] Desktop notifications for pipeline completion milestones
  - [ ] Real-time file size and completion percentage tracking
  - [ ] HTML dashboard generator for web-based monitoring
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
