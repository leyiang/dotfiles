# Add New Home Config File

## Process
To add a new dotfile like `.zshrc_extra`:

### 1. Create Source File
```bash
# Create file WITHOUT dot prefix in home/
touch home/zshrc_extra
# Edit content as needed
```

### 2. Update Mapping
Edit `sync` script, add to `home_mappings`:
```python
home_mappings = {
    # ... existing mappings
    'zshrc_extra': '.zshrc_extra',  # source → target
}
```

### 3. Run Sync
```bash
python3 sync
```

## Result
- Dev file: `home/zshrc_extra` (visible, no dot)
- Compiled: `.compiled/home/.zshrc_extra` 
- Final link: `~/.zshrc_extra` → compiled version

## Mapping Rules
- Source filename: no dot prefix (dev-friendly)
- Target filename: with dot prefix (correct dotfile name)
- Key = source, Value = target in mapping dict

## Example Mappings
```python
'zshrc': '.zshrc'           # home/zshrc → ~/.zshrc
'gitconfig': '.gitconfig'   # home/gitconfig → ~/.gitconfig
'vimrc': '.vimrc'          # home/vimrc → ~/.vimrc
```