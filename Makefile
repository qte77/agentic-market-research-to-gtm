# AI Startup Market Research Pipeline
# RECOMMENDED: Use "claude" with AGENTS.md for orchestrated execution  
# Legacy: Direct subagent execution via this Makefile

.SILENT:
.ONESHELL:
.PHONY: help orchestrated all source landscape research pmf gtm contradictions synthesis slides create_struct clean_struct setup_claude_code dashboard_loop archive_current
.DEFAULT_GOAL := help

AGENTS_DIR := .claude/agents
CLAUDE_EXEC_CMD := Read and execute the workflow described in AGENTS.md
PHASES := source landscape research pmf gtm contradictions synthesis slides
RESULT_DIRS := $(addprefix results/,$(PHASES)) results/validation results/logs
DETAIL_MODE ?= concise
STRATEGY_MODE ?= conservative

# Phase mapping for POSIX compliance
source_agent := source-project-analyst
landscape_agent := industry-landscape-researcher
research_agent := market-research-specialist
pmf_agent := product-market-fit-analyst
gtm_agent := gtm-strategy-developer
contradictions_agent := contradiction-analyzer

synthesis_agent := research-synthesizer
slides_agent := slide-deck-generator


# MARK: Run modes


orchestrated:  ## RECOMMENDED: Execute orchestrated pipeline using AGENTS.md (DETAIL_MODE=concise|detailed, STRATEGY_MODE=conservative|ambitious, defaults: concise+conservative)
	echo "Executing orchestrated pipeline in $(DETAIL_MODE) $(STRATEGY_MODE) mode ..."
	claude -p "$(CLAUDE_EXEC_CMD) in $(DETAIL_MODE) $(STRATEGY_MODE) mode"

all: $(PHASES)  ## Execute all phases sequentially (CI/CD, DETAIL_MODE=concise|detailed, STRATEGY_MODE=conservative|ambitious, defaults: concise+conservative)
	echo "Executing all phases in $(DETAIL_MODE) $(STRATEGY_MODE) mode ..."

source landscape research pmf gtm contradictions synthesis slides:  ## Execute individual phase (CI/CD, DETAIL_MODE=concise|detailed, STRATEGY_MODE=conservative|ambitious, defaults: concise+conservative)
	echo "Starting $($@_agent) in $(DETAIL_MODE) $(STRATEGY_MODE) mode ..."
	cat $(AGENTS_DIR)/$($@_agent).md | claude -p "Execute in $(DETAIL_MODE) $(STRATEGY_MODE) mode"


# MARK: Utilities


archive_current:  ## Archive current results with timestamp and mode info
	echo "Archiving current pipeline results..."
	if [ -d "results" ] && [ "$$(find results -maxdepth 1 -type d -not -name 'results' -not -name 'archive' | wc -l)" -gt 0 ]; then \
		TIMESTAMP=$$(date '+%Y-%m-%d'); \
		SOURCE_NAME=$$(if [ -f "config/sources.md" ]; then head -1 config/sources.md | sed 's/# //g' | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]//g'; else echo "unknown"; fi); \
		DETAIL_MODE=$$(if [ -f "results/logs/mode_log.txt" ]; then tail -1 results/logs/mode_log.txt | grep -o 'detailed\|concise' || echo "$(DETAIL_MODE)"; else echo "$(DETAIL_MODE)"; fi); \
		STRATEGY_MODE="$(STRATEGY_MODE)"; \
		ARCHIVE_NAME="$$TIMESTAMP-$$SOURCE_NAME-$$DETAIL_MODE-$$STRATEGY_MODE"; \
		mkdir -p "results/archive/$$ARCHIVE_NAME"; \
		for dir in $(RESULT_DIRS); do \
			if [ -d "$$dir" ]; then \
				mv "$$dir" "results/archive/$$ARCHIVE_NAME/"; \
			fi; \
		done; \
		echo "Current results archived to results/archive/$$ARCHIVE_NAME"; \
	else \
		echo "No current pipeline results to archive"; \
	fi

create_struct:  ## Setup directory structure
	echo "Creating directory structure..."
	mkdir -p $(RESULT_DIRS)

clean_struct:  ## Clean directory structure  
	echo "Cleaning generated outputs..."
	rm -rf $(RESULT_DIRS)

setup_claude_code:  ## Setup Claude Code CLI
	echo "Setting up Claude Code CLI..."
	npm install -gs @anthropic-ai/claude-code
	echo "Claude Code CLI version: $$(claude --version)"

dashboard_loop:  ## Start live dashboard on sh
	watch -n 2 -t sh scripts/live_dashboard.sh


# MARK: help


help:  ## Show available targets
	echo "Usage: make [target]"
	echo "Targets:"
	awk '/^[a-zA-Z0-9_-]+:.*?##/ {
		helpMessage = match($$0, /## (.*)/)
		if (helpMessage) {
			recipe = $$1
			sub(/:/, "", recipe)
			printf "  \033[36m%-20s\033[0m %s\n", recipe, substr($$0, RSTART + 3, RLENGTH)
		}
	}' $(MAKEFILE_LIST)