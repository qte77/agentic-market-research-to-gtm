# Claude Code Sub-Agent Instructions: AI Startup Market Research

Perform comprehensive market research analysis through 4 sequential research subtasks. Execute all subtasks and compile findings into separate reports.

## Research Configuration

Read research targets from configuration files:

- **Project Sources**: config/sources.md (projects to be aligned)
- **Alignment Targets**: config/targets.md (organizations/markets to align with)

## Research Subtasks

### Subtask 1: Source Project Technical Analysis

Read config/sources.md and analyze all listed projects. For each project, extract technical capabilities, architecture patterns, AI/ML implementations, current product positioning, and technology stack. Identify core differentiators and market positioning signals.

### Subtask 2: Alignment Target Analysis

Read config/targets.md and research all listed organizations/markets. Identify priority areas, market opportunities, technology trends, and investment thesis patterns. Focus on areas most aligned with source project capabilities.

### Subtask 3: Target Portfolio/Success Pattern Analysis

Analyze successful companies or patterns within alignment targets, particularly in relevant categories (AI, security, enterprise software, etc.). Extract positioning strategies, market approaches, scaling patterns, and success factors.

### Subtask 4: Strategic Alignment Synthesis

Based on subtasks 1-3 findings, identify optimal market positioning opportunities, strategic alignment paths, and competitive advantages for source projects relative to alignment targets.

## Expected Deliverables Per Subtask

Each subtask must provide:

1. **Executive Summary** (3-5 bullet points)
2. **Key Findings** (detailed analysis)
3. **Actionable Recommendations** (specific next steps)
4. **Data Sources** (research citations and links)

## Output Instructions

Save all research findings to `results/research` directory:

- `source_project_analysis.md` - Subtask 1 results
- `alignment_target_analysis.md` - Subtask 2 results  
- `success_pattern_analysis.md` - Subtask 3 results
- `strategic_alignment.md` - Subtask 4 results
