# AI Startup Market Research - Claude Code Agents Orchestration

Execute the complete AI startup market research and go-to-market strategy development pipeline automatically by following these orchestration instructions.

## Expected Pipeline Output

- `results/source/` - Source project technical analysis and capability assessment
- `results/landscape/` - Industry landscape and competitive intelligence
- `results/research/` - Strategic market research analysis
- `results/pmf/` - Product-market fit validation and optimization recommendations
- `results/validation/` - Quality assurance reports and validation metrics
- `results/gtm/` - Comprehensive go-to-market strategy
- `results/contradictions/` - Contradiction analysis and objection handling
- `results/synthesis/` - Executive synthesis and strategic integration
- `results/slide_decks/` - Investor-ready presentation materials
- `results/logs/` - Pipeline execution logs and mode tracking
- Full automation from technical analysis through PMF validation to actionable launch plans with executive summaries and pitch decks

## Orchestration Overview

This file defines the orchestrated execution workflow using TodoWrite progress tracking and Task tool subagent management.

## Validation Strategy

**Validated Phases**: The following phases include validation with the **results-validator** subagent:

- **Phase 0** (Source Project Analysis): Validates technical analysis accuracy and completeness
- **Phase 1A** (Industry Landscape): Validates competitive analysis accuracy, source quality, and completeness
- **Phase 1B** (Market Research): Validates research accuracy, strategic alignment, and investment readiness
- **Phase 2** (PMF Analysis): Validates methodology, assumptions, and recommendations  
- **Phase 3** (GTM Strategy): Validates consistency with research/PMF findings and assumptions
- **Phase 4** (Contradiction Analysis): Validates contradiction resolution and objection handling completeness
- **Phase 5** (Research Synthesis): Validates cross-phase consistency and strategic integration
- **Phase 6** (Slide Decks): Validates accuracy, consistency with source materials, and presentation quality

**Default Behavior**: Each validated phase includes 1 correction loop (n=1). If validation fails, the **results-validator** feedback is forwarded to the respective phase subagent for targeted corrections, then re-validated once.

**Override Options**: Users can specify validation loops (n=1 to N). Examples: "Skip validation for [phase]", "Use N validation loops", "Continue validation loops until [phase] passes".

**Validation Process**: Execute validation TodoWrite task (created in step 1 of Universal Pattern), launch Task tool with `subagent_type: "results-validator"` specifying phase name. Read validation feedback from `results/validation/[phase]_feedback_summary.md`. If validation fails, create correction TodoWrite task and re-launch respective phase subagent with specific corrections from feedback. Mark validation TodoWrite task complete only when criteria pass.

## Parallel Execution Framework

**Core Principle**: All parallel operations use single messages with multiple Task tool calls.

**TodoWrite Rules**: Phase 0 + Phase 1A can both be "in_progress" simultaneously. Validation tasks can be "in_progress" simultaneously during corrections. Sequential phases: exactly ONE execution task "in_progress" at a time.

**Validation Protocol**: Launch validations simultaneously for completed parallel phases. Phase 1B waits for BOTH Phase 0 AND 1A validation success. For parallel corrections: launch all failed phase corrections in single message, then re-validate all simultaneously.

**Prompt Discipline**: Only provide: execution modes, reference to subagent's .md configuration, input file paths. DO NOT summarize feedback content - let subagents read feedback files directly.

## Pipeline Execution Modes

**Dual Mode Detection**: Main agent must detect content depth (concise/detailed) and strategic approach (conservative/ambitious) from user prompt.

| Mode Type | Possible Keywords |
|-----------|----------|
| **Concise** | "concise", "summary", "brief", "executive" |
| **Detailed** | "detailed", "comprehensive", "thorough", "full" |
| **Conservative** | "conservative", "safe", "measured", "realistic", "proven" |
| **Ambitious** | "ambitious", "aggressive", "bold", "optimistic", "disruptive" |

**Defaults**: concise + conservative. Pass both modes to subagents as `execution_mode` and `strategy_mode` parameters.

## Execution Protocol

**Universal Pattern** (applies to all phases - parallel and sequential):

1. Create TodoWrite tasks for the phase (include validation task if phase requires validation)
2. Launch Task tool with `subagent_type`, `description` (3-5 words), and standardized prompt containing only:
   - Execution modes (concise/detailed, conservative/ambitious)
   - Reference to follow subagent's own .md configuration
   - Input file paths from previous phases (if applicable)
3. Mark phase execution TodoWrite task completed after phase completion
4. For validated phases: Execute validation TodoWrite task per validation protocol
5. Mark validation TodoWrite task completed only when validation criteria pass
6. Update and display pipeline progress status

**Standardized Prompt Pattern**: All Task tool prompts should follow this format:

```sh
Execute [phase name] analysis in [execution_mode] mode with [strategy_mode] approach. Follow your .claude/agents/[subagent].md configuration and SUBAGENTS.md guidelines. [Include input file paths if applicable.]
```

**TodoWrite Management**: Reference Parallel Execution Framework above for in_progress state rules.

**Note**: For parallel execution (Phase 0 + Phase 1A), use single message with multiple Task tool calls.

## Dependencies

| Phase | Dependencies |
|-------|-------------|
| Phase 0 | None |
| Phase 1A | None (parallel with 0) |
| Phase 1B | 0+1A |
| Phase 2 | 1B |
| Phase 3 | 1B+2 |
| Phase 4 | All prior |
| Phase 5 | 1B+3+4 |
| Phase 6 | 5 |
| Phase 7 | All prior (no validation required) |

## Execution Instructions for Claude

When this file is referenced:

1. **Display Execution Plan**: Output complete pipeline plan with phase dependencies and progress tracking
2. **Execute Phases**: Use TodoWrite to track progress and Task tool to execute research phases with parallel optimization where possible
3. **Update Progress**: After each phase completion, update and display progress status with completed/remaining phases

### Phase 0 + Phase 1A: Parallel Independent Analysis

**PARALLEL EXECUTION PROTOCOL:**

- **Single message** = Multiple Task tool calls
- Both **Phase 0 AND Phase 1A** must be launched together  
- **NO sequential execution** allowed for these phases

**EXECUTE BOTH PHASES SIMULTANEOUSLY IN A SINGLE MESSAGE WITH MULTIPLE TASK TOOL CALLS:**

- **Phase 0**: Task tool with `subagent_type: "source-project-analyst"`. Let subagent follow its `.claude/agents/source-project-analyst.md` configuration and `SUBAGENTS.md` guidelines.
- **Phase 1A**: Task tool with `subagent_type: "industry-landscape-researcher"`. Let subagent follow its `.claude/agents/industry-landscape-researcher.md` configuration and `SUBAGENTS.md` guidelines.

**IMPLEMENTATION REQUIREMENT:** Use a single message containing TWO Task tool invocations to launch both subagents concurrently. Do NOT launch them sequentially.

**Prompt Pattern**: Follow the Standardized Prompt Pattern defined in the Execution Protocol section above.

Both phases have no dependencies and MUST run concurrently for optimal performance.

**VALIDATION:** Both Phase 0 and Phase 1A require validation per the Parallel Execution Framework above. Phase 1B cannot begin until both validations complete successfully.

### Sequential Phases 1B-6

**Phase 1B**: `"market-research-specialist"` → Include `results/source/` and `results/landscape/`  
**Phase 2**: `"product-market-fit-analyst"` → Include `results/research/`  
**Phase 3**: `"gtm-strategy-developer"` → Include `results/research/` and `results/pmf/`  
**Phase 4**: `"contradiction-analyzer"` → Include all prior phase outputs  
**Phase 5**: `"research-synthesizer"` → Include `results/research/`, `results/gtm/`, `results/contradictions/`  
**Phase 6**: `"slide-deck-generator"` → Include `results/synthesis/`

All phases follow the Execution Protocol above. Let each subagent follow its `.claude/agents/[name].md` configuration.

### Phase 7: Pipeline Execution Summary

After completing all seven prior phases, orchestrator agent automatically generates `results/pipeline_execution_summary.md` containing:

- Date, time and duration of pipeline run
- Complete pipeline status and deliverables overview
- Key strategic insights and alignment target analysis
- Implementation roadmap and next steps
- Success metrics and automation performance summary
