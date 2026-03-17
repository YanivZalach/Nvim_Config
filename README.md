# My Awesome NeoVim Configuration For Unix/WSL

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<p align="center">
   <img width="600" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/1200px-Neovim-logo.svg.png" alt="Neovim Logo">
</p>

[NeoVim](https://neovim.io) is a powerful and highly configurable text editor designed to make text manipulation and coding a breeze. It's known for its unique modal editing system, where different modes offer distinct functionalities like insertion, navigation, and text manipulation. This design philosophy enables lightning-fast editing once you're familiar with the concepts.

What do we have here? My Nvim configuration file!

Who can use it? Anyone can use it!

<img width="949" alt="nvim" src="https://github.com/YanivZalach/Nvim_Config/assets/131461377/3cc992e7-292d-4f4d-a1b7-387cf79d9b95">

## Requirements 🛠️

Before using this Nvim configuration, make sure you have the following installed on your system:

- [NeoVim](https://neovim.io) 📜 - MUST HAVE

*What if i want to use Vim? visit: <https://github.com/YanivZalach/Vim_Config>*

**And:**

- [Node.js](https://github.com/nodejs/node) 🟢 (Required by some LSP language servers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) 🔍 (Required for project-wide text search with Telescope)

*What if i want a fast, plug and play setup? visit: <https://github.com/YanivZalach/Vim_Config_NO_PLUGINS>*

## Installation 📦

1. Install the programs listed above using your package manager or download them from their respective websites.

2. Copy the config file:

      Copy and paste the following command into the terminal and press 'enter':

      ```bash
      git clone https://github.com/YanivZalach/Nvim_Config.git ~/.config/nvim
      ```

3. Install the Plugins:

   Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which **auto-installs on first launch**.

   Simply open NeoVim:

   ```
   nvim
   ```

   Lazy will automatically bootstrap itself and install all plugins. Wait for the installation to complete, then restart NeoVim.

## Usage, Features, and Special Key Bindings 🚀

### Welcome to Your Enhanced Vim Experience

Smart Tab and Indentation Settings 💡

- Experience seamless and intelligent code indentation for a consistent coding journey.

Telescope Fuzzy Finder 🔍

- Move fast using the Telescope Fuzzy Finder to switch seamlessly between files.
  
Auto-Completion using coc.nvim 🔌
  
- Auto-completion courtesy of coc.nvim, which can be extended in the future, with enhancements and specific languages.

LSP (Language Server Protocol) 🧠

- Full IDE-like language features: go to definition, find references, rename, code actions, diagnostics, and more — with PyCharm-style keybindings.

File Explorer nvim Integration 🌲

- Navigate through your project effortlessly with nvim, your trusty sidekick for efficient file exploration.
  
Vim-airline ✈️

- A sleek and customizable status bar for Nvim, located at the bottom of your editor.

Vim-web-devicons 🌈

- Developer-friendly icons to different file types and directories.

Nvim-terminal 💻

- A terminal emulator directly within Nvim. compile code, and perform other terminal-related tasks without leaving your Vim environment.

Hebrew Mode 🚀

- A mode that support right to left written languages. This feature empowers you so you can use any Language in Nvim.

Hex conversion 💻

- A simple way to convert file to Hex form and from Hex form.

Harpoon 🔌

- A great file navigation plugin.

### Native Neovim Key Bindings 🎮

Utilize these native Vim key bindings to navigate and control the text editor efficiently:

- `:w`: Save changes to the file.
- `:q`: Quit Vim.
- `:q!`: Quit Vim without saving changes.
- `:wq` or `:x`: Save changes and quit Vim.
- `j`, `k`, `h`, `l`: Navigate through the file.
- `zz`: Center the current line on the screen.
- `i`, `a`, `s`: Enter insert mode.
- `shift+v`: Enter visual line mode.
- `z=`: Get spelling check suggestions for a word.
- `dd`: Delete the current line.
- `yy`: Yank (copy) the current line.
- `p`: Paste the content you've yanked or deleted.
- `u`: Undo the last action.
- `<Ctrl> + r`: Redo an undone action.
- `/pattern`: Search for a specific pattern in the text.
- `n`: Move to the next occurrence of the search pattern.
- `N`: Move to the previous occurrence of the search pattern.
- `<Ctrl> + a`: Increase a number.
- `<Ctrl> + x`: Decrease a number.

Remember, Vim's unique modal nature means that you often need to switch to Normal mode (by pressing `Esc`) before executing the above commands.

### Enhanced Key Bindings for Speed and Fun! ⚡️

**Editing:**
- `<Ctrl> + <Shift> + V`: Paste text from the main clipboard.
- `<Ctrl> + C` (visual): Copy selection to the main clipboard.
- `jj`: Quickly exit insert mode.
- `<Space> + a`: Select all the text in the document.
- `Q`: Format a paragraph into lines.
- `<Ctrl> + <Alt> + L`: Format whole document.
- `<Ctrl> + Z`: Toggle spell check.
- `<Space> + sw`: Surround word with a chosen character.
- `<Space> + rw`: Replace all occurrences of word under cursor.

**File Explorer & Terminal:**
- `<Space> + e`: Open side file explorer.
- `<Space> + o`: Open file explorer (full).
- `<Space> + tt`: Open a terminal.
- `jj` / `<Esc>` (in terminal): Exit terminal mode.

**Windows & Tabs:**
- `<Space> + y`: Split window vertically.
- `<Space> + x`: Split window horizontally.
- `<Ctrl> + H/J/K/L`: Navigate between splits.
- `<Alt> + ↑/↓/←/→`: Resize splits.
- `<Space> + c`: Open/create file in new tab.
- `<S-Tab>`: Switch to next tab.
- `<Ctrl> + S`: Save all files.
- `<Ctrl> + Q`: Save and quit all.

**Search & Navigation (Telescope):**
- `<Ctrl> + <Shift> + F`: Search string in whole project (Find in Path).
- `<Ctrl> + F`: Fuzzy search in current buffer.
- `<Space> + fh`: Find hidden files.
- `<Space> + fb`: Find open buffer.
- `<Space> + fo`: Open recent file.
- `<Space> + fr`: Pick from registers.
- `<Space> + fm`: Go to mark.
- `<Space> + fk`: View all keybindings.

**Harpoon (Quick File Navigation):**
- `<Space> + hj`: Toggle Harpoon menu.
- `<Space> + ha`: Add file to Harpoon.
- `<Space> + hn`: Next Harpoon file.
- `<Space> + hy`: Previous Harpoon file.
- `<Space> + h1`–`h4`: Jump to Harpoon files 1–4.

**Other:**
- `<Space> + v`: Enter V-Block mode.
- `<Space> + ht`: Toggle Hebrew mode.
- `<Space> + hx`: Hex file converter.
- `<Space> + ps`: Open plugin manager (Lazy).
- `<Space> + pi`: Open LSP installer (Mason).
- `<leader> + rr` (Markdown only): Compile to PDF with Pandoc.

### LSP Key Bindings 🧠

Active when an LSP server is attached to the buffer:

| Keybinding | Action |
|---|---|
| `<Ctrl> + <Shift> + B` | Go to Definition |
| `<Space> + rn` | Rename Symbol |
| `<Space> + gr` | Find Usages / References |
| `<Ctrl> + P` | Parameter Info / Signature Help |
| `K` | Quick Documentation (Hover) |
| `]d` | Jump to Next Diagnostic |
| `[d` | Jump to Previous Diagnostic |
| `<Space> + ds` | File Structure (symbols in current file) |
| `<Ctrl> + <Alt> + O` | Organize / Sort Imports |
| `<Space> + gd` | Go to Declaration |

## Troubleshooting 🔧

The installation is not working:

- Make sure you have Git installed on your computer.
  Open the terminal and run the following command:

  ```bash
  git --version
  ```

  If Git is installed, you will see the installed version. If not, you need to install it using your package manager.
  Then retry the Installation.
  
- Check if a file/directory already exists
  
  Check if the `~/.config/nvim` already exists.
  Open the terminal and run the following command :

  - To check if the `~/.config/nvim` directory exists, run:

      ```bash
      ls ~/.config/nvim
      ```

      Is found, run:

      ```bash
      mv ~/.config/nvim ~/.config/nvim_backup
      ```

  This will rename the existing directory as _backup.
  Retry the Installation.
  
## Acknowledgments 🙏

A special thanks to the NeoVim community for their support.

### Happy Editing! 🪶💻
