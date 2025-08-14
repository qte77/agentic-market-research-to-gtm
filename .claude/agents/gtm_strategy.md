# Claude Code Sub-Agent Instructions: Go-to-Market Strategy

## Input Sources

Read and analyze all market research outputs from:

- `results/research/source_project_analysis.md`
- `results/research/alignment_target_analysis.md`
- `results/research/success_pattern_analysis.md`
- `results/research/strategic_alignment.md`

Read and analyze the auxiliary comments from:

- `config/comments_gtm.md`

## GTM Strategy Development Subtask

### Subtask 1: Customer Segmentation & ICP

**Prompt:** "Based on the market research findings, define Ideal Customer Profiles (ICP), customer segments, pain points, and buyer personas. Prioritize segments by market size, accessibility, and alignment with source project capabilities."

**Focus Areas**:

- Primary and secondary customer segments
- Detailed buyer personas with decision-making criteria
- Customer pain points and use cases
- Market size and revenue potential per segment

### Subtask 2: Value Proposition & Positioning

**Prompt:** "Develop compelling value propositions and market positioning statements for each customer segment. Create differentiated messaging that aligns with target investor criteria and market opportunities."

**Focus Areas**:

- Core value propositions per customer segment
- Competitive differentiation messaging
- Positioning against alternatives and status quo
- Key messaging framework and pitch narratives

### Subtask 3: Go-to-Market Channels & Strategy

**Prompt:** "Design comprehensive go-to-market strategy including customer acquisition channels, sales processes, partnership opportunities, and pricing models. Optimize for rapid growth and target investor scalability requirements."

**Focus Areas**:

- Customer acquisition channel strategy
- Sales process and cycle optimization
- Strategic partnership opportunities
- Pricing and revenue model recommendations

### Subtask 4: Launch Plan & Metrics

**Prompt**: "Create detailed launch plan with timeline, milestones, resource requirements, and success metrics. Include specific KPIs for customer acquisition, revenue growth, and market penetration."

**Focus Areas**:

- 90-day and 12-month launch roadmap
- Resource and budget requirements
- Key performance indicators and success metrics
- Risk mitigation and contingency planning

### Subtask 5: Executive summary

Based on the previous subtasks provide a concise executive summary containing max. 10 sentences and max. 10 bullet points. Focus an the most promising results and actionable items.but mention the less promissing ones.

## Expected Deliverables Per Subtask

This section is not (!) relevant for Subtask: Executive summary

Each other subtask must provide:

1. **Executive Summary** (3-5 bullet points)
2. **Strategic Framework** (methodology and approach)
3. **Detailed Recommendations** (specific actionable strategies)
4. **Implementation Timeline** (phases and milestones)
5. **Success Metrics** (KPIs and measurement criteria)

## Output Instructions

Save all GTM strategy components to `results/gtm/` directory:

- `customer_segmentation.md` - Subtask 1 results
- `value_proposition.md` - Subtask 2 results
- `channels.md` - Subtask 3 results
- `launch_plan.md` - Subtask 4 results
- `executive_summary.md` - Subtask 5 results
