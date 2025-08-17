# AI Startup Market Research - Claude Code Agents Orchestration

Execute the complete AI startup market research and go-to-market strategy development pipeline automatically by following these orchestration instructions.

## Execution Instructions for Claude

When this file is referenced, automatically execute following research phases in sequence:

### Phase 1: Market Research Analysis

Use the **market-research-specialist** subagent to analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns. This generates structured research data and competitive analysis.

**Phase 1 Validation**: Use the **results-validator** subagent to verify research accuracy, source quality, and completeness before proceeding to GTM phase.

**Validation Failure Response**: If validation fails, forward the **results-validator** feedback content directly to **market-research-specialist** for targeted corrections.

### Phase 2: Go-to-Market Strategy Development

Use the **gtm-strategy-developer** subagent to create comprehensive go-to-market strategies from the validated market research data. This produces customer segmentation, value propositions, sales channels, and launch plans.

**Phase 2 Validation**: Use the **results-validator** subagent to verify GTM strategy consistency with research findings and validate assumptions before synthesis.

**Validation Failure Response**: If validation fails, forward the **results-validator** feedback content directly to **gtm-strategy-developer** for targeted corrections.

### Phase 3: Research Synthesis

Use the **research-synthesizer** subagent to generate executive summaries and strategic alignment reports from validated pipeline outputs. This creates concise strategic overviews with actionable next steps.

## Expected Pipeline Output

- `results/research/` - Complete market research analysis
- `results/validation/` - Quality assurance reports and validation metrics
- `results/gtm/` - Comprehensive go-to-market strategy
- Executive synthesis documents within research and GTM directories
- Full automation from technical analysis to actionable launch plans with executive summaries

## Automation Features

Makefile orchestration available with `make research`, `make validate`, `make gtm`, `make synthesis` for batch execution with validation feedback loops.

### Phase 4: Pipeline Execution Summary

After completing all three prior phases, automatically generate `results/pipeline_execution_summary.md` containing:

- Date, time and duration of pipeline run
- Complete pipeline status and deliverables overview
- Key strategic insights and alignment target analysis
- Implementation roadmap and next steps
- Success metrics and automation performance summary
