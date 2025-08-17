# AI Startup Market Research Pipeline
# Sequential execution with dependency management

.SILENT:
.ONESHELL:
.PHONY: all all-validated research gtm synthesis validate validate-research validate-gtm validate-research-loop validate-gtm-loop archive_current create_struct clean_struct setup_claude_code help
.DEFAULT_GOAL := help

AGENTS_DIR := .claude/agents
RESULT_DIRS := results/research results/synthesis results/gtm results/validation results/logs


# MARK: Pipeline


all: research gtm synthesis  ## Perform full 3-phase process (without validation)
all-validated: research validate-research-loop gtm validate-gtm-loop synthesis  ## Perform full process with validation feedback loops

research:  ## Market Research Analysis (Phase 1)
	echo "Starting Market Research Analysis..."
	cat $(AGENTS_DIR)/market_research.md | claude -p "execute"
	echo "Market Research completed."

gtm:  ## Go-to-Market Strategy (Phase 2)
	echo "Starting Go-to-Market Strategy Development..."
	cat $(AGENTS_DIR)/gtm_strategy.md | claude -p "execute"
	echo "Go-to-Market Strategy completed."

synthesis:  ## Research Synthesis (Phase 3)
	echo "Starting Research Synthesis..."
	cat $(AGENTS_DIR)/research_synthesizer.md | claude -p "execute"
	echo "Research Synthesis completed."

validate:  ## Validate all pipeline outputs
	echo "Starting Pipeline Validation..."
	cat $(AGENTS_DIR)/results-validator.md | claude -p "execute"
	echo "Pipeline Validation completed."

validate-research:  ## Validate research phase only
	echo "Validating Market Research outputs..."
	cat $(AGENTS_DIR)/results-validator.md | claude -p \
		"Validate only the research phase outputs in results/research/"
	echo "Research validation completed."

validate-research-loop:  ## Validate research with correction loop
	echo "Validating Market Research with feedback loop..."
	cat $(AGENTS_DIR)/results-validator.md | claude -p \
		"Validate research phase outputs in results/research/. "\
		"Append results to phase-specific files with iteration markers. "\
		"If validation fails, forward current iteration feedback content only to market-research-specialist."
	echo "Research validation loop completed."

validate-gtm:  ## Validate GTM phase only  
	echo "Validating GTM Strategy outputs..."
	cat $(AGENTS_DIR)/results-validator.md | claude -p \
		"Validate GTM phase outputs in results/gtm/ and "\
		"check consistency with results/research/"
	echo "GTM validation completed."

validate-gtm-loop:  ## Validate GTM with correction loop
	echo "Validating GTM Strategy with feedback loop..."
	cat $(AGENTS_DIR)/results-validator.md | claude -p \
		"Validate GTM phase outputs in results/gtm/ and consistency with results/research/. "\
		"Append results to phase-specific files with iteration markers. "\
		"If validation fails, forward current iteration feedback content only to gtm-strategy-developer."
	echo "GTM validation loop completed."


# MARK: Setup folders


archive_current:  ## Archive current project to results/archive/
	if ls $(RESULT_DIRS) results/pipeline_execution_summary.md >/dev/null 2>&1; then \
		ARCHIVE_DIR="results/archive/$(date +%Y-%m-%d-%H%M%S)"; \
		mkdir -p "$${ARCHIVE_DIR}"; \
		mv $(RESULT_DIRS) results/pipeline_execution_summary.md "$${ARCHIVE_DIR}/" 2>/dev/null || true; \
		echo "Archived to $${ARCHIVE_DIR}"; \
	else \
		echo "No current project to archive"; \
	fi

create_struct:  ## Setup directory structure
	echo "Creating directory structure..."
	mkdir -p $(RESULT_DIRS)

clean_struct:  ## Clean directory structure
	echo "Cleaning generated outputs..."
	rm -rf $(RESULT_DIRS)


# MARK: Claude Code


setup_claude_code:  ## Setup claude code CLI, node.js and npm have to be present
	echo "Setting up Claude Code CLI ..."
	npm install -gs @anthropic-ai/claude-code
	echo "Claude Code CLI version: $$(claude --version)"


# MARK: Help


help:  ## Displays this message with available recipes
	# TODO add stackoverflow source
	echo "Usage: make [recipe]"
	echo "Recipes:"
	awk '/^[a-zA-Z0-9_-]+:.*?##/ {
		helpMessage = match($$0, /## (.*)/)
		if (helpMessage) {
			recipe = $$1
			sub(/:/, "", recipe)
			printf "  \033[36m%-20s\033[0m %s\n", recipe, substr($$0, RSTART + 3, RLENGTH)
		}
	}' $(MAKEFILE_LIST)