<!-- markdownlint-disable MD034 no-bare-urls -->
# AI Startup Market Research Sub-Agents - Common Guidelines

This document contains shared guidelines and patterns for all sub-agents in the AI startup market research pipeline.

## Critical: File Creation Requirements

**YOU MUST CREATE ACTUAL FILES** - This is not a text generation task. You must use the Write tool to create each deliverable as a separate markdown file.

### Required Process

1. Use LS tool to verify target directory exists (create with Write if needed)
2. Use Write tool to create each required file with complete content
3. Use LS tool after creation to verify files were written successfully

## Standard Framework Components

For each analysis area, provide:

- **Executive Summary** (Board-ready summary under 500 words with the following requirements):
  - One-page to maximum three-page visual executive brief
  - Investor pitch narrative structure
  - FAQ addressing key concerns
  - 3-5 key points or strategic insights per item discussed
  - Clear priority hierarchy
  - Every insight linked to specific action
  - Evidence trail to source documents
  - Quantified metrics where available
- **Detailed Findings** (comprehensive analysis or strategic framework)
- **Strategic Recommendations** (actionable next steps or implementation plan)
- **Success Metrics** (KPIs, measurement criteria, or data sources)

## Implementation Instructions Template

1. **START**: Use LS to check target directory exists (directories are created by pipeline hooks)
2. **READ INPUTS**: Use Read tool to analyze required source files
3. **FETCH SOURCES**: All subagents must fetch URLs when provided in task prompts:
   - Use WebFetch to retrieve content from each URL
   - Document the URL, date accessed, and key findings
   - Include these URLs as citations in your output files
4. **FOR EACH FILE**: Use Write tool with full path `/results/[directory]/[filename]`
5. **VERIFY**: Use LS to confirm each file was created
6. **COMPLETE**: Ensure all required files exist before finishing

## Critical Warning

**FAILURE TO CREATE FILES = TASK FAILURE**  

Each sub-agent must produce actual markdown files in their designated results directory. Text-only responses without file creation constitute incomplete task execution.

## Mandatory Citation Requirements

**CRITICAL - VALIDATION WILL FAIL WITHOUT PROPER CITATIONS**

**ALL CLAIMS MUST INCLUDE PROPER SOURCE DOCUMENTATION:**

**This means:** Every factual statement, market size, funding amount, company metric, or competitive claim MUST have an inline citation immediately following it. No exceptions.

- **Web URLs**: Include full URLs for all online sources (e.g., https://techcrunch.com/2024/article-title)
- **Book Citations**: Include ISBN, author, title, publication year (e.g., "AI Strategy" by John Smith, ISBN: 978-1234567890, 2024)
- **Reports**: Include report title, organization, publication date, and URL/DOI if available
- **News Articles**: Include publication name, date, author, and full URL
- **Company Data**: Include source type (SEC filing, investor deck, website), date accessed, and URL
- **Academic Papers**: Include DOI, journal name, publication date, and authors

**Citation Format Examples:**

- Market sizing: "AI market reached $100B in 2024 (Source: Gartner AI Market Report 2024, https://gartner.com/report-link)"
- Funding data: "Tea raised $5M Series A (Source: Crunchbase, accessed 2024-08-17, https://crunchbase.com/funding-round/...)"
- Competitive info: "Darktrace revenue $500M ARR (Source: Darktrace Annual Report 2024, SEC Filing 10-K, https://sec.gov/...)"

## Quality Standards

- Use clear, actionable language
- Include specific recommendations and next steps
- Provide quantitative metrics where possible
- Maintain professional executive-level tone
- Focus on strategic business value and implementation feasibility

## Markdown Formatting Requirements

**ALL OUTPUT FILES MUST BE VALID MARKDOWN** adhering to markdownlint rules:

- **Reference**: [markdownlint rules documentation](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)
- **Validation**: Ensure all markdown files pass linting without errors
- **Key Requirements**:
  - Proper heading hierarchy (H1 → H2 → H3, no skipping levels)
  - Blank lines around headings, lists, and code blocks
  - Consistent list formatting (use `-` for unordered lists)
  - No bare URLs (use proper markdown links: `[text](url)`)
  - Single trailing newline at end of files
  - No emphasis as headings (use proper `#` heading syntax)
