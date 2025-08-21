# AI Startup Market Research - Claude Code Agents Orchestration

Execute the complete AI startup market research and go-to-market strategy development pipeline automatically by following these orchestration instructions.

## Expected Pipeline Output

- `results/research/` - Complete market research analysis
- `results/pmf/` - Product-market fit validation and optimization recommendations
- `results/validation/` - Quality assurance reports and validation metrics
- `results/gtm/` - Comprehensive go-to-market strategy
- `results/synthesis/` - Executive synthesis and strategic integration
- `results/slide_decks/` - Investor-ready presentation materials
- Full automation from technical analysis through PMF validation to actionable launch plans with executive summaries and pitch decks

## Validation Process

**Validated Phases**: All six phases require explicit validation with the **results-validator** subagent:

- **Phase 1** (Market Research): Validates research accuracy, source quality, and completeness
- **Phase 2** (PMF Analysis): Validates methodology, assumptions, and recommendations  
- **Phase 3** (GTM Strategy): Validates consistency with research/PMF findings and assumptions
- **Phase 4** (Research Synthesis): Validates cross-phase consistency and strategic integration
- **Phase 5** (Slide Decks): Validates accuracy, consistency with source materials, and presentation quality
- **Phase 6** (Pipeline Summary): Validates completeness, accuracy, and strategic coherence of final deliverables

**Default Validation Behavior**: Each phase MUST be followed by running the **results-validator** subagent with exactly 1 validation cycle (default). This process works as follows:

1. Complete the phase (e.g., market research using the appropriate subagent)
2. Run **results-validator** to check the outputs and generate validation report
3. If validation fails: Forward validation feedback to the phase subagent for corrections
4. After corrections, run **results-validator** again to re-validate the corrected outputs
5. Repeat steps 3-4 for the specified number of validation cycles (default 1)
6. After completing all validation cycles, proceed to next phase (do not forward feedback again)
7. The **results-validator** subagent saves all validation reports to `results/validation/`

**User Override Options**: Users can customize validation behavior by explicitly specifying:

- **No validation**: "Skip validation for [phase]" or "Run [phase] without validation"
- **Multiple cycles**: "Run validation with N cycles for [phase]" (where N = 0, 1, 2, 3, 4, etc.)
- **Global setting**: "Use N validation cycles for all phases" applies to all validated phases
- **Custom criteria**: "Apply validation with [specific stopping criteria]"

**Phase-to-Subagent Mapping**: When validation fails, feedback is forwarded to:

- **Phase 1**: market-research-specialist
- **Phase 2**: product-market-fit-analyst  
- **Phase 3**: gtm-strategy-developer
- **Phase 4**: research-synthesizer
- **Phase 5**: slide-deck-generator

Note: Phase 6 (Pipeline Execution Summary) is generated directly by the executing agent and does not require subagent mapping.

**Error Handling**: Each subagent contains internal error handling capabilities. If the **results-validator** subagent fails:

- Log the validation failure to `results/validation/validator_error.log`
- Continue to the next phase with a warning flag
- Generate a validation failure report documenting the error
- Mark the phase as "validation-incomplete" in the final pipeline summary

**Validation Failure Specification**: The **results-validator** determines failure based on:

- Factual inaccuracies or unsupported claims
- Methodological flaws or logical inconsistencies  
- Missing required deliverables or incomplete analysis
- Inconsistency with previous phase outputs
- Poor quality or unclear presentation of findings

## Execution Instructions for Claude

When this file is referenced with an execution command (e.g., 'execute the workflow in AGENTS.md', 'run the pipeline', or similar), automatically execute the following research phases in sequence. 

**Pipeline Initialization**: Capture start timestamp using `date` command and store for duration calculation.

Each phase must complete before the next begins. All phases require validation with the results-validator subagent after each phase completes. Before each validation, set environment variable: `export CURRENT_AGENT="results-validator"`

**PIPELINE TERMINATION**: 
- If Phase 1 (Market Research) returns STOP EXECUTION error, immediately halt the entire 6-phase pipeline and report the issue to the user.
- If Phase 3 (GTM Strategy) returns STOP EXECUTION error, halt the pipeline.
- If Phase 4 (Research Synthesis) returns STOP EXECUTION error, halt the pipeline.
- If Phase 2 (PMF Analysis) or Phase 5 (Slide Deck Generation) return STOP EXECUTION errors, mark the respective phase as FAILED but continue to the next phase. Document the failure in the final summary.
- Missing optional config files do not halt the pipeline.

### Phase 1: Market Research Analysis

Set environment variable: `export CURRENT_AGENT="market-research-specialist"`

Use the **market-research-specialist** subagent to analyze AI startup technical capabilities and strategic positioning against target investor priorities and successful portfolio patterns. This generates structured research data and competitive analysis.

### Phase 2: Product-Market Fit Analysis

Set environment variable: `export CURRENT_AGENT="product-market-fit-analyst"`

Use the **product-market-fit-analyst** subagent to validate problem-solution alignment and market readiness from the validated market research data. This analyzes customer pain points, solution effectiveness, market timing, and competitive positioning to determine PMF strength and identify optimization opportunities.

### Phase 3: Go-to-Market Strategy Development

Set environment variable: `export CURRENT_AGENT="gtm-strategy-developer"`

Use the **gtm-strategy-developer** subagent to create comprehensive go-to-market strategies from the validated market research data and PMF analysis. This produces customer segmentation, value propositions, sales channels, and launch plans optimized for confirmed product-market fit.

### Phase 4: Research Synthesis

Set environment variable: `export CURRENT_AGENT="research-synthesizer"`

Use the **research-synthesizer** subagent to generate executive summaries and strategic alignment reports from validated pipeline outputs. This creates concise strategic overviews with actionable next steps.

### Phase 5: Slide Deck Generation

Set environment variable: `export CURRENT_AGENT="slide-deck-generator"`

Use the **slide-deck-generator** subagent to transform the synthesized research and strategy documents into compelling, investor-ready presentations. This creates structured slide decks using appropriate templates (Sequoia Capital, YC, etc.) with visual storytelling and data-driven narratives. If a slide deck template was handed to you, forward it to the **slide-deck-generator** subagent.

### Phase 6: Pipeline Execution Summary

Set environment variable: `export CURRENT_AGENT="orchestrating-agent"`

The orchestrating agent generates `results/pipeline_execution_summary.md` containing:

- Pipeline start timestamp (captured using `date` command at execution beginning)
- Pipeline end timestamp (captured using `date` command at execution completion)
- Total execution duration (calculated from start/end timestamps)
- Complete pipeline status and deliverables overview
- Key strategic insights and alignment target analysis
- Implementation roadmap and next steps
- Success metrics and automation performance summary
