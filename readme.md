# .dotfiles 🗃  repo

- Replacement of the main [dotfiles](https://github.com/iAmG-r00t/dotfiles) repository.
- Basically I will start building this repository bit by bit.

- Simple server set-up script.
  - Installs several tools; `fzf`, `bat`, `tmux` and `mosh`.
  - Setups tmux and bash configuration files.
  - Does some few cleanups.

- Run this command to install and setup up basic server stuff.

  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/servers.sh | bash
  ```

---

# Get the dotfiles

- Run the following commands to just get the specific dotfiles.

- bashrc; **beware it will rewrite your `.bashrc local` file is it is present.**
  
  ```sh
  curl -fsSL -o .bashrc https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/bashrc
  ```

- tmuxconf; **beware it will rewrite your `.tmux.conf` local file is it is present.**

  ```sh
  curl -fsSL -o .tmux.conf https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/tmux.conf
  ```
