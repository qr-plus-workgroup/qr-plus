#!/bin/bash

# Setup Milestones for QR+ Repository
# This script creates initial milestones for spec versions

set -e # Exit on error

REPO="qr-plus-workgroup/qr-plus"

echo "🎯 Setting up milestones for $REPO"
echo ""

# Function to create a milestone
create_milestone() {
  local title="$1"
  local description="$2"
  local due_date="$3" # Optional, format: YYYY-MM-DD

  echo "Creating milestone: $title"

  if [ -z "$due_date" ]; then
    gh api repos/$REPO/milestones \
      -f title="$title" \
      -f description="$description"
  else
    gh api repos/$REPO/milestones \
      -f title="$title" \
      -f description="$description" \
      -f due_on="${due_date}T23:59:59Z"
  fi
}

echo "📋 Creating initial milestones"
echo ""

# v1.0 - First published spec
create_milestone \
  "v1.0" \
  "First published QR+ specification (stable). Even minor version = published/stable for implementation."

# v1.1.x - Draft working version
create_milestone \
  "v1.1.x (Draft)" \
  "Draft working version. Odd minor version = work in progress, not stable. Changes in this version will be published in v1.2."

# v1.2 - Next published release
create_milestone \
  "v1.2" \
  "Next published specification release (stable). Will include all approved changes from v1.1.x draft."

# Backlog - Not yet assigned
create_milestone \
  "Backlog" \
  "Issues not yet assigned to a specific version. Will be prioritized and assigned to future milestones during planning."

echo ""
echo "✅ All milestones created successfully!"
echo ""
echo "View milestones at: https://github.com/$REPO/milestones"
echo ""
echo "📝 Note: Adjust milestone due dates and titles based on your actual spec versioning timeline."
echo "    Use 'gh api repos/$REPO/milestones' to list existing milestones"
echo "    Use 'gh api repos/$REPO/milestones/{number} -X PATCH' to update"
