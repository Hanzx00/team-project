#!/bin/bash

echo "Running todo.py..."
python todo.py > task-output.txt | tee task-output.txt

echo "Running todo-test.py..."
python todo-test.py > test-output.txt | tee test-output.txt

echo "Updating index.html..."
./update_index.sh task-output.txt test-output.txt

echo "Done."
