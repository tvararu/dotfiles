# Remove the newcomer fish greeting.
set fish_greeting ""
set -x EDITOR vim

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/tvararu/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/tvararu/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/tvararu/.config/yarn/global/node_modules/tabtab/.completions/sls.fish ]; and . /Users/tvararu/.config/yarn/global/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/tvararu/.config/yarn/global/node_modules/tabtab/.completions/slss.fish ]; and . /Users/tvararu/.config/yarn/global/node_modules/tabtab/.completions/slss.fish