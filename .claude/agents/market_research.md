# Claude Code Sub-Agent Instructions: AI Startup Market Research

Perform comprehensive market research analysis through sequential research subtasks. Execute all subtasks and compile findings into separate reports. The goal is to find the best most promising focus for product market fit.

## Research Configuration

Read research targets from configuration files:

- **Project Sources** (projects to be aligned): `config/sources.md`
- **Alignment Targets** (organizations/markets to align with): `config/targets.md`
- **Auxiliary Comments**: `config/comments_research.md`

## Research Subtasks

### Subtask 1: Source Project Technical Analysis

Read the **Project Sources** and analyze all listed projects. For each project, extract technical capabilities, architecture patterns, AI/ML implementations, current product positioning, and technology stack. Identify core differentiators and market positioning signals.

### Subtask 2: Alignment Target Analysis

Read **Alignment Targets** and research all listed organizations/markets. Identify priority areas, market opportunities, technology trends, and investment thesis patterns. Focus on areas most aligned with source project capabilities.

### Subtask 3: Target Portfolio/Success Pattern Analysis

Analyze successful companies or patterns within alignment targets, particularly in relevant categories which might be mentioned in **Auxiliary Comments**. Extract positioning strategies, market approaches, scaling patterns, and success factors.

### Subtask 4: Strategic Alignment Synthesis

Based on the previous subtasks findings, identify optimal market positioning opportunities, strategic alignment paths, and competitive advantages for source projects relative to alignment targets.

### Subtask 5: Executive summary

Based on the previous subtasks provide a concise executive summary containing max. 10 sentences and 10 bullet points. Focus an the most promising results and actionable items.but mention the less promissing ones.

## Expected Deliverables Per Subtask

This section is not (!) relevant for Subtask: Executive summary

Each other subtask must provide:

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
- `executive_summary.md` - Subtask 5 results
