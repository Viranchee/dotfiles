### Prerequisite:

``` bash
brew install rcm
 fish shell:
echo DOTFILES_DIRS=\"(pwd)\" > ~/.rcrc 
```
Setup: In `$HOME` folder, add a `.rcrc` file which has a variable of where this DotFiles repository is. eg. For me, it's currently

``` bash
cat ~/.rcrc
> DOTFILES_DIRS="$HOME/dotfiles/macOS"
```

Tools:

- `lsrc`: List files managed by RCM
- `mkrc <dotfile>` : Add a file to the repo by copying and symlinking behind the scenes
- `rcup` 
- `rcdn`
- TODO: How to setup a new computer.


### Dotfiles added
- `Fish` Shell
- `mpv`: TODO: manually download UOSC
- `yt-dlp`: Config file
- `gitconfig`: Probably didn't need it but a good consistency
- `rclone config`: Encrypted rclone config file. The complicated key is saved to my Password management software

### Future Dotfiles
- Automate Macos settings setup?
- Emacs (Org-mode) config. TODO: Switch to emacs
- VSCode config. Stop relying on VSCode native sync?
- Other configurations. Python Environments?

### Interesting Repo:
- Use [MacHack](https://github.com/kendfinger/MacHack) setup flags
