default:
    @just --list

# Format Lua files in place
fmt:
    stylua .

# Check formatting without modifying files
fmt-check:
    stylua --check .

# Lint Lua files
lint:
    selene init.lua lua after

# Run formatting check and lint
check: fmt-check lint
