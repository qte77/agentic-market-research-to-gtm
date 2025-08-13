# AI Startup Market Research Pipeline
# Sequential execution with dependency management

.SILENT:
.ONESHELL:
.PHONY: all research gtm clean setup usage help
.DEFAULT_GOAL := usage

all: research gtm  ## Run the whole process

research:  ## Market Research Analysis (Phase 1)
	echo "Starting Market Research Analysis..."
	claude task --agent general-purpose --file .claude/agents/market_research.md
	echo "Market Research completed. Output in results/research/"

gtm: research  ## Go-to-Market Strategy (Phase 2)
	echo "Starting Go-to-Market Strategy Development..."
	claude task --agent general-purpose --file .claude/agents/gtm_strategy.md
	echo "Go-to-Market Strategy completed. Output in results/gtm/"

clean:  ## Clean generated outputs
	echo "Cleaning generated outputs..."
	rm -rf results/research results/gtm
	echo "Cleanup completed."

setup:  ## Setup directories
	echo "Creating directory structure..."
	mkdir -p results/research results/gtm
	echo "Directory structure created."

usage:  ## Usage, how to use this Makefile
	echo "AI Startup Market Research Pipeline"
	echo ""
	echo "Available targets:"
	echo "  all      - Run complete pipeline (research + gtm)"
	echo "  research - Run market research analysis only"
	echo "  gtm      - Run go-to-market strategy (requires research)"
	echo "  setup    - Create directory structure"
	echo "  clean    - Remove generated outputs"
	echo "  help     - Show this help message"
	echo ""
	echo "Usage examples:"
	echo "  make all     # Run complete automated pipeline"
	echo "  make research # Run only market research phase"
	echo "  make clean   # Clean all outputs"

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