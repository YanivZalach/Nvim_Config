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

- [Node.js](https://github.com/nodejs/node) 🟢 (Auto-Completion using nvim.coc)
- [Vim-Plug](https://github.com/junegunn/vim-plug) ⚡️ (plugin manager)

*What if i want a fast, plug and play setup? visit: <https://github.com/YanivZalach/Vim_Config_NO_PLUGINS>*

## Installation 📦

1. Install the programs listed above using your package manager or download them from their respective websites.

2. Copy the config file:

      Copy and paste the following command into the terminal and press 'enter':

      ```bash
      git clone https://github.com/YanivZalach/Nvim_Config.git ~/.config/nvim
      ```

3. Install the Plugins:

   To install the plugins, follow these steps:

   Launch NeoVim by typing the following in the terminal, all in lowercase:

   ```
   nvim
   ```

   Once inside NeoVim, press **:** to enter command mode.

   Write the following command to trigger plugin installation:

   ```
   PlugInstall
   ```

   After running this command, a window will pop up showing the progress of plugin downloads. Wait for the downloads to complete.

   Once the download is finished, you can exit the window by typing:

   ```
   :q
   ```

   With these steps, you'll have successfully installed the plugins for your NeoVim configuration.

## Usage, Features, and Special Key Bindings 🚀

### Welcome to Your Enhanced Vim Experience

Smart Tab and Indentation Settings 💡

- Experience seamless and intelligent code indentation for a consistent coding journey.

Telescope Fuzzy Finder 🔍

- Move fast using the Telescope Fuzzy Finder to switch seamlessly between files.
  
Treesitter Syntax Highlighting 🌲

- Better syntax highlighting with treesitter.

Auto-Completion using coc.nvim 🔌
  
- Auto-completion courtesy of coc.nvim, which can be extended in the future, with enhancements and specific languages.

Git integration using vim fugitive 🎮

- Git keybindings and commends easy and fast with vim fugitive.

Oil nvim Integration 🌲

- Navigate through your project effortlessly with Oil nvim, your trusty sidekick for efficient file exploration.
  
Vim-airline ✈️

- a sleek and customizable status bar for Nvim, located at the bottom of your editor.

Vim-web-devicons 🌈

- Developer-friendly icons to different file types and directories.

Nvim-terminal 💻

- A terminal emulator directly within Nvim. compile code, and perform other terminal-related tasks without leaving your Vim environment.

Hebrew Mode 🚀

- A mode that support right to left written languages. This feature empowers you so you can use any Language in Nvim.

Hex conversion 💻

- A simple way to convert file to Hex form and from Hex form.

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

Remember, Vim's unique modal nature means that you often need to switch to Normal mode (by pressing `Esc`) before executing the above commands.

### Enhanced Key Bindings for Speed and Fun! ⚡️

Take your editing experience to the next level with these added key bindings:

- `<Ctrl> + c`: Copy text to the main clipboard in normal mode.
- `<Ctrl> + <Shift> + v`: Paste text from the main clipboard.
- `jj`: Quickly exit insert mode.
- `Q`: Format a paragraph into lines.
- `J`: In visual mode, move line down.
- `K`: In visual mode, move line up.
- `<Ctrl> + z`: Toggle spell check.
- `<Space> + e`: Open a file explorer.
- `<Space> + v`: Enter V-Block Mode
- `<Ctrl> + t`: Toggle a terminal window.
- `<Ctrl> + i`: Make the terminal scrollable or switch to input mode.
- `<Space> + y`: Split window vertically.
- `<Space> + x`: Split window horizontally.
- `<Ctrl> + j`, `<Ctrl> + k`, `<Ctrl> + h`, `<Ctrl> + l`: Navigate between splits.
- `<Alt> + Left Arrow`, `<Alt> + Right Arrow`, `<Alt> + Up Arrow`, `<Alt> + Down Arrow`: Resize splits.
- `<Space> + t`: Switch between tabs.
- `<Space> + c`: Create a new tab.
- `<Ctrl> + s`: Save the current file.
- `<Ctrl> + q`: Save and quit.
- `<Space> + sw`: Surround word with a wanted character.
- `<Space> + rw`: Replace all occurrences of a word.
- `<Space + ht`: toggle `Hebrew` mode.
- `<Space + hx`: Use `Hex` converter.
- `<Ctrl> + n`: Toggle NERD Tree.
- `<Space> + ff`: Finding a file in the working directly.
- `<Space> + fh`: Finding a file in the working directly including a hidden one.
- `<Space> + fb`: Finding an open file(buffer).
- `<Space> + fo`: Opening an old file.
- `<Space> + fw`: Fuzzy word finding.
- `<Space> + fr`: Pick from registers.
- `<Space> + fk`: All the keybinding.
- `<Space> + fm`: Select and go to mark.
- `<Space> + fg`: Git status changes.
- `<Space> + ga`: Add all changes.
- `<Space> + gc`: Commit changes.
- `<Space> + gp`: Git push.
- `<Space> + gs`: Git file status.
- `<Space> + gl`: Git log.
- `<Space> + dx`: Jump to definition, split horizontally.
- `<Space> + dy`: Jump to definition, split vertically.
- `<Space> + dt`: Jump to definition in a new tab.

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
