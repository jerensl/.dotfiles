if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Clear default fish greeting
function fish_greeting
    fastfetch
end

# ~/.config/fish/config.fish

# starship config
starship init fish | source

# set the workspace path
set -x -U GOPATH $HOME/.asdf/shims/go
set -x GOPATH $HOME/.asdf/shims/go/workspace

# direnv config
direnv hook fish | source
direnv export fish | source

# exac for list directory
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'
# pnpm
set -gx PNPM_HOME "/home/jerensl/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Created by `pipx` on 2024-10-10 03:24:03
set PATH $PATH /home/jerensl/.local/bin

# Check if SSH agent is running
if not set -q SSH_AUTH_SOCK
    echo "Starting ssh-agent..."
    eval (ssh-agent -c)
end

# Obsidian Config
# D-Bus session setup (for Flatpak apps like Obsidian)
if not set -q DBUS_SESSION_BUS_ADDRESS
    eval (dbus-launch | sed -n 's/^DBUS_SESSION_BUS_ADDRESS=/set -x DBUS_SESSION_BUS_ADDRESS /p; s/^DBUS_SESSION_BUS_PID=/set -x DBUS_SESSION_BUS_PID /p')
end

# Ensure Wayland session variables are correctly set
set -x XDG_SESSION_TYPE wayland
set -x GDK_BACKEND wayland
set -x QT_QPA_PLATFORM wayland

# Optional: set the correct Wayland display if not already set
if not set -q WAYLAND_DISPLAY
    set -x WAYLAND_DISPLAY wayland-1  # or wayland-0 depending on your system
end

# Add your SSH key
# ssh-add -l >/dev/null 2>&1; or ssh-add ~/.ssh/github_personal

# source /opt/asdf-vm/asdf.fish
# source ~/.asdf/plugins/golang/set-env.fish
