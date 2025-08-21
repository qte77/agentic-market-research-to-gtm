# AI Startup Market Research - Claude Code Agents Orchestration

Execute the complete AI startup market research and go-to-market strategy development pipeline automatically by following these orchestration instructions.

## Expected Pipeline Output

- `results/research/` - Complete market research analysis
- `results/pmf_analysis/` - Product-market fit validation and optimization recommendations
- `results/validation/` - Quality assurance reports and validation metrics
- `results/gtm/` - Comprehensive go-to-market strategy
- `results/synthesis/` - Executive synthesis and strategic integration
- `results/slide_decks/` - Investor-ready presentation materials
- Full automation from technical analysis through PMF validation to actionable launch plans with executive summaries and pitch decks

## Automation Features

Makefile orchestration available with `make research`, `make pmf`, `make validate`, `make gtm`, `make synthesis`, `make slides` for batch execution. Use `make all-validated` for validation feedback loops or individual phase validation targets.

## Validation Strategy

**Validated Phases**: The following phases include validation with the **results-validator** subagent:

- **Phase 1** (Market Research): Validates research accuracy, source quality, and completeness
- **Phase 2** (PMF Analysis): Validates methodology, assumptions, and recommendations  
- **Phase 3** (GTM Strategy): Validates consistency with research/PMF findings and assumptions
- **Phase 4** (Research Synthesis): Validates cross-phase consistency and strategic integration
- **Phase 5** (Slide Decks): Validates accuracy, consistency with source materials, and presentation quality

**Default Behavior**: Each validated phase includes 1 correction loop. If validation fails, the **results-validator** feedback is forwarded to the respective phase subagent for targeted corrections, then re-validated once.

**Override Options**: Users can customize validation behavior by specifying in requirements or comments:

- **No validation**: "Skip validation for [phase]" or "Run [phase] without validation"
- **Multiple iterations**: "Run validation with N correction cycles for [phase]" (where N = 2, 3, 4, etc.)
- **Global setting**: "Use N validation loops" applies to all validated phases
- **Strict validation**: "Continue validation loops until [phase] passes" (unlimited iterations)
- **Custom criteria**: "Apply validation stopping on [specific criteria]"

**Validation Process**: For each validated phase, if validation fails, feedback is forwarded to:

- **Phase 1**: market-research-specialist
- **Phase 2**: product-market-fit-analyst  
- **Phase 3**: gtm-strategy-developer
- **Phase 4**: research-synthesizer
- **Phase 5**: slide-deck-generator

Validation loops continue until either validation passes, iteration limit is reached, or user-defined criteria are met.

## Execution Instructions for Claude

When this file is referenced, automatically execute following research phases in sequence:

### Phase 1: Market Research Analysis

Use the **market-research-specialist** subagent to analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns. This generates structured research data and competitive analysis.

### Phase 2: Product-Market Fit Analysis

Use the **product-market-fit-analyst** subagent to validate problem-solution alignment and market readiness from the validated market research data. This analyzes customer pain points, solution effectiveness, market timing, and competitive positioning to determine PMF strength and identify optimization opportunities.

### Phase 3: Go-to-Market Strategy Development

Use the **gtm-strategy-developer** subagent to create comprehensive go-to-market strategies from the validated market research data and PMF analysis. This produces customer segmentation, value propositions, sales channels, and launch plans optimized for confirmed product-market fit.

### Phase 4: Research Synthesis

Use the **research-synthesizer** subagent to generate executive summaries and strategic alignment reports from validated pipeline outputs. This creates concise strategic overviews with actionable next steps.

### Phase 5: Slide Deck Generation

Use the **slide-deck-generator** subagent to transform the synthesized research and strategy documents into compelling, investor-ready presentations. This creates structured slide decks using appropriate templates (Sequoia Capital, YC, etc.) with visual storytelling and data-driven narratives. If a slide deck template was handed to you, forward it to the **slide-deck-generator** subagent.

### Phase 6: Pipeline Execution Summary

After completing all five prior phases, automatically generate `results/pipeline_execution_summary.md` containing:

- Date, time and duration of pipeline run
- Complete pipeline status and deliverables overview
- Key strategic insights and alignment target analysis
- Implementation roadmap and next steps
- Success metrics and automation performance summary
