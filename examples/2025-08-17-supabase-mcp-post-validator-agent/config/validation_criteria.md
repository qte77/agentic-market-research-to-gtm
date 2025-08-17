# Validation Criteria and Quality Standards

## Source Quality Hierarchy

### Tier 1: Authoritative Sources (High Confidence)

- Official company websites and documentation
- SEC filings and investor reports
- Government databases (USPTO, SEC)
- Academic research papers (peer-reviewed)
- Industry reports from established analysts (Gartner, IDC, McKinsey)

### Tier 2: Industry Sources (Medium Confidence)

- Technology news sites (TechCrunch, VentureBeat)
- Industry publications (Forbes, Harvard Business Review)
- Conference presentations and whitepapers
- Analyst reports from boutique firms

### Tier 3: Secondary Sources (Low Confidence)

- Blog posts and opinion pieces
- Social media posts
- Unverified news aggregators
- Wikipedia (requires cross-verification)

## Data Freshness Requirements

- **Market sizing data**: Maximum 12 months old
- **Funding information**: Maximum 6 months old
- **Competitive analysis**: Maximum 18 months old
- **Technical documentation**: Maximum 24 months old

## Critical Claims Requiring 100% Verification

1. Market sizing figures (TAM, SAM, SOM)
2. Funding amounts and valuations
3. Competitive positioning claims
4. Financial projections and benchmarks
5. Customer segment sizing
6. Regulatory or compliance requirements

## Quality Scoring Methodology

### Overall Quality Grades

- **A Grade**: >90% of claims verified with Tier 1/2 sources
- **B Grade**: 70-89% of claims verified with Tier 1/2 sources
- **C Grade**: 50-69% of claims verified with Tier 1/2 sources
- **F Grade**: <50% of claims verified with Tier 1/2 sources

### Confidence Ratings

- **High**: Multiple Tier 1 sources or recent official data
- **Medium**: Single Tier 1 source or multiple Tier 2 sources
- **Low**: Tier 3 sources only or outdated information

## Mandatory Citation Standards

**ZERO TOLERANCE for unsourced claims** - All factual assertions must include proper citations:

- **Web Sources**: Full URL, publication date, author (if available), access date
- **Books**: ISBN-13, author(s), title, publisher, publication year
- **Reports**: Organization, report title, publication date, URL/DOI, page numbers
- **News Articles**: Publication name, headline, author, date, full URL
- **SEC Filings**: Filing type (10-K, 10-Q, 8-K), company name, filing date, SEC URL
- **Academic Papers**: DOI, journal name, volume/issue, authors, publication date
- **Company Websites**: Specific page URL, content description, access date

**Citation Validation Checks:**

- Verify all URLs are accessible and content matches claims
- Confirm ISBN numbers are valid and match cited books
- Check DOIs resolve to correct academic papers
- Validate SEC filing numbers and dates
- Cross-reference quotes and statistics with original sources
- Flag any paraphrasing that misrepresents source material

## Validation Checkpoints

### Research Phase Validation

- [ ] All market sizing claims have authoritative sources with full citations
- [ ] Competitive analysis includes official company data with URLs/ISBNs
- [ ] Technical assessments reference actual documentation with DOIs/URLs
- [ ] Investment data verified through multiple sources with proper citations

### GTM Phase Validation

- [ ] Customer segments align with research findings with cited sources
- [ ] Pricing models reflect market benchmarks with competitor data citations
- [ ] Channel strategies match customer characteristics with supporting evidence
- [ ] Financial projections supported by market data with full source documentation

### Cross-Phase Consistency

- [ ] No contradictions in market sizing
- [ ] Customer segments consistent across phases
- [ ] Competitive positioning aligns with differentiation
- [ ] Value propositions address identified pain points

## Validation Failure Thresholds

### Hard Stop Triggers

- Critical claim verification <50%
- Major contradictions between phases
- Missing sources for market sizing
- Outdated data for key assumptions
- **ANY factual claim without proper citation (URL, ISBN, DOI, etc.)**
- Broken or inaccessible source links for critical claims

### Warning Triggers

- Overall quality score below B grade
- >20% of claims lack verification
- Source quality predominantly Tier 3
- Data freshness exceeds requirements

## Auto-Retry Criteria

Agents should be re-run with feedback when:

- Specific claims lack proper sources
- Contradictions identified with clear resolution path
- Data freshness issues can be addressed
- Quality score between C-B grades (improvable)
