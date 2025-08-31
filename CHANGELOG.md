<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Guiding Principles

- Changelogs are for humans, not machines.
- There should be an entry for every single version.
- The same types of changes should be grouped.
- Versions and sections should be linkable.
- The latest version comes first.
- The release date of each version is displayed.
- Mention whether you follow Semantic Versioning.

## Types of changes

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Removed` for now removed features.
- `Fixed` for any bug fixes.
- `Security` in case of vulnerabilities.

## [Unreleased]

## [2.0.0] - 2025-08-31

### Added

- Parallel execution framework for Phase 0 (source analysis) and Phase 1A (industry landscape)
- Enhanced validation protocol with configurable correction loops (n=1 to N)
- Pipeline execution mode detection (concise/detailed + conservative/ambitious)
- Three new specialized agents:
  - Source project analyst for technical architecture assessment
  - Industry landscape researcher for competitive analysis
  - Contradiction analyzer for strategic inconsistency resolution
- Live dashboard script for real-time pipeline monitoring (`scripts/live_dashboard.sh`)
- VC Corner pitch deck template with structured investor presentation sections

### Changed

- Major pipeline restructuring: 7-phase workflow with parallel optimization
- Enhanced orchestration with TodoWrite progress tracking and Task tool management
- Streamlined agent configuration separation (AGENTS.md vs SUBAGENTS.md)
- Improved validation strategy with phase-specific feedback loops
- Updated directory structure with additional result categories
- Enhanced Makefile with better directory management and archiving

### Fixed

- Claude Code settings configuration for improved command hooks and telemetry

## [1.0.0] - 2025-08-18

### Added

- Orchestration by Makefile pipeline or Claude Code using AGENTS.md as guideline
- Claude Code sub agents do not inherit context from parent agent and use SUBAGENTS.md as common guideline
- Sub agents market-research-specialist, gtm-strategy-developer, results-validator, research-synthesizer
- Devcontainer.json fro DevEx
