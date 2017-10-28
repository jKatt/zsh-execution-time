# zsh-execution-time
Adds executiom time and date to the RPROMPT

`2s < Sat Oct 28 22:57:18 2017`


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
