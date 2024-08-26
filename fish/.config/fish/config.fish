if status is-interactive
    # Commands to run in interactive sessions can go here
    # starship init fish | source	
    oh-my-posh init fish --config "~/.config/oh-my-posh.toml" | source
    # Set the Android SDK home directory
    # set -x ANDROID_HOME $HOME/Android/Sdk
    # Add Android SDK tools, emulator, and platform-tools to PATH
    # set -x PATH $ANDROID_HOME/tools $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $PATH
end
