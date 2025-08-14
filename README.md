<!-- markdownlint-disable MD028 no-blanks-blockquote -->
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

### Execution Methods

**Automated Pipeline (Recommended)**:

```bash
# Reference orchestration file in Claude Code CLI
Please execute the market research pipeline as defined in @AGENTS.md
```

**Make-based Execution**:

```bash
make all       # Complete pipeline
make research  # Market research only
make gtm       # Go-to-market strategy only
```

**Manual Execution**:

```bash
claude task --agent general-purpose --file .claude/agents/market_research.md
claude task --agent general-purpose --file .claude/agents/gtm_strategy.md
```

### Method Comparison

- **Method 1**: Best for interactive analysis with adaptive execution and real-time insights
- **Method 2**: Ideal for reproducible builds and CI/CD integration with dependency management
- **Method 3**: Perfect for debugging, development, and step-by-step customization

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
├── targets.md          # Organizations/markets to align with
├── comments_research.md # Research constraints and focus areas
└── comments_gtm.md     # GTM strategy guidance
.claude/agents/          # Sub-agent instructions
results/research/        # Market research outputs
results/gtm/             # Go-to-market strategy
AGENTS.md               # Orchestration commands
```
