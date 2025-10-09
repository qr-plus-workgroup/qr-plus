#!/bin/bash

# Setup Labels for QR+ Repository
# This script creates all labels needed for issue tracking

set -e # Exit on error

REPO="qr-plus-workgroup/qr-plus"

echo "🏷️  Setting up labels for $REPO"
echo ""

# Function to create or update a label
create_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  echo "Creating label: $name"
  gh label create "$name" \
    --color "$color" \
    --description "$description" \
    --repo "$REPO" \
    --force  # Updates if exists
}

echo "📊 Priority Labels"
create_label "priority: high" "d73a4a" "High priority - blocks testing or major use case"
create_label "priority: medium" "fbca04" "Medium priority - important but workarounds exist"
create_label "priority: low" "0e8a16" "Low priority - minor improvement or edge case"

echo ""
echo "🏷️  Type Labels"
create_label "type: standard-gap" "b60205" "Missing capability that blocks use case"
create_label "type: standard-ambiguity" "d93f0b" "Unclear or contradictory specification"
create_label "type: enhancement" "0075ca" "Nice-to-have improvement (workarounds exist)"
create_label "type: bug" "d73a4a" "Sandbox implementation doesn't match spec"
create_label "type: documentation" "0366d6" "Documentation improvement needed"

echo ""
echo "🔄 Status Labels"
create_label "status: investigating" "fbca04" "Analyzing the issue"
create_label "status: confirmed" "28a745" "Issue verified as real"
create_label "status: wontfix" "6c757d" "By design or out of scope"
create_label "status: duplicate" "cfd3d7" "Already reported elsewhere"
create_label "status: stale" "e4e669" "No activity for extended period"

echo ""
echo "✅ All labels created successfully!"
echo ""
echo "View labels at: https://github.com/$REPO/labels"
