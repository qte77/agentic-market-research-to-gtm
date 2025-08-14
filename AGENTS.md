# Automated Market Research & Go-to-Market Strategy

Execute the complete AI startup market research and go-to-market strategy development pipeline automatically by following these orchestration instructions.

## Execution Instructions for Claude

When this file is referenced, automatically execute both research phases in sequence:

### Phase 1: Market Research Analysis

Use the Task tool with subagent_type="general-purpose" and read the instructions from `.claude/agents/market_research.md`. Execute all 4 research subtasks and generate reports in `results/research/`.

### Phase 2: Go-to-Market Strategy Development

After completing Phase 1, use the Task tool with subagent_type="general-purpose" and read the instructions from `.claude/agents/gtm_strategy.md`. Execute all 4 GTM tasks using the market research outputs and generate strategy documents in `results/gtm/`.

## Expected Pipeline Output

- `results/research/` - Complete market research analysis
- `results/gtm/` - Comprehensive go-to-market strategy
- Full automation from technical analysis to actionable launch plans

## Automation Features

The pipeline includes automated hooks for enhanced workflow:

- **Directory Setup**: Auto-creates required folders before execution
- **Progress Tracking**: Real-time notifications for each phase
- **File Monitoring**: Confirms each report generation
- **Completion Summary**: Final directory tree of all outputs

### Phase 3: Pipeline Summary Generation

After completing both research and GTM phases, automatically generate execution summary in `results/pipeline_execution_summary.md` containing:

- Date, time and duration of pipeline run
- Complete pipeline status and deliverables overview
- Key strategic insights and alignment target analysis
- Implementation roadmap and next steps
- Success metrics and automation performance summary
