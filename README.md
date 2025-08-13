# AI Startup Market Research Framework

Stop Guessing. Start Dominating. - Automated market intelligence for AI startups that refuse to fail. Research and go-to-market strategy development framework for aligning AI startups with investor and market opportunities.

## Purpose

Analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns to identify optimal market opportunities and develop actionable go-to-market strategies.

## Usage

### Configuration Setup

Before running the pipeline, configure your research targets:

1. **Edit `config/sources.md`** - Add projects/companies to be analyzed and aligned
2. **Edit `config/targets.md`** - Add organizations/markets to align with

### Execution Methods

### Method 1: Automated Pipeline (Recommended)

Reference the orchestration file inside Claude Code CLI to trigger automatic execution:

```bash
Please execute the market research pipeline as defined in @AGENTS.md
```

This automatically runs both sub-agents in sequence with full automation.

### Method 2: Make-based Execution

Execute the complete pipeline with automatic sequencing:

```bash
make all       # Run complete pipeline (research → gtm)
make research  # Run only market research phase
make gtm       # Run only go-to-market (requires research)
make clean     # Clean all outputs
```

### Method 3: Manual Sub-Agent Execution

Execute individual research phases through Claude Code sub-agents:

```bash
# 1. Market Research Analysis
claude task --agent general-purpose --file .claude/agents/market_research.md

# 2. Go-to-Market Strategy Development  
claude task --agent general-purpose --file .claude/agents/gtm_strategy.md
```

### Method Comparison

- **Method 1**: Best for interactive analysis with adaptive execution and real-time insights
- **Method 2**: Ideal for reproducible builds and CI/CD integration with dependency management
- **Method 3**: Perfect for debugging, development, and step-by-step customization

### Configuration Examples

**Adding New Source Project** (`config/sources.md`):

```markdown
## Additional Projects
- **NewCo AI**: https://github.com/newco-ai
  - Description of project and focus areas
```

**Adding New Alignment Target** (`config/targets.md`):

```markdown
## Additional Targets
- **Accelerator Program**: https://accelerator.com
  - Program requirements and portfolio analysis
```

## Automated Features

- Auto-creates directory structure via hooks
- Real-time progress tracking and notifications
- Completion summaries with file listings

See `AGENTS.md` for detailed orchestration instructions.

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

## Project Structure

```bash
config/                  # Configuration files
├── sources.md          # Projects to be aligned
└── targets.md          # Organizations/markets to align with
.claude/agents/          # Sub-agent instructions
results/research/        # Market research outputs
results/gtm/             # Go-to-market strategy
AGENTS.md               # Orchestration commands
```
