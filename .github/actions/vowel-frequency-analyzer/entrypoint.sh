#!/bin/bash
set -e

echo "🔍 Running frequency analyzer..."
python3 $GITHUB_WORKSPACE/.github/actions/vowel-frequency-analyzer/frequency.py $GITHUB_WORKSPACE/data.txt > $GITHUB_WORKSPACE/output.txt

echo "📝 Updating README.md..."
bash $GITHUB_WORKSPACE/.github/actions/vowel-frequency-analyzer/update_readme.sh
