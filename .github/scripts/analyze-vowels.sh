#!/bin/bash

echo "Analyzing vowels in data.txt..."

awk '
{
  for (i=1; i<=length($0); i++) {
    c = tolower(substr($0, i, 1))
    if (c ~ /[aeiou]/) {
      count[c]++
    }
  }
}
END {
  for (v in count) {
    printf "%s: %d\n", v, count[v]
  }
}' data.txt
