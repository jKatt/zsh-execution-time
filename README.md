# zsh-execution-time
needs coreutils to be installed to get ms from gdate

```sh
brew install coreutils
```

## Installation
### Oh My Zsh

- Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone https://github.com/jKatt/zsh-execution-time $ZSH_CUSTOM/plugins/execution-time
    ```

- Add the plugin to the list of plugins for Oh My Zsh to load:

    ```sh
    plugins=(execution-time)
    ```
