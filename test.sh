#!/bin/bash

test -f test_argparse || make

. tap-functions
plan_no_plan

is "$(./test_argparse -f --path=/path/to/file a 2>&1)" 'force: 1
path: /path/to/file
argc: 1
argv[0]: a'

is "$(./test_argparse -n 2>&1)" 'error: option `n` requires a value'

is "$(./test_argparse -n 2 2>&1)" 'num: 2'

is "$(./test_argparse -n2 2>&1)" 'num: 2'

is "$(./test_argparse -na 2>&1)" 'error: option `n` expects a numerical value'

is "$(./test_argparse --help 2>&1)" 'Usage: test-argparse [options]

    -f, --force           force to do
    -h, --help            show this help message and exit
    -p, --path            path to read
    -n, --num             selected num'