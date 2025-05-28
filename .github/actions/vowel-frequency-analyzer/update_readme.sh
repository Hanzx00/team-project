#!/bin/bash

echo "## Vowel Frequency Report" >> $GITHUB_WORKSPACE/README.md
echo "\`\`\`" >> $GITHUB_WORKSPACE/README.md
cat $GITHUB_WORKSPACE/output.txt >> $GITHUB_WORKSPACE/README.md
echo "\`\`\`" >> $GITHUB_WORKSPACE/README.md
echo "_Updated by $GITHUB_ACTOR on $(date)_" >> $GITHUB_WORKSPACE/README.md
