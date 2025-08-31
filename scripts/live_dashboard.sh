#!/bin/sh
# AI Market Research Pipeline Live Dashboard
# Usage: watch -n 2 sh scripts/live_dashboard.sh

clear
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║            AI Market Research Pipeline Status            ║"
echo "╠══════════════════════════════════════════════════════════════╣"

# Get current status from hooks-generated file
if [ -f "results/dashboard_status.txt" ]; then
    status=$(cat results/dashboard_status.txt)
    echo "║ $status"
    echo "╠══════════════════════════════════════════════════════════════╣"
fi

# Dynamic phase processing
for phase_dir in results/research results/pmf results/gtm results/synthesis results/validation results/slide_decks; do
    if [ ! -d "$phase_dir" ]; then
        continue
    fi
    
    phase_name=$(basename "$phase_dir")
    case "$phase_name" in
        "research") display_name="Research Phase" ;;
        "pmf") display_name="PMF Phase" ;;
        "gtm") display_name="GTM Phase" ;;
        "synthesis") display_name="Synthesis Phase" ;;
        "validation") display_name="Validation Phase" ;;
        "slide_decks") display_name="Slide Decks Phase" ;;
        *) display_name="$phase_name Phase" ;;
    esac
    
    padding=$((54 - ${#display_name}))
    if [ $padding -lt 0 ]; then padding=0; fi
    printf "║ %s:%*s║\n" "$display_name" "$padding" ""
    
    # Process all .md files in the phase directory
    file_count=0
    for file_path in "$phase_dir"/*.md; do
        if [ -f "$file_path" ]; then
            file=$(basename "$file_path")
            size=$(wc -w < "$file_path" 2>/dev/null || echo 0)
            printf "║ ✅ %-40s %6d words ║\n" "$file" "$size"
            file_count=$((file_count + 1))
        fi
    done
    
    if [ $file_count -eq 0 ]; then
        printf "║ ⏳ %-40s  pending  ║\n" "No files yet"
    fi
    
    echo "╠══════════════════════════════════════════════════════════════╣"
done

echo "╚══════════════════════════════════════════════════════════════╝"

# Progress Summary
total_files=$(find results -name "*.md" -not -path "*/archive/*" 2>/dev/null | wc -l)
completed_phases=$(ls results/.*.complete 2>/dev/null | wc -l)
total_words=$(find results -name "*.md" -not -path "*/archive/*" -exec wc -w {} + 2>/dev/null | tail -1 | awk '{print $1}' || echo 0)

echo "Summary: $total_files documents, $completed_phases phases complete, $total_words words"
echo "Last updated: $(date '+%H:%M:%S')"
echo ""
echo "💡 Run: watch -n 2 sh scripts/live_dashboard.sh (for live updates)"