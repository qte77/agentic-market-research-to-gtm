# Subagents

<!-- markdownlint-disable MD034 no-bare-urls -->
## AI Startup Market Research Sub-Agents - Common Guidelines

This document contains shared guidelines and patterns for all sub-agents in the AI startup market research pipeline.

## Pipeline Mode Adaptation

### ALL SUBAGENTS MUST ADAPT THEIR OUTPUT BASED ON THE DUAL MODES SPECIFIED IN THEIR INVOCATION PROMPT:

### Content Depth Modes

#### Concise Mode

**Target**: Executive-focused, essential insights only
**File Output**: Same number of files as detailed mode (5-6 files per phase)
**Content Depth**: 1-2 pages per file (500-1000 words)
**Focus**: Key findings, strategic recommendations, and actionable next steps only
**Audience**: C-level executives, investors, board presentations
**Execution**: Faster turnaround, streamlined analysis

#### Detailed Mode

**Target**: Research-grade thoroughness with complete context
**File Output**: 5-6 comprehensive files per phase (current standard)
**Content Depth**: 3-5 pages per file (1500-2500 words)
**Focus**: Complete analysis, supporting data, methodology, and comprehensive insights
**Audience**: Research teams, strategic planning, due diligence
**Execution**: Full depth analysis with extensive documentation

### Strategic Approach Modes

#### Conservative Mode

**Target**: Risk-aware, measured strategic recommendations
**Market Sizing**: Lower-end TAM/SOM/SAM estimates, realistic capture rates (0.1-1% TAM)
**Growth Strategy**: Conservative projections (2-5x annually), proven approaches
**Validation**: Require stronger proof points and established market evidence

#### Ambitious Mode

**Target**: High-growth, bold strategic recommendations
**Market Sizing**: Higher-end TAM/SOM/SAM estimates, optimistic capture rates (1-10% TAM)
**Growth Strategy**: Aggressive projections (5-20x annually), disruptive approaches
**Validation**: Accept early signals and emerging market opportunities

### Mode Implementation Requirements

1. **Check invocation prompt** for both mode specifications (depth: concise/detailed, strategy: conservative/ambitious)
2. **Adapt content depth** according to depth mode (file count remains 5-6 files per phase)
3. **Adapt strategic approach** according to strategy mode (research methodology and recommendations)
4. **Maintain quality standards** regardless of mode combination
5. **Log both mode usage** in pipeline execution summary
6. **Default modes**: Concise + Conservative if no modes specified

## Critical: File Creation Requirements

**YOU MUST CREATE ACTUAL FILES** - This is not a text generation task. You must use the Write tool to create each deliverable as a separate markdown file.

### Required Process

1. Use LS tool to verify target directory exists
2. If directory doesn't exist, create a placeholder file (e.g., `results/[directory]/.gitkeep`) to establish the directory
3. Use Write tool to create each required file with complete content  
4. Use LS tool after creation to verify files were written successfully

**Note**: Write tool creates directories automatically when writing files with full paths.

## Standard Framework Components

For each analysis area, provide:

- **Executive Summary** (Board-ready summary 1-2 pages maximum, Investor pitch narrative structure, FAQ addressing key concerns, 3-5 key points or strategic insights per item discussed, Clear priority hierarchy, Every insight linked to specific action, Evidence trail to source documents, Quantified metrics where available)
- **Detailed Findings** (comprehensive analysis or strategic framework)
- **Strategic Recommendations** (actionable next steps or implementation plan)
- **Success Metrics** (KPIs, measurement criteria, or data sources)

## Implementation Instructions Template

1. **START**: Use LS to check target directory exists
2. **READ INPUTS**: Use Read tool to analyze required source files
3. **FOR EACH FILE**: Use Write tool with full path `/results/[directory]/[filename]`
4. **VERIFY**: Use LS to confirm each file was created
5. **COMPLETE**: Ensure all required files exist before finishing

## Critical Warning

### FAILURE TO CREATE FILES = TASK FAILURE

Each sub-agent must produce actual markdown files in their designated results directory. Text-only responses without file creation constitute incomplete task execution.

## Mandatory Citation Requirements

### ALL CLAIMS MUST INCLUDE PROPER SOURCE DOCUMENTATION:

- **Web URLs**: Include full URLs for all online sources (e.g., https://techcrunch.com/2024/article-title)
- **Book Citations**: Include ISBN, author, title, publication year (e.g., "AI Strategy" by John Smith, ISBN: 978-1234567890, 2024)
- **Reports**: Include report title, organization, publication date, and URL/DOI if available
- **News Articles**: Include publication name, date, author, and full URL
- **Company Data**: Include source type (SEC filing, investor deck, website), date accessed, and URL
- **Academic Papers**: Include DOI, journal name, publication date, and authors

### Citation Format Examples:

- Market sizing: "AI market reached $100B in 2024 (Source: Gartner AI Market Report 2024, https://gartner.com/report-link)"
- Funding data: "Tea raised $5M Series A (Source: Crunchbase, accessed 2024-08-17, https://crunchbase.com/funding-round/...)"
- Competitive info: "Darktrace revenue $500M ARR (Source: Darktrace Annual Report 2024, SEC Filing 10-K, https://sec.gov/...)"

## Quality Standards

- Use clear, actionable language
- Include specific recommendations and next steps
- Provide quantitative metrics where possible
- Maintain professional executive-level tone
- Focus on strategic business value and implementation feasibility
- **MANDATORY**: Every factual claim must include proper source citation

## Markdown Formatting Requirements

**ALL OUTPUT FILES MUST BE VALID MARKDOWN** adhering to markdownlint rules:

- **Reference**: <https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md>
- **Validation**: Ensure all markdown files pass linting without errors
- **Key Requirements**:
  - Proper heading hierarchy (H1 → H2 → H3, no skipping levels)
  - Blank lines around headings, lists, and code blocks
  - Consistent list formatting (use `-` for unordered lists)
  - No bare URLs (use proper markdown links: `[text](url)`)
  - Single trailing newline at end of files
  - No emphasis as headings (use proper `#` heading syntax)
