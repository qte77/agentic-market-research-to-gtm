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

## [2.0.0] - 2025-08-18

### Added

- Live dashboard script for real-time AI Market Research Pipeline monitoring
- VC Corner pitch deck template with structured sections for investor presentations
- Source project analyst agent for technical architecture assessment
- Industry landscape researcher agent for competitive analysis and market research
- Contradiction analyzer agent for identifying conflicts and resolving strategic inconsistencies

### Changed

- Enhanced README with revised usage instructions and improved configuration setup
- Updated CLAUDE.md agent configuration with separate orchestrator and subagent sections
- Streamlined Makefile pipeline execution with enhanced directory management
- Improved SUBAGENTS.md guidelines for output adaptation and file creation processes
- Updated agent specifications with better validation and correction loops

### Fixed

- Claude Code settings configuration for improved command hooks and telemetry

## [1.0.0] - 2025-08-18

### Added

- Orchestration by Makefile pipeline or Claude Code using AGENTS.md as guideline
- Claude Code sub agents do not inherit context from parent agent and use SUBAGENTS.md as common guideline
- Sub agents market-research-specialist, gtm-strategy-developer, results-validator, research-synthesizer
- Devcontainer.json fro DevEx
