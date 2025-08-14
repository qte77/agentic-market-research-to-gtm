# AI Startup Market Research Pipeline
# Sequential execution with dependency management

.SILENT:
.ONESHELL:
.PHONY: all research gtm create_struct clean_struct setup_claude_code usage help
.DEFAULT_GOAL := usage

all: research gtm  ## Perfom full process

research:  ## Market Research Analysis (Phase 1)
	echo "Starting Market Research Analysis..."
	claude task --agent general-purpose --file .claude/agents/market_research.md
	echo "Market Research completed."

gtm:  ## Go-to-Market Strategy (Phase 2)
	echo "Starting Go-to-Market Strategy Development..."
	claude task --agent general-purpose --file .claude/agents/gtm_strategy.md
	echo "Go-to-Market Strategy completed."

create_struct:  ## Setup directory structure
	echo "Creating directory structure..."
	mkdir -p results/research results/gtm

clean_struct:  ## Clean directory structure
	echo "Cleaning generated outputs..."
	rm -rf results/research results/gtm

setup_claude_code:  ## Setup claude code CLI, node.js and npm have to be present
	echo "Setting up Claude Code CLI ..."
	npm install -gs @anthropic-ai/claude-code
	echo "Claude Code CLI version: $$(claude --version)"

usage:  ## Usage, how to use this Makefile
	echo "AI Startup Market Research Pipeline"
	echo ""
	echo "Available targets:"
	echo "  all           - Run complete pipeline (research + gtm)"
	echo "  research      - Run market research analysis only"
	echo "  gtm           - Run go-to-market strategy only"
	echo "  create_struct - Create directory structure"
	echo "  clean_struct  - Remove generated outputs"
	echo ""

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