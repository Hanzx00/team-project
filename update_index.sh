#!/bin/bash

TASK_FILE=$1
TEST_FILE=$2

# Extract ToDo Tasks
TODO_TASKS=$(grep "ToDo Tasks:" -A 10 "$TASK_FILE" | sed -n '/ToDo Tasks:/,/Done Tasks:/p' | sed '1d;$d')

# Extract Done Tasks
DONE_TASKS=$(grep "Done Tasks:" -A 10 "$TASK_FILE" | sed '1d')

# Extract Test Results
TEST_RESULTS=$(cat "$TEST_FILE")

# Function to update <pre> tag by ID
update_pre() {
  local id=$1
  local content=$2
  local file=$3
  perl -0777 -i -pe "s|<pre id=\"$id\">.*?</pre>|<pre id=\"$id\">$content</pre>|gs" "$file"
}

# Update index.html
update_pre "todo" "$TODO_TASKS" index.html
update_pre "done" "$DONE_TASKS" index.html
update_pre "test" "$TEST_RESULTS" index.html

# Commit changes
git config --global user.email "you@example.com"
git config --global user.name "GitHub Actions"
git add index.html
git commit -m "Update index.html with task & test results"
git push
