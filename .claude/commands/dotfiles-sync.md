# Dotfiles Sync System

## Overview
The sync script uses a "compile" approach to handle dotfiles development convenience vs correct linking.

## Architecture
- **Source**: `home/zshrc` (no dot prefix, dev-friendly)
- **Compile**: `.compiled/home/.zshrc` (with dot prefix)  
- **Link**: `~/.zshrc` → `.compiled/home/.zshrc` → `home/zshrc`

## Key Components

### 1. File Mapping System
```python
home_mappings = {
    'zshrc': '.zshrc',
    'gitconfig': '.gitconfig',
    # ... other mappings
}
```

### 2. Compilation Process
- Creates `.compiled/` directory
- Maps `home/filename` → `.compiled/home/.filename` via relative symlinks
- Config dirs: `config/nvim/` → `.compiled/nvim/.config/nvim/`

### 3. Stow Installation
- Uses GNU Stow from `.compiled/` directory
- Creates final symlinks: `~/.zshrc` → `Work/dotfiles/.compiled/home/.zshrc`

## Commands
- `python3 sync` - Full sync (compile + install)
- Files in `home/` directory are development-friendly (no dots)
- Final links in `~/` have correct dot prefixes

## Benefits
- ✅ Dev experience: visible files in `home/`
- ✅ Correct linking: proper dotfile names in `~/`
- ✅ Live editing: changes reflect immediately via symlinks